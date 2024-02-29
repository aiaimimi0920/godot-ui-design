class_name CustomTooltip

func get_plain_tooltip(for_text):
	var tooltip = preload("res://addons/godot_ui_design/components/tooltips/plain_tooltip/PlainTooltip.tscn").instantiate()
	tooltip.label_text = for_text
	return tooltip

func get_rich_tooltip(for_text):
	var tooltip = preload("res://addons/godot_ui_design/components/tooltips/rich_tooltip/RichTooltip.tscn").instantiate()

	var subhead_regex = RegEx.new()
	subhead_regex.compile("\\[Subhead:(.*?)\\]")
	var subhead_regex_res = subhead_regex.search(for_text)
	var subhead = subhead_regex_res.get_string(1)

	var support_regex = RegEx.new()
	support_regex.compile("\\[Support:(.*?)\\]")
	var support_regex_res = support_regex.search(for_text)
	var support = support_regex_res.get_string(1)

	var action_regex = RegEx.new()
	action_regex.compile("\\[Action:(.*?)\\]")
	var action_regex_res = action_regex.search(for_text)
	var action = action_regex_res.get_string(1)
	var action_array = action.split(",")
	var res_action_array = []
	for cur_action in action_array:
		res_action_array.append(cur_action.split(":"))
	
	tooltip.subhead_text = subhead
	tooltip.support_text = support
	tooltip.action_array = res_action_array
	tooltip.tooltip_text = for_text
	return tooltip

