#define RXD2 16
#define TXD2 17

int max_x = 200, max_y = 200, front_x = 0, front_y = 10, back_x = 0, back_y = 0;
int five_to_y = max_y - 5, ten_to_y = max_y - 10, five_to_x = max_x - 5, ten_to_x = max_x - 10;
int int_x = 10;
bool mov = 0;
bool cw = 0;
int orient_x = (head_x > tail_x) ? 1 : (head_x < tail_x) ? -1 : 0; // 1 right, -1 left, 0 vertical
int orient_y = (head_y > tail_y) ? 1 : (head_y < tail_y) ? -1 : 0; // 1 up, -1 down, 0 horizontal

void setup() {
  // put your setup code here, to run once:
  Serial.begin(38400);
  // Serial1.begin(9600, SERIAL_8N1, RXD2, TXD2);
  Serial2.begin(38400, SERIAL_8N1, RXD2, TXD2); // the SERIAL_8N1 sets data, parity, and stop bits
  Serial.println("Serial Txd is on pin: " + String(TX));
  Serial.println("Serial Rxd is on pin: " + String(RX));
}

void loop() {
  // put your main code here, to run repeatedly:
  mode_1();
  mode_2();
  mode_3();
  mode_4();
  mode_5();
  mode_6();
  mode_3();
  mode_7();
}

void mode_1() {
  while (front_y < max_y) {
    Serial2.println(26);
    front_y++;
    back_y++;
    print_to_serial();
  }
}

void mode_2() {
  while (back_y < five_to_y) { //(front_y != back_y)?
    Serial2.println(3);
    front_x++, front_y--;
    back_x--, back_y++;
    print_to_serial();
  }
}

void mode_3() { // same movement as between mode_6 and mode_7
  int i = 0;
  if (front_x < ten_to_x) {
    while (i < int_x) {
      Serial2.println(26);
      front_x++;
      back_x++;
      print_to_serial();
    }
  }
}

void mode_4() {
  while (back_y < max_y) {
    Serial2.println(3);
    front_x--, front_y--;
    back_x++, back_y++;
    print_to_serial();
  }
}

void mode_5() {
  while (front_y > 0) {
    Serial2.println(26);
    front_y--;
    back_y--;
    print_to_serial();
  }
}

void mode_6() {
  while (back_y > 5) { //(front_y != back_y)?
    Serial2.println(2);
    front_x++, front_y++;
    back_x--, back_y--;
    print_to_serial();
  }
}

void mode_7() {
  while (back_y > 0) {
    Serial2.println(2);
    front_x--, front_y++;
    back_x++, back_y--;
    print_to_serial();
  }
}

void print_to_serial() {
  Serial.print("front_x:");
  Serial.print(front_x);
  Serial.print(", front_y:");
  Serial.print(front_y);
  Serial.print(", back_x:");
  Serial.print(back_x);
  Serial.print(", back_y:");
  Serial.println(back_y);
}
