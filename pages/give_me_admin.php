<?php
include("../share/funzioni2_1.php");

$id_amministratore = $_GET["id_amministratore"];

if($id_amministratore==0) {
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='login_admin'>Login</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input type='text' style='width:100%' id='login_admin' />";
	echo "</div>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<input type='hidden' id='id_admin_mod' value='$id_amministratore' />";
	echo "<label for='password_admin_mod'>Password</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input type='text' style='width:100%' id='password_admin_mod' />";
	echo "</div>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='nome_admin'>Nome</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input type='text' style='width:100%' id='nome_admin' />";
	echo "</div>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='cognome_admin'>Cognome</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input type='text' style='width:100%' id='cognome_admin' />";
	echo "</div>";
	echo "</div>";
}
else {

$dataset2=eseguiQuery("select * from amministrazione_azioni where id_amministrazione=$id_amministratore");

while($row2=($dataset2->fetch_assoc())) {

	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='login_admin'>Login</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input type='text' disabled style='width:100%' id='login_admin' value='$row2[login]' />";
	echo "</div>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<input type='hidden' id='id_admin_mod' value='$id_amministratore' />";
	echo "<label for='password_admin_mod'>Password</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input type='text' style='width:100%' id='password_admin_mod' value='$row2[password]' />";
	echo "</div>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='nome_admin'>Nome</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input type='text' style='width:100%' id='nome_admin' value='$row2[nome]' />";
	echo "</div>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='cognome_admin'>Cognome</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input type='text' style='width:100%' id='cognome_admin' value='$row2[cognome]' />";
	echo "</div>";
	echo "</div>";
}
}
?>
