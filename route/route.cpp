#include <unistd.h>
#include <stdio.h>
#include<stdlib.h>
#include <errno.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include<iostream>
#include <cstring>
#include <fstream>
#include <vector>

#define BUFSZ 512
using namespace std;

typedef struct Box
{
	int  flag;
	char szmsg[2048];
}Box;

int main(int argc,char* argv[])
{
	// int fd;
	// int len;
	// char buf[1024];


	// if((fd = open("fifo2",O_RDONLY))<0)
	// {
	// 	perror("Open failed");
	// 	exit(1);
	// }

	// 	while((len = read(fd,buf,1024))>0)
	// 	{
	// 		printf("%s",buf);
	// 		system(buf);
	// 	}

	// close(fd);

	//ssint satelliteId = atoi(argv[1]);
	// ifstream in;
	// vector<string> vec_str;
	// //string routeFile = "sat"+to_string(satelliteId)+".txt";
	// string routeFile = "routeTable.txt";
	// in.open(routeFile);
	// string s;

	// while (getline(in, s))
	// {
	// 	cout<<s<<endl;
	// 	system(s.c_str());
	// 	s = "";
	// 	//vec_str.push_back(s);
	// }

	// ofstream fout;
	// fout.open(routeFile,ios::trunc);
	// fout.close();
	int shmid;
	int ret;
	key_t key;
	char *shmadd;

	//system("ipcs -m");
	shmid = shmget((key_t)1234,sizeof(Box),IPC_CREAT|0666);
	void* shm = shmat(shmid,0,0);
	Box*pBox = (Box*)shm;
	string s;
	while(1)
	{
		if(pBox->flag ==1)
		{
			s = pBox->szmsg;
			int p0 = s.find("-", 0);
			string cmd_del = s.substr(0, p0);
			cout<<cmd_del<<endl;
			system(cmd_del.c_str());
			int p1 = s.find("-",p0+1);
			string cmd = s.substr(p0+1,s.size());
			cout<<cmd<<endl;
			system(cmd.c_str());
			pBox->flag = 0;


				
		}
	}
	
	shmdt(shm);
	shmctl(shmid,IPC_RMID,NULL); 

	return 0;
}

