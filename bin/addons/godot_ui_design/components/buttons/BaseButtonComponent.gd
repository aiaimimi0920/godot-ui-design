extends BaseComponent2

@export var label_text: String:
	set(val):
		label_text = val
		set_dynamic_data("label_text", label_text)
	get:
		return label_text

@export var icon_name = "":
	set(val):
		icon_name = val
		set_dynamic_data("icon_name", icon_name)
	get:
		return icon_name

func trigger_init_label():
	_trigger_init_label(%Label, {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.Attr.LABEL_TOKEN,
	})
	pass

func trigger_update_label():
	_trigger_update_label(%Label, {
		UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Attr.LABEL_COLOR,
		UIDesignConstants.Attr.LABEL_OPACITY:UIDesignConstants.Attr.LABEL_OPACITY,
	})

func trigger_dynamic_label():
	_trigger_dynamic_label(%Label, {
		"text":"label_text",
	})


func trigger_init_shape():
	_trigger_init_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Attr.SHAPE_SHADOWCOLOR,
	})

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
	pass



func trigger_update_shape():
	_trigger_update_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Attr.SHAPE_COLOR,
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.SHAPE_OPACITY,
		UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.Attr.SHAPE_ELEVATION,
	})

	_trigger_update_shape(%StateLayer, {
		UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Attr.SHAPE_COLOR,
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.STATE_LAYER_OPACITY,
	})
	
	_trigger_update_shape(%FocusIndicator, {
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY,
		UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY,
	})


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

@export var child_init_attr_data = {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.LabelToken.LABEL_LARGE,
		
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.FULLY_ROUNDED,
		UIDesignConstants.Attr.SHAPE_HEIGHT:40,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
		
		UIDesignConstants.Attr.ICON_SIZE:18,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	}
	
func get_init_attr_data():
	return child_init_attr_data

@export var child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
				UIDesignConstants.Attr.LABEL_OPACITY:1,
				
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SECONDARY_CONTAINER,
				UIDesignConstants.Attr.SHAPE_OPACITY:0,
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
				
				UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
				UIDesignConstants.Attr.ICON_OPACITY:1,
				
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
				
				UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
			},
		UIDesignConstants.State.DISABLED:{
				UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.LABEL_OPACITY:0.38,
				
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
	return child_update_attr_data

