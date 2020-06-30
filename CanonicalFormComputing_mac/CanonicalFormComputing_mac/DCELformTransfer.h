#pragma once
#include <vector>
#include <string>
#include <stdarg.h>
#include <sys/stat.h>

using namespace std;

struct halfEdges;
struct vertices;
struct faces;


class DCELformTransfer
{
public:DCELformTransfer(void);
public:~DCELformTransfer();

public:int splitTXT(string path);
public:int formTransfer(string path);
};
