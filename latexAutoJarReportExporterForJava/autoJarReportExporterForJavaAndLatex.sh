#!/usr/bin/env bash

if [ $# != 1 ] ; then
    echo "usage: autoReportExporter path/to/report_file (Ex: report01-08-??????)."
    exit 1;
fi

if [ -e $1 ]; then
    echo "path found.";
    valid_path=`cd -P $1; pwd`;
    dir_name=`cd -P $1; pwd | xargs basename`;
else
    echo "not a valid path.";
    exit 1;
fi

texFileCount=`find $valid_path/*.tex -type f | wc -l`
if [ $texFileCount != 1 ] ; then
    echo "a tex file should be put in the directory.";
    exit 1;
fi
echo "tex file found.";

cd $valid_path; platex -shell-escape $valid_path/*.tex && dvipdfmx $valid_path/*.dvi -o $dir_name.pdf && open $valid_path/$dir_name.pdf
echo "pdf file generated.";

javac  -encoding UTF-8  $valid_path/*.java;
echo "javac compilation finished.";

cd $valid_path; jar cf $dir_name.jar *.java *.class *.pdf;
echo "jar file generated.";

for f in $valid_path/*.java ; do
    java -cp $valid_path/$dir_name.jar `echo ${f##*/} | sed 's/\.[^\.]*$//'`;
done;
