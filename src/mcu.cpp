#include "mcu.h"
#include <atomic>
#include <cmath>
#include <godot_cpp/classes/audio_server.hpp>
#include <godot_cpp/classes/project_settings.hpp>
#include <godot_cpp/classes/time.hpp>
#include <godot_cpp/core/error_macros.hpp>
#include <godot_cpp/core/memory.hpp>
#include <godot_cpp/variant/packed_vector2_array.hpp>
#include <godot_cpp/variant/utility_functions.hpp>
#include <string>
#include <vector>

MCU *MCU::singleton = nullptr;

MCU *MCU::get_singleton() {
	return MCU::singleton;
}

MCU::MCU() {
	MCU::singleton = this;
}

MCU::~MCU() {
	MCU::singleton = nullptr;
}

void MCU::_bind_methods() {

}
