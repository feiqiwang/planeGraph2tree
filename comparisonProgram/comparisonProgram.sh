#!/bin/bash

#You can customize the clustering result file name HERE.
clusterFile="ClusterResult.pdf"

#DO NOT change the file name of tree edit distance.
fileName="treeEditDistanceResult.CSV"

#You can change the file path HERE.
path="./MutiRootTreeExample"

#You can customize Tree Edit Distance parameters HERE.
insertion=1
delection=1
subtitution=1

if [ ! -f "./RTED_v1.2.jar" ]; then
	wget http://tree-edit-distance.dbresearch.uni-salzburg.at/downloads/projects/tree-edit-distance/RTED_v1.2.jar
fi

if [ -f "./treeEditDistanceResult.CSV" ]; then
	rm treeEditDistanceResult.CSV
fi

if [ -f "./$clusterFile" ]; then
	rm $clusterFile
fi
echo "------------------------------------------------------------"
echo "|  Transferred RNA Secondary Structure Comparison Program  |"
echo "------------------------------------------------------------"
echo -e "\r"
echo "Tree edit distance computation START."

echo -n "dist" >> $fileName

for expData in `ls $path/`
do
	echo -n ",$expData" >> $fileName
done

echo -e "\r" >> $fileName

for expData1 in `ls $path/`
do
	echo -n "$expData1">>$fileName
	for expData2 in `ls $path/`
	do
		result=999999

		for file in `ls $path/$expData1/`
		do
			for sfile in `ls $path/$expData2/`
			do
				r=$(java -jar RTED_v1.2.jar -f $path/$expData1/$file $path/$expData2/$sfile -c $insertion $delection $subtitution -s left --switch)
				rint=${r%.*}
				if [ $result -gt $rint ];then
					result=$rint
				fi
			done
		done
		echo -n "," >> $fileName
		echo -n $result >> $fileName
		echo -n "."
	done
	echo -e "\r" >> $fileName
done
echo -e "\r"
echo "Tree edit distance computation complected."
echo -e "\r"

Rscript clusteringComputation.r
mv Rplots.pdf $clusterFile
echo "Clustering result have been saved in $clusterFile."
