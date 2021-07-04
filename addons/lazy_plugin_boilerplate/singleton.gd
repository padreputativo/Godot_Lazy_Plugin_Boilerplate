extends "boilerplate core/SingletonNode.inheritance.gd"


#############################
#  Lazy Plugin Boilerplate  #
#############################


onready var singleton = $"/root/lazy_plugin_boilerplate"

func _ready():
	# You have some extra methods: singleton.notify(string), singleton.warning(string), singleton.error(string)
	singleton.notify("The plugin is running your singleton during the gameplay and the Editor!")
