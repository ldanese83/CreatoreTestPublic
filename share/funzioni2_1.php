<?php 

function delta_tempo ($data_iniziale,$data_finale,$unita) {
 
 $data1 = strtotime($data_iniziale);
 $data2 = strtotime($data_finale);
 
	switch($unita) {
		case "m": $unita = 1/60; break; 	//MINUTI
		case "h": $unita = 1; break;		//ORE
		case "g": $unita = 24; break;		//GIORNI
		case "a": $unita = 8760; break;         //ANNI
	}
 
 $differenza = (($data2-$data1)/3600)/$unita;
 return $differenza;
}

function truncate($val, $f="0")
{
    if(($p = strpos($val, '.')) !== false) {
        $val = floatval(substr($val, 0, $p + 1 + $f));
    }
    return $val;
}

//funzione per connettersi ad un database: ritorna l'handler al database, funziona in concomitanza con config.php per i parametri del db
function connettiDB() {
	//localhost
	$db_host="127.0.0.1";
	$db_name="creatoretest2";
	$db_user="root";
	$db_password="";
	
	$conn = new mysqli($db_host, $db_user, $db_password, $db_name);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
	
	return $conn;
	
}

//funzione per connettersi ad un database usando PDO
function connettiDBPDO() {
	//localhost
	$db_host="127.0.0.1";
	$db_name="creatoretest2";
	$db_user="root";
	$db_password="";
	
	
	try {
	  $conn = new PDO("mysql:host=$db_host;dbname=$db_name", $db_user, $db_password);
	  // set the PDO error mode to exception
	  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	  return $conn;
	} catch(PDOException $e) {
	  echo "Connection failed: " . $e->getMessage();
	}
	
}

//funzione per inserire dati con prepare, per evitare injection
function eseguiInsertPrepare($query,$params) {
	
	$conn=connettiDBPDO();	
		
	// Costruzione della query
	$placeholders = implode(',', array_fill(0, count($params), '?'));
	$sql = "$query ($placeholders)";

	// Preparazione della query
	$stmt = $conn->prepare($sql);

	// Binding dei parametri
	foreach ($params as $index => $value) {
		$stmt->bindValue($index + 1, $value); // L'indice dei parametri in bindValue inizia da 1
	}

	// Esecuzione della query
    if ($stmt->execute()) {
        // Ottenere l'ID dell'elemento inserito
        $lastInsertId = $conn->lastInsertId();
        //echo "Query eseguita con successo! L'ID dell'elemento inserito è: " . $lastInsertId;
		return $lastInsertId;
		
    } else {
        // Ottenere informazioni dettagliate sull'errore
        $errorInfo = $stmt->errorInfo();
        echo "Errore durante l'esecuzione della query:<br>";
        echo "Codice SQLSTATE: " . $errorInfo[0] . "<br>";
        echo "Codice di errore specifico del driver: " . $errorInfo[1] . "<br>";
        echo "Messaggio di errore: " . $errorInfo[2];
    }
	
}


//funzione per update sicuri
//i campi nella query devono essere nominati :c0,:c1,:c2,:c3,..,:cn
function eseguiUpdatePrepare($query,$params) {
	
	$conn=connettiDBPDO();	
	
    // Preparazione della query
    $stmt = $conn->prepare($query);

	for($i=0;$i<count($params);$i++) {
		// Binding dei parametri
		$stmt->bindValue(":c$i", $params[$i]);
	}

    // Esecuzione della query
    if ($stmt->execute()) {
        //echo "Aggiornamento riuscito.";
    } else {
        // Ottenere informazioni dettagliate sull'errore
        $errorInfo = $stmt->errorInfo();
        echo "Errore durante l'esecuzione della query:<br>";
        echo "Codice SQLSTATE: " . $errorInfo[0] . "<br>";
        echo "Codice di errore specifico del driver: " . $errorInfo[1] . "<br>";
        echo "Messaggio di errore: " . $errorInfo[2];
    }
	
}

