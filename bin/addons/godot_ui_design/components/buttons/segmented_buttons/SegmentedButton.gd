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
		"ContainerOpacity":0,
		
		"OutlineWidth":1,
		"OutlineColor":UIDesignConstants.Role.OUTLINE,
		"OutlineOpacity":1.0,
		
		"LabelStyle":UIDesignConstants.LabelToken.LABEL_LARGE,
		
		"UnselectedLabelColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedLabelColor":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
		
		"IconSize":18,
		"UnselectedIconColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedIconColor":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
	},
	UIDesignConstants.State.DISABLED:{
		"OutlineColor":UIDesignConstants.Role.ON_SURFACE,
		"OutlineOpacity":0.12,

		"UnselectedLabelColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedLabelColor":UIDesignConstants.Role.ON_SURFACE,
		"LabelOpacity":0.38,

		"UnselectedIconColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedIconColor":UIDesignConstants.Role.ON_SURFACE,
		"IconOpacity":0.38,
	},
	UIDesignConstants.State.HOVER:{

		"UnselectedLabelColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedLabelColor":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
		
		"StateLayerOpacity":UIDesignConstants.hover_state_layer_opacity,
		
		"UnselectedStateLayerColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedStateLayerColor":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
		
		"UnselectedIconColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedIconColor":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
	},
	UIDesignConstants.State.FOCUSED:{
		"FocusIndicatorColor":UIDesignConstants.Role.SECONDARY_COLOR,
		"FocusIndicatorThickness":UIDesignConstants.focus_indicator_thickness,
		"FocusIndicatorOffset":UIDesignConstants.focus_indicator_outer_offset,
		
		"UnselectedLabelColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedLabelColor":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
		
		"StateLayerOpacity":UIDesignConstants.focus_state_layer_opacity,
		
		"UnselectedStateLayerColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedStateLayerColor":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
		
		"UnselectedIconColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedIconColor":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
	},
	UIDesignConstants.State.ACTIVATED:{},
	UIDesignConstants.State.PRESSED:{
		"UnselectedLabelColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedLabelColor":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
		
		"StateLayerOpacity":UIDesignConstants.pressed_state_layer_opacity,
		
		"UnselectedStateLayerColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedStateLayerColor":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
		
		"UnselectedIconColor":UIDesignConstants.Role.ON_SURFACE,
		"SelectedIconColor":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
	},
	UIDesignConstants.State.DRAGGED:{
	},
}

var outline_color:UIDesignConstants.Role:
	get:
		return outline_color
	set(val):
		outline_color = val
		update_color_flag = true

@onready var outlined_button_list = [%SegmentedBlockButton1,%SegmentedBlockButton2,%SegmentedBlockButton3,%SegmentedBlockButton4,%SegmentedBlockButton5]


