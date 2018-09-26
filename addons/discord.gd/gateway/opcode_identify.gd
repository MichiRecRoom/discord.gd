extends "opcode_base.gd"

# OPCODE 2 - Identify

func receive(connection, __):
	# We can't receive this from Discord, so this does nothing.
	pass

func send(connection):
	# TODO: Configurable large_threshold
	# TODO: Shard support
	# TODO: Presence support
	connection.put_payload({
		op = 2,
		d = {
			token = connection.bot().token,
			properties = {
				"$os": OS.get_name(),
				"$browser": "discord.gd",
				"$device": "discord.gd"
			},
			#compress = true,
			large_threshold = 250,
			#shard = [0, 1],
			#presence = {
			#	game = {
			#		name = "",
			#		type = ""
			#	},
			#	status = "",
			#	since = 0,
			#	afk = false
			#}
		}
	})