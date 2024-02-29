extends Control

@export var input_text: String:
	set(val):
		if not is_inside_tree():
			await ready
		%SearchView.input_text = val
	get:
		return %SearchView.input_text

@export var support_text: String:
	set(val):
		if not is_inside_tree():
			await ready
		%SearchView.support_text = val
	get:
		return %SearchView.support_text

signal search_something
func _on_search_view_search_something(new_text):
	emit_signal("search_something",new_text)
