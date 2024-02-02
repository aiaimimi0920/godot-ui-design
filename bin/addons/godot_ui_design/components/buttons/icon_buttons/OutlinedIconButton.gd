extends BaseComponent

func get_state_map_data():
	return child_state_map_data

## 颜色角色其实跟状态有关，不同状态可能使用不同的颜色角色。但是一个控件中可能包含多个子内容需要调整颜色
@export var child_state_map_data = {
	UIDesignConstants.State.ENABLED:{
		"ContainerShape":UIDesignConstants.ShapeToken.FULLY_ROUNDED,
		"ContainerWidth":40,
		"ContainerHeight":40,
		
		"ContainerElevation":UIDesignConstants.ElevationLevel.LEVERL_0,
		"ContainerShadowColor":UIDesignConstants.Role.SHADOW,
		"ContainerColor":UIDesignConstants.Role.SECONDARY_CONTAINER,
		
		"ToggleSelectedContainerColor":UIDesignConstants.Role.INVERSE_SURFACE,
		
		"OutlineWidth":1,
		"ToggleUnselectedOutlineColor":UIDesignConstants.Role.OUTLINE,
		"OutlineOpacity":1.0,
		
		"IconSize":24,
		"ToggleUnselectedIconColor":UIDesignConstants.Role.ON_SURFACE_VARIANT,
		"ToggleSelectedIconColor":UIDesignConstants.Role.INVERSE_ON_SURFACE,
	},
	UIDesignConstants.State.DISABLED:{
		"ContainerColor":UIDesignConstants.Role.ON_SURFACE,
		"ContainerOpacity":0.12,

		"ToggleUnselectedIconColor":UIDesignConstants.Role.ON_SURFACE,
		"ToggleSelectedIconColor":UIDesignConstants.Role.ON_SURFACE,
		"IconOpacity":0.38,
		
		"ToggleUnselectedOutlineColor":UIDesignConstants.Role.ON_SURFACE,
		"OutlineOpacity":0.12,
		
		"ToggleSelectedOutlineColor":UIDesignConstants.Role.ON_SURFACE,
	},
	UIDesignConstants.State.HOVER:{
		"StateLayerOpacity":UIDesignConstants.hover_state_layer_opacity,
		
		"ToggleUnselectedStateLayerColor":UIDesignConstants.Role.ON_SURFACE_VARIANT,
		"ToggleSelectedStateLayerColor":UIDesignConstants.Role.INVERSE_ON_SURFACE,
		
		"ToggleUnselectedIconColor":UIDesignConstants.Role.ON_SURFACE_VARIANT,
		"ToggleSelectedIconColor":UIDesignConstants.Role.INVERSE_ON_SURFACE,
	},
	UIDesignConstants.State.FOCUSED:{
		"FocusIndicatorColor":UIDesignConstants.Role.SECONDARY_COLOR,
		"FocusIndicatorThickness":UIDesignConstants.focus_indicator_thickness,
		"FocusIndicatorOffset":UIDesignConstants.focus_indicator_outer_offset,
		
		"StateLayerOpacity":UIDesignConstants.focus_state_layer_opacity,
		
		"ToggleUnselectedStateLayerColor":UIDesignConstants.Role.ON_SURFACE_VARIANT,
		"ToggleSelectedStateLayerColor":UIDesignConstants.Role.INVERSE_ON_SURFACE,
		
		"ToggleUnselectedIconColor":UIDesignConstants.Role.ON_SURFACE_VARIANT,
		"ToggleSelectedIconColor":UIDesignConstants.Role.INVERSE_ON_SURFACE,
	},
	UIDesignConstants.State.ACTIVATED:{},
	UIDesignConstants.State.PRESSED:{
		"StateLayerOpacity":UIDesignConstants.pressed_state_layer_opacity,
		
		"ToggleUnselectedStateLayerColor":UIDesignConstants.Role.ON_SURFACE,
		"ToggleSelectedStateLayerColor":UIDesignConstants.Role.INVERSE_ON_SURFACE,
	
		"ToggleUnselectedIconColor":UIDesignConstants.Role.ON_SURFACE,
		"ToggleSelectedIconColor":UIDesignConstants.Role.INVERSE_ON_SURFACE,
	},
	UIDesignConstants.State.DRAGGED:{
	},
}

