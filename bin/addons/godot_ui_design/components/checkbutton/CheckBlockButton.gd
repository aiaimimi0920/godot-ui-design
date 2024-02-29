extends BaseComponent2

@export var icon_name = "":
	set(val):
		icon_name = val
		set_dynamic_data("icon_name", icon_name)
	get:
		return icon_name

func trigger_init_icon():
	_trigger_init_icon(%Icon, {
		UIDesignConstants.Attr.ICON_SIZE:UIDesignConstants.Attr.ICON_SIZE,
	})
	pass

func trigger_update_icon():
	_trigger_update_icon(%Icon, {
		UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Attr.ICON_COLOR,
		UIDesignConstants.Attr.ICON_OPACITY:UIDesignConstants.Attr.ICON_OPACITY,
	})

func trigger_dynamic_icon():
	_trigger_dynamic_icon(%Icon, {
		"icon_name":"icon_name",
	})


func trigger_init_shape():
	_trigger_init_shape(%StateLayer, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
	})
	
	_trigger_init_shape(%FocusIndicator, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,

		UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH:UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OFFSET:UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET,
	})
	_trigger_init_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Attr.SHAPE_SHADOWCOLOR,
	})

func trigger_update_shape():
	_trigger_update_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Attr.SHAPE_COLOR,
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.SHAPE_OPACITY,
		UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.Attr.SHAPE_ELEVATION,
	})
	
	_trigger_update_shape(%FocusIndicator, {
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY,
		UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY,
	})
	_trigger_update_shape(%StateLayer, {
		UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Attr.STATE_LAYER_COLOR,
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.STATE_LAYER_OPACITY,
	})


@export var new_child_init_attr_data = {
	UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.FULLY_ROUNDED,
	UIDesignConstants.Attr.SHAPE_HEIGHT:16,
	UIDesignConstants.Attr.SHAPE_WIDTH:16,
	UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,

	UIDesignConstants.Attr.ICON_SIZE:16,
	
	UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
	UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
}

func get_init_attr_data():
	return new_child_init_attr_data
	

@export var new_child_update_attr_data = {
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

func get_update_attr_data():
	return new_child_update_attr_data

