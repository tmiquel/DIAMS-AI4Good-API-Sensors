<h1 align="center">AI for good / DIAMS</h1>
<h2 align="center">Sensor measurements API</h2>

<em>Schéma relationnel :</em>
<img src="https://zupimages.net/up/19/29/09qm.jpg" alt="a relationnale scheme showing 3 tables: Datum(ID, timestamp, devise, PM2_5, PM10, positive_feeling, mixed_feeling, negative_feeling, latitude & longitude), LastDatum(ID, timestamp, devise, PM2_5, PM10, positive_feeling, mixed_feeling, negative_feeling, latitude & longitude), and Location(ID, timestamp, device, latitude & longitude).">
<br />
<hr />
<em>Capteurs :</em>
<p>Les capteurs utilisés sont les SDS011 produits par Nova Fitness. Ils permettent une mesure rapide et précise de la concentration de l'air en μg/m³ de particules fines (PM2.5 et PM10).
Le capteur détecte les particules supérieures à un diamètre de 0.3μm et les mesures sont réalisées pour des concentrations allant jusqu'à 999.99μg/m³ avec une marge d’erreur de 10%.</p>
<p> http://www.inovafitness.com/en/a/chanpinzhongxin/95.html </p>
<br />
<hr />
<em>Localisation :</em>
<img src='https://zupimages.net/up/19/29/8be3.jpg' alt='world map picture' />
<p>Pour obtenir une qualité de données optimale il faut y associer la position géographique à l’aide d’une application disponible sur Android:
  <ul><li>1) Téléchargez l'application ==> https://play.google.com/store/apps/details?id=com.mendhak.gpslogger&hl=fr</li>
  <li>2) Une fois l'application téléchargée, allez dans le menu en haut à gauche</li> 
  <li>3) Cliquez sur « détails de l’enregistrement » , puis cliquez sur « envoyer les fichiers vers une url personnalisée</li>
  <li>4) Cliquez sur Url qui se situe tout en haut de la liste; entrez l’url suivant en remplaçant nomdudevice par le nom de votre capteur : http://simple-ai4good-sensors-api.herokuapp.com/locations?device=nomdudevice&latitude=%LAT&longitude=%LON une fois l’adresse entrée cliquez sur ok</li>
  <li>5) Puis cliquez sur « entête HTTP » taper : Content-type: application/json</li>
  <li>6) Finalement, dans « methode HTTP », écrivez : POST</li>
  <li>7) Revenez dans « menu » et allez sur « envoyer auto couriel et téléchargement », activez « autoriser l'envoi automatique », puis dans 'combien de fois?', entrez 1 et cliquez sur ok</li>
  <li>8) C’est bon vous pouvez maintenant « démarrer l’enregistrement » quand vous mesurez la qualité de l’air</li>
  Les données de géolocalisation sont accessibles sur le site http://simple-ai4good-sensors-api.herokuapp.com/locations et le site suivant affichent la mesure correspondante sur la carte (http://simple-ai4good-sensors-api.herokuapp.com/) à condition que moins d'une minute sépare l'enregistrement sur l'API de la mesure de particules fines et celle de la localisation.</p>
<br />
<hr />
