/*
*   client.cpp
*   File for setting up TCP/IP client

*/
//  Libraries

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <time.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <string.h>
#define PORT 8080
#define LOCAL "127.0.0.1"
//  Main Function

int main(int argc, char const *argv[])
{
	int sock = 0, valread;
	struct sockaddr_in serv_addr;
	char buffer[1024] = {0};
	if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0)
	{
		printf("\n Socket creation error \n");
		return -1;
	}

	serv_addr.sin_family = AF_INET;
	serv_addr.sin_port = htons(PORT);
	
	// Convert IPv4 and IPv6 addresses from text to binary form
	if(inet_pton(AF_INET, LOCAL , &serv_addr.sin_addr)<=0)
	{
		printf("\nInvalid address/ Address not supported \n");
		return -1;
	}

	if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
	{
		printf("\nConnection Failed \n");
		return -1;
	}
	char bytes[4] = {26,18,26,3}; 
	char hello1[12] = {'a','b','c','d','e','f','g','h',bytes[0],'j',bytes[3]};
	char hello2[12] = {'c','d','e','f','g','h','i','j',bytes[0],'~',bytes[2]};
	char hello3[12] = {'(','*','&','^','$','%','%','^',bytes[0],'j',bytes[1]};
	char hello4[12] = {'1','2','4','5','6','7','8','9',bytes[0],'7',bytes[0]};
	char hello5[12] = {'a','b','c','d','e','f','g','h',bytes[3],'j',bytes[3]};
	char hello6[12] = {'c','d','e','f','g','h','i','j',bytes[3],'~',bytes[2]};
	char hello7[12] = {'(','*','&','^','$','%','%','^',bytes[0],'j',bytes[1]};
	char hello8[12] = {'1','2','4','5','6','7','8','9',bytes[0],'7',bytes[0]};
	char hello9[12] = {'a','b','c','d','e','f','g','h',bytes[0],'j',bytes[3]};
	char hello10[12] = {'c','d','e','f','g','h','i','j',bytes[3],'~',bytes[2]};
	char hello11[12] = {'(','*','&','^','$','%','%','^',bytes[3],'j',bytes[1]};
	char hello12[12] = {'1','2','4','5','6','7','8','9',bytes[3],'7',bytes[0]};
	char hello13[12] = {'a','b','c','d','e','f','g','h',bytes[0],'j',bytes[3]};
	char hello14[12] = {'c','d','e','f','g','h','i','j',bytes[0],'~',bytes[2]};
	char hello15[12] = {'(','*','&','^','$','%','%','^',bytes[0],'j',bytes[1]};
	char hello16[12] = {'1','2','4','5','6','7','8','9',bytes[0],'7',bytes[0]};
	char end[3]="end";
	while(1){
	// scanf("%s",hello);

	send(sock , hello1, strlen(hello1) , 0 );
	printf("%s message sent\n",hello1);
	sleep(1);
	send(sock , hello2 , strlen(hello2) , 0 );
	printf("%s message sent\n",hello2);
	sleep(1);
	send(sock , hello3, strlen(hello3) , 0 );
	printf("%s message sent\n",hello3);
	sleep(1);
	send(sock , hello4 , strlen(hello4) , 0 );
	printf("%s message sent\n",hello4);
	sleep(1);
	send(sock , hello5, strlen(hello5) , 0 );
	printf("%s message sent\n",hello5);
	sleep(1);
	send(sock , hello6 , strlen(hello6) , 0 );
	printf("%s message sent\n",hello6);
	sleep(1);
	send(sock , hello7, strlen(hello7) , 0 );
	printf("%s message sent\n",hello7);
	sleep(1);
	send(sock , hello8 , strlen(hello8) , 0 );
	printf("%s message sent\n",hello8);
	sleep(1);
	send(sock , hello9, strlen(hello9) , 0 );
	printf("%s message sent\n",hello9);
	sleep(1);
	send(sock , hello10 , strlen(hello10) , 0 );
	printf("%s message sent\n",hello10);
	sleep(1);
	send(sock , hello11, strlen(hello11) , 0 );
	printf("%s message sent\n",hello11);
	sleep(1);
	send(sock , hello12 , strlen(hello12) , 0 );
	printf("%s message sent\n",hello12);
	sleep(1);
	send(sock , hello13, strlen(hello13) , 0 );
	printf("%s message sent\n",hello13);
	sleep(1);
	send(sock , hello14 , strlen(hello14) , 0 );
	printf("%s message sent\n",hello14);
	sleep(1);
	send(sock , hello15, strlen(hello15) , 0 );
	printf("%s message sent\n",hello7);
	sleep(1);
	send(sock , hello15 , strlen(hello15) , 0 );
	printf("%s message sent\n",hello15);
	valread = read( sock , buffer, 1024);
	printf("%s\n",buffer);
	}
	return 0;
}

