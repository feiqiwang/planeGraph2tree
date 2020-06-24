#!/bin/bash

#You can customize the clustering result file name HERE.
clusterFile="ClusterResult.pdf"

#DO NOT change the file name of tree edit distance.
fileName="treeEditDistanceResult.CSV"

#You can change the file path HERE.
path="./MutiRootTreeExample/PKB"

#You can set the experiment number HERE.
expNumBegin=1
expNumEnd=10

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

for ((i=expNumBegin;i<=expNumEnd;i++))
do
	echo -n ",$i" >> $fileName
done

echo -e "\r" >> $fileName

for ((i=expNumBegin;i<=expNumEnd;i++))
do
	echo -n "$i">>$fileName
	for ((j=expNumBegin;j<=expNumEnd;j++))
	do
		result=999999

		for file in `ls $path$i/`
		do
			for sfile in `ls $path$j/`
			do
				r=$(java -jar RTED_v1.2.jar -f $path$i/$file $path$j/$sfile -c $insertion $delection $subtitution -s left --switch)
				rint=${r%.*}
				if [ $result -gt $rint ];then
					result=$rint
				fi
			done
		done
		echo -n "," >> $fileName
		echo -n $result >> $fileName
		echo -n -e '\u2022'
	done
	echo -e "\r" >> $fileName
done
echo -e "\r"
echo "Tree edit distance computation complected."
echo -e "\r"

Rscript clusteringComputation.r
mv Rplots.pdf $clusterFile
echo "Clustering result have been saved in $clusterFile."
