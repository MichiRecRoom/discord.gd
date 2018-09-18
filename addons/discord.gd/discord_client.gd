extends Node

# @return [String] The token we use for any API requests and gateway connections.
#	This does not need to be prefixed with 'Bot '.
export (String) var token = 'TOKEN_HERE'

const WEBSOCKET_CONNECTION = preload('gateway/connection.gd')

func _ready():
	# TODO: Sharding support
	add_child(WEBSOCKET_CONNECTION.new())

# Gets all the connection nodes under this node.
func websocket_connections():
	var connections = []
	for child in get_children():
		# TODO: Add websocket connections to groups
		if child.get_script() == WEBSOCKET_CONNECTION:
			connections.append(child)
	return connections

# Tells the bot to connect.
func run():
	for connection in websocket_connections():
		connection.gateway_connect()

# Tells the bot to reconnect.
func restart():
	for connection in websocket_connections():
		connection.gateway_reconnect()

# Tells the bot to disconnect.
func quit():
	for connection in websocket_connections():
		connection.gateway_disconnect()
