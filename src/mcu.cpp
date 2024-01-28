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

MCUSchemeContent::MCUSchemeContent() {
	_set_source_color(Color(), false);
	_set_is_dark(false, false);
	_set_contrast_level(0, false);
	update_scheme();
}

MCUSchemeContent::MCUSchemeContent(Color cur_source_color, bool cur_is_dark, float cur_contrast_level) {
	_set_source_color(cur_source_color, false);
	_set_is_dark(cur_is_dark, false);
	_set_contrast_level(cur_contrast_level, false);
	update_scheme();
}

MCUSchemeContent::MCUSchemeContent(Color cur_source_color, bool cur_is_dark) :
		MCUSchemeContent::MCUSchemeContent(cur_source_color, cur_is_dark, 0.0) {}

MCUSchemeContent::MCUSchemeContent(const Ref<Texture2D> &cur_source_texture, bool cur_is_dark, float cur_contrast_level) {
	_set_source_texture(cur_source_texture, false);
	_set_is_dark(cur_is_dark, false);
	_set_contrast_level(cur_contrast_level, false);
	update_scheme();
}

MCUSchemeContent::MCUSchemeContent(const Ref<Texture2D> &cur_source_texture, bool cur_is_dark) :
		MCUSchemeContent::MCUSchemeContent(cur_source_texture, cur_is_dark, 0.0) {}

MCUSchemeContent::~MCUSchemeContent() {
}

void MCUSchemeContent::_set_source_color(Color cur_source_color, bool cur_update) {
	source_color = cur_source_color;
	if (cur_update) {
		update_scheme();
	}
}

void MCUSchemeContent::set_source_color(Color cur_source_color) {
	_set_source_color(cur_source_color, true);
}

void MCUSchemeContent::_set_source_texture(const Ref<Texture2D> &cur_source_texture, bool cur_update) {
	source_texture = cur_source_texture;
	if(source_texture.is_null()){
		return;
	}

	Ref<Image> cur_source_img = source_texture->get_image();
	cur_source_img->decompress();
	std::vector<Argb> pixels;
	for (auto j = 0; j < cur_source_img->get_height(); j++) {
		for (auto i = 0; i < cur_source_img->get_width(); i++) {
			Argb cur_color = cur_source_img->get_pixel(i, j).to_argb32();
			pixels.push_back(cur_color);
		}
	}
	QuantizerResult result = QuantizeCelebi(pixels, 256);

	ScoreOptions cur_options;
	cur_options.desired = 4;
	std::vector<Argb> ranked = RankedSuggestions(result.color_to_count, cur_options);
	Argb cur_color = ranked[0];
	_set_source_color(get_color_from_argb(cur_color), false);

	if (cur_update) {
		update_scheme();
	}
}

void MCUSchemeContent::set_source_texture(const Ref<Texture2D> &cur_source_texture) {
	_set_source_texture(cur_source_texture, true);
}

void MCUSchemeContent::_set_is_dark(bool cur_is_dark, bool cur_update) {
	is_dark = cur_is_dark;
	if (cur_update) {
		update_scheme();
	}
}

void MCUSchemeContent::set_is_dark(bool cur_is_dark) {
	_set_is_dark(cur_is_dark, true);
}

void MCUSchemeContent::_set_contrast_level(float cur_contrast_level, bool cur_update) {
	contrast_level = cur_contrast_level;
	if (cur_update) {
		update_scheme();
	}
}

void MCUSchemeContent::set_contrast_level(float cur_contrast_level) {
	_set_contrast_level(cur_contrast_level, true);
}

Color MCUSchemeContent::get_source_color() {
	return source_color;
}

Ref<Texture2D> MCUSchemeContent::get_source_texture() {
	return source_texture;
}

bool MCUSchemeContent::get_is_dark() {
	return is_dark;
}

float MCUSchemeContent::get_contrast_level() {
	return contrast_level;
}

void MCUSchemeContent::update_scheme() {
	Hct source_color_hct(source_color.to_argb32());
	scheme = SchemeContent(source_color_hct, is_dark, contrast_level);
	emit_signal("updated_scheme");
}

Color MCUSchemeContent::get_color_from_argb(Argb cur_argb) {
	return Color(RedFromInt(cur_argb) / 255.0, GreenFromInt(cur_argb) / 255.0, BlueFromInt(cur_argb) / 255.0, AlphaFromInt(cur_argb) / 255.0);
}

