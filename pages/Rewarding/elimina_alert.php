<?php
session_start();
include("../../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
$id_alert = $_POST["id_alert"];

eseguiQuery("DELETE FROM ct_alerts WHERE id_alert=$id_alert");
echo "Alert eliminato con successo.";
}
?>