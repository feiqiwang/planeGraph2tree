//
//  main.cpp
//  CanonicalFormComputing_mac
//
//  Created by Feiqi Wang on 6/29/32 H.
//  Copyright © 32 Feiqi Wang. All rights reserved.
//

#include <iostream>
#include <fstream>
#include <vector>
#include <string>

#include "CentroidComputing.h"
#include "DCELformTransfer.h"
#include "RootTransformation.h"

using namespace std;

int main(int argc, const char * argv[]) {
    /*Example code*/
    
    string fileName = "example";
    
    DCELformTransfer DT;
    DT.formTransfer(fileName);
    
    PlaneGraph PG;
    PG.buildGraph(fileName + "_ver.txt", fileName + "_edge.txt", fileName + "_face.txt");
    PG.setOuterFace(fileName + "_outerF.txt");
    PG.RUNNING();
    
    rootTrans RT;
    RT.running(fileName);
    
    PG.APTEDformTrans_AllVerAsRoot();
    
    system("Pause");
    return 0;
}
