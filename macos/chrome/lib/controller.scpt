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

on getCurrentSong()
  set targetTab to activeTab() of me

  set songCode to "document.querySelector('#currently-playing-title').innerHTML"
  set song to executeJavaScript(targetTab, songCode) of me

  set artistCode to "document.querySelector('.currently-playing-details').innerText"
  set artist to executeJavaScript(targetTab, artistCode) of me

  return {song, artist}
end getCurrentSong

on notifyCurrentSong()
  set songDetails to getCurrentSong() of me

  notify(item 1 of songDetails, item 2 of songDetails) of me
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
  tell application "Google Chrome"
    return execute activeTab javascript code
  end tell
end executeJavaScript
