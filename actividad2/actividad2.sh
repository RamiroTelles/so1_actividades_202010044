#!/bin/bash

GITHUB_USER="RamiroTelles"
url="https://api.github.com/users/$GITHUB_USER" 
pagina=$(curl -s $url) 

User1=$(echo "$pagina"| jq -r '.login')
USER_ID=$(echo "$pagina" | jq -r '.id')
CREATED_AT=$(echo "$pagina" | jq -r '.created_at' | cut -c 1-10)

mensaje="Hola $User1. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT."
#echo "$mensaje"

fecha=$(date +%Y-%m-%d)

dir1="/tmp/$fecha"


if [ ! -d "$dir1" ]; then
    mkdir -p "$dir1"
    echo "Directorio /tmp/fecha creado."
else
    echo "Directorio /tmp/fecha ya existe."
fi

archivo="/tmp/$fecha/saludos.log"

if [ ! -f "$archivo" ]; then
    echo "$mensaje" > "$archivo"
    echo "Archivo /tmp/fecha/saludos1.log creado."
else
    echo "$mensaje" >> "$archivo"
    echo "Archivo /tmp/fecha/saludos1.log ya existe."
fi

#Como se metio al crontab

#crontab -e

#se añadio linea        
# */5 * * * * cd /home/rami/scripts; ./actividad2.sh

