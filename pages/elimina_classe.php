<?php
session_start();
include("../share/funzioni2_1.php");

if (!isset($_SESSION['Username']))
{
 echo "Non hai i permessi per accedere alla pagina";
}else {
$id_classe = $_GET["id_classe"];

eseguiQuery("DELETE FROM ct_classi WHERE id_classe = $id_classe");
eseguiQuery("DELETE FROM ct_utenti_classi WHERE fk_classe = $id_classe");
}
?>