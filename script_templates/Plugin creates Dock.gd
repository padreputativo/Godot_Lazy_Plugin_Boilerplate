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
		# Load the dock scene and instance it.
		dock = preload("do not export tools/panel_example.tscn").instance()

		# Add the loaded scene to the docks.
		add_control_to_dock(DOCK_SLOT_LEFT_UL, dock)
		# Note that LEFT_UL means the left of the editor, upper-left dock.


func _exit_tree():
	# Remove the dock.
	remove_control_from_docks(dock)
	# Erase the control from the memory.
	dock.free()


# Remove this if you does not need it
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
