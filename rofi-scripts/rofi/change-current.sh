#!/bin/bash

# capitalize first letter
dir_title="$(tr '[:lower:]' '[:upper:]' <<< ${1:0:1})${1:1}"

# If it is a course, look in the semester
if [[ $1 == "course" ]]; then
    ln -nsf ~/Documents/semester-4/$2 ~/Documents/current; export CURRENT=Discrete\ Structures;
    # open topic section
    /bin/bash $HOME/.config/rofi/rofi-view-notes.sh

# General topic opener
elif [[ $1 != "new" ]]; then
    ln -nsf ~/Documents/$1 ~/Documents/current;export CURRENT=Algorithm\ Notes;

    # open topic section
    /bin/bash $HOME/.config/rofi/rofi-view-notes.sh

# New topic
elif [[ $1 == "new" ]]; then
    echo 'New Course? (Y,n)'
    read r

    if [[ $r == "n" ]]; then # new topic
        echo Enter Subject Name
        read subjectName

        # make a directory for the new topic
        dir_name=${subjectName,,}
        dir_name=${dir_name// /-}
        $(mkdir ~/Documents/$dir_name)

        $(touch ~/Documents/$dir_name/master.tex)
        $(cp /home/jcc/.utils/master-template.tex ~/Documents/$dir_name/master.tex)
        
        ## create a csv file
        $(touch ~/Documents/$dir_name/.notes.csv)
        addFileEntry="New Section,$HOME/.config/rofi/view-algo-notes.sh ns"
        masterEntry="Master,$HOME/.config/rofi/view-algo-notes.sh master"
        $(echo $addFileEntry >> ~/Documents/$dir_name/.notes.csv)
        $(echo $masterEntry >> ~/Documents/$dir_name/.notes.csv)

        # Add to list of subjects 
        subjectEntry="$subjectName,$HOME/.config/rofi/change-current.sh course $dir_name"
        $(echo $subjectEntry >> $HOME/.config/rofi/subjects.csv)

        # Open the file viewer
        ln -nsf ~/Documents/$dir_name ~/Documents/current; export CURRENT=$subjectName;
        /bin/bash $HOME/.config/rofi/rofi-view-notes.sh

    else
        # new course
        echo Enter Course Title
        read courseTitle
        

        dir_name=${courseTitle,,}
        dir_name=${dir_name// /-}

        # Initialize course directory
        $(mkdir ~/Documents/semester-4/$dir_name)

        $(cp /home/jcc/.utils/master-template.tex ~/Documents/semester-4/$dir_name/master.tex)

        $(cp /home/jcc/.utils/lec-data-template.csv /home/jcc/Documents/semester-4/$dir_name/.notes.csv)

        # Add to the list of subjects
        courseEntry="$courseTitle,$HOME/.config/rofi/change-current.sh course $dir_name"
        $(echo $courseEntry >> $HOME/.config/rofi/subjects.csv)

        /home/jcc/.utils/sort_csv /home/jcc/.config/rofi/subjects.csv

        # open file viewer
        ln -nsf ~/Documents/semester-4/$dir_name ~/Documents/current; export CURRENT=$courseTitle;
        /bin/bash $HOME/.config/rofi/rofi-view-notes.sh
    fi
fi

