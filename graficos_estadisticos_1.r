##' # Gráficos estadísticos con R (1)
##' [Francisco García García](http://bioinfo.cipf.es/ "webpage of department") _(2014-10-29)_  
##'
##' 
##' 
##' ----------------------------------------------------------------------------



##' ## 1. Representación gráfica de una variable cuantitativa 

#esto es una linea comentada

##' Queremos representar gráficamente los valores de la variable colesterol. Utilizaremos los _diagramas de cajas o boxplots_:
colesterol <- c(150,125,138,144,150,201,225,233,200,190, 250,150,180,240,235)  #incluimos los datos de nuestra variable
boxplot(colesterol)

##' Es posible incluir o modificar elementos en el gráfico:
boxplot(colesterol, col = "red")                                  #color 

##' con un interrogante delante del nombre de la función obtenemos ayuda sobre su uso
?boxplot   

boxplot(colesterol, col = "red", main = "Exp. 53",
        xlab = "Colesterol")  #título principal y subtítulos para ejes 


boxplot(colesterol, col = "red", main = "Exp. 53",
        xlab = "Colesterol", ylimit = c(0,250)) #modificamos la escala del eje Y



##' Estos 15 valores corresponden a 3 grupos de ratones, que fueron sometidos a distintos tratamientos. 
##' ¿Observamos diferencias a partir de su representación gráfica?
colesterol <- c(150,125,138,144,150,201,225,233,200,190, 250,150,180,240,235)
tratamientos <- c("A","A","A","A","A","B","B","B","B","B","C","C","C","C","C")

#así sería más rápido:
tratamientos <- c(rep("A",5), rep("B",5), rep("C",5))

#representamos la variable colesterol para cada uno de los tres grupos descritos:
boxplot(colesterol ~ tratamientos)

boxplot(colesterol ~ tratamientos, col= c("red", "blue", "pink")) #con color

# valores de colesterol superiores a 175 pueden ser peligrosos. Incluimos una línea horizontal que señalice este límite:
boxplot(colesterol ~ tratamientos, col= c("red", "blue", "pink")) #con color
abline(h = 175)
abline(h = 175, col = "green", lwd = 2)   #indicamos que sea una línea gruesa y de color verde

#y si nos gustan más las distribuciones horizontales de estos plots:
boxplot(colesterol ~ tratamientos, col= c("red", "blue", "pink"), horizontal = TRUE) 
abline(v = 175, col = "green", lwd = 2) 




##' ## 2. Representación gráfica de una variable categórica 
##' Gráficos circulares o de sectores:
 
##' La variable "variante" incluye las frecuencias de diferentes tipos de mutaciones:
variante  <- c(10,12,4,16)
nombres   <- c("SNP", "stop lost", "intron variant", "exon variant")

#calculamos los porcentajes
pct <- round(variante/sum(variante)*100)

#realizamos el gráfico:
pie(variante)
pie(variante, labels = nombres)  #añadimos nombres de las categorias
pie(variante, labels = paste(nombres, pct, "%"))  #añadimos nombres de las categorias + porcentajes
pie(variante, labels = paste(nombres, pct, "%"), col = c("red", "blue", "pink", "green"))  #cambiamos colores
pie(variante, labels = paste(nombres, pct, "%"), col = c("red", "blue", "pink", "green"),
    main = "Tipos de variantes genómicas") #incluimos un título 

 
##' Gráficos de barras:
##' Este tipo de gráficos son útiles para representar variables categóricas o variables cuantitativas discretas
##' La variable "mut" indica el número de mutaciones encontradas en varios genes de interés (varía entre 1 y 5)

mut <- c(1,3,5,2,4,4,4,1,1,1,1,3,5,2)  #datos iniciales
datos <- table(mut) #tabla de frecuencias
barplot(datos) #generamos el diagrama de barras

barplot(datos, xlab = "número de mutaciones", ylab = "frecuencias", main = "Mutaciones detectadas en genes OPITZ")
#hemos incluido título del gráfico  y títulos para los ejes X,Y.
barplot(datos, horiz = TRUE, 
        ylab = "número de mutaciones", xlab = "frecuencias", main = "Mutaciones detectadas en genes OPITZ", 
        col = "green")  #cambiamos el modo de visualización y añadimos color a las barras




##' ## 3. Representación gráfica de dos variables cuantitativas
##' 
##' Queremos conocer la relacion entre el nivel de cuantificación de varios metabolitos

#introducimos los datos de 3 metabolitos:
glutamato <- c(143, 90, 100, 119,  98,  87,  84,  99, 101,  99)
colina <- c(146, 97, 106, 123, 103,  90,  90, 106, 108, 101)  
HLDL <-   c(100, 107, 105, 89, 88, 102, 122, 105, 93, 145)

#¿qué relación hay entre la colina y el HLDL? Utilizaremos los gráficos de dispersión o de puntos
plot(colina, HLDL)

plot(colina, HLDL, pch = 2, col = "blue", main = "colina vs. HLDL")      #representamos cada metabolito con triángulos azules 
plot(colina, HLDL, pch = 2, col = "blue", cex =2, main = "colina vs. HLDL")  #un poco más grandes! 
abline(lm(colina ~ HLDL), col = "red", main = "colina vs. HLDL") # añadimos la recta de regresión 


#¿y entre la colina y el glutamato?
plot(colina, glutamato, main = "colina vs. glutamato")
plot(colina, glutamato, main = "colina vs. glutamato", cex=0.5, col = "blue") #puntos más pequeños y con color!



#¿podemos ver las relaciones de los tres metabolitos por parejas?
pairs(~glutamato + colina + HLDL)

pairs(~glutamato + colina + HLDL, col = "blue", main = "Correlación lineal entre metabolitos")
#incluyendo nuevos elementos en el gráfico






##'
##' ## Links interesantes:
##' 
##' -[Quick-R] (http://www.statmethods.net/)   Muy directo!
##'
##' -[ggplot2] (http://ggplot2.org/)  Paquete de funciones que personalizan cualquier tipo de gráfico.
##' 
##' -[r-tutor] (http://www.r-tutor.com/)  An R Introduction to Statistics
##'

##' ----------------------------------------------------------------------------
