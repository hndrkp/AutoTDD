as yet unclassified
selectedStateColor

	^ self determineColorOf: (self data results at: self selectedResult ifAbsent: [ TestResult new ])