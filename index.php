<?php

require_once "php/connect.php";


// récupération des formations
$sql = "SELECT * FROM formations ORDER BY annee_obtention";

// on lance la requête préparée
$request = $pdo->prepare($sql);
$request->execute();

// on met en forme les résultat dans le tableau $formations
$formations = $request->fetchAll(PDO::FETCH_ASSOC);



// récupération des expériences d'éduc
$sql = "SELECT * FROM experiences WHERE domaine='social' ORDER BY date_debut";

// on lance la requête préparée
$request = $pdo->prepare($sql);
$request->execute();

// on met en forme les résultat dans le tableau $social
$social = $request->fetchAll(PDO::FETCH_ASSOC);
$social = formatDate($social, "date_debut");
$social = formatDate($social, "date_fin");



// récupération des expériences de GP
$sql = "SELECT * FROM experiences WHERE domaine='RH' ORDER BY date_debut";

// on lance la requête préparée
$request = $pdo->prepare($sql);
$request->execute();

// on met en forme les résultat dans le tableau $RH
$RH = $request->fetchAll(PDO::FETCH_ASSOC);
$RH = formatDate($RH, "date_debut");
$RH = formatDate($RH, "date_fin");



// récupération des expériences d'informatique
$sql = "SELECT * FROM experiences WHERE domaine='informatique' ORDER BY date_debut";

// on lance la requête préparée
$request = $pdo->prepare($sql);
$request->execute();

// on met en forme les résultat dans le tableau $info
$info = $request->fetchAll(PDO::FETCH_ASSOC);
$info = formatDate($info, "date_debut");
$info = formatDate($info, "date_fin");





//formatage des dates en format européen
function formatDate($array, $dateKey){
    foreach ($array as $cle => $valeur) {
        if (array_key_exists($dateKey, $valeur)) {
            $array[$cle][$dateKey] = date("d/m/Y", strtotime($valeur[$dateKey]));
        }
    }
        return $array;
}






// récupération des compétences
$sql = "SELECT * FROM competences";

// on lance la requête préparée
$request = $pdo->prepare($sql);
$request->execute();

// on met en forme les résultat dans le tableau $competences
$competences = $request->fetchAll(PDO::FETCH_ASSOC);




// récupération des qualités
$sql = "SELECT * FROM qualites";

// on lance la requête préparée
$request = $pdo->prepare($sql);
$request->execute();

// on met en forme les résultat dans le tableau $qualites
$qualites = $request->fetchAll(PDO::FETCH_ASSOC);




// récupération des projets
$sql = "SELECT * FROM projets";

// on lance la requête préparée
$request = $pdo->prepare($sql);
$request->execute();

// on met en forme les résultat dans le tableau $projets
$projets = $request->fetchAll(PDO::FETCH_ASSOC);



// récupération des variables de formulaire de contact
$errors = [];
if (array_key_exists("errors", $_GET)) {
    $errors = $_GET["errors"];
}
$mail = "";
if (array_key_exists("mail", $_GET)) {
    $mail = $_GET["mail"];
}
$message = "";
if (array_key_exists("message", $_GET)) {
    $message = $_GET["message"];
}
$nom = "";
if (array_key_exists("nom", $_GET)) {
    $nom = $_GET["nom"];
}



include "index.phtml";
