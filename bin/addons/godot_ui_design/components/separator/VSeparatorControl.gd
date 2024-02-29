extends Control

enum ShowMode {FULL_WIDTH, MIDDLE_INSET,INSET}
@export var show_mode:ShowMode = ShowMode.FULL_WIDTH:
	set(val):
		show_mode = val
		if not is_inside_tree():
			await ready
		%HSeparator.show_mode = show_mode

func _ready():
	%VSeparator.anchors_preset = PRESET_LEFT_WIDE
