extends Control

@export var action_list=[]:
	set(val):
		if not is_inside_tree():
			await ready
		%BaseDialog.action_list = val
	get:
		return %BaseDialog.action_list


@export var support_text: String:
	set(val):
		if not is_inside_tree():
			await ready
		%BaseDialog.support_text = val
	get:
		return %BaseDialog.support_text
	
@export var head_text: String:
	set(val):
		if not is_inside_tree():
			await ready
		%BaseDialog.head_text = val
	get:
		return %BaseDialog.head_text

@export var head_icon_name = "":
	set(val):
		if not is_inside_tree():
			await ready
		%BaseDialog.head_icon_name = val
	get:
		return %BaseDialog.head_icon_name



signal trigger_action
func _on_base_dialog_trigger_action(action_sig_name, action_data):
	emit_signal("trigger_action",action_sig_name, action_data)
