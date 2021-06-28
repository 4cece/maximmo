<?php

include("connectbdd.php");


$sql = "SELECT *, cm.nom AS commune, typ.nom AS typeBien, GROUP_CONCAT(opt.nom SEPARATOR ' | ') AS logement_options, GROUP_CONCAT(DISTINCT(images.fichier)) AS logement_images 
FROM logement lg 
JOIN type_de_bien typ ON typ.id=lg.logement_type 
JOIN commune cm ON cm.id=lg.commune_id 
JOIN departement dep ON dep.id=cm.departement_id 
JOIN region reg ON reg.id=dep.id 
LEFT JOIN logement_option lgopt ON lgopt.logement_id=lg.id 
LEFT JOIN optionTb opt ON opt.id=lgopt.option_id 
LEFT JOIN images ON images.logement_id = lg.id GROUP BY lg.id";

$req = $bdd->prepare($sql);
$req->execute();

$datas = $req->fetchAll(PDO::FETCH_ASSOC);
// echo"<pre>";
// print_r($datas);
// echo"</pre>";
echo json_encode($datas);
 //var_dump($datas);