<?php
include("../share/funzioni2_1.php");

$id_materia = $_GET["nome_materia"];
$nome_argomento = $_GET["nome_argomento"];
$id_argomento = htmlspecialchars($_GET["id_argomento"]);


if($id_argomento==0) {
	$id_mat=eseguiInsert("insert into ct_argomenti(nome_argomento,fk_materia) values('$nome_argomento',$id_materia)");
	
	echo "Argomento inserito correttamente";
}
else {
	eseguiQuery("UPDATE ct_argomenti SET nome_argomento='$nome_argomento',fk_materia=$id_materia WHERE id_argomento=$id_argomento");
	echo "Argomento modificato correttamente";
	

}
?>
