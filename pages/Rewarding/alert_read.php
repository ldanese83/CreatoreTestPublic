<?php
session_start();
include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
	$id_alert = $_GET["id_alert"];
	
	$params=[$id_alert];
	eseguiUpdatePrepare("UPDATE ct_alerts SET letto=1 WHERE id_alert=:c0",$params);
			

	}
?>
