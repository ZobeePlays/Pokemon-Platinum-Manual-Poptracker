Changelog
---------------

0.1.2
- the ".._hosted" items are unnecesary, so i got rid of them and just made them locations, since they are locations in the apworld.  since the location always gives the event flag as item, the normal hosted item still gets toggled, which is all we need to happen.
- got rid of all the code relating to ".._hosted" stuff.
- made it so that the tracker acts as a client!!!!!!!!!!! my copy paste did not fail me, it was my commas in the sectionID list xD
- set visibility rule for buying flash.  it doesn't exist as a check when the setting is off.
	-cheerioschelsea

---------------
0.1.1
- created this changelog!
- removed bloat from sinnoh.json (1st pass)
- moved map coords to the top (final pass)
- made the hidden items use the premier ball icon
- added datapackage.json file for future reference
- created sectionID.lua for future implementation of sending checks from the tracker to the client
- collapsed the weird route 207/wayward cave check
- moved settings to a pop-up to conserve space
- there's 11 hiddens in floaroma meadow according to bulbapedia.... *shrug* so i guess we're both right irt it's location
- fixed Riley's name (no longer Ridley in the tracker files... still wrong in the apworld tho)
- re-arranged a few checks to be more logical irt playthrough, but then stopped because it made comparing the diffs harder xD
- route 224 logic needs $defogcross?
- next major thing would be sending checks from the tracker to the server.  i was on a deep dive into the lua stuff all day, looking at other packs, learning about slot data, trying to figure anything out code wise, but i'm too afraid that i'm going to break what's already there, so i'll leave it alone for now.
- also, gratz on fixing the warehouse grunt event, i tried everything and couldn't get it to work.
	-cheerioschelsea