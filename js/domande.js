var contatore=1;
var tipo_domanda="1";

function cambia_tipo() {
	
	tipo_domanda = $('#tipo_domanda').val();
	
	for(j=2;j<contatore+1;j++) {
		
		$("#risposta"+j).remove();
		
	}
	contatore=1;
	
	switch(tipo_domanda) {
		case "1":
			$('#opzioni_aggiuntive').css("display","block");
			$('#risposte').css("display","none");
			$('#esercizio_numeri').css("display","none");
			break;
		case "2":
			$('#opzioni_aggiuntive').css("display","none");
			$('#risposte').css("display","block");
			$('#esercizio_numeri').css("display","none");
			break;
		case "3":
			$('#opzioni_aggiuntive').css("display","none");
			$('#risposte').css("display","block");
			$('#esercizio_numeri').css("display","none");
			break;
		case "4":
			$('#opzioni_aggiuntive').css("display","none");
			$('#risposte').css("display","none");
			$('#esercizio_numeri').css("display","block");
	}
	
}

var trovate=0;

function change_corretta(id) {
	
	if($("#corretta"+id).val()=="no") { 
		
		if(tipo_domanda=="2") {

			for(j=0;j<contatore;j++) {
				
				if($("#corretta"+(j+1)).val()=="si") trovate++;
				
			}
			
		}
		if(trovate>0) {
			
			alert("Nel tipo di domanda Scelta Multipla può esserci una sola risposta corretta!");
			
		}
		else {
			$("#correct_response"+id).removeClass("correct_response");
			$("#correct_response"+id).addClass("correct_response_checked");
			$("#corretta"+id).val("si");
			$("#span_correct"+id).html("Corretta");
		}
	}
	else {
		$("#correct_response"+id).removeClass("correct_response_checked");
		$("#correct_response"+id).addClass("correct_response");
		$("#corretta"+id).val("no");
		$("#span_correct"+id).html("Non corretta");
		trovate=0;
	}

	
}

function add_row() {
	
	contatore++;
	
	$("#risposte").append("<div class='row_form' id='riga_risposta"+contatore+"'><div class=\"input-group input-group-icon\" style=\"width:100%\"><input type=\"text\" placeholder=\"Risposta "+(contatore)+"\" id=\"risposta"+(contatore)+"\" name=\"risposta[]\" style=\"width:85%\" /><div class=\"input-icon\"><i class=\"fa fa-reply\"></i></div><div class=\"correct_response\" id=\"correct_response"+(contatore)+"\" onclick=\"change_corretta("+(contatore)+")\"><span class=\"tooltiptext tooltip-bottom\" id=\"span_correct"+(contatore)+"\">Non corretta</span><i class=\"fa fa-check-square\"></i><input type=\"hidden\" id=\"corretta"+(contatore)+"\" name=\"corretta[]\" value=\"no\" /></div><div class=\"remove_response\" id=\"remove_response"+contatore+"\" onclick='remove_row("+contatore+");'><i class=\"fa fa-minus\"></i></div></div></div>");

}

function remove_row(id) {
	
	$("#riga_risposta"+id).remove();
	
}
