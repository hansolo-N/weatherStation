#! /bin/bash

city=Casablanca

curl -s wttr.in/casablanca?T --output weather_report

obs_temp=$(curl -s wttr.in/casablanca?T | grep -E -m 1 '°.' | grep -Eo -e '-?[[:digit:]].*')

#To extract Current Temperature
obs_temp=$(curl -s wttr.in/$city?T | grep -m 1 '°.' | grep -Eo -e '-?[[:digit:]].*' | cut -c 1,2)
echo "The current Temperature of $city is: $obs_temp °C"


fc_temp=$(curl -s wttr.in/casablanca?T | head -n 23 | tail -1 |  grep '°.' | cut -d "C" -f 2 | grep -Eo -e '-?[[:digit:]].*' | cut -c 1,2)

echo "the forecasted Temperature of the city is: $fc_temp °C"

hour=$(TZ=Casablanca date '+ %H')
day=$(TZ=Casablanca date '+ %d')
month=$(TZ=Casablanca date '+ %m')
year=$(TZ=Casablanca date '+ %Y')

current=$(echo -e "$year\t$month\t$day\t$obs_temp\t$fc_temp")

echo $current >>  rx_poc.log


cityTime=$(TZ="$city" date)

echo $cityTime
