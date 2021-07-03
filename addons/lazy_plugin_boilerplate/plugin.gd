tool
extends "boilerplate core/EditorPlugin.inheritance.gd"


###############################
#   Lazy Plugin Boilerplate   #
###############################


func _init(): plugin_scope = self


###### YOUR PLUGIN'S CODE


var main_panel_to_instance = preload("do not export tools/panel_example.tscn")
var main_panel


func deferred_enter_tree():
	# Now you have some extra methods: notify(string), warning(string), error(string)
	# All configured in "singleton" will be shared across all your scripts
	
	singleton.notify("The plugin's singleton is globally _ready!")

	# https://docs.godotengine.org/en/stable/tutorials/plugins/editor/making_main_screen_plugins.html
	main_panel = main_panel_to_instance.instance()
	# Add the main panel to the editor's main viewport.
	get_editor_interface().get_editor_viewport().add_child(main_panel)
	# Hide the main panel. Very much required.
	make_visible(false)


func deferred_exit_tree():
	if main_panel:
		main_panel.queue_free()


func make_visible(visible):
	if main_panel:
		main_panel.visible = visible


func has_main_screen():
	return true


func get_plugin_name():
	return "Main Screen Template"


func get_plugin_icon():
	# Must return some kind of Texture for the icon.
	return get_editor_interface().get_base_control().get_icon("Node", "EditorIcons")


