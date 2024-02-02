extends BaseComponent

func get_state_map_data():
	return child_state_map_data

## 颜色角色其实跟状态有关，不同状态可能使用不同的颜色角色。但是一个控件中可能包含多个子内容需要调整颜色
@export var child_state_map_data = {
	UIDesignConstants.State.ENABLED:{
		"ContainerShape":UIDesignConstants.ShapeToken.FULLY_ROUNDED,
		"ContainerHeight":40,
		"ContainerElevation":UIDesignConstants.ElevationLevel.LEVERL_0,
		"ContainerShadowColor":UIDesignConstants.Role.SHADOW,
		"ContainerColor":UIDesignConstants.Role.SECONDARY_CONTAINER,
		"OutlineColor":UIDesignConstants.Role.OUTLINE,
		"OutlineWidth":1,
		"OutlineOpacity":1.0,
		
		"LabelStyle":UIDesignConstants.LabelToken.LABEL_LARGE,
		"LabelColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"IconSize":18,
		"IconColor":UIDesignConstants.Role.PRIMARY_COLOR,
	},
	UIDesignConstants.State.DISABLED:{
		"ContainerElevation":UIDesignConstants.ElevationLevel.LEVERL_0,
		"ContainerColor":UIDesignConstants.Role.ON_SURFACE,
		"ContainerOpacity":0.12,
		
		"OutlineColor":UIDesignConstants.Role.ON_SURFACE,
		"OutlineOpacity":0.12,
		
		"LabelColor":UIDesignConstants.Role.ON_SURFACE,
		"LabelOpacity":0.38,
		"IconColor":UIDesignConstants.Role.ON_SURFACE,
		"IconOpacity":0.38,
	},
	UIDesignConstants.State.HOVER:{
		"LabelColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"StateLayerColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"StateLayerOpacity":UIDesignConstants.hover_state_layer_opacity,
		"IconColor":UIDesignConstants.Role.PRIMARY_COLOR,
		
		"OutlineColor":UIDesignConstants.Role.OUTLINE,
	},
	UIDesignConstants.State.FOCUSED:{
		"FocusIndicatorColor":UIDesignConstants.Role.SECONDARY_COLOR,
		"FocusIndicatorThickness":UIDesignConstants.focus_indicator_thickness,
		"FocusIndicatorOffset":UIDesignConstants.focus_indicator_outer_offset,

		"LabelColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"StateLayerColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"StateLayerOpacity":UIDesignConstants.focus_state_layer_opacity,
		"IconColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"OutlineColor":UIDesignConstants.Role.PRIMARY_COLOR,
	},
	UIDesignConstants.State.ACTIVATED:{},
	UIDesignConstants.State.PRESSED:{
		"LabelColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"StateLayerColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"StateLayerOpacity":UIDesignConstants.pressed_state_layer_opacity,
		"IconColor":UIDesignConstants.Role.PRIMARY_COLOR,
		"OutlineColor":UIDesignConstants.Role.OUTLINE,
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


func init_state():
	var target_icon_size_state_data = get_state_data("IconSize")
	if target_icon_size_state_data:
		%Icon.icon_size = target_icon_size_state_data
	
	icon_name = icon_name
	
	var target_label_token_state_data = get_state_data("LabelStyle")
	label_token = target_label_token_state_data
	var token = UIDesignConstants.label_token_map[label_token]
	if token:
		%Label.set("theme_override_fonts/font",token)
	else:
		%Label.set("theme_override_fonts/font",custom_font)
		
	%Label.set("theme_override_font_sizes/font_size",font_size)
	
	%Label.set("theme_override_constants/line_spacing",font_height-font_size)
	
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


var icon_color:UIDesignConstants.Role:
	get:
		return icon_color
	set(val):
		icon_color = val
		update_color_flag = true

var label_color:UIDesignConstants.Role:
	get:
		return label_color
	set(val):
		label_color = val
		update_color_flag = true


var outline_color:UIDesignConstants.Role:
	get:
		return outline_color
	set(val):
		outline_color = val
		update_color_flag = true

func update_state():
	if update_state_flag == false:
		return 
	var target_icon_color_state_data = get_state_data("IconColor")
	
	if target_icon_color_state_data:
		icon_color = target_icon_color_state_data

	var target_label_color_state_data = get_state_data("LabelColor")
	
	if target_label_color_state_data:
		label_color = target_label_color_state_data

	var target_label_opacity_state_data = get_state_data("LabelOpacity")
	if target_label_opacity_state_data!=null:
		%Label.modulate.a = target_label_opacity_state_data
	else:
		%Label.modulate.a = 1

	var target_icon_opacity_state_data = get_state_data("IconOpacity")
	if target_icon_opacity_state_data!=null:
		%Icon.modulate.a = target_icon_opacity_state_data
	else:
		%Icon.modulate.a = 1

	super.update_state()
	
	var target_outline_opacity_state_data = get_state_data("OutlineOpacity")
	if target_outline_opacity_state_data!=null:
		%Container.modulate.a = target_outline_opacity_state_data
	else:
		%Container.modulate.a = 1

	var target_outline_color_state_data = get_state_data("OutlineColor")
	outline_color = target_outline_color_state_data


func update_color():
	if update_color_flag == false:
		return 
	
	var cur_color = get_role_color(icon_color)
	%Icon.set("theme_override_colors/font_color",cur_color)

	var cur_label_color = get_role_color(label_color)
	%Label.set("theme_override_colors/font_color",cur_label_color)

	var cur_outline_color = get_role_color(outline_color)
	var state_layer_style = %Container.get("theme_override_styles/panel")
	state_layer_style.border_color = cur_outline_color

	super.update_color()


@export var font_size: int:
	set(val):
		font_size = val
	get:
		return font_size

@export var font_weight: int:
	set(val):
		font_weight = val
		## TODO:
	get:
		return font_weight


@export var font_weight_prominent: int:
	set(val):
		font_weight_prominent = val
		## TODO:
	get:
		return font_weight_prominent

@export var font_height: int:
	set(val):
		font_height = val
		## TODO:
	get:
		return font_height

@export var font_tracking: float:
	set(val):
		font_tracking = val
		## TODO:
	get:
		return font_tracking


@export var label_token: UIDesignConstants.LabelToken:
	set(val):
		label_token = val
		var token = UIDesignConstants.label_token_map[label_token]
		if token:
			font_size = token.font_size
			font_weight = token.font_weight
			font_weight_prominent = token.font_weight_prominent
			font_height = token.font_height
			font_tracking = token.font_tracking
	get:
		return label_token
		
@export var custom_font: Font

var update_label_text_flag = true
@export var label_text: String:
	set(val):
		label_text = val
		update_label_text_flag=true
	get:
		return label_text

func _ready():
	super._ready()

func _process(delta):
	super._process(delta)
	update_label_text()

func update_label_text():
	if update_label_text_flag==false:
		return 
	%Label.text = label_text
