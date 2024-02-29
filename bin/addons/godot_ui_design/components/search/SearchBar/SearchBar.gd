extends BaseComponent2
	
func _init_label():
	super._init_label()
	%LineEdit.set("theme_override_colors/caret_color",get_role_color(UIDesignConstants.Role.PRIMARY_COLOR))
	%LineEdit.set("theme_override_colors/font_placeholder_color",get_role_color(UIDesignConstants.Role.ON_SURFACE_VARIANT))
	
@export var input_text="":
	set(val):
		if not is_inside_tree():
			await ready
			
		%LineEdit.text = val
	get:
		return %LineEdit.text

@export var support_text = "":
	set(val):
		if not is_inside_tree():
			await ready
		%LineEdit.placeholder_text = val
	get:
		return %LineEdit.placeholder_text

@export var leading_icon_name = "":
	set(val):
		leading_icon_name = val
		set_dynamic_data("leading_icon_name", leading_icon_name)
	get:
		return leading_icon_name




@export var trailing_icon_name_1 = "":
	set(val):
		trailing_icon_name_1 = val
		set_dynamic_data("trailing_icon_name_1", trailing_icon_name_1)
	get:
		return trailing_icon_name_1

@export var trailing_icon_name_2 = "":
	set(val):
		trailing_icon_name_2 = val
		set_dynamic_data("trailing_icon_name_2", trailing_icon_name_2)
	get:
		return trailing_icon_name_2

func trigger_init_icon():
	_trigger_init_icon(%LeadIconButton, {
		UIDesignConstants.Attr.ICON_SIZE:UIDesignConstants.Attr.ICON_SIZE,
	})
	
	_trigger_init_icon(%TrailingIconButton1, {
		UIDesignConstants.Attr.ICON_SIZE:UIDesignConstants.Attr.ICON_SIZE,
	})
	_trigger_init_icon(%TrailingIconButton2, {
		UIDesignConstants.Attr.ICON_SIZE:UIDesignConstants.Attr.ICON_SIZE,
	})

func trigger_update_icon():
	_trigger_update_icon(%LeadIconButton, {
		UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Attr.ICON_COLOR,
		UIDesignConstants.Attr.ICON_OPACITY:UIDesignConstants.Attr.ICON_OPACITY,
	})
	
	_trigger_update_icon(%TrailingIconButton1, {
		UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Attr.ICON_COLOR+100,
		UIDesignConstants.Attr.ICON_OPACITY:UIDesignConstants.Attr.ICON_OPACITY,
	})
	_trigger_update_icon(%TrailingIconButton2, {
		UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Attr.ICON_COLOR+100,
		UIDesignConstants.Attr.ICON_OPACITY:UIDesignConstants.Attr.ICON_OPACITY,
	})

func trigger_dynamic_icon():
	_trigger_dynamic_icon(%LeadIconButton, {
		"icon_name":"leading_icon_name",
	})
	
	_trigger_dynamic_icon(%TrailingIconButton1, {
		"icon_name":"trailing_icon_name_1",
	})
	_trigger_dynamic_icon(%TrailingIconButton2, {
		"icon_name":"trailing_icon_name_2",
	})

func trigger_init_label():
	_trigger_init_label(%LineEdit, {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.Attr.LABEL_TOKEN,
	})

func trigger_update_label():
	_trigger_update_label(%LineEdit, {
		UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Attr.LABEL_COLOR,
		UIDesignConstants.Attr.LABEL_OPACITY:UIDesignConstants.Attr.LABEL_OPACITY,
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
	


@export var child_init_attr_data = {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.FULLY_ROUNDED,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
		UIDesignConstants.Attr.SHAPE_HEIGHT:56,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
		
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.LabelToken.BODY_LARGE,
	}
	
func get_init_attr_data():
	return child_init_attr_data

@export var child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE_CONTAINER_HIGH,
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_3,
				UIDesignConstants.Attr.SHAPE_OPACITY:1,
				
				UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.LABEL_OPACITY:1,
				
				UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.ICON_COLOR+100:UIDesignConstants.Role.ON_SURFACE_VARIANT,
				UIDesignConstants.Attr.ICON_OPACITY:1,
				
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.SURFACE_CONTAINER,
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
			},
		UIDesignConstants.State.DISABLED:{
			},
		UIDesignConstants.State.HOVERED:{
				
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
			
			},
		UIDesignConstants.State.FOCUSED:{
			},
		UIDesignConstants.State.ACTIVATED:{
			},
		UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
			},
		UIDesignConstants.State.DRAGGED:{
			},
	}

func get_update_attr_data():
	return child_update_attr_data

signal pressed_lead
func _on_lead_icon_button_pressed():
	emit_signal("pressed_lead")

signal pressed_trailing_1
func _on_trailing_icon_button_1_pressed():
	emit_signal("pressed_trailing_1")
	
signal pressed_trailing_2
func _on_trailing_icon_button_2_pressed():
	emit_signal("pressed_trailing_2")

func _on_resized():
	%BaseComponent.custom_minimum_size = size


