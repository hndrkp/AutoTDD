drawing
drawText: aString on: aCanvas at: aPoint
	
	| text |
	text := TextMorph new
		string: aString fontName: self class fontName size: self class fontSize;
		color: self class fontColor;
		extent: (70 @ 20); "uncool, but autoFit does not work properly"
		autoFitOnOff;
		position: aPoint;
		yourself.
	aCanvas drawMorph: text 