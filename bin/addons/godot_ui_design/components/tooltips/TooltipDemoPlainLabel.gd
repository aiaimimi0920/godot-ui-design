extends Label

func _make_custom_tooltip(for_text):
	return CustomTooltip.new().get_plain_tooltip(for_text)
