int D[8];
int err = 0;    //with placeholder value
struct batt {
  int s_state, SOC, SOH;
};
int s_state = 45, l_state = 3;   //with placeholder value
int drive[3] = {10, 50, 200}; // {x, y, total_distance} with placeholder values
String DATA = "";  //concatenate D[7] - D[0]
char temp [6];

//assign placeholder values
batt batt1 = {0, 100, 99};
batt batt2 = {1, 98, 97};
batt batt3 = {2, 96, 95};

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  compute();
  assign_values();
  concatenate();
  Serial.print(DATA);
}

void loop() {
  // put your main code here, to run repeatedly:
  //  Serial.print("asdfghjkl");
}

void compute() {
  String a0 = "", a1 = "", a2 = "";
  itoa(s_state, temp, 2);
  a0 = temp[0] + temp[1];   //batt1.s_state
  a1 = temp[2] + temp[3];   //batt2.s_state
  a2 = temp[4] + temp[5];   //batt3.s_state
  batt1.s_state = bin_to_dec(a0);
  batt2.s_state = bin_to_dec(a1);
  batt3.s_state = bin_to_dec(a2);
}

int bin_to_dec(String str) {
  if (str == "00") {
    return 0;
  } else if (str == "01") {
    return 1;
  } else if (str == "10") {
    return 2;
  } else if (str == "11") {
    return 3;
  }
}

void assign_values() {
  D[7] = batt1.s_state + ((batt2.s_state) * 4) + ((batt3.s_state) * 16) + (err * 32);
  D[6] = batt1.SOC;
  D[5] = batt2.SOC;
  D[4] = batt3.SOC;
  D[3] = batt1.SOH;
  D[2] = batt2.SOH;
  D[1] = batt3.SOH;
  D[0] = l_state;
}

void concatenate() {
  for (int i = 7; i >= 0; i--) {
    DATA += char(D[i]);
  }
  //  DATA = char(D[7])+char(D[6])+char(D[5])+char(D[4])+char(D[3])+char(D[2])+char(D[1])+char(D[0]);
}
