<?php

require_once "connect.php";


// ajout d'un nouveau message
if(array_key_exists("envoyer", $_POST)){


    // formatage des champs avant leur insertion en base de données
    $nom = trim($_POST["nom"]);
    $mail = strtolower($_POST["mail"]);
    $message = $_POST["message"];

    // validation des données
    $data = ["errors" => []];
    // si le nom et prénom ne sont pas remplis
    if ($nom == "") {
        $data["errors"][] = "Merci de compléter le champ nom et prénom";
    }
    // si le mail est pas rempli
    if ($mail == "") {
        $data["errors"][] = "Merci de compléter le champs mail";
    }
    // si le message n'est pas rempli
    if ($message == "") {
        $data["errors"][] = "Merci de compléter le champ message";
    }
    // preg_match pour format email
    $regex= '/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([\w]+\.)+[a-zA-Z]{2,}))$/';
    if (!preg_match($regex, $mail)) {
        $data["errors"][] = "Merci de renseigner un email valide";
    }


    // le formulaire est valide
    if (empty($data["errors"])) {

        //préparation de la requête PDO pour éviter les injections SQL
        $sql = "INSERT INTO messages  VALUES (null, ? , ? , ? , NOW())";

        $request = $pdo->prepare($sql);

        // Insertion des lignes en BDD, l'ordre des variables correspond à celui des "?"
        $request->execute( [$_POST["nom"], $_POST["mail"], $_POST["message"]] );

        //si mail valide, on envoie le message
        mail($mailer_sendTo, "Envoi depuis page Contact", $_POST["message"], "From : " . $_POST["mail"]);

        header("location: ../index.php?envoye=1#contact");
    } else {
        $data["nom"] = $_POST["nom"];
        $data["mail"] = $_POST["mail"];
        $data["message"] = $_POST["message"];
        header("location: ../index.php?".http_build_query($data)."#contact");
    }
}