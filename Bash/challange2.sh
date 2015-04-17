#!/bin/bash
freespace=$(df -h / | grep -E "\/$" | awk '{print $4}')
text="\033[34m"
bold="\033[1m"
normal="\033[0m"
logdate=$(date +"%Y%m%d")
logfile="$logdate"_report.log

echo -e $bold"Quick system report for "$text"$HOSTNAME"$normal
printf "\tSystem type:\t%s\n" $MACHTYPE
printf "\tBash Version:\t%s\n" $BASH_VERSION
printf "\tFree Space:\t%s\n" $freespace
printf "\tFiles in dir:\t%s\n" $(ls | wc -l)
printf "\tGenerated on:\t%s\n" $(date +"%m/%d/%y") # US date format
echo -e $text"A summary of this info has been saved to $logfile"$normal

cat <<- EOF > $logfile
	This report was automatically generated by my Bash script.
	It contains a brief summary of some system information.
EOF

printf "SYS:\t%s\n" $MACHTYPE >> $logfile
printf "BASH:\t%s\n" $BASH_VERSION >> $logfile
