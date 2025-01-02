<?php
include("../share/funzioni2_1.php");

$id_griglia = $_GET["id_griglia"];

eseguiQuery("UPDATE ct_griglie_valutazione SET attiva=2 WHERE id_griglia = $id_griglia");

?>