extends "opcode_base.gd"

# OPCODE 7 - Reconnect

func receive(connection, __):
	connection.gateway_reconnect(true)

func send(connection):
	# We can't send this to Discord, so this does nothing.
	pass