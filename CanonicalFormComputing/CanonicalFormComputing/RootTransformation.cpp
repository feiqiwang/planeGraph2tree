#include "stdafx.h"
#include <iostream>
#include <fstream>
#include <vector>
#include <string>

#include "RootTransformation.h"

rootTrans::rootTrans()
{

}

rootTrans::~rootTrans()
{

}

int rootTrans::running(string index)
{
	transfer(index);
	return 0;
}

int rootTrans::transfer(string index)
{
	string oriori=readFile("./tree_result_inSimpleName/"+index+".txt");
	int sCount = oriori.length();
	cout << oriori << endl;
	string ori = oriori.substr(1,ori.length() - 2);
	cout << ori << endl;

	if (ori[0] == 'V')
	{
		saveFile(index,1,oriori);
	}
	else if (ori[0] == 'E' || ori[0] == 'F')
	{
		char oriRoot= ori[0];
		ori = ori.substr(1,ori.length()-1);
		vector<string> subTs;
		string subT;
		int count = 0;

		cout << "-----------------------------Start to split the subtree-------------------------------------" << endl;

		//split subtrees.
		for (string::iterator oIt = ori.begin(); oIt != ori.end(); ++oIt)
		{
			if ((*oIt) == '{')
			{
				count++;
			}
			else if ((*oIt) == '}')
			{
				count--;
			}
			subT.push_back((*oIt));
			if (count == 0)
			{
				subTs.push_back(subT);
				cout << subT << endl;
				subT.clear();
			}

		}

		cout << "-------------------------Start to rebuild tree-----------------------------------------" <<endl;
		for (int i = 0; i < subTs.size(); i++)
		{
			string result = subTs[i].substr(0 , subTs[i].length() - 1)+ '{' + oriRoot;
			cout << result << endl;
			for (int j = 0; j < subTs.size(); j++)
			{
				if (i != j)
				{
					result = result + subTs[j];
				}
			}
			result += '}'; 
			result += '}';
			cout <<"The "<<i+1<<" result is"<< result << endl;
			if (result.length() != sCount && sCount%3 != 0)
			{
				cout << "Size ERROR." << result.length()<<" "<<sCount<<endl;
				cout << endl;
			}
			

			saveFile(index, i+1, result);

			result.clear();
		}

	}
	else
	{
		cout << "Warning! The form of string is error!" << endl;
	}

	return 0;
}

string rootTrans::readFile(string path)
{
	ifstream read(path, ios::in);
	string s;
	if (!read.is_open())
	{
		cout << "File Open ERROR!" << endl;
	}
	else
	{
		getline(read,s);
	}

	return s;
}

int rootTrans::saveFile(string index, int no, string result)
{
	string folderPath = "./tree_result_MutiRoot/" + index;
	_mkdir(folderPath.c_str());
	ofstream save(folderPath+"/"+to_string(no)+".txt");
	save << result;
	save.close();

	return 0;
}
