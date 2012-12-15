on control(keyCode)
  set code to "var keyCode = " & keyCode & ";
    var event = document.createEvent('Events');
    event.initEvent('keydown', true, true);
    event.keyCode = keyCode;
    event.which = keyCode;

    document.dispatchEvent(event);
  "

  tell application "Google Chrome"
    set targetTab to null

    repeat with theWindow in every window
      repeat with theTab in every tab of theWindow
        if theTab's title ends with "- Google Play" then
          set targetTab to theTab
          exit repeat
        end if
      end repeat
    end repeat
    
    execute targetTab javascript code
  end tell
end control
