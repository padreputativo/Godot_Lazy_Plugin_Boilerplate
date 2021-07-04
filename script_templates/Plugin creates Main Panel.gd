tool
extends "boilerplate core/EditorPlugin.inheritance.gd"


#############################
#  Lazy Plugin Boilerplate  #
#############################



const MainPanel = preload("do not export tools/panel_example.tscn")
var main_panel_instance


func deferred_enter_tree():
	# You have some extra methods: singleton.notify(string), singleton.warning(string), singleton.error(string)

	##### START HERE #####

	# https://docs.godotengine.org/en/stable/tutorials/plugins/editor/making_main_screen_plugins.html
	main_panel_instance = MainPanel.instance()
	# Add the main panel to the editor's main viewport.
	get_editor_interface().get_editor_viewport().add_child(main_panel_instance)
	# Hide the main panel. Very much required.
	make_visible(false)


func deferred_exit_tree():
	if main_panel_instance:
		main_panel_instance.queue_free()


func make_visible(visible):
	if main_panel_instance:
		main_panel_instance.visible = visible


func has_main_screen():
	return true


func get_plugin_name():
	return "Main Screen Plugin Name"


func get_plugin_icon():
	# Must return some kind of Texture for the icon.
	return get_editor_interface().get_base_control().get_icon("Node", "EditorIcons")
