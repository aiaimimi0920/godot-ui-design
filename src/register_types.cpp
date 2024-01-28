#include "register_types.h"
#include "mcu.h"

#include <godot_cpp/classes/engine.hpp>
#include <godot_cpp/classes/os.hpp>
#include <godot_cpp/classes/resource_loader.hpp>
#include <godot_cpp/classes/scene_tree.hpp>
#include <godot_cpp/classes/window.hpp>
#include <godot_cpp/variant/utility_functions.hpp>

static MCU *MCUPtr;

void initialize_ui_design_module(ModuleInitializationLevel p_level) {
	if (p_level != MODULE_INITIALIZATION_LEVEL_SCENE) {
		return;
	}
	GDREGISTER_CLASS(MCU);
	GDREGISTER_CLASS(MCUSchemeContent);
	MCUPtr = memnew(MCU);
	Engine::get_singleton()->register_singleton("MCU", MCU::get_singleton());
}

void uninitialize_ui_design_module(ModuleInitializationLevel p_level) {
	if (p_level != MODULE_INITIALIZATION_LEVEL_SCENE) {
		return;
	}
	Engine::get_singleton()->unregister_singleton("MCU");
	memdelete(MCUPtr);
}

extern "C" {

GDExtensionBool GDE_EXPORT godot_ui_design_library_init(const GDExtensionInterfaceGetProcAddress p_get_proc_address, GDExtensionClassLibraryPtr p_library, GDExtensionInitialization *r_initialization) {
	godot::GDExtensionBinding::InitObject init_obj(p_get_proc_address, p_library, r_initialization);

	init_obj.register_initializer(initialize_ui_design_module);
	init_obj.register_terminator(uninitialize_ui_design_module);
	init_obj.set_minimum_library_initialization_level(MODULE_INITIALIZATION_LEVEL_SCENE);

	return init_obj.init();
}
}
