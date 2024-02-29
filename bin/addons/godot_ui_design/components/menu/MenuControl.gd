extends Control


@export var item_list=[]:
	set(val):
		item_list = val
		if not is_inside_tree():
			await ready
		%BaseDialog.item_list = item_list
	get:
		return item_list
