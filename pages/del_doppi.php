<?php
session_start();
include("../share/funzioni2_1.php");

$result=eseguiQuery("SELECT id_domanda, domanda, ct_argomenti.nome_argomento from ct_domande c inner join ct_argomenti on fk_argomento=id_argomento where domanda in (select domanda from ct_domande c2 where c2.id_domanda<>c.id_domanda) and fk_tipo_domanda<>4 order by domanda;");
$i=0;
while($row=$result->fetch_assoc()) {
	if($i%2==0) {
		eseguiQuery("delete from ct_risposte where fk_domanda=$row[id_domanda]");
		eseguiQuery("delete from ct_utente_domande where fk_domanda=$row[id_domanda]");
		eseguiQuery("delete from ct_domande where id_domanda=$row[id_domanda]");
	}
	$i++;
}
?>
