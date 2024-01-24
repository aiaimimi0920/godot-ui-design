extends BaseDesignNode

var bg_color:Color
var text_color:Color

@export_group("EnabledState")
@export_subgroup("Container", "enable_container_")
@export var enable_container_shape :ShapeStyle = ShapeStyle.FULL
@export var enable_container_height :float = 40
@export_range(0,5,1) var enable_container_elevation :int = 1
@export var enable_container_shadow_color = 0
@export var enable_container_color = 0
@export var enable_container_surface_tint_layer_color = 0

@export_subgroup("Label", "enable_label_")
@export var enable_label_font = 0
@export var enable_label_line_height = 0
@export var enable_label_size = 0
@export var enable_label_weight = 0
@export var enable_label_tracking = 0
@export var enable_label_style = 0
@export var enable_label_color = 0

@export_subgroup("Icon", "enable_icon_")
@export var enable_icon_size :int= 18
@export var enable_icon_color = 0

@export_group("DisabledState")
@export_subgroup("Container", "disabled_container_")
@export var disabled_container_color = 0
@export var disabled_container_opacity:float = 0.12
@export_range(0,5,1) var disabled_container_elevation :int = 0

@export_subgroup("Label", "disabled_label_")
@export var disabled_label_color = 0
@export var disabled_label_opacity :float= 0.38

@export_subgroup("Icon", "disabled_icon_")
@export var disabled_icon_color = 0
@export var disabled_icon_opacity :float= 0.38


@export_group("HoveredState")
@export_subgroup("Container", "hovered_container_")
@export_range(0,5,1) var hovered_container_elevation :int = 2

@export_subgroup("Label", "hovered_label_")
@export var hovered_label_color = 0

@export_subgroup("StateLayer", "hovered_state_layer_")
@export var hovered_state_layer_color = 0
@export var hovered_state_layer_opacity = 0

@export_subgroup("Icon", "hovered_icon_")
@export var hovered_icon_color = 0


@export_group("FocusedState")
@export_subgroup("FocusIndicator", "focused_indicator_")
@export var focused_indicator_color = 0
@export var focused_indicator_thickness = 0
@export var focused_indicator_offset = 0

@export_subgroup("Container", "focused_container_")
@export_range(0,5,1) var focused_container_elevation :int = 1

@export_subgroup("Label", "focused_label_")
@export var focused_label_color = 0

@export_subgroup("StateLayer", "focused_state_layer_")
@export var focused_state_layer_color = 0
@export var focused_state_layer_opacity = 0

@export_subgroup("Icon", "focused_icon_")
@export var focused_icon_color = 0


@export_group("PressedState")
@export_subgroup("Container", "pressed_container_")
@export_range(0,5,1) var pressed_container_elevation :int = 1

@export_subgroup("Label", "pressed_label_")
@export var pressed_label_color = 0

@export_subgroup("StateLayer", "pressed_state_layer_")
@export var pressed_state_layer_color = 0
@export var pressed_state_layer_opacity = 0

@export_subgroup("Icon", "pressed_icon_")
@export var pressed_icon_color = 0


enum ContainerState { ENABLED=0, DISABLED, HOVERED, FOCUSED, PRESSED}

@export_enum("Enabled", "Disabled", "Hovered", "Focused", "Pressed") 
var container_state: int:
	set(val):
		container_state = val
	get:
		return container_state

var container_shape:
	get:
		return get_target_container_shape()

