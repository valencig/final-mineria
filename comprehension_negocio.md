#### Comprehensión del negocio (R Markdown)

*Elaborado por:*
+ Daniela Pinto Veizaga, [dapivei](https://github.com/dapivei)
+ Javier Goujon,
+ Mario Cruz,
+ Miguel Ávila,
***
<div align="justify">

**1. Antecedentes**

*Walmart*, interesada en el progreso y mejora constante de su misión principal –mejora de la experiencia de sus clientes–, busca segmentar las visitas de sus clientes en diferentes tipos de viajes (*TripTypr*).

A la fecha (previa a la publicación del concurso en Kaggle), los *tipos de viajes* creados por Walmart han sido producto del arte (opiniones de los clientes) y la ciencia (historial de compras del cliente).

Como parte del proyecto final se resolverá el problema descrito en [este sitio](https://www.kaggle.com/c/walmart-recruiting-trip-type-classification/data), siguiendo la metodología CRISP-DM aprendida en clases de Minería y Análisis de Datos.

**2. Determinación del objetivo: definición del problema**

*Walmart* ha categorizado los viajes contenidos en sus datasets en 38 distintos tipo de viajes. El objeto del presente trabajo es recrear la clasificación realizada por *Walmart*, mediante el empleo de técnicas de machine learning.

Para ello, *Walmart* proporciona 2 conjuntos de datos:

+ Un conjunto de entrenamiento (train.csv), con datos previamente clasificados. En este conjunto los datos ya tienen TripTypr (trip type) asignado.
+ Un conjunto de prueba (test.csv), sin clasificar; es decir, sin el campo: trip_type.


**3. Determinación de criterio de éxito (i.e. superar benchmark de modelos que utilizan datos sin preprocesar)**

Las predicciones son evaluadas con una pérdida logarítmica multi clase. Para cada visita, se deberá entregar un cojunto de probabilidades estimadas (uno para cada trip_type). La fórmula empleada es:

$$-\frac{1}{N}\sum_{i=1}^{N} \sum_{j=1}^{M} y_{ij} log(p_{ij})$$

donde $N$ es el número de visitas  del conjunto de prueba,  $M$ es el número de TripTypr, $log$ el logaritmo natural, $y_{ij}$ es 1 si la observación $i$ es de clase $j$ y $0$ en otros casos, y $p_{ij}$ es la probabilidad estimada de que la observación $i$ pertenezca a la clase $j$.


**4. Sobre los datos**
Los archivos train.csv y test.csv tienen exactamente el mismo formato, con las mismas variables, exceptuando TripTypr.

El archivo train.csv tiene 647,054 registros con 95,674 visitas distintas.

Cada registro representa la compra de un producto y contiene los siguentes campos:


|Variable|Description|
|--|--|
|TripTypr| Identificador categórico que representa el tipo de visita que realizó el cliente|
|VisitNumber| Número identificador de la visita a la que pertenece la compra.|
|Weekday| Día de la semana en el cuál se realizó la compra|
|Upc| Identificador del producto comprado|
|ScanCount| Número del unidades compradas de cada producto; un valor negativo significa que el producto fue devuelto|
|DepartmentDescription| Descripción del departamento de origen del producto|
|FinelineNumber| Variable categórica creada por Walmart, mediante el cuál se clasifican los productos en diversas categorías|


Cada visita puede contener un número variable de compras de distintos productos en distintos departamentos, incluyendo devoluciones (representadas con número negativos en la columna ScanCount).

**5. Sobre el negocio**

Walmart es una corporación multinacional de tiendas de origen estadounidense donde se pueden comprar y devolver distintos tipos de productos, pagarlos juntos al salir en la caja principal.

Una visita (VisitNumber) representa una de estas compras globales. Así, una visita puede tener asociada compras y devoluciones (ScanCount) de una o más unidades de distintos productos pertenecientes a distintos departamentos (DepartmentDescription). Las visitas son representadas en el conjunto de datos, y son las que deben ser clasificadas en TripTypr.

Conceptualmente, sabemos que un TripTypr determina el tipo de visita. 

**6. Plan de Proyecto**

<p align="center">
  <image width="230" height="600" src="https://github.com/valencig/final-mineria/blob/master/imagenes/plan_trabajo.png">
</p>

</div>
