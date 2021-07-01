tool
extends Control


#############################
#  Lazy Plugin Boilerplate  #
#############################


onready var plugin = get_tree().get_root().get_node("EditorNode").get_node("Lazy Plugin Boilerplate")

func _ready():
	if plugin.is_editor():
		plugin.notify("The plugin tool is enabled properly!")
