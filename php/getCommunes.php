<?php

require_once("connectbdd.php");

$req = $bdd->prepare("SELECT * FROM commune");
$req->execute();
$data = $req->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($data);