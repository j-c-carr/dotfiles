#!/bin/bash

current_dir="/home/jcc/Documents/current"
file="/home/jcc/Documents/current/main.tex"
sections="toc notes assignments appendix"

new_geometry () {
    #
    ## Uncomments newgeometry line in assingments
    #

    # Get the line number of last entry
    startLine=$(grep -wn "% Start of assignments" $file | cut -d: -f1)

    j=$startLine 
    ((j = j + 2))
    sed -i -e "$((j))s/%//" $file
}

show_section () {
    #
    ## Includes the "start of $1"
    #

    # Get the line number of last entry
    startLine=$(grep -wn "% Start of $1" $file | cut -d: -f1)
    endLine=$(grep -wn "End of $1" $file | cut -d: -f1)

    j=$startLine 
    ((j = j + 1))
    while [[ $j < $endLine ]]
    do
        sed -i -e "$((j))s/%//" $file

        #echo $j

        ((j = j + 1))
    done
}

hide_section () {
    #
    ## Hides the "start of $1" until "end of $1"
    #

    # Get the line number of last entry
    startLine=$(grep -wn "% Start of $1" $file | cut -d: -f1)
    endLine=$(grep -wn "End of $1" $file | cut -d: -f1)

    j=$startLine 
    ((j = j + 1))
    while [[ $j < $endLine ]]
    do
        sed -i -e $((j))s/^/%/ $file

        ((j = j + 1))
    done
}

hide_all_sections () {

    for section in $sections
    do
        show_section $section
        hide_section $section
    done
}

new_tex_file () {
    #
    ## $1 - section
    ## Adds a new file to the section
    #
    endLine=$(grep -wn "% End of $1" $file | cut -d: -f1)
    if [[ $1 == "appendix" ]]; then
        endLine=$(($endLine-1 ))
        prefix="t_"
    elif [[ $1 == "assignments" ]]; then
        prefix="a_"
    else
        prefix="lec_"
    fi

    line=`sed "$((endLine - 1))q;d" $file`

    old_file_num="${line//[!0-9]/}"
    old_file_num=$(echo $old_file_num | sed 's/^0*//')
    next_file_num=$(($old_file_num+1 ))

    if [[ $next_file_num -lt 10 ]]; then
        next_file_num="0$next_file_num"
    fi

    touch "$prefix$next_file_num.tex"
    input_str="input{$prefix$next_file_num.tex}"
    sed -i "$endLine i $input_str" $file
    sed -i 's/^input/\\&/' $file
    < /dev/tty vim -o $prefix$next_file_num.tex
    #echo $input_str

}

show_last_file () {
    #
    ## Shows the last file in a certain section
    ## $1 := section
    #
    endLine=$(grep -wn "% End of $1" $file | cut -d: -f1)
    if [[ $1 == "appendix" ]]; then
        endLine=$(($endLine-1 ))
    fi

    j=$(($endLine-1))
    sed -i -e "$((j))s/%//" $file
    < /dev/tty vim -o +$j $file

}

compile () {
    pdflatex -synctex=1 -interaction=nonstopmode -output-directory='/home/jcc/Documents/current/' $file
}

# Error
if [[ $PWD != $current_dir ]]; then
    echo "Switch to the current directory!"

# Compile notebook
elif [[ $1 == "n" ]]; then

    hide_all_sections 

    for section in toc notes appendix
    do 
        show_section $section
    done
    compile
    cp main.pdf notes.pdf

# Handle input for different file types
elif [[ $1 == "l" ]]; then

    hide_all_sections
    new_tex_file "notes"

elif [[ $1 == "a" ]]; then

    hide_all_sections
    new_tex_file "assignments"

elif [[ $1 == "wa" ]]; then

    hide_all_sections
    new_geometry
    show_last_file "assignments"

elif [[ $1 == "t" ]]; then

    hide_all_sections
    new_tex_file "appendix"

else
    echo "Have a nice day"

fi

