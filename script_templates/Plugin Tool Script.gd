tool
extends %BASE%


#############################
#  Lazy Plugin Boilerplate  #
#############################


onready var singleton = $"/root/lazy_plugin_boilerplate"
onready var plugin = $"/root/EditorNode".get_node("lazy_plugin_boilerplate")

func _ready():
	# You have some extra methods: singleton.notify(string), singleton.warning(string), singleton.error(string)
	singleton.notify("The plugin's tool example is accessing to your singleton inside the Editor!")


