# google-music-control
A collection of scripts for controlling Google Play Music on browser.


# What is it?
``google-music-controll`` is a collection of scripts to control Google Play Music opened in browser.


# How to use
## macOS
Basically, you want to execute the scripts when certain hotkey is triggered. I use [alfred](http://www.alfredapp.com/), but I think you can use [quicksilver](http://qsapp.com/) or [automator](https://www.google.com/search?q=automator+service+applescript) to execute them when hotkey is triggered.

I actually execute shell script that executes the script because none of them allows to set a path to the script to execute; rather they ask you to copy and paste the code. I don't like that.

You can execute the script from terminal like following:

```
$ osascript chrome/play-pause.scpt
```

## Linux
You can simply execute the scripts on terminal. Optionally, you can use [Albert](https://github.com/albertlauncher/albert) or something similar.


# Assumptions
## macOS
Before using it, you need to make sure that:

- Using Chrome.
- Google Play Music is opened in browser (doesn't matter in which tab nor window) and playing music already. The scripts don't know how to initiate to play music.

## Linux
xdotool is required.


# How does it work?
## macOS
It uses AppleScript interface that chrome provides and goes through all windows and tabs to find the tab that has google play music opened. Then it executes JavaScript on the page that sends appropriate keyboard shortcuts to control it.

## Linux
It uses xdotool to focus a window that Google Play Music is opened, and sends a key that triggers keyboard shortcut.

# License
MIT
