comparing
hash
	"Answer an integer value that is related to the identity of the receiver."

	^(super hash bitXor: hierarchy hash)
		bitXor: inverse hash