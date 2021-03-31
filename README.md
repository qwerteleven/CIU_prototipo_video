# CIU_prototipo_video
 

```
Proponer un concepto y su prototipo de combinación de salida gráfica en respuesta a
una captura de vídeo.

```

![](./CIU_prototipo_video/animation.gif)

```
Autor Leopoldo lopez reveron 
Escuela de ingeniería informática
Universidad de las palmas de Gran Canaria

```
  
# Trabajo realizado


```
  Se ha desarrollado una transformacion de una captura de video, que consiste en transferir el estilo
  artistico de un autor, que se ha capturado en una red neuronal, a una salida de video:
  
    - Control de la camara
    - Optimizacion con OpenCV-GPU
    - Carga de modelos DNN en el framework Torch 
    - Inferencia en los modelos con la consecuente tranformacion de imagen

    
 ```   
 
# Dependencias necesarias

```
       ** Para poder cambiar los modelos descargar el proyecto github aprox. 200MB **
       
       processing.video
       cvimage https://github.com/atduskgreg/opencv-processing/releases
       OpenCV  https://opencv.org/
       
       
       
       ## Mejorar el rendimiento 
       
       - se necesita de una GPU (minimo 4GB vRAM)
       
       - CMake, para la compilacion de OpenCV
       
       - OpenCV https://opencv.org/releases/ (4.5.1)
       
       - Apache ANT https://ant.apache.org/  (1.9.15)
       
       - Visual Studio 2019  https://visualstudio.microsoft.com/
       
       - CUDA minimo 9 y CUDNN 7.0
       - 
       
       - Pasos a seguir:
          
          - JAVA SDK version 8
          - Instalacion CUDA minimo 9 y CUNN 7.0
          - Instalacion CMake, Visual Studio y descarga de OpenCV, Apache ANT
          - descomprimir OpenCV, Apache ANT
          - Abrir CMake, en source la ruta source de OpenCV, y en build la ruta source de OpenCV
          - Presionamos configurar
          - Selecionamos WITH CUDA, ANT_EXECUTABLE indicamos la ruta del .bat
          - Presionamos generar
          - Presionamos Open project
          - En visual studio, que se abrira automaticamente, seleccinamos RELEASE y compilamos
            Suele tardar entre 6-8 horas, se puede acelerar si desactivas por los ejemplos de CUDA
          - Los archivos que nos interesan estan en opencv\build\lib\Release  opencv\build\bin
          - Son opencv_java451.lib, opencv-451.jar
          - Estos archivos deberan sustituir a los d la libreria de OpenCV que hayamos instalado
          - Normalmente estan en Documents\Processing\libraries\cvimage\library
          
   
 
```

# Controles

```

 Si se tienen mas modelos agragados a ./data
 
 la tecla INTRO, cambia entre los modelos de deep learning

```
 
    
# Decisiones adoptadas para la solución propuesta

```
  
  Se entrega una version con solo un modelo y sin soporte para GPU
  Debido al problema de espacio de la entrega
  
  La version en el GITHUB contiene todos los modelos,aunque queda por parte del 
  usuario la instalacion del soporte en GPU
 

```

# Referencias y herramientas utilizadas

  - ## Libreria camara
  - * [queasycam](https://github.com/jrc03c/queasycam)
  
  - ## Funcionamiento Processing
  - * [Documentacion dibujar texto](https://processing.org/reference/text_.html)
  
  - ## Definición de especificación del proyecto
  - [Guion practica](https://ncvt-aep.ulpgc.es/cv/ulpgctp21/pluginfile.php/412240/mod_resource/content/37/CIU_Pr_cticas.pdf)

  - ## API libreria opencv
  - [cvimage](https://github.com/atduskgreg/opencv-processing/releases)
  
  - ## Libreria OpenCV-JAVA
  - [OpenCV](https://opencv.org/releases/) (4.5.1)
       
  - ## Compilador JAVA
  - [Apache ANT](https://ant.apache.org/)  (1.9.15)
       
  - ## Compilador C++
  - [Visual Studio 2019](https://visualstudio.microsoft.com/)



