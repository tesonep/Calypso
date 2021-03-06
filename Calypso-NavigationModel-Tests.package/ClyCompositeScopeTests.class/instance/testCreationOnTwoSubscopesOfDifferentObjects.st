tests
testCreationOnTwoSubscopesOfDifferentObjects
	| subscope1 subscope2 |
	subscope1 := ClyScopeExample of: #basisObject1 in: environment.
	subscope2 := ClyScopeExample of: #basisObject2 in: environment.
	
	scope := ClyCompositeScope on: {subscope1. subscope2}.
	
	self
		assert: scope basisObjects asSet
		equals: #(basisObject1 basisObject2) asSet