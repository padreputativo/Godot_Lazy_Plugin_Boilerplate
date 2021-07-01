extends "../CONFIG.gd"


#############################
#  Lazy Plugin Boilerplate  #
# PLEASE DO NOT MODIFY THIS #
#############################


var is_properly_configured = null


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


func is_editor():
	if is_properly_configured == null: check_configuration()
	return is_properly_configured && Engine.is_editor_hint()


func is_gameplay():
	if is_properly_configured == null: check_configuration()
	return is_properly_configured && !Engine.is_editor_hint()


func error(msg):
	return push_error(PLUGIN_NAME + " ERROR : " + msg)


func warning(msg):
	return push_warning(PLUGIN_NAME + " Warning : " + msg)


func notify(msg):
	return print(PLUGIN_NAME + " : " + msg)
