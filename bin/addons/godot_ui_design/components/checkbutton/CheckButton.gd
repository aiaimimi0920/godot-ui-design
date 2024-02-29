extends BaseComponent2

@export var icon_name = "":
	set(val):
		icon_name = val
		if %CheckBlockButton==null:
			await ready
		%CheckBlockButton.icon_name = icon_name
	get:
		return icon_name

func trigger_init_shape():
	_trigger_init_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Attr.SHAPE_SHADOWCOLOR,
	})

	_trigger_init_shape(%StateLayer, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.STATE_LAYER_TOKEN,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.STATE_LAYER_WIDTH,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.STATE_LAYER_HEIGHT,
	})
	
	_trigger_init_shape(%FocusIndicator, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH:UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OFFSET:UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET,
	})


func trigger_update_shape():
	_trigger_update_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Attr.SHAPE_COLOR,
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.SHAPE_OPACITY,
		UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.Attr.SHAPE_ELEVATION,
	})

	_trigger_update_shape(%StateLayer, {
		UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Attr.STATE_LAYER_COLOR,
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.STATE_LAYER_OPACITY,
	})
	
	_trigger_update_shape(%FocusIndicator, {
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY,
		UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY,
	})

enum ChildNode {WITHOUT_ICON,WITH_ICON}

@export var child_node_init_attr_data = {
	ChildNode.WITHOUT_ICON:{
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.FULLY_ROUNDED,
		UIDesignConstants.Attr.SHAPE_WIDTH:{
				"selected":20,
				"unselected":16,
			},
		UIDesignConstants.Attr.SHAPE_HEIGHT:{
				"selected":20,
				"unselected":16,
			},
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
		
		UIDesignConstants.Attr.ICON_SIZE:16,
	},
	ChildNode.WITH_ICON:{
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.FULLY_ROUNDED,
		UIDesignConstants.Attr.SHAPE_WIDTH:{
				"selected":24,
				"unselected":24,
			},
		UIDesignConstants.Attr.SHAPE_HEIGHT:{
				"selected":24,
				"unselected":24,
			},
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
		
		UIDesignConstants.Attr.ICON_SIZE:16,
	},
}

@export var child_node_update_attr_data = {
	UIDesignConstants.State.ENABLED:{
			UIDesignConstants.Attr.SHAPE_COLOR:{
					"selected":UIDesignConstants.Role.ON_PRIMARY,
					"unselected":UIDesignConstants.Role.OUTLINE,
				},
			UIDesignConstants.Attr.SHAPE_OPACITY:1,
			UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
			
			UIDesignConstants.Attr.ICON_COLOR:{
				"selected":UIDesignConstants.Role.ON_PRIMARY_CONTAINER,
				"unselected":UIDesignConstants.Role.SURFACE_CONTAINER_HIGHEST,
			},

			UIDesignConstants.Attr.ICON_OPACITY:1,
			
			UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
			
			UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
			UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
			UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
		},
	UIDesignConstants.State.DISABLED:{
			UIDesignConstants.Attr.SHAPE_COLOR:{
				"selected":UIDesignConstants.Role.SURFACE,
				"unselected":UIDesignConstants.Role.ON_SURFACE,
			},
			UIDesignConstants.Attr.SHAPE_OPACITY:{
				"selected":1,
				"unselected":0.38,
			},
			
			UIDesignConstants.Attr.ICON_COLOR:{
				"selected":UIDesignConstants.Role.ON_SURFACE,
				"unselected":UIDesignConstants.Role.SURFACE_CONTAINER_HIGHEST,
			},
			UIDesignConstants.Attr.ICON_OPACITY:0.38,
			UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
		},
	UIDesignConstants.State.HOVERED:{
			UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
			
			UIDesignConstants.Attr.ICON_COLOR:{
				"selected":UIDesignConstants.Role.ON_PRIMARY_CONTAINER,
				"unselected":UIDesignConstants.Role.SURFACE_CONTAINER_HIGHEST,
			},
			
			UIDesignConstants.Attr.SHAPE_COLOR:{
				"selected":UIDesignConstants.Role.PRIMARY_CONTAINER,
				"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
			},
		},
	UIDesignConstants.State.FOCUSED:{
			UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
			UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
			
			UIDesignConstants.Attr.ICON_COLOR:{
				"selected":UIDesignConstants.Role.ON_PRIMARY_CONTAINER,
				"unselected":UIDesignConstants.Role.SURFACE_CONTAINER_HIGHEST,
			},
			
			UIDesignConstants.Attr.SHAPE_COLOR:{
				"selected":UIDesignConstants.Role.PRIMARY_CONTAINER,
				"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
			},
			
		},
	UIDesignConstants.State.ACTIVATED:{
		},
	UIDesignConstants.State.PRESSED:{
			UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
		
			UIDesignConstants.Attr.ICON_COLOR:{
				"selected":UIDesignConstants.Role.ON_PRIMARY_CONTAINER,
				"unselected":UIDesignConstants.Role.SURFACE_CONTAINER_HIGHEST,
			},
			
			UIDesignConstants.Attr.SHAPE_COLOR:{
				"selected":UIDesignConstants.Role.PRIMARY_CONTAINER,
				"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
			},
		
		},
	UIDesignConstants.State.DRAGGED:{
		},
}

enum ChildNodeMode {WITHOUT_ICONS,ICON_ON_SELECTED,ICON_ON_ALL}

@export var child_node_mode:ChildNodeMode:
	set(val):
		child_node_mode = val
		_init_flag = true

