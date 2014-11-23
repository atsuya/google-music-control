google-music-control
====================

AppleScript for controlling google play music.


What is it?
===========

``google-music-controll`` is a collection of AppleScript files to control google play music opened in web browser.


How to use
==========

Basically, you want to execute the scripts when certain hotkey is triggered. I use [alfred](http://www.alfredapp.com/), but I think you can use [quicksilver](http://qsapp.com/) or [automator](https://www.google.com/search?q=automator+service+applescript) to execute them when hotkey is triggered.

I actually execute shell script that executes the script because none of them allows to set a path to the script to execute; rather they ask you to copy and paste the code. I don't like that.

You can execute the script from terminal like following:

```
$ osascript chrome/play-pause.scpt
```


Assumptions
===========
Before using it, you need to make sure that:

- Using OS X.
- Using Chrome.
- Google playf music page is opened (doesn't matter in which tab nor window) and playing music already. The scripts don't know how to initiate to play music. 


How does it work?
=================

It uses AppleScript interface that chrome provides and goes through all windows and tabs to find the tab that has google play music opened. Then it executes JavaScript on the page that sends appropriate keyboard shortcuts to control it. 


License
========

MIT
