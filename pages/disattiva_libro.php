<?php
include("../share/funzioni2_1.php");

$id_libro = $_GET["id_libro"];

eseguiQuery("UPDATE ct_libri_testo SET disattivato=1 where id_libro_testo=$id_libro");
	
header("location:./libri.php")
?>
