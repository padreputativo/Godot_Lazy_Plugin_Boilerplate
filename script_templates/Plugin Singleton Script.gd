extends Node


#############################
#  Lazy Plugin Boilerplate  #
#############################


onready var plugin = get_tree().get_root().get_node("EditorNode").get_node("Lazy Plugin Boilerplate")

func _ready():
	if plugin && plugin.is_gameplay():
		plugin.notify("The plugin's singleton is enabled properly!")
