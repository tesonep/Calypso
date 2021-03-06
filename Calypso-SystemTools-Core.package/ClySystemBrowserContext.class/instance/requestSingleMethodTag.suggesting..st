user requests
requestSingleMethodTag: queryTitle suggesting: suggestedTag
	| knownTags ui selectedTag |
	knownTags := (SystemNavigation default allExistingProtocolsFor: true)
		reject: [ :each | each beginsWith: '*' ].
	knownTags := knownTags asSortedCollection: [ :a :b | a asLowercase < b asLowercase ].	
	ui := ListDialogWindow new
		getList: [ :r | knownTags select: [ :e | r search: e ] ];
		displayBlock: [ :e | e ];
		initialAnswer: suggestedTag;
		acceptNewEntry: true;
		title: queryTitle;
		yourself.
	selectedTag := ui chooseFromOwner: tool.
	selectedTag isEmptyOrNil ifTrue: [ CmdCommandAborted signal].
	(selectedTag beginsWith: '*') ifTrue: [ 
		self inform: 'Star is forbidden for protocol name. You can specify package in method editor using status bar checkbox'.
		^CmdCommandAborted signal].
	
	^selectedTag asSymbol