func _init_all():
	if _init_flag == false:
		return 
	if child_node_mode == ChildNodeMode.WITHOUT_ICONS:
		%CheckBlockButton.new_child_init_attr_data = child_node_init_attr_data[ChildNode.WITHOUT_ICON]
		pass
	elif child_node_mode == ChildNodeMode.ICON_ON_SELECTED:
		if button_pressed:
			%CheckBlockButton.new_child_init_attr_data = child_node_init_attr_data[ChildNode.WITH_ICON]
		else:
			%CheckBlockButton.new_child_init_attr_data = child_node_init_attr_data[ChildNode.WITHOUT_ICON]
		pass
	elif child_node_mode == ChildNodeMode.ICON_ON_ALL:
		%CheckBlockButton.new_child_init_attr_data = child_node_init_attr_data[ChildNode.WITH_ICON]

	%CheckBlockButton._init_flag = true
	
	if button_pressed:
		if child_node_mode == ChildNodeMode.WITHOUT_ICONS:
			icon_name = ""
		else:
			icon_name = "check"
	else:
		if child_node_mode == ChildNodeMode.ICON_ON_ALL:
			icon_name = "close"
		else:
			icon_name = ""
	
	super._init_all()

func _ready():
	super._ready()
	%CheckBlockButton.new_child_update_attr_data = child_node_update_attr_data
	%CheckBlockButton.update_cur_state_data_flag = true
	_on_toggled(null)


func _on_toggled(toggled_on):
	%CheckBlockButton.button_pressed = button_pressed
	%CheckBlockButton._init_flag = true
	%CheckBlockButton._update_flag = true
	_init_flag = true
	_update_flag = true
	if button_pressed:
		%CheckBlockContainer.alignment = %CheckBlockContainer.ALIGNMENT_END
	else:
		%CheckBlockContainer.alignment = %CheckBlockContainer.ALIGNMENT_BEGIN

@export var child_init_attr_data = {
	UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.FULLY_ROUNDED,
	UIDesignConstants.Attr.SHAPE_WIDTH:52,
	UIDesignConstants.Attr.SHAPE_HEIGHT:32,
	UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
	UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH:2,

	
	UIDesignConstants.Attr.STATE_LAYER_TOKEN:UIDesignConstants.ShapeToken.FULLY_ROUNDED,
	UIDesignConstants.Attr.STATE_LAYER_WIDTH:52,
	UIDesignConstants.Attr.STATE_LAYER_HEIGHT:32,
	
	UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
	UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
}
	
func get_init_attr_data():
	return child_init_attr_data


@export var child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.SHAPE_OPACITY:1,
				UIDesignConstants.Attr.SHAPE_COLOR:{
					"selected":UIDesignConstants.Role.PRIMARY_COLOR,
					"unselected":UIDesignConstants.Role.SURFACE_CONTAINER_HIGHEST,
				},
				
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
				UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Role.OUTLINE,

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
				
				UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
			
				UIDesignConstants.Attr.STATE_LAYER_COLOR:{
					"selected":UIDesignConstants.Role.PRIMARY_COLOR,
					"unselected":UIDesignConstants.Role.ON_SURFACE,
				},
			},
		UIDesignConstants.State.DISABLED:{
				UIDesignConstants.Attr.SHAPE_OPACITY:0.12,
			
				UIDesignConstants.Attr.SHAPE_COLOR:{
					"selected":UIDesignConstants.Role.ON_SURFACE,
					"unselected":UIDesignConstants.Role.SURFACE_CONTAINER_HIGHEST,
				},
				UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:{
					"selected":0,
					"unselected":1,
				},
				
			},
		UIDesignConstants.State.HOVERED:{
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				UIDesignConstants.Attr.SHAPE_COLOR:{
					"selected":UIDesignConstants.Role.PRIMARY_COLOR,
					"unselected":UIDesignConstants.Role.SURFACE_CONTAINER_HIGHEST,
				},
				UIDesignConstants.Attr.STATE_LAYER_COLOR:{
					"selected":UIDesignConstants.Role.PRIMARY_COLOR,
					"unselected":UIDesignConstants.Role.ON_SURFACE,
				},
				UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Role.OUTLINE,
				UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:{
					"selected":0,
					"unselected":1,
				},
			},
		UIDesignConstants.State.FOCUSED:{
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				UIDesignConstants.Attr.SHAPE_COLOR:{
					"selected":UIDesignConstants.Role.PRIMARY_COLOR,
					"unselected":UIDesignConstants.Role.SURFACE_CONTAINER_HIGHEST,
				},
				UIDesignConstants.Attr.STATE_LAYER_COLOR:{
					"selected":UIDesignConstants.Role.PRIMARY_COLOR,
					"unselected":UIDesignConstants.Role.ON_SURFACE,
				},
				UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Role.OUTLINE,
				UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:{
					"selected":0,
					"unselected":1,
				},
			},
		UIDesignConstants.State.ACTIVATED:{
			},
		UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
				UIDesignConstants.Attr.SHAPE_COLOR:{
					"selected":UIDesignConstants.Role.PRIMARY_COLOR,
					"unselected":UIDesignConstants.Role.SURFACE_CONTAINER_HIGHEST,
				},
				UIDesignConstants.Attr.STATE_LAYER_COLOR:{
					"selected":UIDesignConstants.Role.PRIMARY_COLOR,
					"unselected":UIDesignConstants.Role.ON_SURFACE,
				},
				UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Role.OUTLINE,
				UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:{
					"selected":0,
					"unselected":1,
				},
			},
		UIDesignConstants.State.DRAGGED:{
			},
	}

func get_update_attr_data():
	return child_update_attr_data

