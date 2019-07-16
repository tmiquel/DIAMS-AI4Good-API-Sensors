AI for good / DIAMS
Sensor measurements API


Schéma relationnel :


Capteurs :
Les capteurs utilisés sont les SDS011 produits par Nova Fitness, et permettent une mesure rapide et précise de la concentration en μg/m³ de particules fines (PM2.5 et PM10) de l'air.
Les particules sont détectées à partir d'un diamètre de 0.3μm et les mesures sont réalisées pour des concentrations allant jusqu'à 999.99μg/m³ avec une erreur relative de 10%.

L'api DIAMS sensor measurements for good est une plateforme recueillant les données produites par des capteurs mobiles de particules fines.
Les données sont accessibles sur l'url suivante http://simple-ai4good-sensors-api.herokuapp.com/data dans un format JSON.
Il est également possible d'associer une position à une mesure en suivant la démarche suivante :
  1 _ téléchargement de l'application ==> https://play.google.com/store/apps/details?id=com.mendhak.gpslogger&hl=fr
  2 _ dans l'onglet 'détails de l'enregistrement', puis dans 'envoyer les fichiers vers une url personnalisée', entrer les données suivantes :
    url : http://simple-ai4good-sensors-api.herokuapp.com/locations?device={{{METTRE LE NOM DU DEVICE ICI SANS LES ACCOLADES}}}&latitude=%LAT&longitude=%LON
    entête HTTP : Content-type: application/json
    methode HTTP : POST
    -- laisser les autres champs vides.
  3 _ dans 'envoyer auto couriel et téléchargement',
autoriser l'envoi automatique, puis dans 'combien de fois?' entrer en minutes la fréquence (strictement positive) à laquelle seront envoyées les positions.

Les données de géolocalisation sont accessibles sur l'url http://simple-ai4good-sensors-api.herokuapp.com/locations et affichent la mesure correspondante sur la carte (http://simple-ai4good-sensors-api.herokuapp.com/) à condition que moins d'une minute sépare l'enregistrement sur l'API de la mesure et celle de la localisation.

