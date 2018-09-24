extends "opcode_base.gd"

# OPCODE 10 - Hello

# Reuse other OPCODE routines
const HEARTBEAT = preload('opcode_heartbeat.gd')
const IDENTIFY = preload('opcode_identify.gd')

func receive(connection, payload):
	connection._trace = payload.d._trace
	HEARTBEAT.new().force_heartbeat(connection)
	connection.heartbeat_timer.wait_time = payload.d.heartbeat_interval / 1000
	connection.heartbeat_timer.start()
	IDENTIFY.new().send(connection)

func send(connection):
	# We can't send this to Discord, so this does nothing.
	pass