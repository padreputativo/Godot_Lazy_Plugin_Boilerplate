tool
extends Button


#############################
#  Lazy Plugin Boilerplate  #
#############################


onready var singleton = $"/root/lazy_plugin_boilerplate"

func _ready():
	# You have some extra methods: singleton.notify(string), singleton.warning(string), singleton.error(string)
	singleton.notify("The plugin's custom type example tool is accessing to your singleton inside the Editor!")


func _enter_tree():
	connect("pressed", self, "clicked")


func clicked():
	print("You clicked me!")
