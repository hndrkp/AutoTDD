as yet unclassified
loadSound: aString

	^ self loadSound: aString ifAbsent: [ SampledSound samples: Array new samplingRate: 1 ]