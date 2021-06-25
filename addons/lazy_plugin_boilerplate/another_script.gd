tool # this keyword make this file to run in the Editor, whatever it is, always, including when you open Scenes containing it
extends Node

# This var let you use your powerfuler plugin.gd methods
onready var plugin = get_tree().get_root().get_node("EditorNode").get_node("Lazy Plugin Boilerplate") # This would be your plugin's name



func _ready():
	if plugin.is_enabled(): # this stops the "tool" behaviour
		
		################### START HERE
		print("The plugin is enabled!")

# Try to avoid the use of this method due it will made the Editor to run slower. Instead this, try Signals
#func _process(delta):
#	pass
