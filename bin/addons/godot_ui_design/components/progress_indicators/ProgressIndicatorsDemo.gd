extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/CircularProgressIndicator.begin_circulate_timer_progress(2)
	$HBoxContainer2/LinearProgressIndicator.begin_circulate_timer_progress(2)
	$HBoxContainer3/CircularProgressIndicator.begin_circulate_timer_progress(2)
	$HBoxContainer4/LinearProgressIndicator.begin_circulate_timer_progress(2)

func _on_button_pressed():
	$HBoxContainer/CircularProgressIndicator.delay_begin_timer_progress(1)


func _on_button_2_pressed():
	$HBoxContainer2/LinearProgressIndicator.delay_begin_timer_progress(1)



