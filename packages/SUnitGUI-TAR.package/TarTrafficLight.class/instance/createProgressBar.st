gui
createProgressBar
	self progressBar: ProgressBarMorph new.
	self progressBar 
		extent: 200@10;
		position: self position + (0@(self height));
		color: Color white;
		progressColor: Color gray darker.
	self addMorph: self progressBar.