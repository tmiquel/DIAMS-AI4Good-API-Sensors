<h1 align="center">AI for good / DIAMS</h1>
<h2 align="center">Sensor measurements API</h2>

<br />
<br />
<h4>Table des matières</h4>
<ul>
<li><a href="#scheme">Schéma relationnel</a></li>
<li><a href="#sensors">Capteurs</a></li>
<li><a href="#locations">Localisation</a></li>
<li><a href="#api">API</a></li>
</ul>
<br />
<h3 name="scheme">Schéma relationnel :</h3>
<p> Datum contient l'ensemble des mesures envoyées par les capteurs. L'attribut device renseigne le nom du capteur. </p>
<p> LastDatum contient la dernière mesure envoyée par un capteur. Elle a donc autant de lignes qu'il y a de capteurs. </p>
<p> Locations contient les mesures GPS envoyées par les téléphones des porteurs de capteurs. Cette mesure est automatiquement renseignée dans les attributs "latitude" et "longitude" de la table Data </p>

<img src="https://zupimages.net/up/19/29/09qm.jpg" alt="a relationnale scheme showing 3 tables: Datum(ID, timestamp, device, PM2_5, PM10, positive_feeling, mixed_feeling, negative_feeling, latitude & longitude), LastDatum(ID, timestamp, device, PM2_5, PM10, positive_feeling, mixed_feeling, negative_feeling, latitude & longitude), and Location(ID, timestamp, device, latitude & longitude).">
<br />
<hr />
<h3 name="sensors">Capteurs :</h3>
<p>Les capteurs utilisés sont les SDS011 produits par Nova Fitness. Ils permettent une mesure rapide et précise de la concentration de l'air en μg/m³ de particules fines (PM2.5 et PM10).
Le capteur détecte les particules supérieures à un diamètre de 0.3μm et les mesures sont réalisées pour des concentrations allant jusqu'à 999.99μg/m³ avec une marge d’erreur de 10%.</p>
<p> http://www.inovafitness.com/en/a/chanpinzhongxin/95.html </p>
<p> La position GPS provient de la puce GPS du téléphone de l'utilisateur. Celle-ci est envoyée via les applications 

<br />
<hr />
<h3 name="locations">Localisation :</h3>(http://simple-ai4good-sensors-api.herokuapp.com/)</br>
<img src='https://zupimages.net/up/19/29/8be3.jpg' alt='world map picture' />
<p>Pour obtenir une qualité de données optimale il faut y associer la position géographique à l’aide d’une application
  <br>
  <h3>Android</h3>
  <ul>
  <li>0) Activez la géolocalisation du téléphone
  <li>1) Téléchargez l'application ==> https://play.google.com/store/apps/details?id=com.mendhak.gpslogger&hl=fr ou allez dans Google      Play et téléchargez « GPS léger (GPSLogger) </li></br>
    <img src="https://zupimages.net/up/19/30/te6d.png" alt='gpslogger'/></br>
  <li>2) Une fois l'application téléchargée autorisez les conditions d’utilisation et le partage de géolocalisation. Puis allez dans le menu en haut à gauche</li> 
  <li>3) Cliquez sur « détails de l’enregistrement » , puis cliquez sur « envoyer les fichiers vers une url personnalisée</li>
  <li>4) Cliquez sur Url qui se situe tout en haut de la liste; entrez l’url suivant en remplaçant nomdudevice par le nom de votre capteur : http://simple-ai4good-sensors-api.herokuapp.com/locations?device=nomdudevice&latitude=%LAT&longitude=%LON une fois l’adresse entrée cliquez sur ok</li>
  <li>5) Puis cliquez sur « entête HTTP » taper : Content-type: application/json</li>
  <li>6) Finalement, dans « methode HTTP », écrivez : POST</li>
  <li>7) Revenez dans « menu » et allez sur « envoyer auto couriel et téléchargement », activez « autoriser l'envoi automatique », puis dans 'combien de fois?', entrez 1 et cliquez sur ok</li>
  <li>8) C’est bon vous pouvez maintenant « démarrer l’enregistrement » quand vous mesurez la qualité de l’air</li>
  Les données de géolocalisation sont accessibles sur le site http://simple-ai4good-sensors-api.herokuapp.com/locations et le site suivant affichent la mesure correspondante sur la carte (http://simple-ai4good-sensors-api.herokuapp.com/) à condition que moins d'une minute sépare l'enregistrement sur l'API de la mesure de particules fines et celle de la localisation.</p>
<br />
<hr />
<h3>iOS</h3>
<li>0) Activez la géolocalisation du téléphone
<li>1) Téléchargez l'application ==> https://apps.apple.com/us/app/overland-gps-tracker/id1292426766 ou allez dans Apple Store et téléchargez « Overland GPS Tracker »</li></br>
<img src="https://zupimages.net/up/19/30/p3hh.png" alt='overland app'/></br>
<li>2) Une fois l'application téléchargée autorisez Overland à accéder à vos mouvements et vos activités physiques. Puis allez dans settings</li>
<li>3) Ajustez les réglages comme sur la capture d’écran ci-dessous</li></br>
<img src="https://zupimages.net/up/19/30/yc1f.jpg" alt='settings overland'/></br>
<li>4) Cliquez sur Receiver Endpoint qui se situe tout en haut de la liste; entrez l’url suivant dans « set receiver endpoint URL » en remplaçant nomdudevice par le nom de votre capteur : http://simple-ai4good-sensors-api.herokuapp.com/locations?device=nomdudevice une fois l’adresse entrée cliquez sur save</li>
<li>5) C’est bon vous pouvez maintenant « démarrer l’enregistrement » et régler send intervalle sur 1m</li>
<hr />
<h3 name="api">API</h3>
  Nos données sont libres de droit et accessible via des requêtes GET sur notre API:</br>
  https://simple-ai4good-sensors-api.herokuapp.com/data </br></br>

Il est possible d'appliquer des filtres aux requêtes.<br />
Pour l'instant, deux types de filtres sont appliquables :
<ul>
  <li>1) : Recherche par numéro d’entrée (numéro identifiant la mesure) dans la base donnée :</li>
  https://simple-ai4good-sensors-api.herokuapp.com/data/10 

  <li>2) : Recherche par nom de capteur :</li>
https://simple-ai4good-sensors-api.herokuapp.com/data?device=sensor8 
</ul>
</br>
<p> On peut également obtenir les autres bases de données (LastDatum & Locations) en utilisant les endpoints:
  <br>
  https://simple-ai4good-sensors-api.herokuapp.com/last_data </br>
  https://simple-ai4good-sensors-api.herokuapp.com/locations </p>
<hr /> 
  
