building
createOnOffButton
	
	| button state |
	state := self use
		ifTrue: [ #on ]
		ifFalse: [ #off ].
	button := ThreePhaseButtonMorph new 
		offImage: (self imageProvider loadResourceAt: #toggleOff);
		onImage: (self imageProvider loadResourceAt: #toggleOn);
		actionSelector: #onOffButtonClicked;
		state: state;
		target: self;
		name: 'onOffButton';
		yourself.
	button extent: (button offImage extent max: button onImage extent).
	self addMorph: button