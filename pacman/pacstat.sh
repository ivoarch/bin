#!/bin/sh
# Pacman stats

P=$(pacman -Q | wc -l)
E=$(pacman -Qe | wc -l)
D=$(pacman -Qd | wc -l)
N=$(pacman -Qdt | wc -l)
U=$(pacman -Qu | wc -l)
M=$(pacman -Qm | wc -l)

printf "Explicit : %4s\n" "$E"
printf "Dependency : %4s\n" "$D"
printf "Not needed : %4s\n" "$N"
printf "Outdated : %4s\n" "$U"
printf "Foreign : %4s\n" "$M"
printf "Total : %4s\n" "$P"
