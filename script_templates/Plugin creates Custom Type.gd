tool
extends "boilerplate core/EditorPlugin.inheritance.gd"


#############################
#  Lazy Plugin Boilerplate  #
#############################


var dock


func deferred_enter_tree():
	# You have some extra methods: singleton.notify(string), singleton.warning(string), singleton.error(string)

	##### START HERE #####

	# https://docs.godotengine.org/en/stable/tutorials/plugins/editor/making_plugins.html
	# Initialization of the plugin goes here.
	# Add the new type with a name, a parent type, a script and an icon.
	add_custom_type("MyButton", "Button", preload("res://addons/lazy_plugin_boilerplate/custom_type_example.gd"), preload("../../icon.png"))


func deferred_exit_tree():
	remove_custom_type("MyButton")

