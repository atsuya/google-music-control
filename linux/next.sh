INITIAL_WINDOW=`xdotool getwindowfocus`
xdotool search --name "Google Play Music" windowfocus key --clearmodifiers Right
xdotool windowfocus ${INITIAL_WINDOW}
