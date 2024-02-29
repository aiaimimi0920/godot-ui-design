extends BaseComponent2

func trigger_init_shape():
	_trigger_init_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Attr.SHAPE_SHADOWCOLOR,
	})

	_trigger_init_shape(%StateLayer, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
	})
	
	_trigger_init_shape(%FocusIndicator, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,

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
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.FULLY_ROUNDED,
		UIDesignConstants.Attr.SHAPE_HEIGHT:4,
		UIDesignConstants.Attr.SHAPE_WIDTH:200,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
		
		UIDesignConstants.Attr.ICON_SIZE:24,
		
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.LabelToken.BODY_LARGE,
		UIDesignConstants.Attr.LABEL_TOKEN+100:UIDesignConstants.LabelToken.BODY_SMALL,
		UIDesignConstants.Attr.LABEL_TOKEN+200:UIDesignConstants.LabelToken.BODY_LARGE,
}
	
func get_init_attr_data():
	return child_init_attr_data

@export var child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
				UIDesignConstants.Attr.SHAPE_OPACITY:0,
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
				
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
				
				UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
				
				UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_SURFACE_VARIANT,
				UIDesignConstants.Attr.ICON_OPACITY:1,

				UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Role.ON_SURFACE_VARIANT,
				UIDesignConstants.Attr.LABEL_OPACITY:1,
				
				UIDesignConstants.Attr.LABEL_COLOR+100:UIDesignConstants.Role.ON_SURFACE_VARIANT,
				UIDesignConstants.Attr.LABEL_OPACITY+100:1,
				
				UIDesignConstants.Attr.LABEL_COLOR+200:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.LABEL_OPACITY+200:1,
				
				
				UIDesignConstants.Attr.LABEL_COLOR+300:UIDesignConstants.Role.ON_SURFACE_VARIANT,
				UIDesignConstants.Attr.LABEL_OPACITY+300:1,
			},
		UIDesignConstants.State.DISABLED:{
			
				UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.ICON_OPACITY:0.38,
				
				UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.LABEL_OPACITY:0.38,

				UIDesignConstants.Attr.LABEL_COLOR+100:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.LABEL_OPACITY+100:0.38,
				
				UIDesignConstants.Attr.LABEL_COLOR+200:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.LABEL_OPACITY+200:0.38,
			},
		UIDesignConstants.State.HOVERED:{
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				
				UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_SURFACE_VARIANT,
				
				UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Role.ON_SURFACE_VARIANT,
				UIDesignConstants.Attr.LABEL_OPACITY:1,
				
				UIDesignConstants.Attr.LABEL_COLOR+100:UIDesignConstants.Role.ON_SURFACE_VARIANT,
				UIDesignConstants.Attr.LABEL_OPACITY+100:1,
				
				UIDesignConstants.Attr.LABEL_COLOR+200:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.LABEL_OPACITY+200:1,
			},
		UIDesignConstants.State.FOCUSED:{
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				
				UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_SURFACE_VARIANT,
				
				UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
				UIDesignConstants.Attr.LABEL_OPACITY:1,
				
				UIDesignConstants.Attr.LABEL_COLOR+100:UIDesignConstants.Role.ON_SURFACE_VARIANT,
				UIDesignConstants.Attr.LABEL_OPACITY+100:1,

				UIDesignConstants.Attr.LABEL_COLOR+200:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.LABEL_OPACITY+200:1,
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


func trigger_init_icon():
	_trigger_init_icon(%LeadingIcon, {
		UIDesignConstants.Attr.ICON_SIZE:UIDesignConstants.Attr.ICON_SIZE,
	})

	_trigger_init_icon(%TrailingIcon, {
		UIDesignConstants.Attr.ICON_SIZE:UIDesignConstants.Attr.ICON_SIZE,
	})
	
func trigger_update_icon():
	_trigger_update_icon(%LeadingIcon, {
		UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Attr.ICON_COLOR,
		UIDesignConstants.Attr.ICON_OPACITY:UIDesignConstants.Attr.ICON_OPACITY,
	})
	
	_trigger_update_icon(%TrailingIcon, {
		UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Attr.ICON_COLOR,
		UIDesignConstants.Attr.ICON_OPACITY:UIDesignConstants.Attr.ICON_OPACITY,
	})


@export var empty_label_text: String:
	set(val):
		empty_label_text = val
		set_dynamic_data("empty_label_text", empty_label_text)
	get:
		return empty_label_text

@export var populated_label_text: String:
	set(val):
		populated_label_text = val
		set_dynamic_data("populated_label_text", populated_label_text)
	get:
		return populated_label_text

@export var supporting_label_text: String:
	set(val):
		supporting_label_text = val
		set_dynamic_data("supporting_label_text", supporting_label_text)
	get:
		return supporting_label_text

@export var character_counter_label_text: String:
	set(val):
		character_counter_label_text = val
		set_dynamic_data("character_counter_label_text", character_counter_label_text)
	get:
		return character_counter_label_text

@export var prefix_label_text: String:
	set(val):
		prefix_label_text = val
		set_dynamic_data("prefix_label_text", prefix_label_text)
	get:
		return prefix_label_text

@export var suffix_label_text: String:
	set(val):
		suffix_label_text = val
		set_dynamic_data("suffix_label_text", suffix_label_text)
	get:
		return suffix_label_text

func trigger_init_label():
	_trigger_init_label(%EmptyLabelText, {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.Attr.LABEL_TOKEN,
	})

	_trigger_init_label(%PopulatedLabelText, {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.Attr.LABEL_TOKEN,
	})

	_trigger_init_label(%PopulatedInputText, {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.Attr.LABEL_TOKEN+200,
	})

	_trigger_init_label(%PopulatedMultipleInputText, {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.Attr.LABEL_TOKEN+200,
	})
	
	_trigger_init_label(%PrefixText, {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.Attr.LABEL_TOKEN+300,
	})

	_trigger_init_label(%SuffixText, {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.Attr.LABEL_TOKEN+300,
	})
	
	_trigger_init_label(%SupportingText, {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.Attr.LABEL_TOKEN+100,
	})
	_trigger_init_label(%CharacterCounterText, {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.Attr.LABEL_TOKEN+100,
	})

func trigger_update_label():
	_trigger_update_label(%EmptyLabelText, {
		UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Attr.LABEL_COLOR,
		UIDesignConstants.Attr.LABEL_OPACITY:UIDesignConstants.Attr.LABEL_OPACITY,
	})

	_trigger_update_label(%PopulatedLabelText, {
		UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Attr.LABEL_COLOR,
		UIDesignConstants.Attr.LABEL_OPACITY:UIDesignConstants.Attr.LABEL_OPACITY,
	})
	
	_trigger_update_label(%PopulatedInputText, {
		UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Attr.LABEL_COLOR+200,
		UIDesignConstants.Attr.LABEL_OPACITY:UIDesignConstants.Attr.LABEL_OPACITY+200,
	})
	
	_trigger_update_label(%PopulatedMultipleInputText, {
		UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Attr.LABEL_COLOR+200,
		UIDesignConstants.Attr.LABEL_OPACITY:UIDesignConstants.Attr.LABEL_OPACITY+200,
	})

	_trigger_update_label(%PrefixText, {
		UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Attr.LABEL_COLOR+300,
		UIDesignConstants.Attr.LABEL_OPACITY:UIDesignConstants.Attr.LABEL_OPACITY+300,
	})
	
	_trigger_update_label(%SuffixText, {
		UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Attr.LABEL_COLOR+300,
		UIDesignConstants.Attr.LABEL_OPACITY:UIDesignConstants.Attr.LABEL_OPACITY+300,
	})

	_trigger_update_label(%SupportingText, {
		UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Attr.LABEL_COLOR+100,
		UIDesignConstants.Attr.LABEL_OPACITY:UIDesignConstants.Attr.LABEL_OPACITY+100,
	})
	_trigger_update_label(%CharacterCounterText, {
		UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Attr.LABEL_COLOR+100,
		UIDesignConstants.Attr.LABEL_OPACITY:UIDesignConstants.Attr.LABEL_OPACITY+100,
	})

var input_text:
	set(val):
		#input_text = val
		%PopulatedInputText.text = val
		%PopulatedMultipleInputText.text = val
	get:
		if show_mode == ShowMode.LINE or show_mode == ShowMode.LINE_AUTO_ADD:
			return %PopulatedInputText.text
		return %PopulatedMultipleInputText.text

@export var multiple_line_count = 0

enum ShowMode {LINE, LINE_AUTO_ADD, MULTIPLE, MULTIPLE_AUTO_ADD}
@export var show_mode:ShowMode = ShowMode.LINE:
	set(val):
		show_mode = val
		if not is_inside_tree():
			await ready
		if show_mode == ShowMode.LINE or show_mode == ShowMode.LINE_AUTO_ADD:
			%LineContainer.visible = true
			%MultipleContainer.visible = false
		elif show_mode == ShowMode.MULTIPLE or show_mode == ShowMode.MULTIPLE_AUTO_ADD:
			%LineContainer.visible = false
			%MultipleContainer.visible = true
			
		if show_mode == ShowMode.LINE:
			%PopulatedInputText.expand_to_text_length = false
		elif show_mode == ShowMode.LINE_AUTO_ADD:
			%PopulatedInputText.expand_to_text_length = true
		
		if show_mode == ShowMode.MULTIPLE:
			%PopulatedMultipleInputText.scroll_fit_content_height = false
		elif show_mode == ShowMode.MULTIPLE_AUTO_ADD:
			%PopulatedMultipleInputText.scroll_fit_content_height = true

func trigger_dynamic_label():
	_trigger_dynamic_label(%EmptyLabelText, {
		"text":"empty_label_text",
	})

	_trigger_dynamic_label(%PopulatedLabelText, {
		"text":"populated_label_text",
	})

	_trigger_dynamic_label(%SupportingText, {
		"text":"supporting_label_text",
	})
	
	_trigger_dynamic_label(%CharacterCounterText, {
		"text":"character_counter_label_text",
	})

	_trigger_dynamic_label(%PrefixText, {
		"text":"prefix_label_text",
	})

	_trigger_dynamic_label(%SuffixText, {
		"text":"suffix_label_text",
	})


func _init_label():
	super._init_label()
	%PopulatedInputText.set("theme_override_colors/caret_color",get_role_color(UIDesignConstants.Role.PRIMARY_COLOR))
	%PopulatedMultipleInputText.set("theme_override_colors/caret_color",get_role_color(UIDesignConstants.Role.PRIMARY_COLOR))

func _on_h_box_container_resized():
	%HBoxContainerControl.custom_minimum_size = %PopulatedContainer.size
	%EmptyContainer.custom_minimum_size = %PopulatedContainer.size
	%EmptyContainer.size = %PopulatedContainer.size
	%TextContainer.custom_minimum_size = %PopulatedContainer.size
	
	%TextContainer.child_init_attr_data = %TextContainer.child_init_attr_data.duplicate(true)
	%TextContainer.child_init_attr_data[UIDesignConstants.Attr.SHAPE_HEIGHT] = %PopulatedContainer.size.y
	%TextContainer.child_init_attr_data[UIDesignConstants.Attr.SHAPE_WIDTH] = %PopulatedContainer.size.x
	%TextContainer._init_flag = true
	
	%ActiveIndicator.child_init_attr_data = %ActiveIndicator.child_init_attr_data.duplicate(true)
	%ActiveIndicator.child_init_attr_data[UIDesignConstants.Attr.SHAPE_WIDTH] = %PopulatedContainer.size.x
	%ActiveIndicator._init_flag = true

func _ready():
	super._ready()
	_on_text_container_start_activated()
	_on_text_container_finish_activated()


func _on_text_container_start_activated():
	%EmptyContainer.visible = false
	%PopulatedContainer.modulate.a = 1
	%PopulatedInputText.mouse_filter = MOUSE_FILTER_STOP
	%PopulatedMultipleInputText.mouse_filter = MOUSE_FILTER_STOP
	#%PopulatedLabelText.modulate.a = 1


func _on_text_container_finish_activated():
	if input_text=="":
		%EmptyContainer.visible = true

		%PopulatedContainer.modulate.a = 0
		%PopulatedInputText.mouse_filter = MOUSE_FILTER_IGNORE
		%PopulatedMultipleInputText.mouse_filter = MOUSE_FILTER_IGNORE

		#%PopulatedLabelText.modulate.a = 0


@export var line_custom_minimum_size = Vector2(60,24):
	set(val):
		line_custom_minimum_size = val
		if not is_inside_tree():
			await ready
		%PopulatedInputTextControl.custom_minimum_size = line_custom_minimum_size
		%PopulatedInputText.custom_minimum_size = line_custom_minimum_size

@export var multiple_custom_minimum_size = Vector2(60,72):
	set(val):
		multiple_custom_minimum_size = val
		if not is_inside_tree():
			await ready
		%PopulatedMultipleInputTextControl.custom_minimum_size = multiple_custom_minimum_size
		%PopulatedMultipleInputText.custom_minimum_size = multiple_custom_minimum_size

func _on_populated_input_text_text_changed(new_text):
	if not is_inside_tree():
		await ready
	if show_mode == ShowMode.LINE_AUTO_ADD:
		%PopulatedInputText.set_expand_to_text_length_enabled(true)
		%PopulatedInputText.size.x = 0
		%PopulatedInputTextControl.custom_minimum_size = %PopulatedInputText.size
		%LineContainer.size.x = 0
		%PopulatedLabelContainer.size.x = 0
		%PopulatedContainer.size.x = 0


func _on_populated_multiple_input_text_text_changed():
	if not is_inside_tree():
		await ready
	if show_mode == ShowMode.MULTIPLE_AUTO_ADD or show_mode == ShowMode.MULTIPLE:
		%PopulatedMultipleInputText.size = Vector2.ZERO
		%PopulatedMultipleInputTextControl.custom_minimum_size = %PopulatedMultipleInputText.size
		%MultipleContainer.size = Vector2.ZERO
		%PopulatedLabelContainer.size = Vector2.ZERO
		%PopulatedContainer.size = Vector2.ZERO


func _on_leading_icon_visibility_changed():
	if not is_inside_tree():
		await ready
	%LeadingIconMarginContainer.visible = %LeadingIcon.visible



func _on_empty_label_text_visibility_changed():
	if not is_inside_tree():
		await ready
	%EmptyLabelTextMarginContainer.visible = %EmptyLabelText.visible


func _on_populated_label_container_visibility_changed():
	if not is_inside_tree():
		await ready
	%PopulatedLabelContainerMarginContainer.visible = %PopulatedLabelContainer.visible


func _on_trailing_icon_visibility_changed():
	if not is_inside_tree():
		await ready
	%TrailingIconMarginContainer.visible = %TrailingIcon.visible


