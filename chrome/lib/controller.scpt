on control(keyCode)
  set code to "var keyCode = " & keyCode & ";
    var event = document.createEvent('Events');
    event.initEvent('keydown', true, true);
    event.keyCode = keyCode;
    event.which = keyCode;

    document.dispatchEvent(event);
  "

  set targetTab to activeTab() of me
  executeJavaScript(targetTab, code) of me
end control

on notifyCurrentSong()
  set targetTab to activeTab() of me

  set songCode to "document.querySelector('#playerSongTitle').innerHTML"
  set song to executeJavaScript(targetTab, songCode) of me

  set artistCode to "document.querySelector('.player-artist-album-wrapper').innerText"
  set artist to executeJavaScript(targetTab, artistCode) of me

  notify(song, artist) of me
end notifyCurrentSong

on notify(name, message)
  display notification message with title name
end notify

on activeTab()
  set targetTab to null

  tell application "Google Chrome"
    repeat with theWindow in every window
      repeat with theTab in every tab of theWindow
        if theTab's title ends with "- Google Play Music" then
          set targetTab to theTab
          exit repeat
        end if
      end repeat
    end repeat
  end tell

  return targetTab
end activeTab

on executeJavaScript(activeTab, code)
  set result to null

  tell application "Google Chrome"
    set result to execute activeTab javascript code
  end tell

  return result
end executeJavaScript
