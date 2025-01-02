function scegli_pers(id_personaggio,nomep) {

	var result= confirm("Sei sicuro di voler usare il personaggio "+nomep+"? Una volta selezionato non sarà possibile modificarlo.");
	if(result==true) {
	
		window.location.href="scegli_personaggio.php?id_personaggio="+id_personaggio
		
	}
	else {}
	
}

