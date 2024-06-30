#!/bin/bash

# Fetch weather information using curl and parse JSON response
weather_info=$(curl -s "https://api.openweathermap.org/data/2.5/weather?id=3157436&units=metric&appid=42c4ce1615c38bb9f1d654f50d6f4282")
temperature=$(echo "$weather_info" | jq -r '.main.temp')

# Fetch public IP address at the start
public_ip=$(curl -s4 ifconfig.co)

# Initialize variables
hour_counter=0
max_cpu_temp=95 # Define the maximum CPU temperature threshold in Celsius

while true; do
	# Increment the hour counter
	((hour_counter++))

	# Fetch public IP if the hour counter reaches 3600 (1 hour in seconds)
	if [ $hour_counter -eq 3600 ]; then
		public_ip=$(curl -s4 ifconfig.co)
		hour_counter=0 # Reset the hour counter
	fi

	volume=$(pamixer --get-volume)
	local_ip=$(ip route get 1 | awk '{print $7; exit}')
	cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{printf("%02.0f", $2 + $4)}')

	# Get RAM usage in GB
	total_ram=$(free -g | awk '/Mem/{print $2}')
	used_ram=$(free -g | awk '/Mem/{print $3}')

	# Get disk usage in GB
	total_disk=$(df -BG / | awk 'NR==2 {sub(/G/,"",$2); print $2}')
	used_disk=$(df -BG / | awk 'NR==2 {sub(/G/,"",$3); print $3}')
	free_disk=$(df -BG / | awk 'NR==2 {sub(/G/,"",$4); print $4}')

	# Get CPU temperature
	cpu_temp=$(sensors | awk '/Tctl:/ {printf("+%s", $2)}')

	# Get total system load
	total_load=$(uptime | awk -F 'load average:' '{print $2}' | awk '{print $1}')

	echo " $temperature°C |  $local_ip |  $public_ip |  $cpu_usage%   ${cpu_temp#+}  ${max_cpu_temp}°C |  $total_load |   ${used_ram}GB  ${total_ram}GB |   ${used_disk}GB,  ${free_disk}GB | 󰕾 $volume% | 󰥔 $(LC_TIME=nb_NO.UTF-8 date +"%A %e. %B %H:%M:%S")"
	sleep 0.7
done
