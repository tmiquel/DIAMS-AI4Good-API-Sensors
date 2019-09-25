<h1 align="center">AI for good / DIAMS</h1>
<h2 align="center">Sensor measurements API</h2>

<br />
<br />
<h4>Table des matières</h4>
<ul>
<li><a href="#objectif">Objectif</a></li>
<li><a href="#acquisition">Acquisition</a></li>
<li><a href="#bdd">Base de données</a></li>
<li><a href="#sensors">Capteurs</a></li>
<li><a href="#api">API</a></li>
<li><a href="#userguide">User Guide</a></li>
</ul>

<br />
<h3 name="objectif">Objectif :</h3>
<p> L’objectif du dispositif est de mettre à disposition des mesures citoyennes de la qualité de l’air. Il repose sur les principes suivants :</p>
<ul>
<li> Acquisition de mesures locales par des capteurs avec une périodicité inférieure à une minute </li>
<li> Gestion et restitution locale des données mesurées </li>
<li> Localisation des mesures effectuées par l’acquisition des coordonnées GPS du dispositif de mesure </li> 
<li> Transfert des mesures à un serveur central de gestion des données </li>
<li> Stockage des mesures et de la localisation dans une base de données pour restitution, exploitation et analyse </li>
</ul>

<br />
<h3 name="acquisition">Acquisition :</h3>
<p> Les mesures sont effectuées par des capteurs fixes ou mobiles.</p>
<p> L’acquisition s’effectue à la périodicité définie soit par mesure unitaire, soit par mesures multiples (permet d’obtenir un niveau de qualité de la mesure). </p>
<p> Locations contient les mesures GPS envoyées par les téléphones des porteurs de capteurs. Cette mesure est automatiquement renseignée dans les attributs "latitude" et "longitude" de la table Data </p>

<br />
<h3 name="bdd">Base de donées :</h3>
<p> La base de données est une base non relationnelle constituée d’une table : </p>
<ul>
<li> Data: contient l'ensemble des mesures envoyées par les capteurs. L'attribut device renseigne le nom du capteur. </li>
</ul>

<hr />
<h3 name="sensors">Capteurs :</h3>
<p>Les capteurs utilisés sont les SDS011 produits par Nova Fitness. Ils permettent une mesure rapide et précise de la concentration de l'air en μg/m³ de particules fines (PM2.5 et PM10).
    Le capteur détecte les particules supérieures à un diamètre de 0.3μm et les mesures sont réalisées pour des concentrations allant jusqu'à 999.99μg/m³ avec une marge d’erreur de 10%.</p>
<p> http://www.inovafitness.com/en/a/chanpinzhongxin/95.html </p>
<p> La position GPS provient de la puce GPS du téléphone de l'utilisateur. Celle-ci est envoyée via les applications 

<br />
<hr />

<h3 name="api">API</h3>
    Nos données sont libres de droit et accessible via des requêtes GET sur notre API:</br>
    https://ai-for-good-api.herokuapp.com/api/v1/data </br></br>

Il est possible d'appliquer des filtres aux requêtes.<br />
Pour l'instant, deux types de filtres sont appliquables :
<ul>
    <li>1) : Rechercher la dernière entrée d’un device: </li>
    https://ai-for-good-api.herokuapp.com/api/v1/last?device=sensor10 

    <li>2) : Rechercher toutes les entrées d’un device: </li>
    https://ai-for-good-api.herokuapp.com/api/v1/data?page=1&device=sensor10
</ul>
</br>
<p> Afin de ne pas surcharger le serveur, nous avons paginé notre API et limiter l’affichage des données à 1000 par page. </p>
</br>
<p>Il est aussi possible de télécharger l’ensemble des données au format CSV via l’adresse suivante: http://ai-for-good-api.herokuapp.com/api/v1/data/csv </p>
<hr /> 

<h3 name="userguide">User guide :</h3></br>
<ul>
    <li>1) : Allumer le capteur en poussant le bouton sur la batterie de OFF à ON, si le capteur est bien allumé la led de votre sac clignote bleue et orange.

    <li>3) : Démarrer le partage de connexion pour que le capteur puisse envoyer les données, si le capteur est bien connecté a votre téléphone la led de votre sac sera bleue.

    <li>4) : Remplir à la fin de la semaine le questionnaire google : https://docs.google.com/forms/d/e/1FAIpQLSdlYLlr8v0lEt-U9dF-QmwiXogiOjbjZR2NPKCsbWGWxlJGBA/viewform?usp=sf_link

    <li>5) : Sur le groupe WhatsApp 'Geek for good' décrire son expérience et poster des photos. Si vous avez un problème n’hésitez pas à nous envoyer un message !
</ul>
