<?php
include("../share/funzioni2_1.php");

$id_libro = $_GET["id_libro"];

if($id_libro==0) {
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='titolo_libro_mod'>Titolo Libro</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='titolo_libro_mod' />";
	echo "</div></div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='casa_mod'>Casa editrice</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='casa_mod' />";
	echo "</div></div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='autori_mod'>Autori</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='autori_mod' />";
	echo "<input type='hidden' id='id_libro_mod' value='$id_libro' />";
	echo "</div>";
	echo "</div>";
}
else {

$dataset=eseguiQuery("select * from ct_libri_testo where id_libro_testo=$id_libro");

while($row=($dataset->fetch_assoc())) {

	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='titolo_libro_mod'>Titolo Libro</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='titolo_libro_mod' value='$row[titolo_libro]' />";
	echo "</div></div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='casa_mod'>Casa editrice</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='casa_mod' value='$row[casa_editrice]' />";
	echo "</div></div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='autori_mod'>Autori</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='autori_mod' value='$row[autori]' />";
	echo "<input type='hidden' id='id_libro_mod' value='$id_libro' />";
	echo "</div>";
	echo "</div>";
	
}
}
?>
