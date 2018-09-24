extends "opcode_base.gd"

# OPCODE 1 - Heartbeat

# This is used to tell the server we're still alive. The gateway can also
# request that we send it a heartbeat immediately.

func receive(connection, __):
	# Discord is requesting we send it a heartbeat immediately.
	force_heartbeat(connection)

# Sends a heartbeat
func send(connection):
	if !connection.received_ack_since_last_heartbeat:
		# Possible zombie connection. Disconnect then reconnect, attempt to RESUME.
		connection.gateway_reconnect(true)
		connection.received_ack_since_last_heartbeat = false
	else:
		force_heartbeat(connection)

# Sends a heartbeat, but doesn't check for zombie connections
func force_heartbeat(connection):
	connection.put_payload({
		op = 1,
		d = connection.last_seq
	})
	connection.received_ack_since_last_heartbeat = false