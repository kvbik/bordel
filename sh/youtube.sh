
[[ $1 ]] && PLAYLIST_URL="$1" || exit
PLAYLIST_ID=$( echo "$PLAYLIST_URL" | tr '&' '\n' | grep '^list' | cut -d= -f2 )

VIDEOS=$( wget -q -O - "https://gdata.youtube.com/feeds/api/playlists/$PLAYLIST_ID?v=2" | sed 's/>/>\n/g' | grep media:player | cut -d"'" -f2 | cut -d'&' -f1 )

YOUTUBE_DL=~/bin/youtube-dl

for v in $VIDEOS; do
	echo $v | sed 's/.*?v=//; s/$/.flv/'
done > list.$PLAYLIST_ID.txt

for v in $VIDEOS; do
	$YOUTUBE_DL "$v"
done

