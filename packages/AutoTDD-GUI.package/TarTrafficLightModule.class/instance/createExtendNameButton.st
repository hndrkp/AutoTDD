building
createExtendNameButton
	
	| button state |
	state := self nameExpanded
		ifTrue: [ #on ]
		ifFalse: [ #off ].
	button := ThreePhaseButtonMorph new
		offImage: (self imageProvider loadImageAt: #expand);
		onImage: (self imageProvider loadImageAt: #collapse);
		actionSelector: #extendNameButtonClicked;
		state: state;
		target: self;
		name: 'extendNameButton';
		yourself.
	button extent: (button offImage extent max: button onImage extent).
	self center: button at: (self topCenter).
	self addMorph: button