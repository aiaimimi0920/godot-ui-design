@tool
extends Label

@export var scheme:MCUSchemeContent:
	get:
		return scheme
	set(val):
		if scheme!=null:
			scheme.disconnect("updated_scheme",self.update_color)
		scheme = val
		scheme.connect("updated_scheme",self.update_color)
		
@export var role: UIDesignConstants.Role:
	get:
		return role
	set(val):
		role = val
		update_color()


func _ready():
	update_color()

func update_color():
	var cur_color = scheme.call(UIDesignConstants.func_map[role])
	set("theme_override_colors/font_color", cur_color)

