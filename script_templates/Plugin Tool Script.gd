tool
extends %BASE%


#############################
#  Lazy Plugin Boilerplate  #
#############################


onready var plugin = $"/root/lazy_plugin_boilerplate"

func _ready():
	plugin.notify("The plugin's tool example is accessing to your singleton inside the Editor!")


