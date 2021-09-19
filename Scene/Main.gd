extends Node2D

var txtSaludoUsuario = "Hola **** Bienvenido a este sistema de 'Hackeo' "
var desktop_image = null
var pathImagesReal = OS.get_executable_path()+"/../"
var route_new_desktop_image = pathImagesReal + "DesktopImages/"
var currentBmp = "1.bmp"


func _ready():
	print(route_new_desktop_image)
	if(detect_OS_simple()):
		var userName = get_env_name()
		txtSaludoUsuario = txtSaludoUsuario.replace("****", userName)
	else:
		txtSaludoUsuario = txtSaludoUsuario.replace("****", " NOMBRE JUGADOR ")
	$MenuTest/Panel/SaludoPanel.text = txtSaludoUsuario

#Funcion para llamar los script en bash dependiendo si el SO es un windows
func call_script_bash_windows(command, argsArray):
	var output = []
	var args = PoolStringArray()
	if(argsArray != null):
		args = PoolStringArray(argsArray)
	OS.execute(command,args, true, output)
	return output[0]

func get_env_name():
	return OS.get_environment("USERNAME")

func get_current_desktop_image():
	var image_current_location = call_script_bash_windows("REG", ["QUERY","HKEY_CURRENT_USER\\Control Panel\\Desktop", "/v", "Wallpaper"])
	image_current_location = call_script_bash_windows("REG", ["QUERY","HKEY_CURRENT_USER\\Control Panel\\Desktop", "/v", "Wallpaper"])
	image_current_location = image_current_location.split("    ")
	var result = image_current_location[3]
	result.erase(result.length() - 1, 1)
	result.erase(result.length() - 1, 1)
	return result

func change_image_desktop_image(image):
	#Importamos la clase de c#
	var script_backgroung_change = load("res://Scene/ChangeBackground.cs")
	var nodeCSharpBackgroundObj = script_backgroung_change.new()
	nodeCSharpBackgroundObj.SetWallpaper(image);


#Funcion para determinar el SO para correr el script correspondiente
func detect_OS_simple():
	var os_current_name = OS.get_name()
	match os_current_name:
		"Windows":
			return true
		"WinRT":
			return true
	return false


func _on_Button_pressed():
	change_image_desktop_image(route_new_desktop_image + currentBmp)

func _on_Button2_pressed():
	if(desktop_image != null):
		change_image_desktop_image(desktop_image)

func _on_Imagen1_pressed():
	currentBmp = "1.bmp"

func _on_Imagen2_pressed():
	currentBmp = "2.bmp"
	
func _on_Imagen3_pressed():
	currentBmp = "3.bmp"

func _on_Button3_pressed():
	desktop_image = get_current_desktop_image()
