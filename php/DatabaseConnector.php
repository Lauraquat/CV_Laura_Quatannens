<?php

class DatabaseConnector{

    protected $pdo;

    public function __construct($db_host, $db_port, $db_name, $db_user, $db_password)
    {
        $this->pdo = new PDO('mysql:host='.$db_host.';port='.$db_port.';dbname='.$db_name.';charset=utf8', $db_user, $db_password);

        // active l'affichage des erreurs PDO
        $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $this->pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    }

    public function executeQuery($query)
    {
        // on lance la requête préparée pour la récupération des données de la BDD
        $request = $this->pdo->prepare($query);
        $request->execute();

        // on met en forme les résultat dans le tableau
        return $request->fetchAll(PDO::FETCH_ASSOC);
    }

    public function insertQuery($query, array $insertParams)
    {
        //on lance la requête préparée pour l'envoi du mail
        $request = $this->pdo->prepare($query);

        //on passe les variables à insérer dans la BDD
        return $request->execute($insertParams);

    }
}