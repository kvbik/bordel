
PLAYLIST_URL='http://www.youtube.com/watch?v=SamD72aEfUM&feature=BFa&list=AL94UKMTqg-9BJNPHyG_K32OIF4_rbuWhJ'
PLAYLIST_ID='AL94UKMTqg-9BJNPHyG_K32OIF4_rbuWhJ'

VIDEOS=$( wget -q -O - "https://gdata.youtube.com/feeds/api/playlists/$PLAYLIST_ID?v=2" | sed 's/>/>\n/g' | grep media:player | cut -d"'" -f2 | cut -d'&' -f1 )

YOUTUBE_DL=~/bin/youtube-dl

for v in $VIDEOS; do
	echo $v | sed 's/.*?v=//; s/$/.flv/'
done > list.$PLAYLIST_ID.txt

for v in $VIDEOS; do
	$YOUTUBE_DL "$v"
done

