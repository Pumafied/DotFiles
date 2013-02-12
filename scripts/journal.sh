#!/bin/bash

# Cron script for 30-min activity journal
#-------------------------------------------

#export DISPLAY=:0

#echo -e -n "\n[" `date` "] :\n" >> ~/Dotfiles/.journal
#/usr/bin/gvim  -geometry 100x40+512+400 + ~/DotFiles/.journal

#!/bin/bash

# Cron script for 30-min activity journal
#-------------------------------------------

export DISPLAY=:0
echo -n "\n[" `date` "] :\n" >> ~/Documents/Austin-Lubker-Thinktank/.journal
/usr/bin/gvim -geometry 100x40+512+400 + ~/Documents/Austin-Lubker-Thinktank/.journal
