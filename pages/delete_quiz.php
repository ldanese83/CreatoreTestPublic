<?php
include("../share/funzioni2_1.php");

$id_quiz = $_GET["id_quiz"];

eseguiQuery("DELETE FROM ct_quiz WHERE id_quiz = $id_quiz");
eseguiQuery("DELETE FROM ct_quiz_argomenti WHERE fk_quiz = $id_quiz");
eseguiQuery("DELETE FROM ct_quiz_tipo_domande WHERE fk_quiz = $id_quiz");
eseguiQuery("DELETE FROM ct_quiz_domande WHERE fk_quiz = $id_quiz");

?>