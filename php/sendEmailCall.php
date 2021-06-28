<?php


require_once("connectbdd.php");

$dataPhone = htmlspecialchars($_POST["number"]);
$timestamp = htmlspecialchars($_POST["timestamp"]);

$dataPhone = str_replace("-", "", $dataPhone);
$dataPhone = str_replace(".", "", $dataPhone);

$arrayAllowed = [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

$arrayPhone = str_split($dataPhone);
$verif = 0;
foreach ($arrayPhone as $number){
    if(in_array($number, $arrayAllowed)){
        $verif += 0;
    }else{
        $verif += 1;
    }
}

if($verif !== 0){
    die;
}

// REQUETE 
$req = $bdd->prepare("INSERT INTO rappels (telephone, timestamp) VALUES (?, ?)");
$req->execute([
    $dataPhone,
    $timestamp
]);

