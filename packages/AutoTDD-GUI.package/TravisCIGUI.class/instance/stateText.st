as yet unclassified
stateText
	
	^ Text new
		append: 'Current Build:', String crlf, self state;
		addAttribute: (TextAlignment new alignment: 2)