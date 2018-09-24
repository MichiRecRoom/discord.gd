extends "opcode_base.gd"

# OPCODE 0 - Dispatch

func receive(connection, payload):
	# Intercept any needed payloads
	match payload.t:
		'READY':
			# Copy over the _trace and session_id
			connection._trace = payload.d._trace
			connection.session_id = payload.d.session_id
	
	connection.last_seq = payload.s
	connection.emit_signal('dispatch', payload.t, payload.d)

func send(connection):
	# We can't send this to Discord, so this does nothing.
	pass