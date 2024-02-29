extends "res://addons/godot_ui_design/components/buttons/BaseButtonComponent.gd"

func trigger_init_shape():
	super.trigger_init_shape()
	_trigger_init_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Attr.SHAPE_SHADOWCOLOR,
	})

func trigger_update_shape():
	super.trigger_update_shape()
	_trigger_update_shape(%StateLayer, {
		UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Attr.STATE_LAYER_COLOR,
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.STATE_LAYER_OPACITY,
	})


@export var new_child_init_attr_data = {
	UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.FULLY_ROUNDED,
	UIDesignConstants.Attr.SHAPE_HEIGHT:40,
	UIDesignConstants.Attr.SHAPE_WIDTH:40,
	UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,

	UIDesignConstants.Attr.ICON_SIZE:24,
	
	UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
	UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
}

func get_init_attr_data():
	return new_child_init_attr_data
	

@export var new_child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{				
				UIDesignConstants.Attr.SHAPE_COLOR:{
						"selected":UIDesignConstants.Role.SECONDARY_CONTAINER,
						"unselected":UIDesignConstants.Role.SURFACE_CONTAINER_HIGHEST,
					},
				UIDesignConstants.Attr.SHAPE_OPACITY:1,
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
				
				UIDesignConstants.Attr.ICON_COLOR:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
				},

				UIDesignConstants.Attr.ICON_OPACITY:1,
				
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
				
				UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
			
				UIDesignConstants.Attr.STATE_LAYER_COLOR:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
				},
			},
		UIDesignConstants.State.DISABLED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.SHAPE_OPACITY:0.12,
				
				UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.ICON_OPACITY:0.38,
			},
		UIDesignConstants.State.HOVERED:{
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
			},
		UIDesignConstants.State.FOCUSED:{
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
			},
		UIDesignConstants.State.ACTIVATED:{
			},
		UIDesignConstants.State.PRESSED:{
			UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
			},
		UIDesignConstants.State.DRAGGED:{
			},
	}

func get_update_attr_data():
	return new_child_update_attr_data

