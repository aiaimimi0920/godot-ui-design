extends Control

@export var action_list=[]:
	set(val):
		if not is_inside_tree():
			await ready
		%Snackbar.action_list = val
	get:
		return %Snackbar.action_list

	
@export var support_text: String:
	set(val):
		if not is_inside_tree():
			await ready
		%Snackbar.support_text = val
	get:
		return %Snackbar.support_text


@export var show_close_button=false:
	set(val):
		if not is_inside_tree():
			await ready
		%Snackbar.show_close_button = val
	get:
		return %Snackbar.show_close_button

signal trigger_action
func _on_snackbar_trigger_action(action_sig_name, action_data):
	emit_signal("trigger_action",action_sig_name, action_data)


func _on_snackbar_close_panel():
	queue_free()

