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

htmlFileCount=`find $valid_path/*.html -type f | wc -l`
if [ $htmlFileCount != 1 ] ; then
    echo "a html file should be put in the directory.";
    exit 1;
fi
echo "html file found.";

wkhtmltopdf -d 300 --page-width 210mm --page-height 297mm $valid_path/*.html $valid_path/$dir_name.pdf;
echo "pdf file generated.";

javac  -encoding UTF-8  $valid_path/*.java;
echo "javac compilation finished.";

cd $valid_path; jar cf $dir_name.jar *.java *.class *.pdf;
echo "jar file generated.";

for f in $valid_path/*.java ; do
    java -cp $valid_path/$dir_name.jar `echo ${f##*/} | sed 's/\.[^\.]*$//'`;
done;
