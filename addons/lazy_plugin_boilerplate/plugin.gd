tool
extends "res://addons/lazy_plugin_boilerplate/config.gd"


# This plugin has been done using the Lazy Plugin Boilerplate template from doradoro

### CREATES A DOCK
# A class member to hold the dock during the plugin life cycle.
var dock

### CREATES A MAIN SCREEN PLUGIN
const MainPanel = preload("res://addons/lazy_plugin_boilerplate/do not export Editor assets into games/editor_panel.tscn")
var main_panel_instance

func _enter_tree():
	self.set_name(PLUGIN_NAME)
	
	if is_enabled():
		################### START HERE to create your plugin
		print("Your plugin, "+PLUGIN_NAME+", is properly configured!")
		
		### CREATES A SINGLETON
		add_autoload_singleton(PLUGIN_DIR, "res://addons/lazy_plugin_boilerplate/singleton.gd")
		
		### CREATES A CUSTOM TYPE
		# https://docs.godotengine.org/en/stable/tutorials/plugins/editor/making_plugins.html
		# Initialization of the plugin goes here.
		# Add the new type with a name, a parent type, a script and an icon.
		add_custom_type("MyButton", "Button", preload("res://addons/lazy_plugin_boilerplate/custom_type.gd"), preload("../../icon.png"))
		
		### CREATES A DOCK
		# https://docs.godotengine.org/en/stable/tutorials/plugins/editor/making_plugins.html
		# Initialization of the plugin goes here.
		# Load the dock scene and instance it.
		dock = preload("res://addons/lazy_plugin_boilerplate/do not export Editor assets into games/editor_panel.tscn").instance()

		# Add the loaded scene to the docks.
		add_control_to_dock(DOCK_SLOT_LEFT_UL, dock)
		# Note that LEFT_UL means the left of the editor, upper-left dock.

		### CREATES A MAIN SCREEN PANEL
		# https://docs.godotengine.org/en/stable/tutorials/plugins/editor/making_main_screen_plugins.html
		main_panel_instance = MainPanel.instance()
		# Add the main panel to the editor's main viewport.
		get_editor_interface().get_editor_viewport().add_child(main_panel_instance)
		# Hide the main panel. Very much required.
		make_visible(false)

		### IMPORT PLUGIN
		# https://docs.godotengine.org/en/stable/tutorials/plugins/editor/import_plugins.html

		### GIZMO PLUGIN
		# https://docs.godotengine.org/en/stable/tutorials/plugins/editor/spatial_gizmos.html

		### INSPECTOR PLUGIN
		# https://docs.godotengine.org/en/stable/tutorials/plugins/editor/inspector_plugins.html

		### VISUAL SHADER PLUGIN
		# https://docs.godotengine.org/en/stable/tutorials/plugins/editor/visual_shader_plugins.html

func _exit_tree():
	# Clean-up of the plugin goes here.
	# Always remember to remove it from the engine when deactivated.


	### REMOVE SINGLETON
	remove_autoload_singleton(PLUGIN_NAME)

	### REMOVE CUSTOM TYPE
	remove_custom_type("MyButton")

	### REMOVE DOCK
	# Clean-up of the plugin goes here.
	# Remove the dock.
	remove_control_from_docks(dock)
	# Erase the control from the memory.
	dock.free()

	### REMOVE MAIN SCREEN PANEL
	if main_panel_instance:
		main_panel_instance.queue_free()

	pass


### CREATING A MAIN SCREEN PLUGIN
func has_main_screen():
	return true


func make_visible(visible):
	if main_panel_instance:
		main_panel_instance.visible = visible


func get_plugin_name():
	return "Main Screen Plugin"


func get_plugin_icon():
	# Must return some kind of Texture for the icon.
	return get_editor_interface().get_base_control().get_icon("Node", "EditorIcons")
