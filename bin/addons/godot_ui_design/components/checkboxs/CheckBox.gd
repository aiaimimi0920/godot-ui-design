extends BaseComponent

func get_state_map_data():
	return child_state_map_data

## 颜色角色其实跟状态有关，不同状态可能使用不同的颜色角色。但是一个控件中可能包含多个子内容需要调整颜色
@export var child_state_map_data = {
	UIDesignConstants.State.ENABLED:{
		"ContainerShape":UIDesignConstants.ShapeToken.CUSTOM,
		"ContainerWidth":18,
		"ContainerHeight":18,
		
		"ContainerElevation":UIDesignConstants.ElevationLevel.LEVERL_0,
		"ContainerShadowColor":UIDesignConstants.Role.SHADOW,
		
		"SelectedContainerColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"UnselectedContainerColor":UIDesignConstants.Role.PRIMARY_COLOR,
		
		"SelectedOutlineWidth":0,
		"SelectedOutlineColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"SelectedOutlineOpacity":0,
		
		"UnselectedOutlineWidth":2,
		"UnselectedOutlineColor":UIDesignConstants.Role.ON_SURFACE_VARIANT,
		"UnselectedOutlineOpacity":1.0,
		
		"ErrorUnselectedOutlineColor":UIDesignConstants.Role.ERROR_COLOR,
		"ErrorSelectedOutlineColor":UIDesignConstants.Role.ERROR_COLOR,
		
		"IconSize":18,
		"UnselectedIconColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedIconColor":UIDesignConstants.Role.ON_PRIMARY,
		"ErrorSelectedIconColor":UIDesignConstants.Role.ON_ERROR,
	},
	UIDesignConstants.State.DISABLED:{
		"UnselectedOutlineWidth":2,
		"UnselectedOutlineColor":UIDesignConstants.Role.ON_SURFACE,
		"UnselectedOutlineOpacity":0.38,

		"SelectedOutlineWidth":0,
		"SelectedOutlineColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedOutlineOpacity":0.38,
		
		"SelectedIconColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"SelectedIconOpacity":0.38,
		"UnselectedIconColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"UnselectedIconOpacity":0.38,
	},
	UIDesignConstants.State.HOVER:{
		"UnselectedOutlineWidth":2,
		"UnselectedOutlineColor":UIDesignConstants.Role.ON_SURFACE,
		"UnselectedOutlineOpacity":1,

		"SelectedOutlineWidth":0,
		"SelectedOutlineColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedOutlineOpacity":1,
		
		"SelectedContainerColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"UnselectedContainerColor":UIDesignConstants.Role.PRIMARY_COLOR,
		
		"ErrorUnselectedOutlineColor":UIDesignConstants.Role.ERROR_COLOR,
		"ErrorSelectedOutlineColor":UIDesignConstants.Role.ERROR_COLOR,
		"ErrorUnselectedOutlineWidth":2,
		"ErrorSelectedOutlineWidth":0,
		
		"UnselectedStateLayerColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedStateLayerColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"UnselectedStateLayerOpacity":UIDesignConstants.hover_state_layer_opacity,
		"SelectedStateLayerOpacity":UIDesignConstants.hover_state_layer_opacity,
		
		"ErrorStateLayerColor":UIDesignConstants.Role.ERROR_COLOR,
		"ErrorStateLayerOpacity":UIDesignConstants.hover_state_layer_opacity,
		
		"SelectedIconColor":UIDesignConstants.Role.ON_PRIMARY,
		"ErrorSelectedIconColor":UIDesignConstants.Role.ON_ERROR,
		"UnselectedIconColor":UIDesignConstants.Role.ON_SURFACE,
		
	},
	UIDesignConstants.State.FOCUSED:{
		"FocusIndicatorColor":UIDesignConstants.Role.SECONDARY_COLOR,
		"FocusIndicatorThickness":UIDesignConstants.focus_indicator_thickness,
		"FocusIndicatorOffset":UIDesignConstants.focus_indicator_outer_offset,
		
		"UnselectedOutlineWidth":2,
		"UnselectedOutlineColor":UIDesignConstants.Role.ON_SURFACE,
		"UnselectedOutlineOpacity":1,

		"SelectedOutlineWidth":0,
		"SelectedOutlineColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedOutlineOpacity":1,
		
		"SelectedContainerColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"UnselectedContainerColor":UIDesignConstants.Role.PRIMARY_COLOR,
		
		"ErrorUnselectedOutlineColor":UIDesignConstants.Role.ERROR_COLOR,
		"ErrorSelectedOutlineColor":UIDesignConstants.Role.ERROR_COLOR,
		"ErrorUnselectedOutlineWidth":2,
		"ErrorSelectedOutlineWidth":0,
		
		"UnselectedStateLayerColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedStateLayerColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"UnselectedStateLayerOpacity":UIDesignConstants.hover_state_layer_opacity,
		"SelectedStateLayerOpacity":UIDesignConstants.hover_state_layer_opacity,
		
		"ErrorStateLayerColor":UIDesignConstants.Role.ERROR_COLOR,
		"ErrorStateLayerOpacity":UIDesignConstants.hover_state_layer_opacity,
		
		"SelectedIconColor":UIDesignConstants.Role.ON_PRIMARY,
		"ErrorSelectedIconColor":UIDesignConstants.Role.ON_ERROR,
		"UnselectedIconColor":UIDesignConstants.Role.ON_SURFACE,
	},
	UIDesignConstants.State.ACTIVATED:{},
	UIDesignConstants.State.PRESSED:{
		"UnselectedOutlineWidth":2,
		"UnselectedOutlineColor":UIDesignConstants.Role.ON_SURFACE,
		"UnselectedOutlineOpacity":1,

		"SelectedOutlineWidth":0,
		"SelectedOutlineColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedOutlineOpacity":1,
		
		"SelectedContainerColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"UnselectedContainerColor":UIDesignConstants.Role.PRIMARY_COLOR,
		
		"ErrorUnselectedOutlineColor":UIDesignConstants.Role.ERROR_COLOR,
		"ErrorSelectedOutlineColor":UIDesignConstants.Role.ERROR_COLOR,
		"ErrorUnselectedOutlineWidth":2,
		"ErrorSelectedOutlineWidth":0,
		
		"UnselectedStateLayerColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedStateLayerColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"UnselectedStateLayerOpacity":UIDesignConstants.hover_state_layer_opacity,
		"SelectedStateLayerOpacity":UIDesignConstants.hover_state_layer_opacity,
		
		"ErrorStateLayerColor":UIDesignConstants.Role.ERROR_COLOR,
		"ErrorStateLayerOpacity":UIDesignConstants.hover_state_layer_opacity,
		
		"SelectedIconColor":UIDesignConstants.Role.ON_PRIMARY,
		"ErrorSelectedIconColor":UIDesignConstants.Role.ON_ERROR,
		"UnselectedIconColor":UIDesignConstants.Role.ON_SURFACE,
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
	
	var container_layer_style = %Container.get("theme_override_styles/panel")
	container_layer_style.draw_center = false
	
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
	
	var target_icon_opacity_state_data = get_state_data("IconOpacity")
	if target_icon_opacity_state_data:
		%Icon.modulate.a = target_icon_opacity_state_data
	else:
		%Icon.modulate.a = 1

	super.update_state()
	
	if selected==-1:
		icon_name = "window-minimize"
	elif selected==0:
		icon_name = ""
	elif selected==1:
		icon_name = "check"
	
	var target_icon_color_state_data
	var target_container_color_state_data
	var target_outline_width_state_data
	var target_outline_color_state_data
	var target_outline_opacity_state_data

	if selected<=0:
		target_icon_color_state_data = get_state_data("UnselectedIconColor")
		target_container_color_state_data = get_state_data("UnselectedContainerColor")
		target_outline_width_state_data = get_state_data("UnselectedOutlineWidth")
		target_outline_color_state_data = get_state_data("UnselectedOutlineColor")
		target_outline_opacity_state_data = get_state_data("UnselectedOutlineOpacity")
	else:
		target_icon_color_state_data = get_state_data("SelectedIconColor")
		target_container_color_state_data = get_state_data("SelectedContainerColor")
		target_outline_width_state_data = get_state_data("SelectedOutlineWidth")
		target_outline_color_state_data = get_state_data("SelectedOutlineColor")
		target_outline_opacity_state_data = get_state_data("SelectedOutlineOpacity")
		
	if target_icon_color_state_data!=null:
		icon_color = target_icon_color_state_data
		
	if target_container_color_state_data!=null:
		container_color = target_container_color_state_data

	var container_layer_style = %Container.get("theme_override_styles/panel")
	if selected != 0:
		container_layer_style.draw_center = true
	else:
		container_layer_style.draw_center = false

	if target_outline_width_state_data!=null:
		container_layer_style.border_width_left = target_outline_width_state_data
		container_layer_style.border_width_top = target_outline_width_state_data
		container_layer_style.border_width_right = target_outline_width_state_data
		container_layer_style.border_width_bottom = target_outline_width_state_data
	
	if target_outline_color_state_data!=null:
		outline_color = target_outline_color_state_data
		
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
	
	
signal selected_sig
@export var selected = -1:
	set(val):
		selected = val
		update_state_flag = true
	get:
		return selected

func _on_pressed():
	if selected<=0:
		selected = 1
	else:
		selected = 0