//funzione per eseguire query con prepare per evitare injection
function eseguiQueryPrepareMany($query,$params) {
	
	$conn=connettiDBPDO();	

    // Preparazione della query
    $stmt = $conn->prepare($query);

    // Binding dei parametri
    foreach ($params as $index => $param) {
		//echo "indice: ".$index;
        $stmt->bindValue($index + 1, $param['value']); // L'indice dei parametri in bindValue inizia da 1
    }

	// Esecuzione della query
	if ($stmt->execute()) {
		// Ottenere i risultati della query
		$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
		
		return $results;
		
	} else {
		// Ottenere informazioni dettagliate sull'errore
		$errorInfo = $stmt->errorInfo();
		echo "Errore durante l'esecuzione della query:<br>";
		echo "Codice SQLSTATE: " . $errorInfo[0] . "<br>";
		echo "Codice di errore specifico del driver: " . $errorInfo[1] . "<br>";
		echo "Messaggio di errore: " . $errorInfo[2];
	}
	
}

//funzione per eseguire query con prepare per evitare injection, restituisce riga singola
function eseguiQueryPrepareOne($query,$params) {
	
	$conn=connettiDBPDO();	

    // Preparazione della query
    $stmt = $conn->prepare($query);

    // Binding dei parametri
    foreach ($params as $index => $param) {
        $stmt->bindValue($index + 1, $param['value']); // L'indice dei parametri in bindValue inizia da 1
    }

	// Esecuzione della query
	if ($stmt->execute()) {
		// Ottenere i risultati della query
		$row = $stmt->fetch(PDO::FETCH_ASSOC);
		
		return $row;
		
	} else {
		// Ottenere informazioni dettagliate sull'errore
		$errorInfo = $stmt->errorInfo();
		echo "Errore durante l'esecuzione della query:<br>";
		echo "Codice SQLSTATE: " . $errorInfo[0] . "<br>";
		echo "Codice di errore specifico del driver: " . $errorInfo[1] . "<br>";
		echo "Messaggio di errore: " . $errorInfo[2];
	}
	
}

function eseguiInsert($query) {
	
	$conn=connettiDB();	
		
	$conn->query($query);
	
	$last_id = $conn->insert_id;
	
	return $last_id;
	
}

function eseguiQuery($query) {
	
	$conn=connettiDB();	
		
	$result=$conn->query($query);
	
	return $result;
	
}

//semplice funzione che restituisce una stringa in formato data da un timestamp unix passato come parametro, la formatta in tipo Italiano
function ottieniData($timestampo) {
	$data_finale=date("d-m-Y H:i",$timestampo);
	return $data_finale;
}


//funzione che restituisce il tipo di browser, se riconoscibile, che sta utilizzando l'utente per accedere alla pagina
function GetBrowser(){
    $browser = array("Internet Explorer" => "MSIE",
             "FireFox" => "Firefox",
             "Lynx" => "Lynx",
             "Opera" => "Opera",
             "WebTV" => "WebTV",
             "Konqueror" => "Konqueror",
             "Bot" => "bot|Google|slurp|scooter|spider|infoseek",
             "Netscape" => "Nav|Gold|x11|Netscape",
            );
    
    foreach($browser as $chiave => $valore){
        if(eregi($valore, $_SERVER["HTTP_USER_AGENT"])){
            return $chiave;
        }
    }
	
    return "Altro";
}    


//funzione per inviare le mail, abbisogna dei parametri
//dell'oggetto della mail e del campo from e dell'indirizzo del destinatario e il testo da spedire
function inviaMail($testo,$oggetto,$from,$mail) {
	
	$xheaders = "From: $from \n";
	$xheaders .= "X-Sender: <" .$from. ">\n";
	$xheaders .= "X-Mailer: PHP\n"; // mailer
	$xheaders .= "X-Priority: 6\n"; // Urgent message!
	$xheaders .= "Content-Type: text/html; charset=iso-8859-1\n"; // Mime type
	
	if(mail($mail,$oggetto,$testo,$xheaders)); //echo "Mail inviata in modo corretto"; 
	else die("Errore nell'invio della mail");
}

?>