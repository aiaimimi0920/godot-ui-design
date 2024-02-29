extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	%Carousel.trigger_get_id_tscn_func(get_id_tscn)
	%Carousel.set_left_id(0)
	

func get_id_tscn(cur_id, offset):
	var cur_label = Label.new()
	cur_label.text = str(cur_id+offset)
	cur_label.set_meta("node_id", cur_id+offset)
	cur_label.set("theme_override_colors/font_color", Color.BLACK)
	return cur_label
