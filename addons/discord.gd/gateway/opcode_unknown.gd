extends "opcode_base.gd"

# OPCODE UNKNOWN

# An unknown opcode. If this is used at all, it probably means that discord.gd
# needs an update.

var opcode = null
var data = null

func receive(connection, payload):
	connection.emit_signal('unknown_opcode', payload)

func send(connection):
	connection.put_payload({
		op = opcode,
		d = data
	})