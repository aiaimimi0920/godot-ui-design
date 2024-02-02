class_name UIDesignConstants

enum Role {
	PRIMARY=0,
	SECONDARY,
	TERTIARY,
	NEUTRAL,
	NEUTRAL_VARIANT,
	BACKGROUND,
	ON_BACKGROUND,
	SURFACE,
	SURFACE_DIM,
	SURFACE_BRIGHT,
	SURFACE_CONTAINER_LOWEST,
	SURFACE_CONTAINER_LOW,
	SURFACE_CONTAINER,
	SURFACE_CONTAINER_HIGH,
	SURFACE_CONTAINER_HIGHEST,
	ON_SURFACE,
	SURFACE_VARIANT,
	ON_SURFACE_VARIANT,
	INVERSE_SURFACE,
	INVERSE_ON_SURFACE,
	OUTLINE,
	OUTLINE_VARIANT,
	SHADOW,
	SCRIM,
	SURFACE_TINT,
	PRIMARY_COLOR,
	ON_PRIMARY,
	PRIMARY_CONTAINER,
	ON_PRIMARY_CONTAINER,
	INVERSE_PRIMARY,
	SECONDARY_COLOR,
	ON_SECONDARY,
	SECONDARY_CONTAINER,
	ON_SECONDARY_CONTAINER,
	TERTIARY_COLOR,
	ON_TERTIARY,
	TERTIARY_CONTAINER,
	ON_TERTIARY_CONTAINER,
	ERROR_COLOR,
	ON_ERROR,
	ERROR_CONTAINER,
	ON_ERROR_CONTAINER,
	PRIMARY_FIXED,
	PRIMARY_FIXED_DIM,
	ON_PRIMARY_FIXED,
	ON_PRIMARY_FIXED_VARIANT,
	SECONDARY_FIXED,
	SECONDARY_FIXED_DIM,
	ON_SECONDARY_FIXED,
	ON_SECONDARY_FIXED_VARIANT,
	TERTIARY_FIXED,
	TERTIARY_FIXED_DIM,
	ON_TERTIARY_FIXED,
	ON_TERTIARY_FIXED_VARIANT
}

const func_map ={
	Role.PRIMARY: "get_primary_palette_key_color",
	Role.SECONDARY: "get_secondary_palette_key_color",
	Role.TERTIARY: "get_tertiary_palette_key_color",
	Role.NEUTRAL: "get_neutral_palette_key_color",
	Role.NEUTRAL_VARIANT: "get_neutral_variant_palette_key_color",
	
	Role.BACKGROUND: "get_background",
	Role.ON_BACKGROUND: "get_on_background",
	Role.SURFACE: "get_surface",
	Role.SURFACE_DIM: "get_surface_dim",
	Role.SURFACE_BRIGHT: "get_surface_bright",
	Role.SURFACE_CONTAINER_LOWEST: "get_surface_container_lowest",
	Role.SURFACE_CONTAINER_LOW: "get_surface_container_low",
	Role.SURFACE_CONTAINER: "get_surface_container",
	Role.SURFACE_CONTAINER_HIGH: "get_surface_container_high",
	Role.SURFACE_CONTAINER_HIGHEST: "get_surface_container_highest",
	Role.ON_SURFACE: "get_on_surface",
	Role.SURFACE_VARIANT: "get_surface_variant",
	Role.ON_SURFACE_VARIANT: "get_on_surface_variant",
	Role.INVERSE_SURFACE: "get_inverse_surface",
	Role.INVERSE_ON_SURFACE: "get_inverse_on_surface",
	Role.OUTLINE: "get_outline",
	Role.OUTLINE_VARIANT: "get_outline_variant",
	Role.SHADOW: "get_shadow",
	Role.SCRIM: "get_scrim",
	Role.SURFACE_TINT: "get_surface_tint",
	Role.PRIMARY_COLOR: "get_primary",
	Role.ON_PRIMARY: "get_on_primary",
	Role.PRIMARY_CONTAINER: "get_primary_container",
	Role.ON_PRIMARY_CONTAINER: "get_on_primary_container",
	Role.INVERSE_PRIMARY: "get_inverse_primary",
	Role.SECONDARY_COLOR: "get_secondary",
	Role.ON_SECONDARY: "get_on_secondary",
	Role.SECONDARY_CONTAINER: "get_secondary_container",
	Role.ON_SECONDARY_CONTAINER: "get_on_secondary_container",
	Role.TERTIARY_COLOR: "get_tertiary",
	Role.ON_TERTIARY: "get_on_tertiary",
	Role.TERTIARY_CONTAINER: "get_tertiary_container",
	Role.ON_TERTIARY_CONTAINER: "get_on_tertiary_container",
	Role.ERROR_COLOR: "get_error",
	Role.ON_ERROR: "get_on_error",
	Role.ERROR_CONTAINER: "get_error_container",
	Role.ON_ERROR_CONTAINER: "get_on_error_container",
	Role.PRIMARY_FIXED: "get_primary_fixed",
	Role.PRIMARY_FIXED_DIM: "get_primary_fixed_dim",
	Role.ON_PRIMARY_FIXED: "get_on_primary_fixed",
	Role.ON_PRIMARY_FIXED_VARIANT: "get_on_primary_fixed_variant",
	Role.SECONDARY_FIXED: "get_secondary_fixed",
	Role.SECONDARY_FIXED_DIM: "get_secondary_fixed_dim",
	Role.ON_SECONDARY_FIXED: "get_on_secondary_fixed",
	Role.ON_SECONDARY_FIXED_VARIANT: "get_on_secondary_fixed_variant",
	Role.TERTIARY_FIXED: "get_tertiary_fixed",
	Role.TERTIARY_FIXED_DIM: "get_tertiary_fixed_dim",
	Role.ON_TERTIARY_FIXED: "get_on_tertiary_fixed",
	Role.ON_TERTIARY_FIXED_VARIANT: "get_on_tertiary_fixed_variant"
}

