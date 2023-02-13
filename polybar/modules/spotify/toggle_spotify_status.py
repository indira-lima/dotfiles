#!/bin/python3

# Toggle spotify's player status with dbus
# If it's playing, pause, and vice-versa
#
# @author: Dahan Schuster

import dbus

try:
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object('org.mpris.MediaPlayer2.spotify', '/org/mpris/MediaPlayer2')

    spotify_properties = dbus.Interface(spotify_bus, 'org.freedesktop.DBus.Properties')
    spotify_interface = dbus.Interface(spotify_bus, 'org.mpris.MediaPlayer2.Player')

    status = spotify_properties.Get('org.mpris.MediaPlayer2.Player', 'PlaybackStatus')

    if status == "Playing":
        spotify_interface.Pause()
    else:
        spotify_interface.Play()
    
except Exception as e:
    print("error trying to play/pause spotify", e)
