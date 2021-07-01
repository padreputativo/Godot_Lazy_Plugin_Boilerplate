tool
extends Control


#############################
#  Lazy Plugin Boilerplate  #
#############################


onready var plugin = get_tree().get_root().get_node("EditorNode").get_node("YOUR PLUGIN NAME")

func _ready():
	if plugin && plugin.is_editor():
		plugin.notify("The plugin tool is enabled properly!")
