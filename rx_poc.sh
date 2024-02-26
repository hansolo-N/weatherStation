#! /bin/bash

city=Casablanca

curl -s wttr.in/casablanca?T --output weather_report

obs_temp=$(curl -s wttr.in/casablanca?T | grep -E -m 1 '°.' | grep -Eo -e '-?[[:digit:]].*')

#To extract Current Temperature
obs_temp=$(curl -s wttr.in/$city?T | grep -m 1 '°.' | grep -Eo -e '-?[[:digit:]].*')
echo "The current Temperature of $city: $obs_temp"


fc_temp=$(curl -s wttr.in/casablanca?T | head -n 23 | tail -1 |  grep '°.' | cut -d "C" -f 2 | grep -Eo -e '-?[[:digit:]]')

echo $fc_temp

