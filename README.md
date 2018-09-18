# Discord.gd
Hello! This is a work-in-progress implementation of the Discord API, written for the Godot Engine.

## Progress
The implementation currently handles maintaining a connection to the gateway, as well as emitting signals whenever a DISPATCH or unknown opcode is received, but does not provide any API abstractions such as sending messages. If that doesn't deter you, then you are free to use it in its current state. Otherwise, I recommend waiting for further updates.

If you're interested in my TODO list (listed in order of current relevance):

- [x] Connect and maintain a gateway connection (not including RESUME support)
- [ ] RESUME support
- [ ] REQUEST_GUILD_MEMBERS
- [ ] Abstract DISPATCH events
- [ ] STATUS_UPDATE
- [ ] Sharding support
- [ ] Track state

And here's my secondary TODO list, for miscellaneous things I want to add. These are not necessarily in the order they'll be added in:

- [ ] Voice connection support (if possible)
    - Not currently possible in GDScript (Can't stream Opus files; Can't encrypt without other addons)

Godot has some issues that need to be ironed out before Discord.gd will work as expected:

- [ ] https://github.com/godotengine/godot/issues/21617 - Discord.gd cannot send close frames, and is unable to read close frames. This means that your bot will time out if you close the engine, and you will be unable to read the close error code if the gateway closes your connection.
