import os
# this is just a stand in till I can get it to work with sys in
file_input = """
marlboro. - a great day
OMORI - Pure Imagination
jou beats - brasil
Vsauce Theme
Super Mario World Game Over LoFi Hip Hop Remix
jump man 93 - bruh
elijah who - first kiss
elijah who - skateboard p
PinkOmega - Trap Dumplings
jou beats. - brasil.
Tank - Cowboy Bebop
Nice Boys - Temporex
The Deli - 532PM
elijah who - hitchuwithdawork
android 52 - romance
engelwood - crystal dolphin
potsu - letting go
jump man 93 - bruh
gfbeats - business casual
jump man 93 - bruhh
marlboro. - a great day
OMORI - Pure Imagination
jou beats - brasil
burbank - sorry i like you
elijah who - i'm tired of feeling this way
90's flav - call me
Dragon Ball FighterZ OST - Hit Theme
Persona 3 ost - During the test
Blue in Green - Rainy Streets
Aests - FIGHT!
saib. - Act Right
Aso - Bossa Nova.[ft.Lamp]
jinsang - betrayal
"""


# Replace spaces with +
file_input.replace(" ", "+")
# split by new lines
urls = file_input.splitlines()




# tests = ["google.com","commitstrip.com"]
for url in urls:
    os.system("osascript -e 'tell application \"Safari\" to open location \"http://www.google.com/search?q={}\"'".format(url))

# http://www.google.com/search?q=query+goes+here
# Replace the spaces with pluses
# Use the new lines as a delimeter and seperate it



