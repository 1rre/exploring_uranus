#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

#include "sys/alt_irq.h"
#include "io.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_spi_regs.h"
#include "system.h"
#include "I2C_core.h"
#include "terasic_includes.h"
#include "mipi_camera_config.h"
#include "mipi_bridge_config.h"
#include "auto_focus.h"

#include <fcntl.h>

//EEE_IMGPROC defines
#define EEE_IMGPROC_MSG_START ('R'<<16 | 'B'<<8 | 'B')

//offsets
#define EEE_IMGPROC_STATUS 0
#define EEE_IMGPROC_MSG 1
#define EEE_IMGPROC_ID 2
#define EEE_IMGPROC_BBCOL 3
#define EEE_IMGPROC_TMIN 4
#define EEE_IMGPROC_TDIF 5
#define EEE_IMGPROC_BALL_BASE 6

#define EXPOSURE_INIT 0x002000
#define EXPOSURE_STEP 0x100
#define GAIN_INIT 0x300
#define GAIN_STEP 0x040
#define DEFAULT_LEVEL 3

#define MIPI_REG_PHYClkCtl    0x0056
#define MIPI_REG_PHYData0Ctl  0x0058
#define MIPI_REG_PHYData1Ctl  0x005A
#define MIPI_REG_PHYData2Ctl  0x005C
#define MIPI_REG_PHYData3Ctl  0x005E
#define MIPI_REG_PHYTimDly    0x0060
#define MIPI_REG_PHYSta     0x0062
#define MIPI_REG_CSIStatus    0x0064
#define MIPI_REG_CSIErrEn   0x0066
#define MIPI_REG_MDLSynErr    0x0068
#define MIPI_REG_FrmErrCnt    0x0080
#define MIPI_REG_MDLErrCnt    0x0090

#define ALT_SPI_BASE 0x41000

void mipi_clear_error(void) {
  MipiBridgeRegWrite(MIPI_REG_CSIStatus,0x01FF); // clear error
  MipiBridgeRegWrite(MIPI_REG_MDLSynErr,0x0000); // clear error
  MipiBridgeRegWrite(MIPI_REG_FrmErrCnt,0x0000); // clear error
  MipiBridgeRegWrite(MIPI_REG_MDLErrCnt,0x0000); // clear error

  MipiBridgeRegWrite(0x0082,0x00);
  MipiBridgeRegWrite(0x0084,0x00);
  MipiBridgeRegWrite(0x0086,0x00);
  MipiBridgeRegWrite(0x0088,0x00);
  MipiBridgeRegWrite(0x008A,0x00);
  MipiBridgeRegWrite(0x008C,0x00);
  MipiBridgeRegWrite(0x008E,0x00);
  MipiBridgeRegWrite(0x0090,0x00);
}

void mipi_show_error_info(void) {

  alt_u16 PHY_status,SCI_status,MDLSynErr,FrmErrCnt,MDLErrCnt;

  PHY_status = MipiBridgeRegRead(MIPI_REG_PHYSta);
  SCI_status = MipiBridgeRegRead(MIPI_REG_CSIStatus);
  MDLSynErr = MipiBridgeRegRead(MIPI_REG_MDLSynErr);
  FrmErrCnt = MipiBridgeRegRead(MIPI_REG_FrmErrCnt);
  MDLErrCnt = MipiBridgeRegRead(MIPI_REG_MDLErrCnt);
  printf("PHY_status=%xh, CSI_status=%xh, MDLSynErr=%xh, FrmErrCnt=%xh, MDLErrCnt=%xh\r\n",
         PHY_status,
         SCI_status,
         MDLSynErr,
         FrmErrCnt,
         MDLErrCnt);
}

