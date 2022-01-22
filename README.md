# Mapa Interativo Furg


The Mapa Interativo Furg (Furg Interactive Map) project aims to expand the experience of the academic community, contribute to the sense of belonging of the different actors, allow a better experience for visitors, both in events and in routine activities at the University.

Created by: **Caio Beraldi Ribeiro**

* Github: [@caiobribeiro](https://github.com/caiobribeiro)
* LinkedIn: [@caiobribeiro](http:\/\/linkedin.com\/in\/caiobribeiro)
* Email: caio_ribeiro@protonmail.com

## Features

- Visualize university buildings and events; 
- Creation of account with a university email; 
- Creation of public events; 
- Search of phones in the university's API.

This application's map is based in the [Oficial Map] of Carreiros Campus.

![alt text](https://proinfra.furg.br/images/FILES/Mapa_carreiros.jpg)



## Tech

Mapa Interativo Furg uses a number of open source projects to work properly:

- [Flutter] -Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase;
- [Flutter Modular] - Modular is a solution to modularize the route and dependency injection system, making each scope have its own routes and injections independent of any other factor in the structure. We create objects to group the Routes and Injections and call them Modules;
- [Parse Serve] - Parse Server is an open source backend that can be deployed to any infrastructure that can run Node.js;
- [MobX] - MobX is a state-management library that makes it simple to connect the reactive data of your application with the UI.


## Installation

Fallow the oficial [Google installation guide], than clone this repo e and in the root project folder get all the dependecies.

Install the dependencies and devDependencies.

```sh
cd furg_interactive_map
flutter pub get
```

Now your IDE should not show any errors.




## Development

Want to contribute? Great! 

For development will be necessary run the build runner, open your favorite Terminal and run these commands.

```sh
cd furg_interactive_map
flutter packages pub run build_runner watch
```

This will observe for change in stores files and update every time is saved.

## License

MIT

**Free Software, Hell Yeah!**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

[Oficial Map]: <https://proinfra.furg.br/mapa-do-campus.html>
[Flutter]: <https://flutter.dev/>
[Flutter Modular]: <https://modular.flutterando.com.br/docs/flutter_modular/start/>
[Parse Serve]: <https://parseplatform.org/>
[MobX]: <https://pub.dev/packages/mobx> 
[Google installation guide]: <https://docs.flutter.dev/get-started/install>

