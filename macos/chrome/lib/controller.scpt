on control(keyCode)
  set code to "(function (keyCode) {
    const event = new KeyboardEvent('keydown', { keyCode })
    document.dispatchEvent(event)
  })(" & keyCode & ")
  "

  set targetTab to activeTab() of me
  if targetTab is not null then
    executeJavaScript(targetTab, code) of me
  end if
end control

on getPlayState()
  set targetTab to activeTab() of me

  if targetTab is not null then
    set stateCode to "document.querySelector('#player-bar-play-pause').getAttribute('aria-label')"
    set oppositeState to executeJavaScript(targetTab, stateCode) of me

    if oppositeState is "Play" then
      return "Paused"
    else
      return "Playing"
    end if
  end if
end getPlayState

on getCurrentSong()
  set targetTab to activeTab() of me

  if targetTab is not null then
    set songCode to "document.querySelector('#currently-playing-title').innerHTML"
    set song to executeJavaScript(targetTab, songCode) of me

    set artistCode to "document.querySelector('.currently-playing-details').innerText"
    set artist to executeJavaScript(targetTab, artistCode) of me

    return {song, artist}
  end if
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
