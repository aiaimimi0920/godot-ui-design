extends BaseComponent2

@export var filter_label_array: Array[String] = []:
	set(val):
		filter_label_array = val
		if len(filter_label_array)<=1:
			pass
		else:
			create_filter_menu_flag = true

@export var filter_leading_icon_name_array: Array[String] = []:
	set(val):
		filter_leading_icon_name_array = val
		if len(filter_leading_icon_name_array)<=1:
			pass
		else:
			create_filter_menu_flag = true

@export var show_close_button = false

func _process(delta):
	super._process(delta)
	create_filter_menu()
	
	
var create_filter_menu_flag = false
func create_filter_menu():
	if create_filter_menu_flag == false:
		return 
	
	
	
	create_filter_menu_flag = false
	pass

func _on_pressed():
	super._on_pressed()
	update_now_ui()

@export var selected_index = 0

func update_now_ui():
	%CloseButton.visible = false
	if button_pressed:
		if len(filter_label_array)>1:
			if selected_index!=-1:
				leading_icon_name = "check"
				label_text = filter_label_array[selected_index]
			else:
				leading_icon_name = ""
				label_text = filter_label_array[0]
			trailing_icon_name = "menu-up"
			set_filter_menu_visible(true)
		else:
			leading_icon_name = "check"
			if show_close_button:
				trailing_icon_name = "close"
				%CloseButton.visible = true
			else:
				trailing_icon_name = ""
			selected_index = 0
			label_text = filter_label_array[selected_index]
		pass
	else:
		if len(filter_label_array)>1:
			if selected_index!=-1:
				leading_icon_name = "check"
				label_text = filter_label_array[selected_index]
			else:
				leading_icon_name = ""
				label_text = filter_label_array[0]
			trailing_icon_name = "menu-down"
			set_filter_menu_visible(false)
		else:
			leading_icon_name = ""
			if show_close_button:
				trailing_icon_name = "close"
				%CloseButton.visible = true
			else:
				trailing_icon_name = ""
			selected_index = -1
			label_text = filter_label_array[0]
			
func set_filter_menu_visible(bvisible):
	
	pass

@export var label_text: String:
	set(val):
		label_text = val
		set_dynamic_data("label_text", label_text)
	get:
		return label_text

@export var leading_icon_name = "":
	set(val):
		leading_icon_name = val
		set_dynamic_data("leading_icon_name", leading_icon_name)
	get:
		return leading_icon_name

@export var trailing_icon_name = "":
	set(val):
		trailing_icon_name = val
		set_dynamic_data("trailing_icon_name", trailing_icon_name)
	get:
		return trailing_icon_name

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
		UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH:UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OFFSET:UIDesignConstants.Attr.SHAPE_OUTLINE_OFFSET,
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
		UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY,
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


func trigger_init_icon():
	_trigger_init_icon(%LeadingIcon, {
		UIDesignConstants.Attr.ICON_SIZE:UIDesignConstants.Attr.ICON_SIZE,
	})
	_trigger_init_icon(%TrailingIcon, {
		UIDesignConstants.Attr.ICON_SIZE:UIDesignConstants.Attr.ICON_SIZE,
	})
	pass

func trigger_update_icon():
	_trigger_update_icon(%LeadingIcon, {
		UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Attr.ICON_COLOR,
		UIDesignConstants.Attr.ICON_OPACITY:UIDesignConstants.Attr.ICON_OPACITY,
	})
	_trigger_update_icon(%TrailingIcon, {
		UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Attr.ICON_COLOR+100,
		UIDesignConstants.Attr.ICON_OPACITY:UIDesignConstants.Attr.ICON_OPACITY,
	})

func trigger_dynamic_icon():
	_trigger_dynamic_icon(%LeadingIcon, {
		"icon_name":"leading_icon_name",
	})
	_trigger_dynamic_icon(%TrailingIcon, {
		"icon_name":"trailing_icon_name",
	})

@export var child_init_attr_data = {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.LabelToken.LABEL_LARGE,
		
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.SMALL_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:32,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
		UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH:1,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OFFSET:0,
		
		UIDesignConstants.Attr.ICON_SIZE:18,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	}
	
func get_init_attr_data():
	return child_init_attr_data

