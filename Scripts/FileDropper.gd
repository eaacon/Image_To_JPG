extends Panel

@onready var ui_item_asset = preload("res://Scenes/file_item.tscn")
var quality
var canover = false
@onready var popup = $"../../../PopupPanel"
@onready var Inst = $MarginContainer/Instructions

var current_set = PackedStringArray()
var target_set = PackedStringArray()
@onready var files_container = $MarginContainer/VBoxContainer

func _ready():
	get_viewport().files_dropped.connect(on_files_dropped)
	quality = $"../MarginContainer/HSlider".value

func on_files_dropped(files):
	print("Dropped:")
	
	canover = false
	current_set = files
	
	for i in current_set:
		target_set.append(i.get_basename() + ".jpg")

	pop_ui_list()
	
	check_files()
	Inst.hide()

func check_files():
	if current_set.is_empty() || target_set.is_empty():
		popup.hide()
		Inst.show()
		print("! current set empty")
		return

	for i in current_set.size():
		if FileAccess.file_exists(target_set[i]) && !canover:
			popup.overwrite_warning(target_set[i])
			return;
		else:
			save_jpg(i)

	if canover:
		clear_ui_list()
		popup.hide()

func save_jpg(save_index):
	var original = Image.new()
	
	if original.load(current_set[save_index]) != OK:
		print("couldnt load")
		return

	original.save_jpg(target_set[save_index], quality)
	print("saved " + target_set[save_index])

func pop_ui_list():
	clear_ui_list()
	
	for i in current_set.size():
		addto_ui_list(current_set[i])

func clear_ui_list():
	var fc_children = files_container.get_children()
	
	if fc_children.size() > 0:
		for i in fc_children:
			i.queue_free()

func addto_ui_list(fp):
	var item_inst = ui_item_asset.instantiate()
	files_container.add_child(item_inst)
	# files_container.move_child(item_inst, list_index)
	item_inst.populate(fp)

func remove_ui_list(i):
	var find_saved = files_container.get_children()[i]

	if find_saved != null:
		print("removed " + find_saved.name)
		find_saved.queue_free()
	
	current_set.remove_at(i)
	target_set.remove_at(i)

func remove_all():
	current_set.clear()
	target_set.clear()

func find_targetindex(fp):
	return target_set.find(fp)

func find_currentindex(fp):
	return current_set.find(fp)

func _on_button_button_down():
	get_tree().quit()


func _on_h_slider_value_changed(value):
	quality = value
