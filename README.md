# AppMarvelSwiftUI_IBautista
Práctica final del módulo "IOS Superpoderes" de SwiftUI.

La práctica ha consistido en la realización de una app para IOS, realizada con SwiftUI y utilizando combine y MVVM.
Consume la API de Marvel: https://developer.marvel.com/.

Se han realizado dos llamadas:
- Una de personajes, para la pantalla principal de la app, donde se muestra el listado de personajes:
  <img width="318" alt="image" src="https://github.com/inmiti/AppMarvelSwiftUI_IBautista/assets/118215654/ee96269d-9257-4fa7-a6b7-f1022091230d">


- Otra de listado de series para el personaje seleccionado, para la vista de series:
  <img width="323" alt="image" src="https://github.com/inmiti/AppMarvelSwiftUI_IBautista/assets/118215654/41d058e8-986a-4664-8703-a6d1442fd645">

Podemos seleccionar cualquier personaje y navegar a la vista de series, donde podemos ver las series del personaje sobre el que hacemos tap.

Para la navegación se han empleado Status box, consiguiendo una vista de loading (LoaderView) antes de cada pantalla, así como una vista de error (ErrorView) en dicho caso, también para cada pantalla: 

En el caso de la LoaderView se ha incluido una animación, en la que la imagen gira. 
<img width="250" alt="image" src="https://github.com/inmiti/AppMarvelSwiftUI_IBautista/assets/118215654/c205a5ea-28bf-4aaa-a7e3-77e52f58ae46">

En la ErrorView se incluye un botón para volver a la loaderView:
<img width="243" alt="image" src="https://github.com/inmiti/AppMarvelSwiftUI_IBautista/assets/118215654/c13b2f1b-2a60-4403-87c8-3c2b2ac2c18e">

Por último se ha incluido testing consiguiendo una covertura del 66,8 %, de forma que se han realizado test tanto sobre los modelos, los viewModels y las UI, para éstas últimas se ha utilizado la libería ViewInspector. 
