extends "res://addons/godot_ui_design/components/buttons/BaseButtonComponent.gd"

@export var fab_token:UIDesignConstants.FABToken

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
	UIDesignConstants.FABToken.CUSTOM:{
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.LARGE_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:56,
		UIDesignConstants.Attr.SHAPE_WIDTH:56,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,

		UIDesignConstants.Attr.ICON_SIZE:24,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	},
	UIDesignConstants.FABToken.PRIMARY_SMALL:{
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.MEDIUM_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:40,
		UIDesignConstants.Attr.SHAPE_WIDTH:40,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,

		UIDesignConstants.Attr.ICON_SIZE:24,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	},
	UIDesignConstants.FABToken.PRIMARY:{
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.LARGE_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:56,
		UIDesignConstants.Attr.SHAPE_WIDTH:56,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,

		UIDesignConstants.Attr.ICON_SIZE:24,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	},
	UIDesignConstants.FABToken.PRIMARY_LARGE:{
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.EXTRA_LARGE_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:96,
		UIDesignConstants.Attr.SHAPE_WIDTH:96,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,

		UIDesignConstants.Attr.ICON_SIZE:36,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	},
	UIDesignConstants.FABToken.BRANDED:{
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.LARGE_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:56,
		UIDesignConstants.Attr.SHAPE_WIDTH:56,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,

		UIDesignConstants.Attr.ICON_SIZE:36,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	},
	UIDesignConstants.FABToken.BRANDED_LARGE:{		
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.EXTRA_LARGE_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:96,
		UIDesignConstants.Attr.SHAPE_WIDTH:96,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,

		UIDesignConstants.Attr.ICON_SIZE:48,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	},
	UIDesignConstants.FABToken.SECONDARY_SMALL:{		
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.MEDIUM_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:40,
		UIDesignConstants.Attr.SHAPE_WIDTH:40,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,

		UIDesignConstants.Attr.ICON_SIZE:24,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	},
	UIDesignConstants.FABToken.SECONDARY:{		
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.LARGE_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:56,
		UIDesignConstants.Attr.SHAPE_WIDTH:56,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,

		UIDesignConstants.Attr.ICON_SIZE:24,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	},
	UIDesignConstants.FABToken.SECONDARY_LARGE:{		
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.EXTRA_LARGE_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:96,
		UIDesignConstants.Attr.SHAPE_WIDTH:96,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,

		UIDesignConstants.Attr.ICON_SIZE:36,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	},
	UIDesignConstants.FABToken.SURFACE_SMALL:{		
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.MEDIUM_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:40,
		UIDesignConstants.Attr.SHAPE_WIDTH:40,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,

		UIDesignConstants.Attr.ICON_SIZE:24,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	},
	UIDesignConstants.FABToken.SURFACE:{		
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.LARGE_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:56,
		UIDesignConstants.Attr.SHAPE_WIDTH:56,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,

		UIDesignConstants.Attr.ICON_SIZE:24,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	},
	UIDesignConstants.FABToken.SURFACE_LARGE:{		
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.EXTRA_LARGE_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:96,
		UIDesignConstants.Attr.SHAPE_WIDTH:96,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,

		UIDesignConstants.Attr.ICON_SIZE:36,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	},
	UIDesignConstants.FABToken.TERTIARY_SMALL:{		
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.MEDIUM_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:40,
		UIDesignConstants.Attr.SHAPE_WIDTH:40,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,

		UIDesignConstants.Attr.ICON_SIZE:24,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	},
	UIDesignConstants.FABToken.TERTIARY:{		
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.LARGE_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:56,
		UIDesignConstants.Attr.SHAPE_WIDTH:56,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,

		UIDesignConstants.Attr.ICON_SIZE:24,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	},
	UIDesignConstants.FABToken.TERTIARY_LARGE:{		
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.EXTRA_LARGE_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:96,
		UIDesignConstants.Attr.SHAPE_WIDTH:96,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,

		UIDesignConstants.Attr.ICON_SIZE:36,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	},
}

func get_init_attr_data():
	return new_child_init_attr_data[fab_token]
	

