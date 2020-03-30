#ifndef __ATTACK_CHANGE_H__
#define __ATTACK_CHANGE_H__

#include <iostream>
#include <unistd.h>

using namespace std;

#define SAT_NAME "sat"
#define ATTACK_NAME "attack"
#define SAT_BR_NAME "sbr"

enum AttackMode
{
    SEND_FAKE_HELLO_PACKET =1,
    SEND_FAKE_LSU_PACKET   =2,
    MODIFY_HELLO_PACKET =3,
    MODIFY_LSU_PACKET =4,
    MODIFY_LSACK_PACKET =5,
    SEND_FAKE_LSACK_PACKET = 6,
    DROP_HELLO_LSU_PACKET = 7
};


inline string cmd(){ return ""; };
template <typename T, typename... Args> string cmd(T t, Args... funcRest);
template <typename... Args> string cmd(int i, Args...funcRest);

template <typename T, typename... Args> 
string cmd(T t, Args... funcRest)
{
    return t + cmd(funcRest...);
}
template <typename... Args> 
string cmd(int i, Args...funcRest)
{
    return to_string(i) + cmd(funcRest...);
}

inline void run(string command){system(command.c_str());}
inline void run_q(string command){system(cmd(command," 1> /dev/null 2> /dev/null").c_str());}

void attackLinkChange(string br);

void changeOVS_flow_v1(string br);

void changeOVS_flow_v2(string br);

void changeOVS_flow_v3(string br);

void changeOVS_flow_v4(string br);

void del_allFlowTable(string br);

#endif