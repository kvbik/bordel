
# download all videos from given playlist url and create simple playlist txt file
# .. you need to have youtube-dl in your ~/bin directory

[[ $1 ]] && PLAYLIST_URL="$1" || exit
PLAYLIST_ID=$( echo "$PLAYLIST_URL" | tr '&' '\n' | grep '^list' | cut -d= -f2 )

VIDEOS=$( wget -q -O - "https://gdata.youtube.com/feeds/api/playlists/$PLAYLIST_ID?v=2" | sed 's/>/>\n/g' | grep media:player | cut -d"'" -f2 | cut -d'&' -f1 )

YOUTUBE_DL=~/bin/youtube-dl

for v in $VIDEOS; do
	echo $v | sed 's/.*?v=//; s/^/yt-/'
done > list.$PLAYLIST_ID.txt

for v in $VIDEOS; do
	$YOUTUBE_DL -o 'yt-%(id)s' "$v"
done