@export var icon_name = "":
	set(val):
		icon_name = val
		if is_inside_tree():
			if %Icon:
				%Icon.icon_name = icon_name
				%Icon.visible = (icon_name!="")
	get:
		return icon_name

var outline_color:UIDesignConstants.Role:
	get:
		return outline_color
	set(val):
		outline_color = val
		update_color_flag = true

func init_state():
	var target_icon_size_state_data = get_state_data("IconSize")
	if target_icon_size_state_data:
		%Icon.icon_size = target_icon_size_state_data
	
	icon_name = icon_name
	
	super.init_state()
	
	var target_outline_width_state_data = get_state_data("OutlineWidth")
	var container_layer_style = %Container.get("theme_override_styles/panel")
	container_layer_style.draw_center = false
	container_layer_style.border_width_left = target_outline_width_state_data
	container_layer_style.border_width_top = target_outline_width_state_data
	container_layer_style.border_width_right = target_outline_width_state_data
	container_layer_style.border_width_bottom = target_outline_width_state_data

	var state_layer_style = %StateLayer.get("theme_override_styles/panel")
	state_layer_style.draw_center = true

	var target_container_width_state_data = get_state_data("ContainerWidth")
	size.x = target_container_width_state_data
	custom_minimum_size.x = target_container_width_state_data


var icon_color:UIDesignConstants.Role:
	get:
		return icon_color
	set(val):
		icon_color = val
		update_color_flag = true


func update_state():
	if update_state_flag == false:
		return 
	
	var target_icon_color_state_data = get_state_data("IconColor")
	
	if target_icon_color_state_data:
		icon_color = target_icon_color_state_data


	var target_icon_opacity_state_data = get_state_data("IconOpacity")
	if target_icon_opacity_state_data:
		%Icon.modulate.a = target_icon_opacity_state_data
	else:
		%Icon.modulate.a = 1

	super.update_state()
	
	if toggled:
		var target_container_color_state_data
		var target_state_layer_color_state_data
		target_icon_color_state_data = null
		var target_outline_color_state_data
		if selected:
			target_container_color_state_data = get_state_data("ToggleSelectedContainerColor")
			target_icon_color_state_data = get_state_data("ToggleSelectedIconColor")
			target_state_layer_color_state_data = get_state_data("ToggleSelectedStateLayerColor")
			target_outline_color_state_data = get_state_data("ToggleSelectedOutlineColor")
		else:
			target_container_color_state_data = get_state_data("ToggleUnselectedContainerColor")
			target_icon_color_state_data = get_state_data("ToggleUnselectedIconColor")
			target_state_layer_color_state_data = get_state_data("ToggleUnselectedStateLayerColor")
			target_outline_color_state_data = get_state_data("ToggleUnselectedOutlineColor")
			

			
		if target_container_color_state_data:
			container_color = target_container_color_state_data
		if target_icon_color_state_data:
			icon_color = target_icon_color_state_data
		if target_state_layer_color_state_data:
			state_layer_color = target_state_layer_color_state_data
		if target_outline_color_state_data:
			outline_color = target_outline_color_state_data
	else:
		pass
		
	var target_outline_opacity_state_data = get_state_data("OutlineOpacity")
	if target_outline_opacity_state_data!=null:
		%Container.modulate.a = target_outline_opacity_state_data
	else:
		%Container.modulate.a = 1

func update_color():
	if update_color_flag == false:
		return 
	
	var cur_color = get_role_color(icon_color)
	%Icon.set("theme_override_colors/font_color",cur_color)

	var cur_outline_color = get_role_color(outline_color)
	var state_layer_style = %Container.get("theme_override_styles/panel")
	state_layer_style.border_color = cur_outline_color

	super.update_color()

func _ready():
	super._ready()

func _process(delta):
	super._process(delta)

var toggled = true

@export var selected = false

func _on_pressed():
	if toggled:
		selected = not selected
