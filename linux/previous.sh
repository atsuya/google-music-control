INITIAL_WINDOW=`xdotool getwindowfocus`
xdotool search --name "Google Play Music" windowfocus key Left
xdotool windowfocus ${INITIAL_WINDOW}
