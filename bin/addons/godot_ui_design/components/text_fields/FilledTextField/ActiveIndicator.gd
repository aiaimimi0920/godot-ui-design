extends BaseComponent2

func trigger_init_shape():
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


@export var child_init_attr_data = {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.NO_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:1,
		UIDesignConstants.Attr.SHAPE_WIDTH:112,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
}


	
func get_init_attr_data():
	return child_init_attr_data

@export var child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.ON_SURFACE_VARIANT,
				UIDesignConstants.Attr.SHAPE_OPACITY:1,
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
			},
		UIDesignConstants.State.DISABLED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.SHAPE_OPACITY:0.38,
			},
		UIDesignConstants.State.HOVERED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.SHAPE_OPACITY:1,
			},
		UIDesignConstants.State.FOCUSED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
				UIDesignConstants.Attr.SHAPE_OPACITY:1,
			},
		UIDesignConstants.State.ACTIVATED:{
			},
		UIDesignConstants.State.PRESSED:{
			},
		UIDesignConstants.State.DRAGGED:{
			},
	}

func get_update_attr_data():
	return child_update_attr_data


func start_hover():
	super.start_hover()
	child_init_attr_data = child_init_attr_data.duplicate(true)
	child_init_attr_data[UIDesignConstants.Attr.SHAPE_HEIGHT] = 2
	_init_flag = true

func finish_hover():
	super.finish_hover()
	child_init_attr_data = child_init_attr_data.duplicate(true)
	child_init_attr_data[UIDesignConstants.Attr.SHAPE_HEIGHT] = 1
	_init_flag = true
