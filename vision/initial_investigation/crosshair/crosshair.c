// Added to main.c

int pixel_value = IORD(0x42000, EEE_IMGPROC_CROSS);
printf("%06x\n", pixel_value);
