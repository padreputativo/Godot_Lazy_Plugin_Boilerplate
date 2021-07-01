tool
extends Button


#############################
#  Lazy Plugin Boilerplate  #
#############################


onready var plugin = get_tree().get_root().get_node("EditorNode").get_node("Lazy Plugin Boilerplate")


func _enter_tree():
	connect("pressed", self, "clicked")


func clicked():
	print("You clicked me!")
