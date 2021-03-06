building
buildPackageSelectionWith: aBuilder
	^ (OrderedCollection new
			add: ((self buildCategoryWith: aBuilder)
				frame: self categoryFrame;
				yourself);
			add: ((self buildCategoryLabelWith: aBuilder)
				frame: self categoryLabelFrame;
				yourself);
			add: ((self buildCategoryClassesWith: aBuilder)
				frame: self categoryClassesFrame;
				yourself);
			add: ((self buildTestCategoryWith: aBuilder)
				frame: self testCategoryFrame;
				yourself);
			add: ((self buildTestCategoryLabelWith: aBuilder)
				frame: self testCategoryLabelFrame;
				yourself);
			add: ((self buildTestCategoryClassesWith: aBuilder)
				frame: self testCategoryClassesFrame;
				yourself);
			add: ((self buildCategoryCheckboxWith: aBuilder)
				frame: self categoryCheckboxFrame;
				yourself);
			add: ((self buildTestCategoryCheckboxWith: aBuilder)
				frame: self testCategoryCheckboxFrame;
				yourself);
			yourself)