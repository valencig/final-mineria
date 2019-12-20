# Walmart Classification Problem: Trabajo final de Minería y Análisis de Datos


*Contribuidores:*

+ Daniela Pinto Veizaga
+ Javier Valencia Goujon
+ Mario Cruz García
+ Miguel Ávila del Bosque 

***

## Objetivo:

El presente repositorio busca resolver el problema descrito en [Kaggle](https://www.kaggle.com/c/walmart-recruiting-trip-type-classification/data) siguiendo la metodología CRISP-DM. Los entregables de cada etapa son:

+ [Comprensión del negocio](https://github.com/valencig/final-mineria/blob/master/comprehension_negocio.md) (R Markdown)  

    + Antecedentes
    + Determinación del objetivo
    + Determinación de criterio de éxito (i.e. superar benchmark de modelos que utilizan datos sin preprocesar)
    + Plan del proyecto

+ Comprensión de los datos (R - Bash)  

    + Reporte reproducible de recolección de datos.
    + Análisis exploratorio de datos (reporte reproducible)
    + Univariado
    + Bivariado
    + Multivariado

_Para esta sección, se desarrollo un modelo exploratorio de datos (EDA), con el propósito de conocer el comportamiento de las variables y encontrar tendencias en los datos para el análisis porsterio._ _Igualmente, se realizó un análisis ROC y PCA (Componentes principales) para determinar las variables más importantes y explicativas para nuestra variable de interés._


_Para esta sección, se desarrollo un modelo exploratorio de datos (EDA), con el propósito de conocer el comportamiento de las variables y encontrar tendencias en los datos para el análisis porsterio._ _Igualmente, se realizó un análisis ROC y PCA (Componentes principales) para determinar las variables más importantes y explicativas para nuestra variable de interés._

_Se puede ver el desarrollo completo de esta sección en:_

    + **[comprehension_datos.html](https://github.com/valencig/final-mineria/blob/master/comprehension_datos.html)**
    + **[exploratorio_datos.html](https://github.com/valencig/final-mineria/blob/master/exploratorio_datos.html)**
    + **[EDA_ROC_PCA.html](https://github.com/valencig/final-mineria/blob/master/EDA_ROC_PCA.html)**

+ [Preparación de los datos](https://github.com/valencig/final-mineria/tree/master/codigoR-Bash] (R - Bash) 

+ Reporte reproducible de selección e integración de datos
+ Reporte reproducible de limpieza de datos (incluyendo imputación)
+ Reporte reproducible de ingeniería de características

_Para la preparación de los datos, primeramente se descargaron desde la página de **Kaggle** con ayuda de bash._

+ [Modelado](https://github.com/valencig/final-mineria/blob/master/4-5.%20Modelo%20y%20Evaluaci%C3%B3n.ipynb) (Python)  
    + Diseño de prueba de modelo
    + Selección de modelo (benchmark de modelos seleccionados)
    + Ajuste de hiperparámetros óptimo

_Esta sección, fue desarrollada en python. Se ejecutaron diversos modelos con el conjunto de entrenamiento para la posterior prueba con el conjunto correspondiente._


+ [Evaluación](https://github.com/valencig/final-mineria/blob/master/4-5.%20Modelo%20y%20Evaluaci%C3%B3n.ipynb) (Python)  
    + Evaluación del modelo final contra el conjunto de prueba
    + Reentrenamiento final de modelo con datos de entrenamiento y prueba con hiperparámetros optimizados.
    + Generación y carga de datos de prueba en Kaggle (reporte de posición final en tablero)


+ [Implantación](https://github.com/valencig/final-mineria/tree/master/flask) (Python)  

Desarrollo de web service en flask para predecir resultados a partir de nuevos datos
Reporte ejecutivo final con principales hallazgos e hitos del proyecto (5 minutos)



