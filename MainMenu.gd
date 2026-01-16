extends Control

@onready var play_button = $VBoxContainer/PlayButton
@onready var options_button = $VBoxContainer/OptionsButton
@onready var quit_button = $VBoxContainer/QuitButton
@onready var options_popup = $OptionsPopup  # لو مش موجود احذف السطر ده

func _ready():
    play_button.pressed.connect(_on_play_pressed)
    options_button.pressed.connect(_on_options_pressed)
    quit_button.pressed.connect(_on_quit_pressed)

func _on_play_pressed():
    # غيّر المسار لاسم مشهد اللعبة الحقيقي عندك
    var err = get_tree().change_scene_to_file("res://scenes/Game.tscn")
    if err != OK:
        push_error("Failed to load Game.tscn: %s" % str(err))

func _on_options_pressed():
    if options_popup:
        options_popup.popup_centered()

func _on_quit_pressed():
    get_tree().quit()
