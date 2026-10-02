extends Control

@onready var volume_slider: HSlider = $Center/Panel/VBox/VolumeRow/VolumeSlider
@onready var fullscreen_check: CheckButton = $Center/Panel/VBox/FullscreenRow/FullscreenCheck

func _ready() -> void:
    volume_slider.value = AudioServer.get_bus_volume_db(0)
    fullscreen_check.button_pressed = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
    volume_slider.grab_focus()

func _on_volume_changed(value: float) -> void:
    AudioServer.set_bus_volume_db(0, value)

func _on_fullscreen_toggled(enabled: bool) -> void:
    DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if enabled else DisplayServer.WINDOW_MODE_WINDOWED)

func _on_back_pressed() -> void:
    get_tree().change_scene_to_file("res://main_menu.tscn")

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_cancel"):
        _on_back_pressed()
