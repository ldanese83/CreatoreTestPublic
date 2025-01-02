<?php
session_start();
include("../../share/funzioni2_1.php");

$id_studente = $_GET["id_studente"];
$id_utente = $_SESSION["id_utente"];

if($id_studente==0) {
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='nome_studente_mod'>Nome studente</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='nome_studente_mod' />";
	echo "<input type='hidden' id='id_studente_mod' value='$id_studente' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='cognome_studente_mod'>Cognome studente</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='cognome_studente_mod' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='email_studente_mod'>Email studente</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='email_studente_mod' />";
	echo "</div>";
	echo "</div>";
	echo "</div>";
}
else {

	$params = [
		["value"=>$id_studente]
	];
	$row=eseguiQueryPrepareOne("select * from ct_studenti inner join ct_utenti on id_utente=fk_utente where id_studente=?",$params);

	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='nome_classe_mod'>Nome Studente</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='nome_studente_mod' value='$row[nome]' />";
	echo "<input type='hidden' id='id_studente_mod' value='$id_studente' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='cognome_classe_mod'>Cognome Studente</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='cognome_studente_mod' value='$row[cognome]' />";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='email_studente_mod'>Email Studente</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='email_studente_mod' value='$row[email]' disabled/>";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='username_studente_mod'>Username Studente</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='username_studente_mod' value='$row[username]' disabled/>";
	echo "</div>";
	echo "</div>";
	echo "<div class='row'>";
	echo "<div class='col-md-2' style='padding-top:10px'>";
	echo "<label for='password_studente_mod'>Password Studente (lasciare vuoto per non modificare)</label></div>";
	echo "<div class='col-md-10' style='padding-top:10px'><input style='width:100%' type='text' id='password_studente_mod' value='' />";
	echo "</div>";
	echo "</div>";
		
		
}
?>
