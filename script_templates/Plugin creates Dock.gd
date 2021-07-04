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
	# Load the dock scene and instance it.
	dock = preload("do not export tools/panel_example.tscn").instance()

	# Add the loaded scene to the docks.
	add_control_to_dock(DOCK_SLOT_LEFT_UL, dock)
	# Note that LEFT_UL means the left of the editor, upper-left dock.


func deferred_exit_tree():
	# Remove the dock.
	remove_control_from_docks(dock)
	# Erase the control from the memory.
	dock.free()
