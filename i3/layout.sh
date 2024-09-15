#! /bin/bash

Layouts=("us" "sk")

Current=$(setxkbmap -query | grep layout | awk '{print $2}')

for i in "${!Layouts[@]}"; do
    if [[ "${Layouts[$i]}" == "$Current" ]]; then
        CurrentIndex=$i
        break
    fi
done

NextIndex=$(( (CurrentIndex + 1) % ${#Layouts[@]} ))
Next="${Layouts[$NextIndex]}"

if [[ "$Next" == "sk" ]]; then
    setxkbmap sk qwerty
else
    setxkbmap "$Next"
fi