Color MCUSchemeContent::get_source_color_argb() {
	return get_color_from_argb(scheme.SourceColorArgb());
}

Color MCUSchemeContent::get_primary_palette_key_color() {
	return get_color_from_argb(scheme.GetPrimaryPaletteKeyColor());
}

Color MCUSchemeContent::get_secondary_palette_key_color() {
	return get_color_from_argb(scheme.GetSecondaryPaletteKeyColor());
}

Color MCUSchemeContent::get_tertiary_palette_key_color() {
	return get_color_from_argb(scheme.GetTertiaryPaletteKeyColor());
}

Color MCUSchemeContent::get_neutral_palette_key_color() {
	return get_color_from_argb(scheme.GetNeutralPaletteKeyColor());
}

Color MCUSchemeContent::get_neutral_variant_palette_key_color() {
	return get_color_from_argb(scheme.GetNeutralVariantPaletteKeyColor());
}

Color MCUSchemeContent::get_background() {
	return get_color_from_argb(scheme.GetBackground());
}

Color MCUSchemeContent::get_on_background() {
	return get_color_from_argb(scheme.GetOnBackground());
}

Color MCUSchemeContent::get_surface() {
	return get_color_from_argb(scheme.GetSurface());
}

Color MCUSchemeContent::get_surface_dim() {
	return get_color_from_argb(scheme.GetSurfaceDim());
}

Color MCUSchemeContent::get_surface_bright() {
	return get_color_from_argb(scheme.GetSurfaceBright());
}

Color MCUSchemeContent::get_surface_container_lowest() {
	return get_color_from_argb(scheme.GetSurfaceContainerLowest());
}

Color MCUSchemeContent::get_surface_container_low() {
	return get_color_from_argb(scheme.GetSurfaceContainerLow());
}

Color MCUSchemeContent::get_surface_container() {
	return get_color_from_argb(scheme.GetSurfaceContainer());
}

Color MCUSchemeContent::get_surface_container_high() {
	return get_color_from_argb(scheme.GetSurfaceContainerHigh());
}

Color MCUSchemeContent::get_surface_container_highest() {
	return get_color_from_argb(scheme.GetSurfaceContainerHighest());
}

Color MCUSchemeContent::get_on_surface() {
	return get_color_from_argb(scheme.GetOnSurface());
}

Color MCUSchemeContent::get_surface_variant() {
	return get_color_from_argb(scheme.GetSurfaceVariant());
}

Color MCUSchemeContent::get_on_surface_variant() {
	return get_color_from_argb(scheme.GetOnSurfaceVariant());
}

Color MCUSchemeContent::get_inverse_surface() {
	return get_color_from_argb(scheme.GetInverseSurface());
}

Color MCUSchemeContent::get_inverse_on_surface() {
	return get_color_from_argb(scheme.GetInverseOnSurface());
}

Color MCUSchemeContent::get_outline() {
	return get_color_from_argb(scheme.GetOutline());
}

Color MCUSchemeContent::get_outline_variant() {
	return get_color_from_argb(scheme.GetOutlineVariant());
}

Color MCUSchemeContent::get_shadow() {
	return get_color_from_argb(scheme.GetShadow());
}

Color MCUSchemeContent::get_scrim() {
	return get_color_from_argb(scheme.GetScrim());
}

Color MCUSchemeContent::get_surface_tint() {
	return get_color_from_argb(scheme.GetSurfaceTint());
}

Color MCUSchemeContent::get_primary() {
	return get_color_from_argb(scheme.GetPrimary());
}

Color MCUSchemeContent::get_on_primary() {
	return get_color_from_argb(scheme.GetOnPrimary());
}

Color MCUSchemeContent::get_primary_container() {
	return get_color_from_argb(scheme.GetPrimaryContainer());
}

Color MCUSchemeContent::get_on_primary_container() {
	return get_color_from_argb(scheme.GetOnPrimaryContainer());
}

Color MCUSchemeContent::get_inverse_primary() {
	return get_color_from_argb(scheme.GetInversePrimary());
}

Color MCUSchemeContent::get_secondary() {
	return get_color_from_argb(scheme.GetSecondary());
}