@export var new_child_update_attr_data = {
	UIDesignConstants.FABToken.CUSTOM:{
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.PRIMARY_CONTAINER,
				UIDesignConstants.Attr.SHAPE_OPACITY:1,
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
				
				UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_PRIMARY_CONTAINER,
				UIDesignConstants.Attr.ICON_OPACITY:1,
				
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
				
				UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
			
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_PRIMARY_CONTAINER,
			},
		UIDesignConstants.State.DISABLED:{
			},
		UIDesignConstants.State.HOVERED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
			},
		UIDesignConstants.State.FOCUSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
			},
		UIDesignConstants.State.ACTIVATED:{
			},
		UIDesignConstants.State.PRESSED:{
			UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

			UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
			},
		UIDesignConstants.State.DRAGGED:{
			},
	},
	UIDesignConstants.FABToken.PRIMARY_SMALL:{
			UIDesignConstants.State.ENABLED:{
					UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.PRIMARY_CONTAINER,
					UIDesignConstants.Attr.SHAPE_OPACITY:1,
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
					
					UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_PRIMARY_CONTAINER,
					UIDesignConstants.Attr.ICON_OPACITY:1,
					
					UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
					
					UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
				
					UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_PRIMARY_CONTAINER,
				},
			UIDesignConstants.State.DISABLED:{
				},
			UIDesignConstants.State.HOVERED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				},
			UIDesignConstants.State.FOCUSED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				},
			UIDesignConstants.State.ACTIVATED:{
				},
			UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
				},
			UIDesignConstants.State.DRAGGED:{
				},
		},

		UIDesignConstants.FABToken.PRIMARY:{
			UIDesignConstants.State.ENABLED:{
					UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.PRIMARY_CONTAINER,
					UIDesignConstants.Attr.SHAPE_OPACITY:1,
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
					
					UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_PRIMARY_CONTAINER,
					UIDesignConstants.Attr.ICON_OPACITY:1,
					
					UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
					
					UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
				
					UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_PRIMARY_CONTAINER,
				},
			UIDesignConstants.State.DISABLED:{
				},
			UIDesignConstants.State.HOVERED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				},
			UIDesignConstants.State.FOCUSED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				},
			UIDesignConstants.State.ACTIVATED:{
				},
			UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
				},
			UIDesignConstants.State.DRAGGED:{
				},
		},

		UIDesignConstants.FABToken.PRIMARY_LARGE:{
			UIDesignConstants.State.ENABLED:{
					UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.PRIMARY_CONTAINER,
					UIDesignConstants.Attr.SHAPE_OPACITY:1,
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
					
					UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_PRIMARY_CONTAINER,
					UIDesignConstants.Attr.ICON_OPACITY:1,
					
					UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
					
					UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
				
					UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_PRIMARY_CONTAINER,
				},
			UIDesignConstants.State.DISABLED:{
				},
			UIDesignConstants.State.HOVERED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				},
			UIDesignConstants.State.FOCUSED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				},
			UIDesignConstants.State.ACTIVATED:{
				},
			UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
				},
			UIDesignConstants.State.DRAGGED:{
				},
		},
		UIDesignConstants.FABToken.BRANDED:{
			UIDesignConstants.State.ENABLED:{
					UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE_CONTAINER_LOW,
					UIDesignConstants.Attr.SHAPE_OPACITY:1,
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
					
					UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
					UIDesignConstants.Attr.ICON_OPACITY:1,
					
					UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
					
					UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
				
					UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
				},
			UIDesignConstants.State.DISABLED:{
				},
			UIDesignConstants.State.HOVERED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				},
			UIDesignConstants.State.FOCUSED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				},
			UIDesignConstants.State.ACTIVATED:{
				},
			UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
				},
			UIDesignConstants.State.DRAGGED:{
				},
		},
		UIDesignConstants.FABToken.BRANDED_LARGE:{
			UIDesignConstants.State.ENABLED:{
					UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE_CONTAINER_LOW,
					UIDesignConstants.Attr.SHAPE_OPACITY:1,
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
					
					UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
					UIDesignConstants.Attr.ICON_OPACITY:1,
					
					UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
					
					UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
				
					UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
				},
			UIDesignConstants.State.DISABLED:{
				},
			UIDesignConstants.State.HOVERED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				},
			UIDesignConstants.State.FOCUSED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				},
			UIDesignConstants.State.ACTIVATED:{
				},
			UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
				},
			UIDesignConstants.State.DRAGGED:{
				},
		},

		UIDesignConstants.FABToken.SECONDARY_SMALL:{
			UIDesignConstants.State.ENABLED:{
					UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SECONDARY_CONTAINER,
					UIDesignConstants.Attr.SHAPE_OPACITY:1,
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
					
					UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					UIDesignConstants.Attr.ICON_OPACITY:1,
					
					UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
					
					UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
				
					UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
				},
			UIDesignConstants.State.DISABLED:{
				},
			UIDesignConstants.State.HOVERED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				},
			UIDesignConstants.State.FOCUSED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				},
			UIDesignConstants.State.ACTIVATED:{
				},
			UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
				},
			UIDesignConstants.State.DRAGGED:{
				},
		},
		UIDesignConstants.FABToken.SECONDARY:{
			UIDesignConstants.State.ENABLED:{
					UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SECONDARY_CONTAINER,
					UIDesignConstants.Attr.SHAPE_OPACITY:1,
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
					
					UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					UIDesignConstants.Attr.ICON_OPACITY:1,
					
					UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
					
					UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
				
					UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
				},
			UIDesignConstants.State.DISABLED:{
				},
			UIDesignConstants.State.HOVERED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				},
			UIDesignConstants.State.FOCUSED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				},
			UIDesignConstants.State.ACTIVATED:{
				},
			UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
				},
			UIDesignConstants.State.DRAGGED:{
				},
		},
		UIDesignConstants.FABToken.SECONDARY_LARGE:{
			UIDesignConstants.State.ENABLED:{
					UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SECONDARY_CONTAINER,
					UIDesignConstants.Attr.SHAPE_OPACITY:1,
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
					
					UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					UIDesignConstants.Attr.ICON_OPACITY:1,
					
					UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
					
					UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
				
					UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
				},
			UIDesignConstants.State.DISABLED:{
				},
			UIDesignConstants.State.HOVERED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				},
			UIDesignConstants.State.FOCUSED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				},
			UIDesignConstants.State.ACTIVATED:{
				},
			UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
				},
			UIDesignConstants.State.DRAGGED:{
				},
		},
		UIDesignConstants.FABToken.SURFACE_SMALL:{
			UIDesignConstants.State.ENABLED:{
					UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE_CONTAINER_LOW,
					UIDesignConstants.Attr.SHAPE_OPACITY:1,
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
					
					UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
					UIDesignConstants.Attr.ICON_OPACITY:1,
					
					UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
					
					UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
				
					UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
				},
			UIDesignConstants.State.DISABLED:{
				},
			UIDesignConstants.State.HOVERED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				},
			UIDesignConstants.State.FOCUSED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				},
			UIDesignConstants.State.ACTIVATED:{
				},
			UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
				},
			UIDesignConstants.State.DRAGGED:{
				},
		},
		UIDesignConstants.FABToken.SURFACE:{
			UIDesignConstants.State.ENABLED:{
					UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE_CONTAINER_LOW,
					UIDesignConstants.Attr.SHAPE_OPACITY:1,
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
					
					UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
					UIDesignConstants.Attr.ICON_OPACITY:1,
					
					UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
					
					UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
				
					UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
				},
			UIDesignConstants.State.DISABLED:{
				},
			UIDesignConstants.State.HOVERED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				},
			UIDesignConstants.State.FOCUSED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				},
			UIDesignConstants.State.ACTIVATED:{
				},
			UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
				},
			UIDesignConstants.State.DRAGGED:{
				},
		},
		UIDesignConstants.FABToken.SURFACE_LARGE:{
			UIDesignConstants.State.ENABLED:{
					UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE_CONTAINER_LOW,
					UIDesignConstants.Attr.SHAPE_OPACITY:1,
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
					
					UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
					UIDesignConstants.Attr.ICON_OPACITY:1,
					
					UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
					
					UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
				
					UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
				},
			UIDesignConstants.State.DISABLED:{
				},
			UIDesignConstants.State.HOVERED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				},
			UIDesignConstants.State.FOCUSED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				},
			UIDesignConstants.State.ACTIVATED:{
				},
			UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
				},
			UIDesignConstants.State.DRAGGED:{
				},
		},
		UIDesignConstants.FABToken.TERTIARY_SMALL:{
			UIDesignConstants.State.ENABLED:{
					UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.TERTIARY_CONTAINER,
					UIDesignConstants.Attr.SHAPE_OPACITY:1,
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
					
					UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_TERTIARY_CONTAINER,
					UIDesignConstants.Attr.ICON_OPACITY:1,
					
					UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
					
					UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
				
					UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_TERTIARY_CONTAINER,
				},
			UIDesignConstants.State.DISABLED:{
				},
			UIDesignConstants.State.HOVERED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				},
			UIDesignConstants.State.FOCUSED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				},
			UIDesignConstants.State.ACTIVATED:{
				},
			UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
				},
			UIDesignConstants.State.DRAGGED:{
				},
		},
		UIDesignConstants.FABToken.TERTIARY:{
			UIDesignConstants.State.ENABLED:{
					UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.TERTIARY_CONTAINER,
					UIDesignConstants.Attr.SHAPE_OPACITY:1,
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
					
					UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_TERTIARY_CONTAINER,
					UIDesignConstants.Attr.ICON_OPACITY:1,
					
					UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
					
					UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
				
					UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_TERTIARY_CONTAINER,
				},
			UIDesignConstants.State.DISABLED:{
				},
			UIDesignConstants.State.HOVERED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				},
			UIDesignConstants.State.FOCUSED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				},
			UIDesignConstants.State.ACTIVATED:{
				},
			UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
				},
			UIDesignConstants.State.DRAGGED:{
				},
		},
		UIDesignConstants.FABToken.TERTIARY_LARGE:{
			UIDesignConstants.State.ENABLED:{
					UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.TERTIARY_CONTAINER,
					UIDesignConstants.Attr.SHAPE_OPACITY:1,
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
					
					UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_TERTIARY_CONTAINER,
					UIDesignConstants.Attr.ICON_OPACITY:1,
					
					UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
					
					UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
				
					UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_TERTIARY_CONTAINER,
				},
			UIDesignConstants.State.DISABLED:{
				},
			UIDesignConstants.State.HOVERED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				},
			UIDesignConstants.State.FOCUSED:{
					UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

					UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
					UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				},
			UIDesignConstants.State.ACTIVATED:{
				},
			UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
				},
			UIDesignConstants.State.DRAGGED:{
				},
		},
}

func get_update_attr_data():
	return new_child_update_attr_data[fab_token]

