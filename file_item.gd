extends PanelContainer

@onready var filepath_label = $MarginContainer/HBoxContainer/Label

func populate(fp):
	filepath_label.text = fp

func get_fp():
	return filepath_label.text
