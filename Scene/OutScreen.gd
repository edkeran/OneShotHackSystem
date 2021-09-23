extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	OS.window_fullscreen = true
	OS.window_borderless = true
	OS.window_per_pixel_transparency_enabled = true
	get_tree().get_root().set_transparent_background(true)
