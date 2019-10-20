<?php

require_once "php/connect.php";


// récupération des formations
$formations = $dbConnector->executeQuery("SELECT * FROM formations ORDER BY annee_obtention");

// récupération des expériences d'éduc
$social = $dbConnector->executeQuery("SELECT * FROM experiences WHERE domaine='social' ORDER BY date_debut");
$social = formatDate($social, "date_debut");
$social = formatDate($social, "date_fin");



// récupération des expériences de GP
$RH = $dbConnector->executeQuery("SELECT * FROM experiences WHERE domaine='RH' ORDER BY date_debut");
$RH = formatDate($RH, "date_debut");
$RH = formatDate($RH, "date_fin");



// récupération des expériences d'informatique
$info = $dbConnector->executeQuery("SELECT * FROM experiences WHERE domaine='informatique' ORDER BY date_debut");
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
$competences = $dbConnector->executeQuery("SELECT * FROM competences");

// récupération des qualités
$qualites = $dbConnector->executeQuery("SELECT * FROM qualites");

// récupération des projets
$projets = $dbConnector->executeQuery("SELECT * FROM projets");



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
