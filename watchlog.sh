#!/bin/bash
source ./creds
tail -Fn0 "$log_location" |\
	while read line
	do echo "$line" | grep 'INFO]: UUID of player\|lost connection: Disconnected'
		export did_it_find_anything="$?"
        if [[ "$did_it_find_anything" = 0 ]]
        then
        	echo "$line" | grep 'INFO]: UUID of player'
			export did_it_find_anything="$?"
        	if [[ "$did_it_find_anything" = 0 ]]
				then
        		export who=$(echo "$line" | grep 'INFO]: UUID of player' |\
					awk -F ']: ' '{print $2}' |\
					sed 's/UUID of player //g' |\
					awk -F ' is ' '{print $1}')
				export twilio_msg_body="it's possible ${who} connected"
        		ruby "$what_a_ruby_mess"
			fi
        	echo "$line" | grep 'lost connection: Disconnected'
			export did_it_find_anything="$?"
        	if [[ "$did_it_find_anything" = 0 ]]
				then
        		export who=$(echo "$line" | grep 'lost connection: Disconnected' |\
					awk -F ']: ' '{print $2}' |\
					sed 's/ lost connection: Disconnected//g')
				export twilio_msg_body="it's possible ${who} disconnected"
        		ruby "$what_a_ruby_mess"
			fi
        fi
done
