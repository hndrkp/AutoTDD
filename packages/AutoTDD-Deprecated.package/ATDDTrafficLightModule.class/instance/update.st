updating
update

	self stateButton ifNotNilDo: [ :button |
		button
			labelGraphic: (self imageProvider loadResourceAt: (self imageDictionary at: self state));
			extent: (button findA: SketchMorph) extent.
		(self state ~= self previousState) ifTrue: [
			self soundPlayer playSoundForState: self state ].
		self previousState: self state.
		self center: button at: self topCenter + (0 @ 30) ].
	self owner changed