void mipi_show_error_info_more(void) {
  printf("FrmErrCnt = %d\n",MipiBridgeRegRead(0x0080));
  printf("CRCErrCnt = %d\n",MipiBridgeRegRead(0x0082));
  printf("CorErrCnt = %d\n",MipiBridgeRegRead(0x0084));
  printf("HdrErrCnt = %d\n",MipiBridgeRegRead(0x0086));
  printf("EIDErrCnt = %d\n",MipiBridgeRegRead(0x0088));
  printf("CtlErrCnt = %d\n",MipiBridgeRegRead(0x008A));
  printf("SoTErrCnt = %d\n",MipiBridgeRegRead(0x008C));
  printf("SynErrCnt = %d\n",MipiBridgeRegRead(0x008E));
  printf("MDLErrCnt = %d\n",MipiBridgeRegRead(0x0090));
  printf("FIFOSTATUS = %d\n",MipiBridgeRegRead(0x00F8));
  printf("DataType = 0x%04x\n",MipiBridgeRegRead(0x006A));
  printf("CSIPktLen = %d\n",MipiBridgeRegRead(0x006E));
}

alt_u8 MIPI_Init(void) {
  alt_u8 bSuccess;

  bSuccess = oc_i2c_init_ex(I2C_OPENCORES_MIPI_BASE,50 * 1000 * 1000,400 * 1000); //I2C: 400K
  if ( !bSuccess) printf("failed to init MIPI- Bridge i2c\r\n");

  usleep(50 * 1000);
  MipiBridgeInit();

  usleep(500 * 1000);

//  bSuccess = oc_i2c_init_ex(I2C_OPENCORES_CAMERA_BASE, 50*1000*1000,400*1000); //I2C: 400K
//  if (!bSuccess)
//    printf("failed to init MIPI- Camera i2c\r\n");

  MipiCameraInit();
  MIPI_BIN_LEVEL(DEFAULT_LEVEL);
//    OV8865_FOCUS_Move_to(340);

//    oc_i2c_uninit(I2C_OPENCORES_CAMERA_BASE);  // Release I2C bus , due to two I2C master shared!

  usleep(1000);

//    oc_i2c_uninit(I2C_OPENCORES_MIPI_BASE);

  return bSuccess;
}