Color MCUSchemeContent::get_on_secondary() {
	return get_color_from_argb(scheme.GetOnSecondary());
}

Color MCUSchemeContent::get_secondary_container() {
	return get_color_from_argb(scheme.GetSecondaryContainer());
}

Color MCUSchemeContent::get_on_secondary_container() {
	return get_color_from_argb(scheme.GetOnSecondaryContainer());
}

Color MCUSchemeContent::get_tertiary() {
	return get_color_from_argb(scheme.GetTertiary());
}

Color MCUSchemeContent::get_on_tertiary() {
	return get_color_from_argb(scheme.GetOnTertiary());
}

Color MCUSchemeContent::get_tertiary_container() {
	return get_color_from_argb(scheme.GetTertiaryContainer());
}

Color MCUSchemeContent::get_on_tertiary_container() {
	return get_color_from_argb(scheme.GetOnTertiaryContainer());
}

Color MCUSchemeContent::get_error() {
	return get_color_from_argb(scheme.GetError());
}

Color MCUSchemeContent::get_on_error() {
	return get_color_from_argb(scheme.GetOnError());
}

Color MCUSchemeContent::get_error_container() {
	return get_color_from_argb(scheme.GetErrorContainer());
}

Color MCUSchemeContent::get_on_error_container() {
	return get_color_from_argb(scheme.GetOnErrorContainer());
}

Color MCUSchemeContent::get_primary_fixed() {
	return get_color_from_argb(scheme.GetPrimaryFixed());
}

Color MCUSchemeContent::get_primary_fixed_dim() {
	return get_color_from_argb(scheme.GetPrimaryFixedDim());
}

Color MCUSchemeContent::get_on_primary_fixed() {
	return get_color_from_argb(scheme.GetOnPrimaryFixed());
}

Color MCUSchemeContent::get_on_primary_fixed_variant() {
	return get_color_from_argb(scheme.GetOnPrimaryFixedVariant());
}

Color MCUSchemeContent::get_secondary_fixed() {
	return get_color_from_argb(scheme.GetSecondaryFixed());
}

Color MCUSchemeContent::get_secondary_fixed_dim() {
	return get_color_from_argb(scheme.GetSecondaryFixedDim());
}

Color MCUSchemeContent::get_on_secondary_fixed() {
	return get_color_from_argb(scheme.GetOnSecondaryFixed());
}

Color MCUSchemeContent::get_on_secondary_fixed_variant() {
	return get_color_from_argb(scheme.GetOnSecondaryFixedVariant());
}

Color MCUSchemeContent::get_tertiary_fixed() {
	return get_color_from_argb(scheme.GetTertiaryFixed());
}

Color MCUSchemeContent::get_tertiary_fixed_dim() {
	return get_color_from_argb(scheme.GetTertiaryFixedDim());
}

Color MCUSchemeContent::get_on_tertiary_fixed() {
	return get_color_from_argb(scheme.GetOnTertiaryFixed());
}

Color MCUSchemeContent::get_on_tertiary_fixed_variant() {
	return get_color_from_argb(scheme.GetOnTertiaryFixedVariant());
}