@export var child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.SHAPE_COLOR:{
					"selected":UIDesignConstants.Role.SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.SURFACE_CONTAINER_LOW,
				},
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
				
				UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:{
					"selected":UIDesignConstants.Role.SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.OUTLINE,
				},
				UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:{
					"selected":0,
					"unselected":1,
				},
				UIDesignConstants.Attr.SHAPE_OPACITY:1,

				UIDesignConstants.Attr.LABEL_COLOR:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
				},
				UIDesignConstants.Attr.LABEL_OPACITY:1,
				
				UIDesignConstants.Attr.ICON_COLOR:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.PRIMARY_COLOR,
				},
				UIDesignConstants.Attr.ICON_COLOR+100:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
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
				UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:0.12,
				
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
				
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.SHAPE_OPACITY:0.12,
			
				UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.LABEL_OPACITY:0.38,
				
				UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.ICON_COLOR+100:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.ICON_OPACITY:0.38,
			},
		UIDesignConstants.State.HOVERED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:{
					"selected":UIDesignConstants.ElevationLevel.LEVEL_1,
					"unselected":UIDesignConstants.ElevationLevel.LEVEL_0,
				},
				UIDesignConstants.Attr.LABEL_COLOR:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
				},
				UIDesignConstants.Attr.LABEL_OPACITY:1,
				
				UIDesignConstants.Attr.STATE_LAYER_COLOR:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
				},
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,

				UIDesignConstants.Attr.ICON_COLOR:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.PRIMARY_COLOR,
				},
				UIDesignConstants.Attr.ICON_COLOR+100:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
				},
				UIDesignConstants.Attr.ICON_OPACITY:1,
			},
		UIDesignConstants.State.FOCUSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:{
					"selected":UIDesignConstants.ElevationLevel.LEVEL_0,
					"unselected":UIDesignConstants.ElevationLevel.LEVEL_0,
				},

				UIDesignConstants.Attr.LABEL_COLOR:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
				},
				UIDesignConstants.Attr.LABEL_OPACITY:1,

				UIDesignConstants.Attr.STATE_LAYER_COLOR:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
				},
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,

				UIDesignConstants.Attr.ICON_COLOR:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.PRIMARY_COLOR,
				},
				UIDesignConstants.Attr.ICON_COLOR+100:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
				},
				UIDesignConstants.Attr.ICON_OPACITY:1,
				
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				
			},
		UIDesignConstants.State.ACTIVATED:{
			},
		UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:{
					"selected":UIDesignConstants.ElevationLevel.LEVEL_0,
					"unselected":UIDesignConstants.ElevationLevel.LEVEL_0,
				},

				UIDesignConstants.Attr.LABEL_COLOR:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
				},
				UIDesignConstants.Attr.LABEL_OPACITY:1,

				UIDesignConstants.Attr.STATE_LAYER_COLOR:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
				},
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,

				UIDesignConstants.Attr.ICON_COLOR:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.PRIMARY_COLOR,
				},
				UIDesignConstants.Attr.ICON_COLOR+100:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
				},
				UIDesignConstants.Attr.ICON_OPACITY:1,
			},
		UIDesignConstants.State.DRAGGED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:{
					"selected":UIDesignConstants.ElevationLevel.LEVEL_4,
					"unselected":UIDesignConstants.ElevationLevel.LEVEL_4,
				},

				UIDesignConstants.Attr.LABEL_COLOR:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
				},
				UIDesignConstants.Attr.LABEL_OPACITY:1,

				UIDesignConstants.Attr.STATE_LAYER_COLOR:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
				},
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.dragged_state_layer_opacity,

				UIDesignConstants.Attr.ICON_COLOR:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.PRIMARY_COLOR,
				},
				UIDesignConstants.Attr.ICON_COLOR+100:{
					"selected":UIDesignConstants.Role.ON_SECONDARY_CONTAINER,
					"unselected":UIDesignConstants.Role.ON_SURFACE_VARIANT,
				},
				UIDesignConstants.Attr.ICON_OPACITY:1,
			},
	}

func get_update_attr_data():
	return child_update_attr_data

func _ready():
	super._ready()
	update_now_ui()


func _on_close_button_pressed():
	queue_free()

