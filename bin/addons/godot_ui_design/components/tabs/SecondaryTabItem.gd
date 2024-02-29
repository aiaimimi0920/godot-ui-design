extends BaseComponent2
	
@export var item_text: String:
	set(val):
		item_text = val
		set_dynamic_data("item_text", item_text)
	get:
		return item_text

@export var icon_name = "":
	set(val):
		icon_name = val
		set_dynamic_data("icon_name", icon_name)
	get:
		return icon_name

@export var badge_num = "":
	set(val):
		if not is_inside_tree():
			await ready
		%Badge.label_text = val
	get:
		if not is_inside_tree():
			await ready
		return %Badge.label_text

func trigger_init_label():
	_trigger_init_label(%TextLabel, {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.Attr.LABEL_TOKEN,
	})

func trigger_update_label():
	_trigger_update_label(%TextLabel, {
		UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Attr.LABEL_COLOR,
		UIDesignConstants.Attr.LABEL_OPACITY:UIDesignConstants.Attr.LABEL_OPACITY,
	})

func trigger_dynamic_label():
	_trigger_dynamic_label(%TextLabel, {
		"text":"item_text",
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

@export var child_init_attr_data = {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.NO_ROUNDING,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
		UIDesignConstants.Attr.SHAPE_HEIGHT:48,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
		
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.LabelToken.TITLE_SMALL,
		
		UIDesignConstants.Attr.ICON_SIZE:24,
	}
	
func get_init_attr_data():
	return child_init_attr_data

@export var child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE,
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
				UIDesignConstants.Attr.SHAPE_OPACITY:1,
				
				UIDesignConstants.Attr.LABEL_COLOR:{
					"selected":UIDesignConstants.Role.ON_SURFACE,
					"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
				},
				UIDesignConstants.Attr.LABEL_OPACITY:1,
				
				UIDesignConstants.Attr.ICON_COLOR:{
					"selected":UIDesignConstants.Role.ON_SURFACE,
					"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
				},
				UIDesignConstants.Attr.ICON_OPACITY:1,

				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.SURFACE_CONTAINER,
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
				
				UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,

			},
		UIDesignConstants.State.DISABLED:{
			},
		UIDesignConstants.State.HOVERED:{
				
				UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.LABEL_OPACITY:1,
				
				UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.ICON_OPACITY:1,
			
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
			},
		UIDesignConstants.State.FOCUSED:{
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				
				UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.LABEL_OPACITY:1,
				
				UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.ICON_OPACITY:1,
			
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
			},
		UIDesignConstants.State.ACTIVATED:{
			},
		UIDesignConstants.State.PRESSED:{
			
				UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.LABEL_OPACITY:1,
				
				UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.ICON_OPACITY:1,
			
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
			
			},
		UIDesignConstants.State.DRAGGED:{
			},
	}

func get_update_attr_data():
	return child_update_attr_data


func _on_resized():
	%BaseComponent.custom_minimum_size = size


signal show_tab
func start_activate():
	super.start_activate()
	%HSeparatorControl.visible = true
	emit_signal("show_tab")

func finish_activate():
	super.finish_activate()
	%HSeparatorControl.visible = false