enum ShapeStyle { CUSTOM=0, NONE, EXTRA_SMALL, SMALL, MEDIUM, LARGE, EXTRA_LARGE, FULL }
enum ShapeSymmetry { CUSTOM=0, NONE, TOP, BOTTOM, START, END }
enum ShapeFamily { ROUNDED=0, CUT }

enum ShapeToken { CUSTOM=0, FULLY_ROUNDED, EXTRA_LARGE_TOP_ROUNDING, EXTRA_LARGE_ROUNDING, LARGE_TOP_ROUNDING, 
				  LARGE_END_ROUNDING, LARGE_START_ROUNDING, LARGE_ROUNDING, MEDIUM_ROUNDING, SMALL_ROUNDING,
				  EXTRA_SMALL_TOP_ROUNDING, EXTRA_SMALL_ROUNDING, NO_ROUNDING }


const token_map = {
	ShapeToken.CUSTOM:{
		"style":ShapeStyle.CUSTOM,
		"symmetry":ShapeSymmetry.CUSTOM,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.FULLY_ROUNDED:{
		"style":ShapeStyle.FULL,
		"symmetry":ShapeSymmetry.NONE,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.EXTRA_LARGE_TOP_ROUNDING:{
		"style":ShapeStyle.EXTRA_LARGE,#28
		"symmetry":ShapeSymmetry.TOP,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.EXTRA_LARGE_ROUNDING:{
		"style":ShapeStyle.EXTRA_LARGE,
		"symmetry":ShapeSymmetry.NONE,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.LARGE_TOP_ROUNDING:{
		"style":ShapeStyle.LARGE,#16
		"symmetry":ShapeSymmetry.TOP,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.LARGE_END_ROUNDING:{
		"style":ShapeStyle.LARGE,
		"symmetry":ShapeSymmetry.END,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.LARGE_START_ROUNDING:{
		"style":ShapeStyle.LARGE,
		"symmetry":ShapeSymmetry.START,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.LARGE_ROUNDING:{
		"style":ShapeStyle.LARGE,
		"symmetry":ShapeSymmetry.NONE,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.MEDIUM_ROUNDING:{
		"style":ShapeStyle.MEDIUM,#12
		"symmetry":ShapeSymmetry.NONE,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.SMALL_ROUNDING:{
		"style":ShapeStyle.SMALL,#8
		"symmetry":ShapeSymmetry.NONE,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.EXTRA_SMALL_TOP_ROUNDING:{
		"style":ShapeStyle.EXTRA_SMALL,#4
		"symmetry":ShapeSymmetry.TOP,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.EXTRA_SMALL_ROUNDING:{
		"style":ShapeStyle.EXTRA_SMALL,
		"symmetry":ShapeSymmetry.NONE,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.NO_ROUNDING:{
		"style":ShapeStyle.NONE,#0
		"symmetry":ShapeSymmetry.NONE,
		"family":ShapeFamily.ROUNDED,
	},
}

const margin_size_map = {
	ShapeStyle.CUSTOM:-1,
	ShapeStyle.NONE:0,
	ShapeStyle.EXTRA_SMALL:4,
	ShapeStyle.SMALL:8,
	ShapeStyle.MEDIUM:12,
	ShapeStyle.LARGE:16,
	ShapeStyle.EXTRA_LARGE:28,
	ShapeStyle.FULL:1024,
}

enum ElevationLevel { LEVERL_0=0, LEVERL_1, LEVERL_2, LEVERL_3, LEVERL_4, LEVERL_5}

const elevation_level_map_dp_height={
	ElevationLevel.LEVERL_0:0,
	ElevationLevel.LEVERL_1:1,
	ElevationLevel.LEVERL_2:3,
	ElevationLevel.LEVERL_3:6,
	ElevationLevel.LEVERL_4:8,
	ElevationLevel.LEVERL_5:12,
}

const umbra_shadow_offset = {
	0:Vector2(0,0),
	1:Vector2(0,2),
	3:Vector2(0,3),
	6:Vector2(0,3),
	8:Vector2(0,5),
	12:Vector2(0,7),
}

const penumbra_shadow_offset = {
	0:Vector2(0,0),
	1:Vector2(0,1),
	3:Vector2(0,3),
	6:Vector2(0,6),
	8:Vector2(0,8),
	12:Vector2(0,12),
}

const ambient_shadow_offset = {
	0:Vector2(0,0),
	1:Vector2(0,1),
	3:Vector2(0,1),
	6:Vector2(0,1),
	8:Vector2(0,3),
	12:Vector2(0,5),
}

const shadow_offset_array = [umbra_shadow_offset, penumbra_shadow_offset, ambient_shadow_offset]

const umbra_shadow_size = {
	0:0,
	1:1,
	3:3,
	6:5,
	8:5,
	12:8,
}

const penumbra_shadow_size = {
	0:0,
	1:1,
	3:4,
	6:10,
	8:10,
	12:17,
}

const ambient_shadow_size = {
	0:0,
	1:3,
	3:8,
	6:18,
	8:14,
	12:22,
}

const shadow_size_array = [umbra_shadow_size, penumbra_shadow_size, ambient_shadow_size]

const umbra_shadow_expand_size = {
	0:0,
	1:-1,
	3:-2,
	6:-1,
	8:-3,
	12:-4,
}

const penumbra_shadow_expand_size = {
	0:0,
	1:0,
	3:0,
	6:0,
	8:1,
	12:2,
}

const ambient_shadow_expand_size = {
	0:0,
	1:0,
	3:0,
	6:0,
	8:2,
	12:4,
}

const shadow_expand_size_array = [umbra_shadow_expand_size, penumbra_shadow_expand_size, ambient_shadow_expand_size]

const umbra_opacity = 0.2
const penumbra_opacity = 0.14
const ambient_opacity = 0.12

const opacity_array = [umbra_opacity, penumbra_opacity, ambient_opacity]

enum State { ENABLED=0, DISABLED, HOVER, FOCUSED, ACTIVATED, PRESSED, DRAGGED }

const state_map_opacity = {
	State.ENABLED:0,
	State.DISABLED:0,
	State.HOVER:0.08,
	State.FOCUSED:0.10,
	State.ACTIVATED:0,
	State.PRESSED:0.10,
	State.DRAGGED:0.16,
}

const hover_state_layer_opacity = 0.08
const disabled_state_layer_opacity = 0.08
const focus_state_layer_opacity = 0.10
const pressed_state_layer_opacity = 0.10
const dragged_state_layer_opacity = 0.16

const focus_indicator_thickness = 3
const focus_indicator_outer_offset = 2


var state_map_data = {
	State.ENABLED:{
		"ContainerShape":ShapeToken.FULLY_ROUNDED,
		"ContainerHeight":40,
		"ContainerElevation":ElevationLevel.LEVERL_1,
		"ContainerShadowColor":Role.SHADOW,
		"ContainerColor":Role.SURFACE_CONTAINER_LOW,
		
		"LabelColor":Role.PRIMARY,
		
		"IconSize":18,
		"IconColor":Role.PRIMARY,
	},
	State.DISABLED:{
		"ContainerElevation":ElevationLevel.LEVERL_0,
		"ContainerColor":Role.ON_SURFACE,
		"ContainerOpacity":Role.ON_SURFACE,
		
		"LabelColor":Role.ON_SURFACE,
		"LabelOpacity":0.38,

		"IconColor":Role.ON_SURFACE,
		"IconOpacity":0.38,
	},
	State.HOVER:{
		"ContainerElevation":ElevationLevel.LEVERL_2,

		"LabelColor":Role.PRIMARY,
		
		"StateLayerColor":Role.PRIMARY,
		"StateLayerOpacity":hover_state_layer_opacity,

		"IconColor":Role.ON_SURFACE,
	},
	State.FOCUSED:{
		"FocusIndicatorColor":Role.SECONDARY,
		"FocusIndicatorThickness":focus_indicator_thickness,
		"FocusIndicatorOffset":focus_indicator_outer_offset,
		
		"ContainerElevation":ElevationLevel.LEVERL_1,

		"LabelColor":Role.PRIMARY,
		
		"StateLayerColor":Role.PRIMARY,
		"StateLayerOpacity":focus_state_layer_opacity,

		"IconColor":Role.PRIMARY,
	},
	State.ACTIVATED:{},
	State.PRESSED:{
		"ContainerElevation":ElevationLevel.LEVERL_1,

		"LabelColor":Role.PRIMARY,
		
		"StateLayerColor":Role.PRIMARY,
		"StateLayerOpacity":pressed_state_layer_opacity,

		"IconColor":Role.PRIMARY,
	},
	State.DRAGGED:{},
}

enum LabelToken { CUSTOM=0,
				BODY_LARGE, BODY_MEDIUM, BODY_SMALL, 
				DISPLAY_LARGE, DISPLAY_MEDIUM, DISPLAY_SMALL,
				HEADLINE_LARGE, HEADLINE_MEDIUM, HEADLINE_SMALL,
				LABEL_LARGE, LABEL_MEDIUM, LABEL_SMALL,
				TITLE_LARGE, TITLE_MEDIUM, TITLE_SMALL,
				}

const label_token_map = {
	LabelToken.CUSTOM:null,
	
	LabelToken.BODY_LARGE:preload("res://addons/godot_ui_design/font/body_large.tres"),
	LabelToken.BODY_MEDIUM:preload("res://addons/godot_ui_design/font/body_medium.tres"),
	LabelToken.BODY_SMALL:preload("res://addons/godot_ui_design/font/body_small.tres"),
	
	LabelToken.DISPLAY_LARGE:preload("res://addons/godot_ui_design/font/display_large.tres"),
	LabelToken.DISPLAY_MEDIUM:preload("res://addons/godot_ui_design/font/display_medium.tres"),
	LabelToken.DISPLAY_SMALL:preload("res://addons/godot_ui_design/font/display_small.tres"),
	
	LabelToken.HEADLINE_LARGE:preload("res://addons/godot_ui_design/font/headline_large.tres"),
	LabelToken.HEADLINE_MEDIUM:preload("res://addons/godot_ui_design/font/headline_medium.tres"),
	LabelToken.HEADLINE_SMALL:preload("res://addons/godot_ui_design/font/headline_small.tres"),
	
	LabelToken.LABEL_LARGE:preload("res://addons/godot_ui_design/font/label_large.tres"),
	LabelToken.LABEL_MEDIUM:preload("res://addons/godot_ui_design/font/label_medium.tres"),
	LabelToken.LABEL_SMALL:preload("res://addons/godot_ui_design/font/label_small.tres"),
	
	LabelToken.TITLE_LARGE:preload("res://addons/godot_ui_design/font/title_large.tres"),
	LabelToken.TITLE_MEDIUM:preload("res://addons/godot_ui_design/font/title_medium.tres"),
	LabelToken.TITLE_SMALL:preload("res://addons/godot_ui_design/font/title_small.tres"),
}

enum FABToken { CUSTOM=0,
				PRIMARY_SMALL, PRIMARY, PRIMARY_LARGE, 
				BRANDED, BRANDED_LARGE, 
				SECONDARY_SMALL, SECONDARY, SECONDARY_LARGE, 
				SURFACE_SMALL, SURFACE, SURFACE_LARGE, 
				TERTIARY_SMALL, TERTIARY, TERTIARY_LARGE, 
				}
