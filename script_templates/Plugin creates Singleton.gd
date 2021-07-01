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
		
		add_autoload_singleton(PLUGIN_DIR, "export ingame scripts/singleton_example.gd")


func _exit_tree():
	remove_autoload_singleton(PLUGIN_NAME)
