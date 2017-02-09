#!/bin/bash

WORD_ARRAY=()

if [ -e "${WORD_ARRAY[0]}" ]; then
    echo "hi"
else
    echo "nope"
fi

for i in {0..1}; do
    echo $i
    while [[ ${WORD_ARRAY[$i]} == *['!'-@#$%^'&'*()_+=]* || ( 5 -gt ${#WORD_ARRAY[$i]} || 13 -lt ${#WORD_ARRAY[$i]} ) ]]; do
        echo "NEW WORD FOR - $i"
        if [[ "${#WORD_ARRAY[$i]}" == 0 ]]; then
            WORD_ARRAY[$i]+="$(shuf -n1 /usr/share/dict/words)"
        else
            WORD_ARRAY[$i]="$(shuf -n1 /usr/share/dict/words)"
        fi
        echo "WORD_ARRAY is:" "${WORD_ARRAY[$i]}"
        read -r
    done
done

ghost_password=$(printf "%s" "${WORD_ARRAY[@]}")
#echo "ghost:${ghost_password}" | chpasswd
echo "this is only an echo: password=${ghost_password}"
