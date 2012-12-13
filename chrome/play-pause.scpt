tell application "Google Chrome"
  set code to "
    var event = document.createEvent('Events');
    event.initEvent('keydown', true, true);
    event.keyCode = 32;
    event.which = 32;
    document.dispatchEvent(event);
  "
  execute front window's active tab javascript code
end tell
