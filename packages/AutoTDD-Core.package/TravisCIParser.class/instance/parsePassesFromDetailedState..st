as yet unclassified
parsePassesFromDetailedState: aString

	^ (aString allRegexMatches: '\d+\s+\passes') at: 1 ifAbsent: ['']