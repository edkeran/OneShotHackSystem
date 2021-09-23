using System.Runtime.InteropServices; 
using Godot;
using System;

public class ChangeBackground : Node{ 

    //Importamos la libreria de user32 del SO cuando es Windows 
	[DllImport("user32.dll", CharSet=CharSet.Auto)] 
    static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ;
    //Invocamos la funcion para actualizar el fondo de escritorio
    public static void SetWallpaper(string rutaImagen){ 
        //El parametro UAction con valor 20 indica que queremos cambiar la imagen del escritorio
        //El Parametro uParam para este caso va en 0
        //El lpvParam es un puntero con el objeto o cadena a emplear en la ejecucion
        //fuWinIni Va el valor de 3 para que tome efecto el cambio inmediatamente
        SystemParametersInfo(20,0,rutaImagen,3); 
    }

}
