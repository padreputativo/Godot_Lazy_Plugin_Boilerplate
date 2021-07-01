tool
extends "boilerplate core/shared.lib.gd"


#############################
#  Lazy Plugin Boilerplate  #
#############################


var dock


func _enter_tree():
	self.set_name(PLUGIN_NAME)
	
	if is_editor():
		# You have some extra methods: notify(string), warning(string), error(string), is_editor() -> bool, is_gameplay() -> bool

		##### START HERE #####

		# https://docs.godotengine.org/en/stable/tutorials/plugins/editor/making_plugins.html
		# Initialization of the plugin goes here.
		# Add the new type with a name, a parent type, a script and an icon.
		add_custom_type("MyButton", "Button", preload("res://addons/lazy_plugin_boilerplate/custom_type_example.gd"), preload("../../icon.png"))


func _exit_tree():
	remove_custom_type("MyButton")