void MCUSchemeContent::_bind_methods() {
	ClassDB::bind_method(D_METHOD("set_source_color", "source_color"), &MCUSchemeContent::set_source_color);
	ClassDB::bind_method(D_METHOD("set_source_texture", "source_texture"), &MCUSchemeContent::set_source_texture);
	ClassDB::bind_method(D_METHOD("set_is_dark", "is_dark"), &MCUSchemeContent::set_is_dark);
	ClassDB::bind_method(D_METHOD("set_contrast_level", "contrast_level"), &MCUSchemeContent::set_contrast_level);
	ClassDB::bind_method(D_METHOD("get_source_color"), &MCUSchemeContent::get_source_color);
	ClassDB::bind_method(D_METHOD("get_source_texture"), &MCUSchemeContent::get_source_texture);
	ClassDB::bind_method(D_METHOD("get_is_dark"), &MCUSchemeContent::get_is_dark);
	ClassDB::bind_method(D_METHOD("get_contrast_level"), &MCUSchemeContent::get_contrast_level);

	ClassDB::bind_method(D_METHOD("update_scheme"), &MCUSchemeContent::update_scheme);
	ClassDB::bind_method(D_METHOD("get_source_color_argb"), &MCUSchemeContent::get_source_color_argb);

	ClassDB::bind_method(D_METHOD("get_primary_palette_key_color"), &MCUSchemeContent::get_primary_palette_key_color);
	ClassDB::bind_method(D_METHOD("get_secondary_palette_key_color"), &MCUSchemeContent::get_secondary_palette_key_color);
	ClassDB::bind_method(D_METHOD("get_tertiary_palette_key_color"), &MCUSchemeContent::get_tertiary_palette_key_color);
	ClassDB::bind_method(D_METHOD("get_neutral_palette_key_color"), &MCUSchemeContent::get_neutral_palette_key_color);
	ClassDB::bind_method(D_METHOD("get_neutral_variant_palette_key_color"), &MCUSchemeContent::get_neutral_variant_palette_key_color);
	ClassDB::bind_method(D_METHOD("get_background"), &MCUSchemeContent::get_background);
	ClassDB::bind_method(D_METHOD("get_on_background"), &MCUSchemeContent::get_on_background);
	ClassDB::bind_method(D_METHOD("get_surface"), &MCUSchemeContent::get_surface);
	ClassDB::bind_method(D_METHOD("get_surface_dim"), &MCUSchemeContent::get_surface_dim);
	ClassDB::bind_method(D_METHOD("get_surface_bright"), &MCUSchemeContent::get_surface_bright);
	ClassDB::bind_method(D_METHOD("get_surface_container_lowest"), &MCUSchemeContent::get_surface_container_lowest);
	ClassDB::bind_method(D_METHOD("get_surface_container_low"), &MCUSchemeContent::get_surface_container_low);
	ClassDB::bind_method(D_METHOD("get_surface_container"), &MCUSchemeContent::get_surface_container);
	ClassDB::bind_method(D_METHOD("get_surface_container_high"), &MCUSchemeContent::get_surface_container_high);
	ClassDB::bind_method(D_METHOD("get_surface_container_highest"), &MCUSchemeContent::get_surface_container_highest);
	ClassDB::bind_method(D_METHOD("get_on_surface"), &MCUSchemeContent::get_on_surface);
	ClassDB::bind_method(D_METHOD("get_surface_variant"), &MCUSchemeContent::get_surface_variant);
	ClassDB::bind_method(D_METHOD("get_on_surface_variant"), &MCUSchemeContent::get_on_surface_variant);
	ClassDB::bind_method(D_METHOD("get_inverse_surface"), &MCUSchemeContent::get_inverse_surface);
	ClassDB::bind_method(D_METHOD("get_inverse_on_surface"), &MCUSchemeContent::get_inverse_on_surface);
	ClassDB::bind_method(D_METHOD("get_outline"), &MCUSchemeContent::get_outline);
	ClassDB::bind_method(D_METHOD("get_outline_variant"), &MCUSchemeContent::get_outline_variant);
	ClassDB::bind_method(D_METHOD("get_shadow"), &MCUSchemeContent::get_shadow);
	ClassDB::bind_method(D_METHOD("get_scrim"), &MCUSchemeContent::get_scrim);
	ClassDB::bind_method(D_METHOD("get_surface_tint"), &MCUSchemeContent::get_surface_tint);
	ClassDB::bind_method(D_METHOD("get_primary"), &MCUSchemeContent::get_primary);
	ClassDB::bind_method(D_METHOD("get_on_primary"), &MCUSchemeContent::get_on_primary);
	ClassDB::bind_method(D_METHOD("get_primary_container"), &MCUSchemeContent::get_primary_container);
	ClassDB::bind_method(D_METHOD("get_on_primary_container"), &MCUSchemeContent::get_on_primary_container);
	ClassDB::bind_method(D_METHOD("get_inverse_primary"), &MCUSchemeContent::get_inverse_primary);
	ClassDB::bind_method(D_METHOD("get_secondary"), &MCUSchemeContent::get_secondary);
	ClassDB::bind_method(D_METHOD("get_on_secondary"), &MCUSchemeContent::get_on_secondary);
	ClassDB::bind_method(D_METHOD("get_secondary_container"), &MCUSchemeContent::get_secondary_container);
	ClassDB::bind_method(D_METHOD("get_on_secondary_container"), &MCUSchemeContent::get_on_secondary_container);
	ClassDB::bind_method(D_METHOD("get_tertiary"), &MCUSchemeContent::get_tertiary);
	ClassDB::bind_method(D_METHOD("get_on_tertiary"), &MCUSchemeContent::get_on_tertiary);
	ClassDB::bind_method(D_METHOD("get_tertiary_container"), &MCUSchemeContent::get_tertiary_container);
	ClassDB::bind_method(D_METHOD("get_on_tertiary_container"), &MCUSchemeContent::get_on_tertiary_container);
	ClassDB::bind_method(D_METHOD("get_error"), &MCUSchemeContent::get_error);
	ClassDB::bind_method(D_METHOD("get_on_error"), &MCUSchemeContent::get_on_error);
	ClassDB::bind_method(D_METHOD("get_error_container"), &MCUSchemeContent::get_error_container);
	ClassDB::bind_method(D_METHOD("get_on_error_container"), &MCUSchemeContent::get_on_error_container);
	ClassDB::bind_method(D_METHOD("get_primary_fixed"), &MCUSchemeContent::get_primary_fixed);
	ClassDB::bind_method(D_METHOD("get_primary_fixed_dim"), &MCUSchemeContent::get_primary_fixed_dim);
	ClassDB::bind_method(D_METHOD("get_on_primary_fixed"), &MCUSchemeContent::get_on_primary_fixed);
	ClassDB::bind_method(D_METHOD("get_on_primary_fixed_variant"), &MCUSchemeContent::get_on_primary_fixed_variant);
	ClassDB::bind_method(D_METHOD("get_secondary_fixed"), &MCUSchemeContent::get_secondary_fixed);
	ClassDB::bind_method(D_METHOD("get_secondary_fixed_dim"), &MCUSchemeContent::get_secondary_fixed_dim);
	ClassDB::bind_method(D_METHOD("get_on_secondary_fixed"), &MCUSchemeContent::get_on_secondary_fixed);
	ClassDB::bind_method(D_METHOD("get_on_secondary_fixed_variant"), &MCUSchemeContent::get_on_secondary_fixed_variant);
	ClassDB::bind_method(D_METHOD("get_tertiary_fixed"), &MCUSchemeContent::get_tertiary_fixed);
	ClassDB::bind_method(D_METHOD("get_tertiary_fixed_dim"), &MCUSchemeContent::get_tertiary_fixed_dim);
	ClassDB::bind_method(D_METHOD("get_on_tertiary_fixed"), &MCUSchemeContent::get_on_tertiary_fixed);
	ClassDB::bind_method(D_METHOD("get_on_tertiary_fixed_variant"), &MCUSchemeContent::get_on_tertiary_fixed_variant);
	ADD_SIGNAL(MethodInfo("updated_scheme"));

	ADD_PROPERTY(PropertyInfo(godot::Variant::COLOR, "source_color"), "set_source_color", "get_source_color");
	ADD_PROPERTY(PropertyInfo(godot::Variant::OBJECT, "texture", PROPERTY_HINT_RESOURCE_TYPE, "Texture2D"), "set_source_texture", "get_source_texture");
	ADD_PROPERTY(PropertyInfo(godot::Variant::BOOL, "is_dark"), "set_is_dark", "get_is_dark");
	ADD_PROPERTY(PropertyInfo(godot::Variant::FLOAT, "contrast_level"), "set_contrast_level", "get_contrast_level");
}

MCU *MCU::singleton = nullptr;

MCU *MCU::get_singleton() {
	return MCU::singleton;
}

void MCU::set_default_scheme(Ref<MCUSchemeContent> cur_scheme){
	default_scheme = cur_scheme;
}

Ref<MCUSchemeContent> MCU::get_default_scheme(){
	return default_scheme;
}

MCU::MCU() {
	UtilityFunctions::print("MCU::MCU()");
	MCU::singleton = this;
	Ref<MCUSchemeContent> cur_scheme;
	cur_scheme.instantiate();
	cur_scheme->set_source_color(Color("#6750A4"));
	set_default_scheme(cur_scheme);
}

MCU::~MCU() {
	MCU::singleton = nullptr;
}

void MCU::_bind_methods() {
	ClassDB::bind_method(D_METHOD("set_default_scheme", "scheme"), &MCU::set_default_scheme);
	ClassDB::bind_method(D_METHOD("get_default_scheme"), &MCU::get_default_scheme);
}
