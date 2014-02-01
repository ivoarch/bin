#!/bin/sh

c00=$'\e[0;30m'
c01=$'\e[0;31m'
c02=$'\e[0;32m'
c03=$'\e[0;33m'
c04=$'\e[0;34m'
c05=$'\e[0;35m'
c06=$'\e[0;36m'
c07=$'\e[0;37m'
c08=$'\e[1;30m'
c09=$'\e[1;31m'
c10=$'\e[1;32m'
c11=$'\e[1;33m'
c12=$'\e[1;34m'
c13=$'\e[1;35m'
c14=$'\e[1;36m'
c15=$'\e[1;37m'

f0=$'\e[1;30m'
f1=$'\e[1;37m'
f2=$'\e[0;37m'

kernel=$(uname -rmo)
cpuspe=$(grep 'model name' /proc/cpuinfo| sed 1q|sed 's/^.*:\ *//')

system=$(cat /etc/os-release | sed '2,$d;s/NAME="//;s/"//')

if [ -n "$DISPLAY" ]; then
    wmname="calavera-wm"
    termfn=$(cat $HOME/.Xdefaults | awk '/*font/ {print $2}' | sed 's/xft://;s/:pixelsize//;s/=/\ /')
    systfn=$(sed -n 's/^.*font.*"\(.*\)".*$/\1/p' ~/.gtkrc-2.0)
else
    wmname="none"
    termfn="none"
    systfn="none"
fi

pkgnum=$(pacman -Q|wc -l)
birthd=$(sed -n '1s/^\[\([0-9-]*\).*$/\1/p' /var/log/pacman.log | tr - .)

gitdir="None"
myblog="https://ivoarch.github.io"

cat <<EOF
${c00}▉▉  | ${f1}OS ${f0}........... $f2$system
${c08}  ▉▉| ${f1}Name ${f0}......... $f2$HOSTNAME
${c01}▉▉  | ${f1}Birth day${f0}..... $f2$birthd
${c09}  ▉▉| ${f1}Packages ${f0}..... $f2$pkgnum
${c02}▉▉  |
${c10}  ▉▉| ${f1}Wm ${f0}........... $f2$wmname
${c03}▉▉  | ${f1}Shell ${f0}........ $f2$SHELL
${c11}  ▉▉| ${f1}Terminal ${f0}..... $f2$TERM
${c04}▉▉  | ${f1}Editor ${f0}....... $f2$EDITOR
${c12}  ▉▉| ${f1}Browser ${f0}...... $f2$BROWSER
${c05}▉▉  |
${c13}  ▉▉| ${f1}Kernel ${f0}....... $f2$kernel
${c06}▉▉  | ${f1}Processor ${f0}.... $f2$cpuspe
${c14}  ▉▉|
${c07}▉▉  | ${f1}System font ${f0}.. $f2$systfn
${c15}  ▉▉| ${f1}Term font ${f0}.... $f2$termfn
EOF
