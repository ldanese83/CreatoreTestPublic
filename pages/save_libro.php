<?php
include("../share/funzioni2_1.php");

$id_libro = $_GET["id_libro_mod"];
$titolo_libro = $_GET["titolo_libro_mod"];
$autori = $_GET["autori_mod"];
$casa = $_GET["casa_mod"];

if($id_libro==0) {
	$id_lib=eseguiInsert("insert into ct_libri_testo(titolo_libro,casa_editrice,autori) values('$titolo_libro','$casa','$autori')");
	
	echo "Libro inserito correttamente";
}
else {
	eseguiQuery("UPDATE ct_libri_testo SET titolo_libro='$titolo_libro',casa_editrice='$casa',autori='$autori' WHERE id_libro_testo=$id_libro");
	echo "Libro modificato correttamente";
	

}
?>
