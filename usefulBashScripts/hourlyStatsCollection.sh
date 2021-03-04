#This scripte will collect top,netstat,free,socket stats every hour in a file named hourlyStats.log. In order to limit the file size, the script will reset the file after every 200 hours.
#!/bin/bash
declare -i iteration=0
while true ;
do
  sleep 3600
  iteration=$iteration+1
  printf "\n\n***********************************************************************************************************\n" >> hourlyStats.log
  printf "Timestamp-->" >> hourlyStats.log
  date >> hourlyStats.log
  printf "\n*******Top stats*****\n" >> hourlyStats.log
  top -bn 1 | head -n 20  >> hourlyStats.log
  printf "\n******Free Memory stats******\n" >> hourlyStats.log
  free -mh >> hourlyStats.log
  printf "\n******netstat stats*********\n" >> hourlyStats.log
  netstat -i >> hourlyStats.log

  printf "\n********socket stats**********\n" >>hourlyStats.log
  cat /proc/net/udp6 >> hourlyStats.log
  if [ $iteration -gt 200 ]
  then
    rm -f hourlyStats.log
    iteration=0
  fi
done
