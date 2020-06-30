#pragma once


#include <vector>
#include <string>
using namespace std;

class rootTrans 
{
public:rootTrans(void);
public:~rootTrans();

public:
	
	int running(string index);

private: 

	string readFile(string path);
	int transfer(string index);
	int saveFile(string index, int no, string result);

};
