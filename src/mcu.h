#ifndef MCU_H
#define MCU_H

#include <godot_cpp/classes/engine.hpp>
#include <godot_cpp/classes/image.hpp>
#include <godot_cpp/classes/mutex.hpp>
#include <godot_cpp/classes/node.hpp>
#include <godot_cpp/classes/os.hpp>
#include <godot_cpp/classes/resource_uid.hpp>
#include <godot_cpp/classes/scene_tree.hpp>
#include <godot_cpp/classes/semaphore.hpp>
#include <godot_cpp/classes/texture2d.hpp>
#include <godot_cpp/classes/thread.hpp>
#include <godot_cpp/classes/window.hpp>
#include <godot_cpp/core/math.hpp>
#include <godot_cpp/core/memory.hpp>
#include <godot_cpp/core/mutex_lock.hpp>
#include <godot_cpp/templates/hash_map.hpp>
#include <godot_cpp/templates/list.hpp>
#include <godot_cpp/templates/vector.hpp>
#include <godot_cpp/variant/array.hpp>
#include <godot_cpp/variant/callable.hpp>
#include <godot_cpp/variant/callable_method_pointer.hpp>
#include <godot_cpp/variant/variant.hpp>

#include "material-color-utilities/cpp/quantize/celebi.h"
#include "material-color-utilities/cpp/scheme/scheme.h"
#include "material-color-utilities/cpp/scheme/scheme_content.h"
#include "material-color-utilities/cpp/score/score.h"
#include "material-color-utilities/cpp/utils/utils.h"
#include <optional>

using namespace godot;
using namespace material_color_utilities;

class MCUSchemeContent : public Resource {
	GDCLASS(MCUSchemeContent, Resource);

public:
	SchemeContent scheme = SchemeContent(Hct(0), false, 0);
	Color source_color;
	Ref<Texture2D> source_texture;
	bool is_dark = false;
	float contrast_level = 0;

protected:
	static void _bind_methods();

public:
	MCUSchemeContent(Color cur_source_color, bool cur_is_dark, float cur_contrast_level);
	MCUSchemeContent(Color cur_source_color, bool cur_is_dark);
	MCUSchemeContent(const Ref<Texture2D> &cur_source_texture, bool cur_is_dark);
	MCUSchemeContent(const Ref<Texture2D> &cur_source_texture, bool cur_is_dark, float cur_contrast_level);

	MCUSchemeContent();
	~MCUSchemeContent();

	void _set_source_color(Color cur_source_color, bool cur_update = true);
	void set_source_color(Color cur_source_color);

	void _set_source_texture(const Ref<Texture2D> &cur_source_texture, bool cur_update = true);
	void set_source_texture(const Ref<Texture2D> &cur_source_texture);

	void _set_is_dark(bool cur_is_dark, bool cur_update = true);
	void set_is_dark(bool cur_is_dark);

	void _set_contrast_level(float cur_contrast_level, bool cur_update = true);
	void set_contrast_level(float cur_contrast_level);

	Color get_source_color();
	Ref<Texture2D> get_source_texture();
	bool get_is_dark();
	float get_contrast_level();

	void update_scheme();
	Color get_color_from_argb(Argb cur_argb);
	Color get_source_color_argb();

	Color get_primary_palette_key_color();
	Color get_secondary_palette_key_color();
	Color get_tertiary_palette_key_color();
	Color get_neutral_palette_key_color();
	Color get_neutral_variant_palette_key_color();
	Color get_background();
	Color get_on_background();
	Color get_surface();
	Color get_surface_dim();
	Color get_surface_bright();
	Color get_surface_container_lowest();
	Color get_surface_container_low();
	Color get_surface_container();
	Color get_surface_container_high();
	Color get_surface_container_highest();
	Color get_on_surface();
	Color get_surface_variant();
	Color get_on_surface_variant();
	Color get_inverse_surface();
	Color get_inverse_on_surface();
	Color get_outline();
	Color get_outline_variant();
	Color get_shadow();
	Color get_scrim();
	Color get_surface_tint();
	Color get_primary();
	Color get_on_primary();
	Color get_primary_container();
	Color get_on_primary_container();
	Color get_inverse_primary();
	Color get_secondary();
	Color get_on_secondary();
	Color get_secondary_container();
	Color get_on_secondary_container();
	Color get_tertiary();
	Color get_on_tertiary();
	Color get_tertiary_container();
	Color get_on_tertiary_container();
	Color get_error();
	Color get_on_error();
	Color get_error_container();
	Color get_on_error_container();
	Color get_primary_fixed();
	Color get_primary_fixed_dim();
	Color get_on_primary_fixed();
	Color get_on_primary_fixed_variant();
	Color get_secondary_fixed();
	Color get_secondary_fixed_dim();
	Color get_on_secondary_fixed();
	Color get_on_secondary_fixed_variant();
	Color get_tertiary_fixed();
	Color get_tertiary_fixed_dim();
	Color get_on_tertiary_fixed();
	Color get_on_tertiary_fixed_variant();
};

class MCU : public Node {
	GDCLASS(MCU, Node);

public:
	static MCU *singleton;
	Ref<MCUSchemeContent> default_scheme;

protected:
	static void _bind_methods();

public:
	static MCU *get_singleton();

	void set_default_scheme(Ref<MCUSchemeContent> cur_scheme);
	Ref<MCUSchemeContent> get_default_scheme();

	MCU();
	~MCU();
};

#endif // MCU_H
