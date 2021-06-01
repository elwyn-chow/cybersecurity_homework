egrep '^[0-9]+\.' vulture_vanhalen_songs_ranked.txt  |awk -F"“" '{print $2}' | awk -F",”" ' {print $1}'  |awk -F"”" '{print $1}' > vanhalen_complete_songlist.txt

