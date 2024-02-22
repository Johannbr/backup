#!/bin/bash
today=`date "+%Y-%m-%d_%H-%M-%S"`
# echo $mydate

TARGET=$1
SOURCE=$2

FOLDER_ARRAY=()

# Scan tous les répertoires
for d in $TARGET/*/ ; do
# Le répertoire doit contenir "202"
if [[ $d == *"202"* ]]; then
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
echo "/usr/bin/rsync -av --progress --no-o --delete --safe-links --link-dest=$most_recent $SOURCE $TARGET/$today/ --exclude backup.sh"
/usr/bin/rsync -av --progress --no-o --delete --safe-links --link-dest=$most_recent $SOURCE $TARGET/$today/ --exclude backup.sh

# Display size information
echo "Folder size: "
du -hc --max-depth=0 $1/*

# Supprime le répertoire le plus ancien
# TODO
