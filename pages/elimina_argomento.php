<?php
include("../share/funzioni2_1.php");

$id_argomento = $_GET["id_argomento"];

eseguiQuery("DELETE FROM ct_argomenti WHERE id_argomento = $id_argomento");
eseguiQuery("DELETE FROM ct_domande WHERE fk_argomento = $id_argomento");

?>