func init_state():
	
	super.init_state()
	var target_container_height_state_data = get_state_data("ContainerHeight")
	var target_outline_width_state_data = get_state_data("OutlineWidth")
	var target_outline_color_state_data = get_state_data("OutlineColor")
	var target_label_style_state_data = get_state_data("LabelStyle")
	var target_icon_size_state_data = get_state_data("IconSize")
	var target_height = target_container_height_state_data + density*4
	size.y = target_height
	custom_minimum_size.y = target_height
	
	var max_list = max(len(text_list),len(icon_list))
	while len(text_list)< max_list:
		text_list.append("")

	while len(icon_list)< max_list:
		icon_list.append("")
	
	if max_list==2:
		outlined_button_list[0].visible = true
		
		outlined_button_list[1].visible = false
		outlined_button_list[2].visible = false
		outlined_button_list[3].visible = false
		outlined_button_list[4].visible = true
		
		outlined_button_list[0].icon_name = icon_list[0]
		outlined_button_list[0].label_text = text_list[0]
		
		outlined_button_list[4].icon_name = icon_list[1]
		outlined_button_list[4].label_text = text_list[1]
		
	elif max_list==3:
		outlined_button_list[0].visible = true
		outlined_button_list[1].visible = false
		outlined_button_list[2].visible = true
		outlined_button_list[3].visible = false
		outlined_button_list[4].visible = true
		
		outlined_button_list[0].icon_name = icon_list[0]
		outlined_button_list[0].label_text = text_list[0]
		
		outlined_button_list[2].icon_name = icon_list[1]
		outlined_button_list[2].label_text = text_list[1]
		
		outlined_button_list[4].icon_name = icon_list[2]
		outlined_button_list[4].label_text = text_list[2]
		
	elif max_list==4:
		outlined_button_list[0].visible = true
		outlined_button_list[1].visible = true
		outlined_button_list[2].visible = true
		outlined_button_list[3].visible = false
		outlined_button_list[4].visible = true
		
		outlined_button_list[0].icon_name = icon_list[0]
		outlined_button_list[0].label_text = text_list[0]
		
		outlined_button_list[1].icon_name = icon_list[1]
		outlined_button_list[1].label_text = text_list[1]
		
		outlined_button_list[2].icon_name = icon_list[2]
		outlined_button_list[2].label_text = text_list[2]
		
		outlined_button_list[4].icon_name = icon_list[3]
		outlined_button_list[4].label_text = text_list[3]
		
	elif max_list==5:
		outlined_button_list[0].visible = true
		outlined_button_list[1].visible = true
		outlined_button_list[2].visible = true
		outlined_button_list[3].visible = true
		outlined_button_list[4].visible = true
		
		outlined_button_list[0].icon_name = icon_list[0]
		outlined_button_list[0].label_text = text_list[0]
		
		outlined_button_list[1].icon_name = icon_list[1]
		outlined_button_list[1].label_text = text_list[1]
		
		outlined_button_list[2].icon_name = icon_list[2]
		outlined_button_list[2].label_text = text_list[2]
		
		outlined_button_list[3].icon_name = icon_list[3]
		outlined_button_list[3].label_text = text_list[3]
		
		outlined_button_list[4].icon_name = icon_list[4]
		outlined_button_list[4].label_text = text_list[4]
		

	for node in outlined_button_list:
		for state_key in child_state_map_data:
			for state_data_key in child_state_map_data[state_key].keys():
				node.child_state_map_data[state_key][state_data_key] = child_state_map_data[state_key][state_data_key]
	
		node.child_state_map_data[UIDesignConstants.State.ENABLED]["ContainerHeight"] = target_height
		node.child_state_map_data[UIDesignConstants.State.ENABLED]["ContainerShape"] = UIDesignConstants.ShapeToken.CUSTOM
		
		node.multiple_selected = multiple_selected
		node._ready()
	
	outlined_button_list[0].selected = true
	
	var container_layer_style = %Container.get("theme_override_styles/panel")
	container_layer_style.draw_center = false
	container_layer_style.border_width_left = target_outline_width_state_data
	container_layer_style.border_width_top = target_outline_width_state_data
	container_layer_style.border_width_right = target_outline_width_state_data
	container_layer_style.border_width_bottom = target_outline_width_state_data


func update_state():
	if update_state_flag == false:
		return 

	super.update_state()

	var target_outline_opacity_state_data = get_state_data("OutlineOpacity")
	if target_outline_opacity_state_data!=null:
		%Container.modulate.a = target_outline_opacity_state_data
	else:
		%Container.modulate.a = 1
		

func update_color():
	if update_color_flag == false:
		return 
	
	var cur_outline_color = get_role_color(outline_color)
	var state_layer_style = %Container.get("theme_override_styles/panel")
	state_layer_style.border_color = cur_outline_color

	super.update_color()

func _ready():
	super._ready()

func _process(delta):
	super._process(delta)

@export var density:int=0

@export var text_list:PackedStringArray = ["hello","hi"]:
	set(val):
		text_list = val
		update_state_flag = true
	get:
		return text_list
	
@export var icon_list:PackedStringArray = ["alert","alert"]:
	set(val):
		icon_list = val
		update_state_flag = true
	get:
		return icon_list

@export var multiple_selected=false 

func _on_segmented_block_button_selected_sig(node):
	if multiple_selected == false:
		for cur_node in outlined_button_list:
			if cur_node!=node:
				cur_node.selected = false

func _on_segmented_block_button_resized():
	var max_size_x = 0
	for node in outlined_button_list:
		max_size_x = max(node.size.x,max_size_x)
	var target_size_x = 0
	for node in outlined_button_list:
		node.size.x = max_size_x
		node.custom_minimum_size.x = max_size_x
		if node.visible:
			target_size_x += max_size_x
	size.x = target_size_x
	custom_minimum_size.x = target_size_x
