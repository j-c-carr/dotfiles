#!/bin/bash

CURRENT_DIR="$HOME/Documents/current"
DATE=`date '+%b %d %Y'`

if [[ $1 == "master" ]]; then
    vi ~/Documents/current/master.tex

#
## NEW LECTURE
#
elif [[ $1 == "newLecture" ]]; then

    # GET THE NUMBER OF NOTES
    numNotes=`wc -l < $CURRENT_DIR/.notes.csv`


    # CREATE A NEW NOTE, ADD TO CSV FILE
    lecNumber=$(($numNotes-4))
    
    if [[ $lecNumber -lt 10 ]]; then
        lecString="0$lecNumber"
    else
        lecString="$lecNumber"
    fi

    echo $lecNumber
    $(echo Lecture $lecString,$HOME/.config/rofi/view-lecture-notes.sh, lec_$lecString >> $CURRENT_DIR/.notes.csv)

    # sort the csv file
    $HOME/.utils/sort_csv $CURRENT_DIR/.notes.csv
    

    # CHANGE input in MASTER.TEX
    /bin/bash "$HOME/.config/rofi/insert.sh" "$CURRENT_DIR/master.tex" "% End of lectures" "\\input{lec_$lecString.tex}"

    # Create new file, open in vim
    newLec="$CURRENT_DIR/lec_$lecString.tex"

    echo "lec_$lecNumber.tex created"
    $(echo \\lecture\{$lecString\}\{$DATE\} >> $newLec)
    vi -p $newLec "$CURRENT_DIR/master.tex"

#
## OPEN EXISTING LECTURE
#
elif [[ $1 =~ lec_..* ]]; then
    echo $1
    f="$CURRENT_DIR/$1.tex"
    vi -p $f "$CURRENT_DIR/master.tex"
fi

