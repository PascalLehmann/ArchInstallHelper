#!/bin/bash

# Farben definition normal
black="\e[0;30m"
rot="\e[0;31m"
gruen="\e[0;32m"
gelb="\e[0;33m"
blau="\e[0;34m"
lila="\e[0;35m"
cyan="\e[0;36m"
weiss="\e[0;37m"

# Farben definition Bold
black_bo="\e[1;30m"
rot_bo="\e[1;31m"
gruen_bo="\e[1;32m"
gelb_bo="\e[1;33m"
blau_bo="\e[1;34m"
lila_bo="\e[1;35m"
cyan_bo="\e[1;36m"
weiss_bo="\e[1;37m"

# Farben definition Underline
black_u="\e[4;30m"
rot_u="\e[4;31m"
gruen_u="\e[4;32m"
gelb_u="\e[4;33m"
blau_u="\e[4;34m"
lila_u="\e[4;35m"
cyan_u="\e[4;36m"
weiss_u="\e[4;37m"

# Farben definition Background
black_bg="\e[40m"
rot_bg="\e[41m"
gruen_bg="\e[42m"
gelb_bg="\e[43m"
blau_bg="\e[44m"
lila_bg="\e[45m"
cyan_bg="\e[46m"
weiss_bg="\e[47m"

# Farben definition High Intensity
black_hi="\e[0;90m"
rot_hi="\e[0;91m"
gruen_hi="\e[0;92m"
gelb_hi="\e[0;93m"
blau_hi="\e[0;94m"
lila_hi="\e[0;95m"
cyan_hi="\e[0;96m"
weiss_hi="\e[0;97m"

# Farben definition Bold High Intensity
black_bohi="\e[1;90m"
rot_bohi="\e[1;91m"
gruen_bohi="\e[1;92m"
gelb_bohi="\e[1;93m"
blau_bohi="\e[1;94m"
lila_bohi="\e[1;95m"
cyan_bohi="\e[1;96m"
weiss_bohi="\e[1;97m"

# Farben definition High Intensity backgrounds
black_bghi="\e[100m"
rot_bghi="\e[101m"
gruen_bghi="\e[102m"
gelb_bghi="\e[103m"
blau_bghi="\e[104m"
lila_bghi="\e[105m"
cyan_bghi="\e[106m"
weiss_bghi="\e[107m"

# Reset
reset="\e[0m"

: '
# other styles
echo -e "\e[1mbold\e[0m"
echo -e "\e[3mitalic\e[0m"
echo -e "\e[3m\e[1mbold italic\e[0m"
echo -e "\e[4munderline\e[0m"
echo -e "\e[9mstrikethrough\e[0m"
echo -e "\e[31mHello World\e[0m"
echo -e "\x1B[31mHello World\e[0m"
'
