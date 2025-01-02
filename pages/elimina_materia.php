<?php
include("../share/funzioni2_1.php");

$id_materia = $_GET["id_materia"];

eseguiQuery("DELETE FROM ct_materie WHERE id_materia = $id_materia");
eseguiQuery("DELETE FROM ct_utenti_materie WHERE fk_materia = $id_materia");

?>