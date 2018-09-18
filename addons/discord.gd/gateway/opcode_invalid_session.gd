extends "opcode_base.gd"

# OPCODE 9 - Invalid Session
const CODE = 9

# Reuse other OPCODE routines
const IDENTIFY = preload('opcode_identify.gd')

func receive(connection, payload):
	# TODO: Session Resuming; this section will be filled in when resuming is supported
	#if payload.d:
		# Session may be resumable, let's try it.
	#else:
		# Session isn't resumable. Wait and then re-identify.
	# Sleep for 1-5 seconds
	connection.sleep((randi() % 5) + 1)
	
	# Perform an IDENTIFY
	IDENTIFY.new().send(connection)

func send(connection):
	# We can't send this to Discord, so this does nothing.
	pass