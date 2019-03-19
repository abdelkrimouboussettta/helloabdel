<?php
//connexion à la base de données
$link = new PDO("mysql:host=localhost;port=3306;dbname=france","root","");
$link->exec("SET CHARACTER SET UTF8");
$reg=$_GET["reg"];
if (strlen($reg)>0) {
	$sql="select * from departement where region_code=:reg order by name";
	$statement = $link->prepare($sql);
	$statement->bindParam(":reg",$reg,PDO::PARAM_STR);
} else {
	$sql="select * from departement order by name";
	$statement = $link->prepare($sql);
}
$statement->execute();
while ($row=$statement->fetch(PDO::FETCH_ASSOC)) {	
	extract($row);
	echo "<option value='$departement_code'>$name ($departement_code)</option>";
}
?>