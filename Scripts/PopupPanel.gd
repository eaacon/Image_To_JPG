extends PopupPanel

@onready var mainapp = $"../MarginContainer/VBoxContainer/Panel"
@onready var message = $MarginContainer/VBoxContainer/Label
@onready var Apply_All = $MarginContainer/VBoxContainer/CheckButton
var currentpath = null

func _ready():
	exclusive = true
	hide()

func overwrite_warning(filepath):
	currentpath = filepath
	message.text = "File at " + filepath + " exists. Do you want to overwrite it?"
	visible = true
	grab_focus()


func _on_yes_button_down():
	if Apply_All.is_pressed() == true:
		print(true)
		_on_yes_all()
		return

	if(currentpath != null):
		# print(currentpath + " to " + str(mainapp.current_set) + str(mainapp.current_set.find(currentpath)))
		mainapp.save_jpg(mainapp.find_targetindex(currentpath))
	
	mainapp.remove_ui_list(mainapp.target_set.find(currentpath))
	
	currentpath = null

	mainapp.check_files()


func _on_no_button_down():
	if Apply_All.is_pressed() == true:
		_on_no_all()
		return

	if(currentpath != null):
		mainapp.remove_ui_list(mainapp.target_set.find(currentpath))
	
	currentpath = null
	
	mainapp.check_files()


func _on_yes_all():
	mainapp.canover = true
	currentpath = null

	mainapp.check_files()

func _on_no_all():
	mainapp.remove_all()
	mainapp.clear_ui_list()
	currentpath = null

	mainapp.check_files()
