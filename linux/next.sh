INITIAL_WINDOW=`xdotool getwindowfocus`
xdotool search --name "Google Play Music" windowfocus key Right
xdotool windowfocus ${INITIAL_WINDOW}