int main() {

  // Utils to send the ball & a 16 bit position to the ESP32

  alt_u16 c_bound;
  alt_u8 c_ball;

  inline void esp_send() {
    IOWR_ALTERA_AVALON_PIO_DATA(ARDUINO_BALL_BASE,c_ball);
    IOWR_ALTERA_AVALON_PIO_DATA(ARDUINO_VAL_BASE,(c_bound >> 5) & 0b11111);
    IOWR_ALTERA_AVALON_PIO_DATA(ARDUINO_CTRL_BASE,0b10);
    usleep(1);
    IOWR_ALTERA_AVALON_PIO_DATA(ARDUINO_CTRL_BASE,0b00);
    IOWR_ALTERA_AVALON_PIO_DATA(ARDUINO_VAL_BASE,c_bound & 0b11111);
    IOWR_ALTERA_AVALON_PIO_DATA(ARDUINO_CTRL_BASE,0b11);
    usleep(1);
    IOWR_ALTERA_AVALON_PIO_DATA(ARDUINO_CTRL_BASE,0b00);
  }

  fcntl(STDIN_FILENO,F_SETFL,O_NONBLOCK);

  // Camera power test

  printf("Exploring Uranus File Setup\n");
  IOWR(MIPI_PWDN_N_BASE,0x00,0x00);
  IOWR(MIPI_RESET_N_BASE,0x00,0x00);

  usleep(2000);
  IOWR(MIPI_PWDN_N_BASE,0x00,0xFF);
  usleep(2000);
  IOWR(MIPI_RESET_N_BASE,0x00,0xFF);

  printf("Image Processor ID: %x\n",IORD(EEE_IMGPROC_0_BASE,EEE_IMGPROC_ID));

  usleep(2000);

  if ( !MIPI_Init()) {
    printf("MIPI_Init failed!\r\n");
  } else {
    printf("MIPI_Init successfully!\r\n");
  }

  mipi_clear_error();
  usleep(50 * 1000);
  mipi_clear_error();
  usleep(1000 * 1000);
  mipi_show_error_info();
  printf("\n");

  // Camera operating parameters setup
  alt_u8 manual_focus_step = 10;
  alt_u16 current_focus = 300;
  alt_u32 exposureTime = EXPOSURE_INIT;
  alt_u16 gain = GAIN_INIT;
  alt_u8  t_min = 0xf0;
  alt_u16 t_dif = 0xff;

  OV8865SetExposure(exposureTime);
  OV8865SetGain(gain);
  Focus_Init();
  IOWR(EEE_IMGPROC_0_BASE,EEE_IMGPROC_TMIN,t_min);
  IOWR(EEE_IMGPROC_0_BASE,EEE_IMGPROC_TDIF,t_dif);

loop_forever:

  // touch KEY0 to trigger Auto focus
  if ((IORD(KEY_BASE,0) & 0x03) == 0x02)
    current_focus = Focus_Window(320,240);

  //Process input commands
  int in = getchar();
  switch (in) {
  // Exposure
  case 'e': {
    exposureTime += EXPOSURE_STEP;
    OV8865SetExposure(exposureTime);
    printf("\nExposure = %x ",exposureTime);
  break;}
  case 'd': {
    exposureTime -= EXPOSURE_STEP;
    OV8865SetExposure(exposureTime);
    printf("\nExposure = %x ",exposureTime);
  break;}

  // Gain
  case 't': {
    gain += GAIN_STEP;
    OV8865SetGain(gain);
    printf("\nGain = %x ",gain);
  break;}
  case 'g': {
    gain -= GAIN_STEP;
    OV8865SetGain(gain);
    printf("\nGain = %x ",gain);
  break;}

  // Focus
  case 'r': {
    current_focus += manual_focus_step;
    if (current_focus > 1023) current_focus = 1023;
    OV8865_FOCUS_Move_to(current_focus);
    printf("\nFocus = %x ",current_focus);
  break;}
  case 'f': {
    if (current_focus > manual_focus_step) current_focus -= manual_focus_step;
    OV8865_FOCUS_Move_to(current_focus);
    printf("\nFocus = %x ",current_focus);
  break;}

  // Minimum Intensity Threshold
  case 'o': {
    t_min++;
    printf("\nT_MIN = %x ",t_min);
    IOWR(EEE_IMGPROC_0_BASE,EEE_IMGPROC_TMIN,t_min);
  break;}
  case 'l': {
    t_min--;
    printf("\nT_MIN = %x ",t_min);
    IOWR(EEE_IMGPROC_0_BASE,EEE_IMGPROC_TMIN,t_min);
  break;}

  // Difference Threshold
  case 'i': {
    t_dif++;
    printf("\nT_DIF = %x ",t_dif);
    IOWR(EEE_IMGPROC_0_BASE,EEE_IMGPROC_TDIF,t_dif);
  break;}
  case 'k': {
    t_dif--;
    printf("\nT_DIF = %x ",t_dif);
    IOWR(EEE_IMGPROC_0_BASE,EEE_IMGPROC_TDIF,t_dif);
    break;}
  }

  // Read the bounding box for each ball from memory

  for (c_ball = 0; c_ball < 5; c_ball++) {
    alt_u32 read;
    printf("Ball is %d\n", c_ball);


    // x1, read: <<0:6, y1:10, 0:6, x1:10>>
    read = IORD(EEE_IMGPROC_0_BASE, EEE_IMGPROC_BALL_BASE + (c_ball<<1));
    c_bound = read & 1023;
    printf("Sending x1 = %d\n", c_bound);
    esp_send();

    // y1, read: <<0:22, y1:10>>
    read >>= 16;
    c_bound = (read & 1023) + 640;
    printf("Sending y1 = %d (%d)\n", c_bound, c_bound - 640);
    esp_send();


    // x2, read: <<0:6, y2:10, 0:6, x2:10>>
    read = IORD(EEE_IMGPROC_0_BASE, EEE_IMGPROC_BALL_BASE + (c_ball<<1) + 1);
    c_bound = read & 1023;
    printf("Sending x2 = %d\n", c_bound);
    esp_send();

    // y1, read: <<0:22, y2:10>>
    read >>= 16;
    c_bound = (read & 1023) + 640;
    printf("Sending y2 = %d (%d)\n", c_bound, c_bound - 640);
    esp_send();

    usleep(2500);
  }

  printf("---------------------------------------\n");
  // Delay to allow devices to settle
  usleep(75000);

  goto loop_forever;

  return 0;
}

