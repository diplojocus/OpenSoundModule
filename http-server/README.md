# HTTP server (REST & JSON) on [Spark core](https://www.spark.io/)
![alt text](https://s3.amazonaws.com/spark-website/spark.png "")
## EN : Local HTTP server (REST & JSON) for Sparkcore

This project implement a Http server on Sparkcore itself. Once compiled into the [Web IDE](https://www.spark.io/build), the server will be available at http://IP-SPARKCORE (port 80 by default).

### Common files of projects :
- slre.h
- slre.cpp
- HttpResponse.h
- HttpResponse.cpp
- HttpRequest.h
- HttpRequest.cpp
- http_parser.h
- http_parser.cpp
- SparkTime.h
- SparkTime.cpp

Thanks to :
- [SLRE: Super Light Regular Expression library](https://github.com/cesanta/slre)
- [Marcussacapuces91 Github / SparkCore-RESTserver ](https://github.com/Marcussacapuces91/SparkCore-RESTserver)
- [Joyent Github/ http-parser](https://github.com/joyent/http-parser)

### Projet "spark-Web-Tinker.ino"

- RESTFull URL : http://IP-Sparkcore/D0/on|off
- Digital JSON URL : http://IP-Sparkcore/json/dig/
- Return : {"TS":20140802091229,"D0":0,"D1":0,"D2":0,"D3":0,"D4":0,"D5":0,"D6":0,"D7":1}
- Analog JSON URL : http://IP-Sparkcore/json/ana/
- Return : {"TS":20140802091252,"A0":2127,"A1":2117,"A2":2097,"A3":2098,"A4":2107,"A5":2114,"A6":2083,"A7":2085}

### Installation
- [Connect the Spark Core to your wifi](https://www.spark.io/start)
- [Deploy the firmware using the Spark Cloud](https://www.spark.io/build/)
- How add files in project :

![Add file](http://domotique-info.fr/wp-content/uploads/2014/04/domotique-info-webideaddlib.gif)

## FR : Serveur HTTP REST et JSON pour Spark Core.

Ce projet permet de mettre en oeuvre un serveur sur le Spark core lui-même.
Un fois compilé dans le [Web IDE](https://www.spark.io/build), le serveur sera accessible à l'adresse http://IP-SPARKCORE (port :80 par défaut). Ce projet est un exemple permettant d'envisager d'autres projet.

Fichiers communs des projets (Rappel .h = fichier d'entête, .cpp = fichier de définition [Sources]) :
- slre.h
- slre.cpp
- HttpResponse.h
- HttpResponse.cpp
- HttpRequest.h
- HttpRequest.cpp
- http_parser.h
- http_parser.cpp
- SparkTime.h
- SparkTime.cpp

Remerciements à :
- [SLRE: Super Light Regular Expression library](https://github.com/cesanta/slre)
- [Marcussacapuces91 Github / SparkCore-RESTserver ](https://github.com/Marcussacapuces91/SparkCore-RESTserver)
- [Joyent Github/ http-parser](https://github.com/joyent/http-parser)

### Projet "spark-Web-Tinker.ino"

- RESTFull URL : http://IP-Sparkcore/D0/on|off.
- Digital JSON URL : http://IP-Sparkcore/json/dig/
- Retour : {"TS":20140802091229,"D0":0,"D1":0,"D2":0,"D3":0,"D4":0,"D5":0,"D6":0,"D7":1}
- Analog JSON URL : http://IP-Sparkcore/json/ana/
- Retour : {"TS":20140802091252,"A0":2127,"A1":2117,"A2":2097,"A3":2098,"A4":2107,"A5":2114,"A6":2083,"A7":2085}

### Installation
- [Connecter le Spark Core à votre Wifi](https://www.spark.io/start)
- [Déployer le firmware depuis le Web IDE Spark Cloud](https://www.spark.io/build/)
- Comment ajouter les fichiers dans le projet :

![Add file](http://domotique-info.fr/wp-content/uploads/2014/04/domotique-info-webideaddlib.gif)

Old GUI version :

<a href="http://www.youtube.com/watch?feature=player_embedded&v=ifYkC7UdMVA
" target="_blank"><img src="http://img.youtube.com/vi/ifYkC7UdMVA/0.jpg" 
alt="Aller sur Youtube" width="560" border="10" /></a>

<a href="http://www.youtube.com/watch?feature=player_embedded&v=bbSlwt5ZI3Q
" target="_blank"><img src="http://img.youtube.com/vi/bbSlwt5ZI3Q/0.jpg" 
alt="Aller sur Youtube" width="560" border="10" /></a>

[Youtube video 1](https://www.youtube.com/watch?v=ifYkC7UdMVA)
[Youtube video 2](http://youtu.be/bbSlwt5ZI3Q)

