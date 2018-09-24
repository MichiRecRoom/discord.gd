
# This file contains the base code for all other opcode_*.gd files. These files,
# besides being used to form their respective payloads, double as handlers for
# their respective opcodes, managing the gateway connection as needed.

func _init():
	pass

# @param connection [connection.gd] The gateway connection
# @param payload [Dictionary] The full payload received, including `s` and `t`
#	fields for OPCODE DISPATCH
func receive(connection, payload):
	# This is the base script! If you need to use arbitrary opcodes,
	# use opcode_unknown.gd, or build your own opcode script.
	assert(false)

func send(connection):
	# This is the base script! If you need to use arbitrary opcodes,
	# use opcode_unknown.gd, or build your own opcode script.
	assert(false)