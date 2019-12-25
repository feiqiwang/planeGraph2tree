# PEELING-PlaneGraphTransformation
**PEELING** is a novel method for computing the topological centroid of a plane graph and transferring graph structure to tree structure. It can be applied on comparing pseudo-knotted RNA secondary structure.
![](https://github.com/feiqiwang/screenshots/blob/master/A%20New%20Method%20for%20Comparing%20Pseudo-knotted%20RNA%20Secondary.png?raw=true)
## Requirement
Microsoft Visual Studio Community 2017.
BPSEQ as the input format.
> BPSEQ is a common data format for RNA secondary structure and it contain three column. The first column is the index ordered from 5' to 3' for RNA sequence. The second column contain the label that acronym of nucleotide type which can be A, U, G or C. Besides, acronyms can be X which means this nucleotide would be any type or Y which means this nucleotide would be C or U. The third column inform the index of paired partner for the nucleotide, and it will be 0 if the nucleotide is unpaired.

Input file need be Text Document(.txt).

## Usage
 - **STEP 1** :
 Open *CanonicalFormComputing.vcxproj* file in folder *CanonicalFormComputing* by **Microsoft Visual Studio**.
 - **STEP 2** :
You can easily use this program by changing fileName in *CanoicalFormComputing.cpp*.
> string fileName = "BPSEQexample";

Transferring BPSEQ format to DCEL by creating the class and running *formTransfer method*.
> DCELformTransfer DT; 
> DT.formTransfer(fileName);

Build a tree from DCEL by creating the class and running *buildGraph method* and *RUNNING method*.
> PlaneGraph PG; 
> PG.buildGraph(fileName + "_ver.txt", fileName + "_edge.txt", fileName + "_face.txt"); PG.setOuterFace(fileName +"_outerF.txt"); 
> PG.RUNNING();

The root can be transferred to multiple.
> rootTrans RT; 
> RT.running(fileName);


- **STEP 3** :
 Find your result in folder named *tree_result_MutiRoot*.
