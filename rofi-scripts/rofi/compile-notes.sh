#!/bin/bash

file="/home/jcc/Documents/current/master.tex"

#file="t.txt"


reset_all () {
    sed -i -e '/\\input/s/^\\input/%\\input/' $file
    sed -i -e '/colors/s/^%\\/\\/' $file
    sed -i -e '/preamble/s/^%\\/\\/' $file
}

if [[ $1 == "all" ]]; then # compile all notes
    sed -i -e '/%\\input/s/^%\\/\\/' $file


elif [[ $1 == "recent" ]]; then # hide all input files, only show most recent

    reset_all

    # open the notes on last two lectures
    endLine=$(grep -wn '% End' $file | cut -d: -f1)
    if [[ $2 == 2 ]]; then
        # show the second-to-last entry
        sed -i -e "$((endLine - 2))s/%//" $file
    fi
    
    # show the last entry
    sed -i -e "$((endLine - 1))s/%//" $file


# New Note in Known Topic #TODO
elif [[ $1 == "new-note" ]]; then # add note to topic section
    endOfTopic=$(grep -wn 'End of $2' $file | cut -d: -f1)
    LINE=$((endOfTopic))
    /bin/bash /home/jcc/.config/rofi/insert.sh $file "% End of $2" \\input{$2/$3.tex} 


# New topic
elif [[ $1 == "new-topic" ]]; then # add to bottom
    endOfNotes=$(grep -wn 'End of notes' $file | cut -d: -f1)
    LINE=$((endOfNotes))
    sed -i -e "$LINE i % Start of $2" $file # insert file input
    LINE2=$((endOfNotes+1))
    sed -i -e "$LINE2 i % End of $2" $file # insert file input

    

else
    # $1 = topic directory name
    endLine=$(grep -wn "% End of $1" $file | cut -d: -f1)

    if [[ $2 == "all" ]]; then # compile all the notes from $1 topic

        reset_all # hide all notes to begin with,

        currentLine=$(grep -wn "% Start of $1" $file | cut -d: -f1)

        ## compile all notes
        while [ $currentLine -lt $((endLine-1)) ]; do

            
            currentLine=$((currentLine + 1))

            # Show the note on the current line 
            sed -i -e "$((currentLine))s/%//" $file
        done

    fi
    #TODO: Recent compile mode per topic
fi

# COMPILE THE RESULT
pdflatex /home/jcc/Documents/current/master.tex
