<?php
include("../share/funzioni2_1.php");

$id_materia = $_GET["id_materia"];
$nome_materia = $_GET["nome_materia"];


if($id_materia==0) {
	$id_mat=eseguiInsert("insert into ct_materie(nome_materia) values('$nome_materia')");
	
	echo "Materia inserita correttamente";
}
else {
	eseguiQuery("UPDATE ct_materie SET nome_materia='$nome_materia' WHERE id_materia=$id_materia");
	echo "Materia modificata correttamente";
	

}
?>
