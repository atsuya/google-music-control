INITIAL_WINDOW=`xdotool getwindowfocus`
xdotool search --name "Google Play Music" windowfocus key --clearmodifiers space
xdotool windowfocus ${INITIAL_WINDOW}
