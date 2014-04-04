NetArranger.js : RELEASE_NOTE Point.js WorldPoint.js Main.js
	cat RELEASE_NOTE Main.js Point.js WorldPoint.js > NetArranger.js

Main.js : Main.edna
	ednascript.pl < Main.edna > Main.js

WorldPoint.js : WorldPoint.edna
	ednascript.pl < WorldPoint.edna > WorldPoint.js

Point.js : Point.edna
	ednascript.pl < Point.edna > Point.js

clean:
	rm -f *.js
