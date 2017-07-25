#!/bin/bash
today=`date "+%Y-%m-%d_%H:%M:%S"`
# echo $mydate

TARGET=~/TEST-BK
SOURCE=~/TEST/

FOLDER_ARRAY=()

# Scan tous les répertoires
for d in $TARGET/*/ ; do
# Le répertoire doit contenir "201"
if [[ $d == *"201"* ]]; then
    FOLDER_ARRAY+=($d)
fi
done

# Recherche le plus récent répertoire
IFS=$'\n'
most_recent=`echo "${FOLDER_ARRAY[*]}" | sort -nr | head -n1`
echo $most_recent

# Crée le repertoire d'aujourd'hui
if ! [ -d "$TARGET/$today" ]; then
   mkdir $TARGET/$today
fi


# Lance la commande rsync avec la target la plus récente, la source et la target d'aujourd'hui
echo "/usr/bin/rsync -a --no-o --delete --safe-links --link-dest=$most_recent $SOURCE $TARGET/$today/ --exclude backup.sh"
/usr/bin/rsync -a --no-o --delete --safe-links --link-dest=$most_recent $SOURCE $TARGET/$today/ --exclude backup.sh

# Supprime le répertoire le plus ancien
//TODO
