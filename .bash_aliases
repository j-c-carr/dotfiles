#
# # school
#

alias nag='vim $HOME/jonathancolacocarr.github.io/js/calendar.js'
alias ag='firefox $HOME/jonathancolacocarr.github.io/dashboard.html'
alias cur='/$HOME/.config/rofi/rofi-course-viewer.sh'
alias ma='vim main.tex'
alias rms='rm main.[aflos]*'
alias bex='bundle exec jekyll serve'

#
# # backlight
#
alias light="sudo vi /sys/class/backlight/intel_backlight/brightness"

## Logout
alias lgo="sudo service lightdm restart"
## Polybar
alias poly="/$HOME/.config/polybar/launch.sh"
alias cm="pdflatex -synctex=1 -interaction=nonstopmode -output-directory='$HOME/Documents/current/' '$HOME/Documents/current/main.tex'"
alias cr="cd ~/Documents/current/"
alias ifig="inkscape-figures watch; python3 ~/Public/inkscape-shortcut-manager/main.py"



## School links
alias ode="ln -nsf ~/Documents/courses/math-325 ~/Documents/current; cd $HOME/Documents/current"
alias han="ln -nsf ~/Documents/courses/math-255 ~/Documents/current; cd $HOME/Documents/current"
alias alg="ln -nsf ~/Documents/courses/math-251 ~/Documents/current; cd $HOME/Documents/current"
alias comp="ln -nsf ~/Documents/courses/math-249 ~/Documents/current; cd $HOME/Documents/current"
alias exper="ln -nsf ~/Documents/courses/phys-258 ~/Documents/current; cd $HOME/Documents/current"
alias qmech="ln -nsf ~/Documents/courses/qmech ~/Documents/current; cd $HOME/Documents/current"
alias rl="ln -nsf ~/Documents/courses/reinforcement-learning ~/Documents/current; cd $HOME/Documents/current"
alias cosm="ln -nsf ~/Documents/cosmo ~/Documents/current; cd $HOME/Documents/current"
alias mk="~/.bin/compile-notes.sh"


## Conda alias
alias jupyter="conda activate; jupyter notebook"
alias gtk_debug="export GTK_DEBUG=interactive"
