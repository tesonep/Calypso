tests
testCheckIfEmpty

	query scope: (ClyClassScope of: {ClyClass1FromP1}).
	self deny: (query isEmptyIn: environment).

	query scope: (ClyClassScope of: {ProtoObject}).
	self assert: (query isEmptyIn: environment)