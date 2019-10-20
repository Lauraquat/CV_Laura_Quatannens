<?php

require_once('config.php');
require_once('DatabaseConnector.php');

$dbConnector = new DatabaseConnector($db_host, $db_port, $db_name, $db_user, $db_password);
