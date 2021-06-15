  #define RXD2 16
  #define TXD2 17

int max_x = 200, max_y = 200, head_x = 0, head_y = 0, tail_x = 0, tail_y = 0;
int prev_x, prev_y;
int int_y = max_y/10;
bool mov = 0;
bool cw = 0;
int orient_x = (head_x > tail_x)? 1:(head_x < tail_x)? -1:0 ;  //1 right, -1 left, 0 vertical
int orient_y = (head_y > tail_y)? 1:(head_y < tail_y)? -1:0 ;  //1 up, -1 down, 0 horizontal

void setup() {
  // put your setup code here, to run once:
  Serial.begin(38400);
  //Serial1.begin(9600, SERIAL_8N1, RXD2, TXD2);
  Serial2.begin(38400, SERIAL_8N1, RXD2, TXD2);   // the SERIAL_8N1 sets data, parity, and stop bits
  Serial.println("Serial Txd is on pin: "+String(TX));
  Serial.println("Serial Rxd is on pin: "+String(RX));
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial2.available()){
    int x_pos = Serial2.read();
    int y_pos = Serial2.read();
    float total_distance = Serial2.read();

    if(mov && (head_x>=0) && (head_x<max_x) && (head_y>=0) && (head_y<max_y)){
      move_forward();
    }
    else if(mov && (head_x>=0) && (head_x<max_x) && (head_y>=0) && (head_y<max_y)){
      move_back();
    }
    else if(!mov && cw){
      rotate_clock();
    }
    else if(!mov && !cw){
      rotate_anticlock();
    }
    else{
      idle();
    }
    
  }
  
}

void move_forward(){
  Serial2.println(26);   //medium
  if(orient_y == 0){            //car is horizontal
    if(orient_x == 1){          //head towards right
      head_x++, tail_x++;       //move right
      print_to_serial();
    }else if (orient_x == -1){   //head towards left
      head_x--, tail_x--;       //move left
      print_to_serial();
    }
  }else if (orient_x == 0){      //car is vertical
    if(orient_y == 1){          //heading up
      head_y++, tail_y++;       //move up
      print_to_serial();
    }else if (orient_y == -1){   //heading down
      head_y--, tail_y--;       //move down
      print_to_serial();
    }
  }
}

void move_back(){
  Serial2.println(10);    //medium
    if(orient_y == 0){      //car is horizontal
      if(orient_x == 1){      //head towards right
        head_x--, tail_x--;   //move left
        print_to_serial();
      }else if (orient_x == -1){   //head towards left
        head_x++, tail_x++;       //move right
        print_to_serial();
      }
    }else if (orient_x == 0){      //car is vertical
      if(orient_y == 1){          //heading up
        head_y--, tail_y--;       //move down
        print_to_serial();
      }else if (orient_y == -1){   //heading down
        head_y++, tail_y++;       //move up
        print_to_serial();
      }
    }
}

//assume we can only turn by 90 degrees, left or right, for now
//1) need to make turning gradual
//2) need to connect the head/tail of x/y at END of MOVE with START of ROTATE, and END of ROTATE with START of MOVE

void rotate_clock(){
  Serial2.println(3);   //medium
  if((orient_y==1) && (orient_x>=0)){     //in first quadrant
    head_y--, tail_y++;
    head_x++, tail_x--;
    print_to_serial();
  }else if((orient_x==1) && (orient_y<=0)){     //in fourth quadrant
    head_y--, tail_y++;
    head_x--, tail_x++;
    print_to_serial();
  }else if ((orient_y==-1) && (orient_x<=0)){     //in third quadrant
    head_y++, tail_y--;
    head_x--, tail_x++;
    print_to_serial();
  }else if ((orient_x==-1) && (orient_y>=0)){     //in second quadrant
    head_y++, tail_y--;
    head_x++, tail_x--;
    print_to_serial();
  }
}

void rotate_anticlock(){
  Serial2.println(2);    //medium
    if((orient_y==1) && (orient_x<=0)){     //in second quadrant
    head_y--, tail_y++;
    head_x--, tail_x++;
    print_to_serial();
  }else if((orient_x==-1) && (orient_y<=0)){     //in third quadrant
    head_y--, tail_y++;
    head_x++, tail_x--;
    print_to_serial();
  }else if ((orient_y==-1) && (orient_x>=0)){     //in fourth quadrant
    head_y++, tail_y--;
    head_x++, tail_x--;
    print_to_serial();
  }else if ((orient_x==1) && (orient_y>=0)){     //in first quadrant
    head_y++, tail_y--;
    head_x--, tail_x++;
    print_to_serial();
  }
}

void idle(){
  Serial2.println(31);    //STOP
  print_to_serial();
  }

void print_to_serial(){
  Serial.print("head_x:" );
  Serial.print(head_x);
  Serial.print(", tail_x:");
  Serial.print(tail_x);
  Serial.print(", head_y:");
  Serial.print(head_y);
  Serial.print(", tail_y:");
  Serial.println(tail_y);
  }

  /* XX11X   STOP   6/7/14/15/22/23/30/31
   *  
   * ROTATE ANTICLOCKWISE
   * X0000  FAST      0/16
   * X0010  MEDIUM    2/18
   * X0100  SLOW      4/20
   * 
   * ROTATE CLOCKWISE
   * X0001  FAST      1/17
   * X0011  MEDIUM    3/19
   * X0101  SLOW      5/21
   * 
   * MOVE FORWARDS
   * 1100X  FAST      24/25
   * 1101X  MEDIUM    26/27
   * 1110X  SLOW      28/29
   * 
   * MOVE BACKWARDS
   * 0100X  FAST      8/9
   * 0101X  MEDIUM    10/11
   * 0110X  SLOW      12/13
   */
