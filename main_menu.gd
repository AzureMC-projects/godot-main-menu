extends Control

@onready var menu_buttons: VBoxContainer = $Center/Content/MenuButtons
@onready var loading_overlay: ColorRect = $LoadingOverlay
@onready var loading_bar: ProgressBar = $LoadingOverlay/Center/Panel/VBox/ProgressBar
@onready var loading_status: Label = $LoadingOverlay/Center/Panel/VBox/Status

var loading := false

func _ready() -> void:
    loading_overlay.visible = false
    $Center/Content/MenuButtons/Play.grab_focus()

func _on_play_pressed() -> void:
    if loading:
        return
    loading = true
    menu_buttons.mouse_filter = Control.MOUSE_FILTER_IGNORE
    for child in menu_buttons.get_children():
        if child is BaseButton:
            child.disabled = true
    loading_overlay.visible = true
    await _run_loading_sequence()
    get_tree().change_scene_to_file("res://node_3d.tscn")

func _run_loading_sequence() -> void:
    var steps := [
        ["Waking the dark...", 0.18],
        ["Listening to the silence...", 0.42],
        ["Opening the door...", 0.67],
        ["Something is waiting...", 0.86],
        ["ENTERING...", 1.0]
    ]
    for step in steps:
        loading_status.text = step[0]
        var target: float = step[1]
        var tween := create_tween()
        tween.tween_property(loading_bar, "value", target * 100.0, 0.35)
        await tween.finished
        await get_tree().create_timer(0.12).timeout

func _on_options_pressed() -> void:
    get_tree().change_scene_to_file("res://options.tscn")

func _on_quit_pressed() -> void:
    get_tree().quit()

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_cancel") and not loading:
        get_tree().quit()
