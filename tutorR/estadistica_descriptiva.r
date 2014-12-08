##' # Estadística Descriptiva con R 
##' [Francisco García García](http://bioinfo.cipf.es/ "webpage of department") _(2014-12-08)_  
##'
##' 
##' 
##' ----------------------------------------------------------------------------

##' ### 0. Introducción 
##' ### 1. ¿Cómo leemos los datos en R?
##' ### 2. Descripción numérica de una variable
##' ### 3. Descripción gráfica de una variable 
##' ### 4. Descripción de relaciones entre parejas de variables 
##' ### 5. Ejercicios
##' ### 6. Bibliografía y enlaces de interés
##' ----------------------------------------------------------------------------

##'<br />
##'<br />

##' ## 0. Introducción 
##' En cualquier análisis estadístico siempre debemos realizar un descriptivo de la muestra  con un doble objetivo:
##' 
##' 1. Comprobar la calidad de los datos
##' 
##' 2. Conocer detalladamente los datos. Esto nos ayudará a decidir la estrategia de análisis más adecuada.
##'<br />
##'<br />
##' 
##' ## 1. ¿Cómo leemos los datos en R?
##' Existen varias funciones de lectura de datos en R según el formato del archivo. Cuando tenemos un fichero en excel, es aconsejable 
##' guardarlo previamente en formato csv y posteriormente lo leemos desde R con la función **read.csv**:
datos <- read.csv("riesgos.csv", header = T, sep = "\t")
##' Para obtener información detallada de esta función de lectura:
?read.csv

##' Algunas funciones para explorar los datos:
head(datos)
tail(datos)
colnames(datos)
dim(datos)
summary(datos)
attach(datos)
##'<br />
##'<br />



##' ## 2. Descripción numérica de una variable
##' ### 2.1. Variables cuantitativas:
summary(edad)
sd(edad)
sum(edad)
is.na(edad)
##' También es posible pedir un descriptivo de varias variables cuantitativas al mismo tiempo:
summary(datos[, c("edad","peso","talla")])
##'
##' ### 2.2. Variables categóricas:
##' Obtenemos tablas de frecuencias absolutas con el comando **table**:
table(jornada)
##' También es posible obtener tablas de frecuencias relativas combinando los comandos **table** con **margin.table**:
table(jornada)   / margin.table(table(jornada))
##'<br />

##' ## 3. Descripción gráfica de una variable
##' ### 3.0. Introducción a los gráficos en R:
##' Los comandos de R son funciones que incluyen un conjunto de argumentos separados por comas y todos ellos entre paréntesis:
##'
# boxplot(datos, main = "primer gráfico", xlab = "nivel de colesterol")
##'  
##'  
##' Argumentos generales que utilizaremos en los gráficos:
##'* **main**: _Título principal del gráfico_
##'
##'* **xlab**: _Etiqueta para el eje X_
##'
##'* **ylab**: _Etiqueta para el eje Y_
##'
##'* **col**: _vector de colores_ 
##'
##'
##' ### 3.1. Variables cuantitativas:
##' Hay varias opciones: box-plots, histogramas,...
##' Con un interrogante delante del nombre de la función obtenemos ayuda sobre su uso:  **?boxplot**   
##' 
##' Es posible incluir o modificar elementos en el gráfico:
# incluimos color en la caja
boxplot(edad, col = "red")
# añadimos un título principal y subtítulo para el eje X
boxplot(edad, col = "red", main = "Evaluación de riesgos laborales", xlab = "Edad")  
# modificamos la escala del eje Y
boxplot(edad, col = "red", main = "Evaluación de riesgos laborales", xlab = "Edad",
        ylimit = c(0,45)) 

##'
##' ### 3.2. Variables categóricas:
##'
##' Comandos en R:
##'* **table(x)** para obtener la tabla de frecuencias
##'* **pie(table(x))** genera un gráfico de sectores
##'* **barplot(table(x))** genera un diagrama de barras
##'
##' Los diagramas de barras son preferibles a los diagramas de sectores.
##'  
##' **3.2.1 Gráficos circulares o de sectores**:
##' La variable **contrato** indica el tipo de contrato de cada trabajador (1 ,2  ,3   ,4   ,5   ,6)
##' preparamos una tabla de frecuencias
table(contrato)
##' generamos el diagrama de sectores
pie(table(contrato)) 
##' seleccionamos colores que nos gusten más para cada sector del gráfico:
pie(table(contrato), col = c("red", "blue", "pink", "green", "grey", "yellow"))  
##' además incluimos un título 
pie(table(contrato),  col = c("red", "blue", "pink", "green", "grey", "yellow"),
    main = "Tipos de contratos") 
##'
##'
##' **3.2.2. Gráficos de barras:**
##' Este tipo de gráficos son útiles para representar variables categóricas o variables cuantitativas discretas
##' 
##' La variable **contrato** indica el tipo de contrato de cada trabajador (1 ,2  ,3   ,4   ,5   ,6)
##'preparamos una tabla de frecuencias
table(contrato)
##' generamos el diagrama de barras
barplot(table(contrato)) 
##' incluimos título del gráfico  y títulos para los ejes X,Y.
barplot(table(contrato), xlab = "contratos", ylab = "frecuencias",
        main = "Evaluación de riesgos")
##' cambiamos el modo de visualización y añadimos color a las barras
barplot(table(contrato), horiz = TRUE, 
        ylab = "contratos", xlab = "frecuencias", 
        main = "Evaluación de riesgos", 
        col = "green")  

##'<br />

##' ## 4. Descripción de relaciones entre parejas de variables 
##' ## 4.1.  Varias variables categóricas
##' Obtenemos tablas de contingencia para dos variables categóricas utilizando comando **table**:
table(jornada, carfisi)
##' También es posible estratificar la información anterior por una tercera variable:
table(jornada, carfisi, carpsiqui)
##' 
##' ## 4.2.  Variable categórica vs. variable cuantitativa
##' 
##' ## 4.3.  Variable cuantitativa  vs. variable cuantitativa
##' _¿Qué relación hay entre el peso y la talla?_
plot(peso, talla)
##' representamos cada sujeto con triángulos azules 
plot(peso, talla, pch = 2, col = "blue", main = "peso vs. talla")     
##' un poco más grandes! 
plot(peso, talla, pch = 2, col = "blue", main = "peso vs. talla", cex=2)    


##'<br />

##' ## 5. Ejercicios
##'

##'<br />

##'
##' ## 6.  Bibliografía y enlaces interesantes:
##' 
##' - [David S. Moore. Estadística aplicada básica. Editorial Antoni Bosch.]  (http://www.antonibosch.com/system/downloads/487/original/EC-MOORE2_Contenido.pdf?1358332517)  Manual de Estadística Básica.
##' 

##' - [Quick-R] (http://www.statmethods.net/)   Web con recursos para trabajar con R.
##'

##' - [r-tutor] (http://www.r-tutor.com/)  An R Introduction to Statistics.
##'

##' ----------------------------------------------------------------------------