func get_target_container_shape(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_container_shape(target_container_state)

func _get_target_container_shape(target_container_state):
	return enable_container_shape


var container_height:
	get:
		return get_target_container_height()

func get_target_container_height(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_container_height(target_container_state)

func _get_target_container_height(target_container_state):
	return enable_container_height


var container_elevation:
	get:
		return get_target_container_elevation()

func get_target_container_elevation(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_container_elevation(target_container_state)

func _get_target_container_elevation(target_container_state):
	match target_container_state:
		ContainerState.ENABLED:
			return enable_container_elevation
		ContainerState.DISABLED:
			return disabled_container_elevation
		ContainerState.HOVERED:
			return hovered_container_elevation
		ContainerState.FOCUSED:
			return focused_container_elevation
		ContainerState.PRESSED:
			return pressed_container_elevation

	
var container_shadow_color:
	get:
		return get_target_container_shadow_color()

func get_target_container_shadow_color(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_container_shadow_color(target_container_state)

func _get_target_container_shadow_color(target_container_state):
	return enable_container_shadow_color

var container_color:
	get:
		return get_target_container_color()

func get_target_container_color(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_container_color(target_container_state)

func _get_target_container_color(target_container_state):
	match target_container_state:
		ContainerState.ENABLED:
			return enable_container_color
		ContainerState.DISABLED:
			return disabled_container_color
		ContainerState.HOVERED:
			return enable_container_color
		ContainerState.FOCUSED:
			return enable_container_color
		ContainerState.PRESSED:
			return enable_container_color

var container_surface_tint_layer_color:
	get:
		return get_target_container_surface_tint_layer_color()

func get_target_container_surface_tint_layer_color(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_container_surface_tint_layer_color(target_container_state)

func _get_target_container_surface_tint_layer_color(target_container_state):
	return enable_container_surface_tint_layer_color

var container_opacity:
	get:
		return get_target_container_opacity()

func get_target_container_opacity(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_container_opacity(target_container_state)

func _get_target_container_opacity(target_container_state):
	match target_container_state:
		ContainerState.ENABLED:
			return 1
		ContainerState.DISABLED:
			return disabled_container_opacity
		ContainerState.HOVERED:
			return 1
		ContainerState.FOCUSED:
			return 1
		ContainerState.PRESSED:
			return 1

var label_font:
	get:
		return get_target_label_font()

func get_target_label_font(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_label_font(target_container_state)

func _get_target_label_font(target_container_state):
	return enable_label_font


var label_line_height:
	get:
		return get_target_label_line_height()

func get_target_label_line_height(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_label_line_height(target_container_state)

func _get_target_label_line_height(target_container_state):
	return enable_label_line_height

var label_size:
	get:
		return get_target_label_size()

func get_target_label_size(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_label_size(target_container_state)

func _get_target_label_size(target_container_state):
	return enable_label_size

var label_weight:
	get:
		return get_target_label_weight()

func get_target_label_weight(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_label_weight(target_container_state)

func _get_target_label_weight(target_container_state):
	return enable_label_weight

var label_tracking:
	get:
		return get_target_label_tracking()

func get_target_label_tracking(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_label_tracking(target_container_state)

func _get_target_label_tracking(target_container_state):
	return enable_label_tracking

var label_style:
	get:
		return get_target_label_style()

func get_target_label_style(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_label_style(target_container_state)

func _get_target_label_style(target_container_state):
	return enable_label_style

var label_color:
	get:
		return get_target_label_color()

func get_target_label_color(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_label_color(target_container_state)

func _get_target_label_color(target_container_state):
	match target_container_state:
		ContainerState.ENABLED:
			return enable_label_color
		ContainerState.DISABLED:
			return disabled_label_color
		ContainerState.HOVERED:
			return hovered_label_color
		ContainerState.FOCUSED:
			return focused_label_color
		ContainerState.PRESSED:
			return pressed_label_color

var label_opacity:
	get:
		return get_target_label_opacity()

func get_target_label_opacity(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_label_opacity(target_container_state)

func _get_target_label_opacity(target_container_state):
	match target_container_state:
		ContainerState.ENABLED:
			return 1
		ContainerState.DISABLED:
			return disabled_label_opacity
		ContainerState.HOVERED:
			return 1
		ContainerState.FOCUSED:
			return 1
		ContainerState.PRESSED:
			return 1

var icon_size:
	get:
		return get_target_icon_size()

func get_target_icon_size(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_icon_size(target_container_state)

func _get_target_icon_size(target_container_state):
	return enable_icon_size


var icon_color:
	get:
		return get_target_icon_color()

func get_target_icon_color(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_icon_color(target_container_state)

func _get_target_icon_color(target_container_state):
	match target_container_state:
		ContainerState.ENABLED:
			return enable_icon_color
		ContainerState.DISABLED:
			return disabled_icon_color
		ContainerState.HOVERED:
			return hovered_icon_color
		ContainerState.FOCUSED:
			return focused_icon_color
		ContainerState.PRESSED:
			return pressed_icon_color


var icon_opacity:
	get:
		return get_target_icon_opacity()

func get_target_icon_opacity(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_icon_opacity(target_container_state)

func _get_target_icon_opacity(target_container_state):
	match target_container_state:
		ContainerState.ENABLED:
			return 1
		ContainerState.DISABLED:
			return disabled_icon_opacity
		ContainerState.HOVERED:
			return 1
		ContainerState.FOCUSED:
			return 1
		ContainerState.PRESSED:
			return 1


var indicator_color:
	get:
		return get_target_indicator_color()

func get_target_indicator_color(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_indicator_color(target_container_state)

func _get_target_indicator_color(target_container_state):
	return focused_indicator_color


var indicator_thickness:
	get:
		return get_target_indicator_thickness()

func get_target_indicator_thickness(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_indicator_thickness(target_container_state)

func _get_target_indicator_thickness(target_container_state):
	return focused_indicator_thickness


var indicator_offset:
	get:
		return get_target_indicator_offset()

func get_target_indicator_offset(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_indicator_offset(target_container_state)

func _get_target_indicator_offset(target_container_state):
	return focused_indicator_offset


var state_layer_color:
	get:
		return get_target_state_layer_color()

func get_target_state_layer_color(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_state_layer_color(target_container_state)

func _get_target_state_layer_color(target_container_state):
	match target_container_state:
		ContainerState.ENABLED:
			return Color(0,0,0,0)
		ContainerState.DISABLED:
			return Color(0,0,0,0)
		ContainerState.HOVERED:
			return hovered_state_layer_color
		ContainerState.FOCUSED:
			return focused_state_layer_color
		ContainerState.PRESSED:
			return pressed_state_layer_color


var state_layer_opacity:
	get:
		return get_target_state_layer_opacity()

func get_target_state_layer_opacity(target_container_state=-1):
	if target_container_state == -1:
		target_container_state = container_state
	return _get_target_state_layer_opacity(target_container_state)

func _get_target_state_layer_opacity(target_container_state):
	match target_container_state:
		ContainerState.ENABLED:
			return 0
		ContainerState.DISABLED:
			return 0
		ContainerState.HOVERED:
			return hovered_state_layer_opacity
		ContainerState.FOCUSED:
			return focused_state_layer_opacity
		ContainerState.PRESSED:
			return pressed_state_layer_opacity
		
