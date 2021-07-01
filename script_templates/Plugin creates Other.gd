tool
extends "boilerplate core/shared.lib.gd"


#############################
#  Lazy Plugin Boilerplate  #
#############################


func _enter_tree():
	self.set_name(PLUGIN_NAME)
	
	if is_editor():
		# You have some extra methods: notify(string), warning(string), error(string), is_editor() -> bool, is_gameplay() -> bool

		##### START HERE #####

		### IMPORT PLUGIN
		# https://docs.godotengine.org/en/stable/tutorials/plugins/editor/import_plugins.html
		### GIZMO PLUGIN
		# https://docs.godotengine.org/en/stable/tutorials/plugins/editor/spatial_gizmos.html
		### INSPECTOR PLUGIN
		# https://docs.godotengine.org/en/stable/tutorials/plugins/editor/inspector_plugins.html
		### VISUAL SHADER PLUGIN
		# https://docs.godotengine.org/en/stable/tutorials/plugins/editor/visual_shader_plugins.html

func _exit_tree():
	pass


func apply_changes():
	warning("apply_changes()")
	return true

func _run():
	warning("_run()")
	return true

func build():
	warning("build()")
	return true

func save_external_data():
	warning("save_external_data()")
	return true
