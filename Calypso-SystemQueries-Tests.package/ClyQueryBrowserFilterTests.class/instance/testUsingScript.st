tests-filter by script
testUsingScript

	filter := ClyQueryBrowserFilter substringPattern: '[:each | each selector = #testUsingScript]'.
	
	self assert: (filter matches: self itemOfThisTestMethod).
	self deny: (filter matches: (ClyBrowserItem with: Object >> #printString)).