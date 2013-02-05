#!/bin/bash

rhythmbox-client --pause
cd ~/Music
mpg123 kick.mp3
rhythmbox-client --play
