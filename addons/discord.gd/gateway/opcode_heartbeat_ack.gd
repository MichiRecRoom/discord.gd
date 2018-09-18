extends "opcode_base.gd"

# OPCODE 11 - Heartbeat ACK
const CODE = 11

func receive(connection, __):
	connection.received_ack_since_last_heartbeat = true

func send(connection):
	# We can't send this to Discord, so this does nothing.
	pass