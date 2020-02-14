#!/bin/bash


CURRENT_DIR="$HOME/Documents/current"
DATE=`date '+%b %d %Y'`
## Knowledgebase folders
subtopics=$(echo /home/jcc/.config/rofi/algo-sublist)


#
## OPEN MASTER
#
if [[ $1 == "master" ]]; then
    vi ~/Documents/current/master.tex

#
## NEW TOPIC
#
elif [[ $1 = "ns" ]]; then
    echo "Topic Name: "
    read name
    dir_name=${name,,}
    dir_name=${dir_name// /-} # new dir name
    mkdir "$CURRENT_DIR/$dir_name"
    csvEntry="New $name note,$HOME/.config/rofi/view-algo-notes.sh, $dir_name"
    sed -i "3i$csvEntry" "$CURRENT_DIR/.notes.csv"

    /home/jcc/.utils/sort_csv $CURRENT_DIR/.notes/.csv
    # Add to knowledge base
    echo "$CURRENT_DIR," >> /home/jcc/.config/rofi/algo-sublist
    echo "$CURRENT_DIR/$dir_name"
    echo "$dir_name created."

    # Add topic to master.tex
    /home/jcc/.config/rofi/compile-notes.sh new-topic $dir_name

    # Go to Course Page
    /home/jcc/.config/rofi/rofi-view-notes.sh
#
## NEW NOTE IN KNOWN TOPIC
#
elif [[ $subtopics =~ $1 ]]; then
    echo "Note Name:"
    read name
    note_name=${name,,}
    note_name=${note_name// /-} # new file name
    
    # ADD CSV ENTRY
    # get the title of the parent directory
    if [[ $1 == "slam" ]]; then
        dir_title="SLAM"
    else
        # capitalize first letter
        dir_title="$(tr '[:lower:]' '[:upper:]' <<< ${1:0:1})${1:1}"
    fi
    csvEntry="$dir_title: $name,$HOME/.config/rofi/courses.sh $1/$note_name"
    sed -i "3i$csvEntry" "$CURRENT_DIR/.notes.csv"
    
    # Sort the csv file
    $HOME/.utils/sort_csv $CURRENT_DIR/.notes.csv

    f="$CURRENT_DIR/$1/$note_name.tex"
    touch $f
    echo "${note_name}.tex created."
    /home/jcc/.config/rofi/compile-notes.sh new-note $1 $note_name 
    vi -p $f $CURRENT_DIR/master.tex

#
## OPEN EXISTING NOTE
#
else
    # OPEN KNOWLEDGEBASE NOTE 
    f="$CURRENT_DIR/$1.tex"
    vi -p $f "$CURRENT_DIR/master.tex"
fi

# TODO
#       SORT NOTES IN CSV FILE
#       COMPILE ALL FILES
#       LIST ALL COURSES/TOPICS
