# This plugin has been done using the Lazy Plugin Boilerplate template from doradoro

tool
extends EditorPlugin

# Basic plugin information
const PLUGIN_NAME = "Lazy Plugin Boilerplate" # Should be the same than Project/Project Settings/Plugins
const PLUGIN_DIR = "lazy_plugin_boilerplate" # Should use underscores instead spaces
const MIN_GODOT_VERSION_MAYOR = 3 # check https://semver.org/
const MIN_GODOT_VERSION_MINOR = 0
const MIN_GODOT_VERSION_PATCH = 0

# Plugin dependencies : Add the other plugin's directories wich this plugin needs to run properly
# We cannot do version control yet
const REQUIRED_PLUGINS = [PLUGIN_DIR, "lazy_plugin_boilerplate"]

# This will make sure that everything is ok before running scripts
var is_properly_configured = null





# Checks out the Docs : https://docs.godotengine.org/en/stable/tutorials/plugins/editor/making_plugins.html
# Do not forget to check the Interface methods
func _enter_tree():
	self.set_name(PLUGIN_NAME)
	
	if is_enabled():
		################### START HERE to create your plugin
		print("Your plugin, "+PLUGIN_NAME+", is properly configured!")

# You need to delete here all what you created while your Plugin was running to clean the Editor
func _exit_tree():
	pass

# This is mainly for Main Scene plugins. You delete it.
func get_plugin_name():
	return PLUGIN_NAME

# If you are going to use icons, check out the get_icon method. You can delete it
func get_plugin_icon():
	# Must return some kind of Texture for the icon.
	return get_editor_interface().get_base_control().get_icon("Node", "EditorIcons")





## Exclusive Lazy Plugin Boilerplate methods ##

# This will check if your plugin is properly configured
func check_configuration():
	is_properly_configured = false
	
	if self.name != PLUGIN_NAME: # checks if this is the first instance
		error(self.name + " should be " + PLUGIN_NAME)
	elif self.get_parent().get_class() != "EditorNode"  && self == get_tree().get_root().get_node("EditorNode").get_node(PLUGIN_NAME):
		error("Parent should be an EditorNode")
	elif not get_editor_interface().is_plugin_enabled(PLUGIN_DIR): # checks if the plugin is turned on
		error("The plugin is not turned on!")
	elif self.get_script().get_path().get_base_dir() != "res://addons/" + PLUGIN_DIR: # check if the plugin is properly located
		error(self.get_script().get_path().get_base_dir() + " should be res://addons/" + PLUGIN_DIR)
	elif Engine.get_version_info().major != MIN_GODOT_VERSION_MAYOR:
		error(str(Engine.get_version_info().major) + " should be " + str(MIN_GODOT_VERSION_MAYOR))
	elif Engine.get_version_info().minor <= MIN_GODOT_VERSION_MINOR:
		error(str(Engine.get_version_info().minor) + " should be >= " + str(MIN_GODOT_VERSION_MINOR))
	elif Engine.get_version_info().patch <= MIN_GODOT_VERSION_PATCH:
		error(str(Engine.get_version_info().patch) + " should be >= " + str(MIN_GODOT_VERSION_PATCH))
	else:
		var passed = true
		for plugin in REQUIRED_PLUGINS:
			if not get_editor_interface().is_plugin_enabled(plugin):
				passed = false
				error(plugin + " plugin is required to run this plugin!")
				break
		
		if passed:
			is_properly_configured = true
			return true
	
	is_properly_configured = false
	return false

# Checks if the plugin is enabled to be able to stop the "tool" autorun
func is_enabled():
	if is_properly_configured == null: check_configuration()
	return is_properly_configured && get_editor_interface().is_plugin_enabled(PLUGIN_DIR)

# This will ease and reduce the error reporting messages size
func error(msg):
	push_error(PLUGIN_NAME + " ERROR : " + msg)
	
func warning(msg):
	push_warning(PLUGIN_NAME + " Warning : " + msg)
