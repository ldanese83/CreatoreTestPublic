-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 31, 2024 alle 10:57
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `creatoretest2`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_alerts`
--

CREATE TABLE `ct_alerts` (
  `id_alert` int(11) NOT NULL,
  `fk_classe` int(11) NOT NULL,
  `letto` int(11) NOT NULL DEFAULT 0,
  `data_alert` datetime NOT NULL,
  `testo` text NOT NULL,
  `tipologia` varchar(100) NOT NULL,
  `link` varchar(200) NOT NULL,
  `doc_stud` int(11) NOT NULL,
  `fk_studente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Struttura della tabella `ct_anni_scolastici`
--

CREATE TABLE `ct_anni_scolastici` (
  `id_anno` int(11) NOT NULL,
  `anno_scolastico` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_anni_scolastici`
--

INSERT INTO `ct_anni_scolastici` (`id_anno`, `anno_scolastico`) VALUES
(1, '2020/2021'),
(2, '2024/2025');

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_argomenti`
--

CREATE TABLE `ct_argomenti` (
  `id_argomento` int(11) NOT NULL,
  `nome_argomento` varchar(200) NOT NULL,
  `fk_materia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_argomenti`
--

INSERT INTO `ct_argomenti` (`id_argomento`, `nome_argomento`, `fk_materia`) VALUES
(2, 'Android', 1),
(3, 'Servlet', 1),
(4, 'JSP', 1),
(5, 'Sicurezza Informatica', 2),
(6, 'Società', 4),
(7, 'Catena del Valore', 4),
(8, 'Sistemi Informativi', 4),
(9, 'Python Classi', 5),
(11, 'Basi di Java', 5),
(12, 'Introduzione alla programmazione', 5),
(13, 'Intro ai database', 5),
(15, 'Flowgorithm ', 5),
(17, 'Java Classi', 5),
(18, 'Diagrammi ER', 5),
(19, 'Introduzione a Python', 5),
(21, 'Programmazione strutturata Python', 5),
(22, 'Java Ereditarietà', 5),
(23, 'Java Vector', 5),
(24, 'Gestione della Memoria OOP', 5),
(25, 'Java File', 5),
(26, 'Alberi e liste concatenate', 5),
(27, 'Python Funzioni e Moduli', 5),
(28, 'Database NoSQL', 5),
(31, 'Diagrammi delle classi UML', 5),
(32, 'Programmazione ad oggetti', 5),
(34, 'Algoritmi di ricerca ed ordinamento', 5),
(35, 'Linguaggi compilati ed interpretati', 5),
(36, 'Python Strutture Dati', 5),
(37, 'Ricorsione', 5),
(38, 'Python File', 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_argomenti_kahoot`
--

CREATE TABLE `ct_argomenti_kahoot` (
  `id_arg_kahoot` int(11) NOT NULL,
  `fk_argomento` int(11) NOT NULL,
  `fk_utente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_badge`
--

CREATE TABLE `ct_badge` (
  `id_badge` int(11) NOT NULL,
  `nome_badge` varchar(200) NOT NULL,
  `img_badge` varchar(200) NOT NULL,
  `descrizione` text NOT NULL,
  `fk_utente_creatore` int(11) NOT NULL,
  `fk_argomento` int(11) NOT NULL,
  `num_esercizi` int(11) NOT NULL,
  `media_minima` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_badge_alunni`
--

CREATE TABLE `ct_badge_alunni` (
  `id_badge_alunno` int(11) NOT NULL,
  `fk_utente` int(11) NOT NULL,
  `fk_badge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_classi`
--

CREATE TABLE `ct_classi` (
  `id_classe` int(11) NOT NULL,
  `nome_classe` varchar(100) NOT NULL,
  `fk_anno_scolastico` int(11) NOT NULL,
  `colore` varchar(20) NOT NULL DEFAULT '#ffffff',
  `icona` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_classi`
--

INSERT INTO `ct_classi` (`id_classe`, `nome_classe`, `fk_anno_scolastico`, `colore`, `icona`) VALUES
(4, '3E Informatica', 2, '#56f8a2', 'fa-bomb'),
(5, '4E Informatica', 2, '#1254f2', 'fa-ghost');

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_classi_esercizi_attivi`
--

CREATE TABLE `ct_classi_esercizi_attivi` (
  `id_attivi` int(11) NOT NULL,
  `fk_classe` int(11) NOT NULL,
  `fk_quest` int(11) NOT NULL,
  `fk_esercizio` int(11) NOT NULL,
  `attivo` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ct_classi_esercizi_attivi`
--

INSERT INTO `ct_classi_esercizi_attivi` (`id_attivi`, `fk_classe`, `fk_quest`, `fk_esercizio`, `attivo`) VALUES
(1, 5, 1, 1, 1),
(2, 5, 1, 2, 1),
(3, 5, 1, 3, 1),
(5, 5, 1, 5, 1),
(6, 5, 1, 6, 1),
(7, 5, 1, 7, 1),
(8, 5, 1, 8, 1),
(9, 5, 1, 9, 1),
(10, 5, 1, 10, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_classi_quest`
--

CREATE TABLE `ct_classi_quest` (
  `id_classe_quest` int(11) NOT NULL,
  `fk_classe` int(11) NOT NULL,
  `fk_quest` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ct_classi_quest`
--

INSERT INTO `ct_classi_quest` (`id_classe_quest`, `fk_classe`, `fk_quest`) VALUES
(2, 5, 1),
(3, 5, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_consegne_studenti`
--

CREATE TABLE `ct_consegne_studenti` (
  `id_consegna` int(11) NOT NULL,
  `fk_studente` int(11) NOT NULL,
  `fk_esercizio` int(11) NOT NULL,
  `valutazione` int(11) NOT NULL DEFAULT 0,
  `valutato` int(11) NOT NULL DEFAULT 0,
  `file_consegnato` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ct_consegne_studenti`
--

INSERT INTO `ct_consegne_studenti` (`id_consegna`, `fk_studente`, `fk_esercizio`, `valutazione`, `valutato`, `file_consegnato`) VALUES
(1, 14, 1, 5, 1, NULL),
(2, 5, 2, 8, 1, NULL),
(3, 4, 2, 3, 1, NULL),
(4, 7, 2, 5, 1, NULL),
(5, 7, 3, 10, 1, './consegne/4ei_2024.csv'),
(6, 14, 5, 6, 1, NULL),
(7, 14, 6, 7, 1, NULL),
(9, 14, 2, 5, 1, NULL),
(10, 14, 7, 0, 0, NULL),
(11, 14, 8, 0, 0, NULL),
(12, 14, 9, 8, 1, NULL),
(74, 14, 10, 9, 1, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_domande`
--

CREATE TABLE `ct_domande` (
  `id_domanda` int(11) NOT NULL,
  `domanda` text NOT NULL,
  `punti` float NOT NULL,
  `fk_argomento` int(11) NOT NULL,
  `fk_tipo_domanda` int(11) NOT NULL,
  `num_righe` int(11) DEFAULT NULL,
  `fk_libro` int(11) NOT NULL,
  `data_creazione` date NOT NULL,
  `ese_num` text DEFAULT NULL,
  `fk_utente` int(11) NOT NULL,
  `num_gruppo` int(11) NOT NULL,
  `livello_diff` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_domande`
--

INSERT INTO `ct_domande` (`id_domanda`, `domanda`, `punti`, `fk_argomento`, `fk_tipo_domanda`, `num_righe`, `fk_libro`, `data_creazione`, `ese_num`, `fk_utente`, `num_gruppo`, `livello_diff`) VALUES
(1, 'Dare la definizione di Personal Mobility', 1, 2, 1, 5, 1, '2022-09-19', '', 1, 0, 1),
(3, 'Descrivere la differenza tra Access Mobility e Terminal Mobility.', 1, 2, 1, 5, 1, '2020-04-04', '', 1, 0, 1),
(11, 'Come funzionano le pagine JSP?', 1, 4, 2, 0, 1, '2020-04-04', '', 3, 0, 1),
(12, 'Come si chiama in JSP il codice compreso tra i tag &amp;lt;% e %&amp;gt; ?', 2, 4, 2, 0, 1, '2020-04-04', '', 1, 0, 1),
(13, 'Cosa si intende per Service Profile Portability?', 1, 2, 1, 5, 1, '2020-04-04', '', 1, 0, 1),
(14, 'Dare una descrizione della tecnologia 5G. Quali possibilit&agrave; dovrebbe portare questa tecnologia?', 1, 2, 1, 7, 1, '2020-04-04', '', 1, 0, 1),
(15, 'Descrivere le differenze tra la tecnologia 1G e la tecnologia 2G', 1, 2, 1, 5, 1, '2020-04-09', '', 1, 0, 1),
(16, 'Quali sono i principali sistemi operativi per sistemi mobili? Darne una breve descrizione.', 1, 2, 1, 5, 1, '2020-04-09', '', 1, 0, 1),
(17, 'Quali sono i 4 livelli di astrazione del sistema operativo iOS? Dare una breve descrizione del loro utilizzo.', 1, 2, 1, 5, 1, '2020-04-09', '', 1, 0, 1),
(18, 'Quali sono le due principali applicazioni per la creazione di applicazioni in ambiente Android? Dare una breve descrizione.', 1, 2, 1, 5, 1, '2020-04-09', '', 1, 0, 1),
(19, 'Dare una descrizione dell&rsquo;Hardware Abstraction Layer in ambiente Android.', 1, 2, 1, 5, 1, '2020-04-09', '', 1, 0, 1),
(20, 'Quali sono i 4 livelli dell&rsquo;architettura Android? Dare una breve descrizione di ognuno.', 1, 2, 1, 5, 1, '2020-04-09', '', 1, 0, 1),
(21, 'Quali sono le due macchine virtuali utilizzate nel tempo dal S/O Android? Cosa significa compilatore Just in Time?', 1, 2, 1, 5, 1, '2020-04-09', '', 1, 0, 1),
(22, 'Dare una descrizione del componente Activity in Android.', 1, 2, 1, 5, 1, '2020-04-09', '', 1, 0, 1),
(23, 'Dare una descrizione del componente Service in Android.', 1, 2, 1, 5, 1, '2020-04-09', '', 1, 0, 1),
(24, 'Dare una descrizione del componente Broadcast Receiver in Android.', 1, 2, 1, 5, 1, '2020-04-09', '', 1, 0, 1),
(25, 'Dare una descrizione del componente Content Provider in Android.', 1, 2, 1, 5, 1, '2020-04-09', '', 1, 0, 1),
(26, 'Quali sono i possibili stati nel ciclo di vita di una Activity?', 1, 2, 1, 5, 1, '2020-04-09', '', 1, 0, 1),
(27, 'Cosa significa che un&rsquo;Activity &egrave; ibernata all&rsquo;interno del S/O Android?', 1, 2, 1, 5, 1, '2020-04-09', '', 1, 0, 1),
(28, 'Quando viene richiamato il metodo onCreate() di un&rsquo;Activity e per cos viene generalmente utilizzato?', 1, 2, 1, 5, 1, '2020-04-09', '', 1, 0, 1),
(29, 'Quando viene richiamato il metodo onDestroy() su un&rsquo;activity?', 1, 2, 1, 5, 1, '2020-04-09', '', 1, 0, 1),
(30, 'Qual &egrave; l&rsquo;estensione di un pacchetto autoinstallante Android? Quali tipi di certificati possiamo associare alle nostre applicazioni?', 1, 2, 1, 5, 1, '2020-04-09', '', 1, 0, 1),
(31, 'Differenza tra Activity e Applicazione.', 1, 2, 1, 5, 1, '2020-04-09', '', 1, 0, 1),
(32, 'Qual &egrave; la risposta?', 1, 4, 3, 0, 1, '2022-01-15', '', 1, 0, 1),
(36, 'Il lavoratore autonomo (pi&ugrave; di una risposta):', 1, 6, 3, 0, 1, '2022-01-30', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(37, 'Quale tra le seguenti &egrave; la principale societ&agrave; di persone?', 0.5, 6, 2, 0, 1, '2022-01-30', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(38, 'In una societ&agrave; di persone:', 0.5, 6, 2, 0, 1, '2022-01-30', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(39, 'Una societ&agrave; di capitali ha autonomia patrimoniale, il che significa:', 0.5, 6, 2, 0, 1, '2022-01-30', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(40, 'In una SPA, a differenza di una SRL:', 0.5, 6, 2, 0, 1, '2022-01-30', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(41, 'Nella visione stakeholder:', 0.5, 6, 2, 0, 1, '2022-01-30', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(43, 'Il lavoratore dipendente (pi&ugrave; di una risposta):', 2, 6, 3, 0, 1, '2022-02-05', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(44, 'Una SNC fondata da 2 soci dichiara fallimento. Il primo socio pu&ograve; ripagare la sua parte di debito, avendo la liquidit&agrave; per farlo nel suo conto corrente personale. Il secondo non ha liquidit&agrave; al momento, ma ricever&agrave; tra un mese un pagamento che gli consentirebbe di coprire la sua parte di debito.', 1, 6, 2, 0, 1, '2022-02-05', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(45, 'Una SPA ha personalit&agrave; giuridica, quindi:', 1, 6, 2, 0, 1, '2022-02-05', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(46, 'In una SPA:', 1, 6, 2, 0, 1, '2022-02-05', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(47, 'Il sistema informativo aziendale:', 1, 8, 2, 0, 1, '2022-02-05', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(48, 'Un ERP permette di gestire:', 1, 8, 2, 0, 1, '2022-02-05', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(49, 'Un processo aziendale:', 1, 7, 2, 0, 1, '2022-02-05', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(50, 'Tra le possibili opzioni di Operation Management troviamo (pi&ugrave; di una risposta):', 2, 7, 3, 0, 1, '2022-02-05', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(51, 'Quando un&rsquo;azienda adotta il Just in Time significa che:', 1, 7, 2, 0, 1, '2022-02-05', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(52, 'La sigla SRL sta per', 1, 6, 2, 0, 1, '2022-02-05', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(53, 'Cosa si intende con programmazione strutturata?', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(55, 'Quali sono i vantaggi della programmazione ad oggetti?', 1, 9, 3, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(56, 'Definire possibili attributi e metodi dell&amp;#039;oggetto Moto', 1, 9, 1, 2, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(57, 'Cosa significa istanza di una classe?', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(58, 'Come si rappresenta solitamente la classe?', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(59, 'La classe Film ha gli attributi: titolo e regista. Disegnare il diagramma degli oggetti per 2 oggetti della classe Film', 1, 9, 4, 1, 1, '2022-05-14', '&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(60, 'Quando viene richiamato il costruttore di una classe?', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(61, 'Cosa si intende con incapsulamento?', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(64, 'Qual &egrave; la corretta definizione di una classe Automobile in Python?', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(65, 'Qual &egrave; la corretta definizione di un metodo con 2 parametri in Python?', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(66, 'Come posso richiamare il metodo &amp;#039;stampa&amp;#039; senza parametri sull&amp;#039;oggetto &amp;#039;ogg&amp;#039; in Python?', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(67, 'Come potrei creare un oggetto della classe Triangolo con i parametri base a 5 ed altezza a 3?', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(68, 'Qual &egrave; la corretta definizione di un costruttore per creare oggetti con 1 parametro?', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(69, 'Come si pu&ograve; creare un attributo protetto per la definizione di un colore in una classe Python?', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(70, 'Se creo un oggetto della classe Rettangolo con nome r1, come posso accedere ad un suo attributo privato __base da una funzione esterna main?', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(71, 'Una classe che eredita da una superclasse &egrave; anche detta:', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(72, 'Se la classe Cerchio &egrave; sottoclasse della classe FiguraGeometrica in Python devo scrivere:', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(73, 'Per accedere agli elementi della sopraclasse all&amp;#039;interno dei metodi della sottoclasse mi serve la parola chiave:', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(74, 'Ereditariet&agrave; multipla:', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(75, 'Con polimorfismo in programmazione intendiamo:', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(76, 'Nell&amp;#039;overriding:', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(77, 'Volendo stampare un oggetto direttamente con la funzione print, quale operatore devo sovraccaricare?', 1, 9, 2, 0, 1, '2022-05-14', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(78, 'In Python una funzione creata all&amp;#039;interno della definizione di una classe si chiama:', 1, 9, 2, 0, 1, '2022-05-29', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(80, 'Quali possono essere dei possibili attributi e metodi per l&amp;#039;oggetto Televisore?', 1, 9, 1, 2, 1, '2022-05-29', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(81, 'Se una classe deriva da due superclassi abbiamo:', 1, 9, 2, 0, 1, '2022-05-29', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(82, 'Un&amp;#039;istanza di una classe:', 1, 9, 2, 0, 1, '2022-05-29', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(83, 'Quale delle seguenti non pu&ograve; creare correttamente un oggetto della classe Cane?', 1, 9, 2, 0, 1, '2022-05-29', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(84, 'Quali delle seguenti NON &egrave; corretta riguardo la programmazione ad oggetti?', 1, 9, 2, 0, 1, '2022-05-29', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(85, 'La parola chiave che definisce un modello che indica i dati che saranno contenuti in un oggetto della classe e le funzioni che possono essere richiamate su un oggetto della classe &egrave;', 1, 9, 2, 0, 1, '2022-05-29', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(86, 'La parola che per convenzione &egrave; usata per riferirsi all&amp;#039;istanza corrente (oggetto) di una classe:', 1, 9, 2, 0, 1, '2022-05-29', '&amp;lt;p&amp;gt;&amp;amp;lt;p&amp;amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;amp;lt;/p&amp;amp;gt;&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(87, 'Per estendere una classe, la nuova classe dovrebbe avere accesso a tutti i dati e al funzionamento interno della superclasse', 1, 9, 2, 0, 1, '2022-05-29', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(88, 'Quale dei seguenti &egrave; il modo corretto di definire un costruttore?', 1, 9, 2, 0, 1, '2022-05-29', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(89, 'Quale delle seguenti affermazioni &egrave; pi&ugrave; accurata per la dichiarazione x = Cerchio()?', 1, 9, 2, 0, 1, '2022-05-29', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(90, 'Qual &egrave; il metodo di cui fare l&amp;#039;overload per sovraccaricare l&amp;#039;operatore di somma?', 1, 9, 2, 0, 1, '2022-05-29', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(91, 'Disegnare un possibile diagramma delle classi per la classe Auto', 1, 9, 1, 0, 1, '2022-05-29', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(92, 'Cos&amp;#039;&egrave; un MRP?', 0.5, 8, 1, 3, 1, '2022-08-28', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(93, 'Qual &egrave; il minimo conferimento per una SRLS?', 1, 6, 2, 0, 1, '2022-08-30', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 7, 0, 1),
(95, 'Come si chiama il compilatore Java?', 1, 11, 2, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(96, 'Quali tra i seguenti sono IDE con i quali si pu&ograve; sviluppare in Java?', 1, 11, 3, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(97, 'Cos&amp;#039;&egrave; una variabile d&amp;#039;ambiente, per esempio PATH?', 1, 11, 2, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(98, 'Come si chiama l&amp;#039;ambiente che possiamo installare sui nostri PC per richiamare java e il suo compilatore da riga di comando?', 1, 11, 2, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(99, 'Quali tra queste sono tra le principali libreire (package) di Java?', 1, 11, 3, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(100, 'Cos&amp;#039;&egrave; un identificatore?', 1, 11, 2, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(101, 'Cosa sono le parole chiave di un linguaggio di programmazione?', 1, 11, 2, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(102, 'Cosa significa case sensitive?', 1, 11, 2, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(103, 'Quale dei seguenti NON va bene come nome di variabile in java?', 1, 11, 2, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(104, 'Come posso scrivere una variabile per il lato del quadrato da convenzione java?', 1, 11, 2, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(105, 'Quale delle seguenti &egrave; la dichiarazione di una costante in java?', 1, 11, 2, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(106, 'Quali tra i seguenti sono tipi di dato primitivi in java?', 1, 11, 3, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;&amp;amp;lt;p&amp;amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;amp;lt;/p&amp;amp;gt;&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(107, 'Cosa significa casting in un linguaggio di programmazione?', 1, 11, 2, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(108, 'Cosa significa promozione in Java?', 1, 11, 2, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(109, 'Cosa significa tipizzazione statica?', 1, 11, 2, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(110, 'Qual &egrave; la caratteristica di un linguaggio fortemente tipizzato?', 1, 11, 2, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(111, 'Qual &egrave; l&amp;#039;operatore da usare per fare l&amp;#039;AND in una condizione Java?', 1, 11, 2, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(112, 'Qual &egrave; l&amp;#039;operatore per effettuare l&amp;#039;OR in Java?', 1, 11, 2, 0, 1, '2022-09-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(113, 'Cos&amp;#039;&egrave; un package in Java', 1, 11, 2, 0, 1, '2022-09-22', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(114, 'Cos&amp;#039;&egrave; il ByteCode Java?', 1, 11, 2, 0, 1, '2022-09-22', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(115, 'Il ByteCode:', 1, 11, 2, 0, 1, '2022-09-22', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(116, 'La JVM:', 1, 11, 2, 0, 1, '2022-09-22', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(117, 'Per fare input in Java possiamo utilizzare la classe:', 1, 11, 2, 0, 1, '2022-09-23', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(118, 'Come si stampa a video in Java?', 1, 11, 2, 0, 1, '2022-09-23', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(119, 'Come leggo un intero da standard input se ho creato un oggetto Scanner denominato myScanner?', 1, 11, 2, 0, 1, '2022-09-23', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(120, 'Come si inserisce in Java un commento su una sola riga?', 1, 11, 2, 0, 1, '2022-09-23', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(121, 'Come si inserisce in Java un commento su pi&ugrave; righe?', 1, 11, 2, 0, 1, '2022-09-23', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(122, 'In Java se ho due variabili intere e effettuo la loro divisione:', 1, 11, 2, 0, 1, '2022-09-23', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(123, 'Se dichiaro una variabile X in Java all&amp;#039;interno di un blocco di codice:', 1, 11, 2, 0, 1, '2022-09-26', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(124, 'La differenza tra gli operatori doppio &amp;amp;&amp;amp; e singolo &amp;amp; nel controllo di un if:', 1, 11, 2, 0, 1, '2022-09-26', '&amp;lt;p&amp;gt;&amp;amp;lt;p&amp;amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;amp;lt;/p&amp;amp;gt;&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(125, 'La differenza tra gli operatori doppio || e singolo | nel controllo di un&amp;#039;operazione OR:', 1, 11, 2, 0, 1, '2022-09-26', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(126, 'Cos&amp;#039;&egrave; una stringa di caratteri? Come si rappresenta in un linguaggio di programmazione?', 3, 12, 1, 3, 1, '2022-10-04', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(127, 'Cosa significa concatenare stringhe? Qual &egrave; l&amp;#039;operatore che usa Flowgorithm per la concatenazione?', 3, 12, 1, 3, 1, '2022-10-04', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(128, 'Cos&#039;&egrave; una variabile? Quali sono le sue caratteristiche?', 3, 12, 1, 4, 1, '2022-10-04', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(129, 'Cosa significa pseudocodice? E codice macchina?', 3, 12, 1, 4, 1, '2022-10-04', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(130, 'Cos&#039;&egrave; un algoritmo e quali sono le sue propriet&agrave;?', 3, 12, 1, 6, 1, '2022-10-04', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(131, 'Cos&amp;#039;&egrave; lo pseudocodice? E cos&amp;#039;&egrave; invece un linguaggio di programmazione?', 3, 12, 1, 4, 1, '2022-10-04', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(132, 'Cos&#039;&egrave; l&#039;assegnazione? Scrivi cosa significa che &egrave; un&#039;operazione distruttiva a sinistra. Posso eseguire l&#039;assegnazione a=a+5? Se si cosa significa?', 3, 12, 1, 5, 1, '2022-10-04', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(133, 'Descrivi i principali blocchi di un diagramma a blocchi', 3, 12, 1, 5, 1, '2022-10-04', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(134, 'Quale tra i seguenti &egrave; un nome valido di variabile:', 1, 12, 2, 0, 1, '2022-10-04', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(135, 'Descrivere gli operatori booleani visti a lezione', 3, 12, 1, 5, 1, '2022-10-04', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(136, 'Cos&amp;#039;&egrave; il tipo di una variabile (fare degli esempi)? Cos&amp;#039;&egrave; un valore booleano?', 3, 12, 1, 3, 1, '2022-10-04', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(137, 'Quali sono i dati di input e i dati di output per il seguente problema? Da loro un nome in modo che possano diventare le variabili di un programma', 2, 12, 4, 0, 1, '2022-10-04', '&lt;p&gt;Una vasca riceve acqua da due condutture che versano rispettivamente %%3,6??0 e %%4,9??0 litri al minuto. In quante ore si riempir&amp;agrave; la vasca sapendo che la sua capacit&amp;agrave; &amp;egrave; di %%200,300?? ettolitri?&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n______________________________________________________________________________________________________________________&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;______________________________________________________________________________________________________________________&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;______________________________________________________________________________________________________________________&lt;/p&gt;\r\n', 1, 1, 1),
(138, 'Quali sono i dati di input e i dati di output per il seguente problema? Da loro un nome in modo che possano diventare le variabili di un programma', 2, 12, 4, 0, 1, '2022-10-04', '&lt;p&gt;Due falegnami per costruire una libreria ricevono una paga oraria rispettivamente di 18 euro e 21 euro. Sapendo che mediamente hanno lavorato per 9 ore al giorno e che alla consegna della libreria il secondo falegname ha ricevuto 297 euro pi&amp;ugrave; del primo, calcola quanti giorni hanno lavorato i due (stesso numero di giorni).&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n______________________________________________________________________________________________________________________&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;______________________________________________________________________________________________________________________&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;______________________________________________________________________________________________________________________&lt;/p&gt;\r\n', 1, 1, 1),
(139, 'Quali sono i dati di input e i dati di output per il seguente problema? Da loro un nome in modo che possano diventare le variabili di un programma', 2, 12, 4, 0, 1, '2022-10-04', '&lt;p&gt;Per partecipare ad una gita scolastica ogni alunno versa una cifra di %%15,25?? euro. I partecipanti, che sono %%27,38?? devono inoltre dividere tra di loro una spesa extra di %%100,200?? euro. Quanto spende in totale ciascun alunno?&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n______________________________________________________________________________________________________________________&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;______________________________________________________________________________________________________________________&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;______________________________________________________________________________________________________________________&lt;/p&gt;\r\n', 1, 1, 1),
(140, 'Disegna il diagramma a blocchi che risolva il seguente problema:', 5, 12, 4, 0, 1, '2022-10-04', '&lt;p&gt;Si deve dipingere una parete rettangolare di base B centimetri e altezza H centimetri. Il colore scelto per dipingere la parete costa C euro per centimetro quadrato.Calcolare il costo per dipingere una qualsiasi parete, leggendo in input il valore della base e dell&amp;#39;altezza della parete e il costo della pittura.&lt;/p&gt;\r\n', 1, 2, 1),
(141, 'Disegna il diagramma a blocchi che risolva il seguente problema:', 5, 12, 4, 0, 1, '2022-10-04', '&lt;p&gt;Gli alunni iscritti in una scuola media sono X. Y di essi non frequentano la terza. Quante sono le sezioni di terza se ogni classe &amp;egrave; formata da Z alunni? Vogliamo avere in input quanti iscritti totali alle medie, quanti non frequentano la terza e quanti alunni compongono ogni terza.&lt;/p&gt;\r\n', 1, 2, 1),
(142, 'Disegna il diagramma a blocchi che risolva il seguente problema:', 5, 12, 4, 0, 1, '2022-10-04', '&lt;p&gt;L&amp;#39;abbonamento annuale ad un settimanale, il cui prezzo di copertina &amp;egrave; di X euro, costa X1 euro e l&amp;#39;abbonamento ad un mensile, il cui prezzo di copertina &amp;egrave; di Y euro, costa Y1 euro. Calcolare il risparmio totale se ci si abbona ai 2 giornali, piuttosto che acquistarli in edicola (considerando l&amp;#39;anno composto da 52 settimane).&lt;/p&gt;\r\n', 1, 2, 1),
(143, 'Cos&amp;#039;&egrave; e a cosa serve un DBMS?', 3, 13, 1, 5, 1, '2022-10-09', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(144, 'Quali possibili problemi si possono avere se non si utilizzano i database?', 3, 13, 1, 5, 1, '2022-10-09', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(145, 'Perch&egrave; usare i database e non dati salvati dalle singole applicazioni?', 3, 13, 1, 5, 1, '2022-10-09', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(146, 'Quali sono i passi da fare per la realizzazione di un database? Darne una breve descrizione', 3, 13, 1, 8, 1, '2022-10-09', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(147, 'Quali possibili modelli logici esistono per la creazione di database? Darne una breve descrizione', 3, 13, 1, 8, 1, '2022-10-09', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(148, 'Cos&amp;#039;&egrave; un&amp;#039;entit&agrave; in un modello ER? Fare un esempio', 3, 18, 1, 5, 1, '2022-10-09', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(149, 'Qual &egrave; la differenza tra entit&agrave; forte ed entit&agrave; debole? Fare un esempio', 3, 18, 1, 5, 1, '2022-10-09', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(150, 'Cos&amp;#039;&egrave; un&amp;#039;istanza di un&amp;#039;entit&agrave;? Cos&amp;#039;&egrave; un attributo?', 3, 18, 1, 5, 1, '2022-10-09', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(151, 'Qual &egrave; la differenza tra attributi identificatori e descrittori?', 3, 18, 1, 5, 1, '2022-10-09', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(152, 'Indicare e dare una breve descrizione di alcune tipologie di attributo (per esempio guardandone l&amp;#039;opzionalit&agrave;)', 3, 18, 1, 6, 1, '2022-10-09', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(153, 'Cosa sono le chiavi candidate, le chiavi primarie e le chiavi alternative? Fare un esempio.', 3, 18, 1, 5, 1, '2022-10-09', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(154, 'Cos&amp;#039;&egrave; una chiave artificiale? Fare un esempio', 3, 18, 1, 5, 1, '2022-10-09', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(155, 'Cos&amp;#039;&egrave; una chiave composta? Fare un esempio', 3, 18, 1, 5, 1, '2022-10-09', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(156, 'Cos&amp;#039;&egrave; una chiave esterna? Fare un esempio.', 3, 18, 1, 5, 1, '2022-10-09', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(157, 'Per il problema seguente disegnare con notazione ER quali sono le possibili entit&agrave;, gli attributi delle entit&agrave; e le possibili chiavi:', 5, 18, 4, 0, 1, '2022-10-09', '&amp;lt;p&amp;gt;Un database deve gestire i dati riguardanti una pizzeria: le ordinazioni, i camerieri ed i tavoli&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(158, 'Per il problema seguente disegnare con notazione ER quali sono le possibili entit&agrave;, gli attributi delle entit&agrave; e le possibili chiavi:', 5, 18, 4, 0, 1, '2022-10-09', '&amp;lt;p&amp;gt;Una nave da crociera vuole registrare i dati riguardanti il personale di bordo, i passeggeri e le cabine&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(159, 'Per il problema seguente disegnare con notazione ER quali sono le possibili entit&agrave;, gli attributi delle entit&agrave; e le possibili chiavi:', 5, 18, 4, 0, 1, '2022-10-09', '&amp;lt;p&amp;gt;Si devono gestire i dati relativi ad una gara motociclistica. I dati indispensabili sono i dati sui piloti, sulle motociclette e sui meccanici che vi lavorano&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(160, 'Per il problema seguente disegnare con notazione ER quali sono le possibili entit&agrave;, gli attributi delle entit&agrave; e le possibili chiavi:', 5, 18, 4, 0, 1, '2022-10-21', '&amp;lt;p&amp;gt;Una biblioteca vuole gestire i dati riguardanti i libri a disposizione dei tesserati, i dati riguardanti i tesserati ed infine i dati del personale della biblioteca.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(161, 'Un&#039;azienda elettrica ha stabilito le seguenti tariffe:', 5, 15, 4, 0, 1, '2022-10-30', '&lt;table border=&quot;1&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;width:100%&quot;&gt;\r\n	&lt;thead&gt;\r\n		&lt;tr&gt;\r\n			&lt;th style=&quot;background-color:#efefef; width:50%&quot;&gt;KILOWATT ORA&lt;/th&gt;\r\n			&lt;th style=&quot;background-color:#efefef; width:50%&quot;&gt;COSTO IN EURO&lt;/th&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/thead&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;0 - 500&lt;/td&gt;\r\n			&lt;td&gt;%%18,28?? euro&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;501 - 1000&lt;/td&gt;\r\n			&lt;td&gt;%%28,45?? euro + 0.0%%3,9?? euro per ogni kilowatt sopra i 500&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;1001 e oltre&lt;/td&gt;\r\n			&lt;td&gt;%%45,65?? euro + 0.1%%0,9?? euro per ogni kilowatt sopra i 1000&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Creare il diagramma a blocchi che, dato il consumo mensile, calcoli e stampi l&amp;#39;importo della bolletta (i kilowatt non possono essere minori di 0)&lt;/p&gt;\r\n', 1, 1, 3),
(162, 'Creare con Flowgorithm il diagramma a blocchi che risolva il seguente problema', 5, 15, 4, 0, 1, '2022-10-30', '&lt;p&gt;Si deve dipingere una parete rettangolare di base B centimetri e altezza H centimetri. Inserire un controllo affinch&amp;egrave; base ed altezza non siano miinori di 0. Il colore scelto per dipingere la parete costa C euro per centimetro quadrato, inserire un controllo affinch&amp;egrave; non venga inserito un costo negativo. Creare un diagramma a blocchi che calcoli il costo per dipingere una qualsiasi parete, leggendo in input il valore della base e dell&amp;rsquo;altezza della parete e il costo della pittura.&lt;/p&gt;\r\n', 1, 2, 3),
(163, 'Dati due numeri naturali A e B, con A diverso da B, aggiungere al pi&ugrave; piccolo la somma dei due numeri', 4, 15, 4, 0, 1, '2022-10-30', '&lt;p&gt;Esempio: se A &amp;egrave; 5 e B &amp;egrave; 7, allora il pi&amp;ugrave; piccolo &amp;egrave; A e ad A aggiungiamo A+B, quindi A = 5 + (5+7) = 17, B rimane uguale. Alla fine si danno in output A e B.&lt;/p&gt;\r\n', 1, 3, 3),
(164, 'Risolvere il seguente problema con uun diagramma a blocchi e ciclo indefinito', 4, 15, 4, 0, 1, '2022-10-30', '&amp;lt;p&amp;gt;Una lumaca si trova in fondo ad un pozzo fondo X metri. Chiedere in input all&amp;amp;#39;utente l&amp;amp;#39;altezza del pozzo e verificare che sia maggiore di 5, dare un errore altrimenti. La lumaca vuole uscire dal pozzo. Durante il giorno la lumaca riesce a salire di 3 metri, purtoppo, quando dorme durante la notte, scivola indietro di 2 metri. Dopo quanti giorni la lumaca riuscir&amp;amp;agrave; ad uscire dal pozzo?&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(165, 'Risolvere il seguente problema utilizzando un diagramma a blocchi con ciclo indefinito', 5, 15, 4, 0, 1, '2022-10-30', '&lt;p&gt;Una lumaca si trova in fondo ad un pozzo fondo X metri. Chiedere in input all&amp;#39;utente l&amp;#39;altezza del pozzo e verificare che sia maggiore di 5, dare un errore altrimenti. La lumaca vuole uscire dal pozzo. Durante il giorno la lumaca riesce a salire di 3 metri, purtoppo, quando dorme durante la notte, scivola indietro di 2 metri. Dare in output dove si trova la lumaca alla fine di ogni giorno (prima di scivolare la notte) e dopo quanti giorni riesce ad uscire dal pozzo. Leggere bene l&amp;#39;output per dare la risposta finale correttamente.&lt;/p&gt;\r\n', 1, 2, 1),
(166, 'Un&#039;autonoleggio applica le seguenti tariffe:', 5, 15, 4, 0, 1, '2022-10-30', '&lt;table border=&quot;1&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;width:100%&quot;&gt;\r\n	&lt;thead&gt;\r\n		&lt;tr&gt;\r\n			&lt;th style=&quot;background-color:#efefef; width:50%&quot;&gt;GIORNI NOLEGGIO&lt;/th&gt;\r\n			&lt;th style=&quot;background-color:#efefef; width:50%&quot;&gt;COSTO NOLEGGIO&lt;/th&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/thead&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;1-5 giorni&lt;/td&gt;\r\n			&lt;td&gt;%%2,4??0 euro al giorno&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;5-10 giorni&lt;/td&gt;\r\n			&lt;td&gt;%%5,9??0 euro al giorno&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;oltre i 10 giorni&lt;/td&gt;\r\n			&lt;td&gt;%%10,16??0 euro al giorno + un fisso di %%10,14??0 euro&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Dati i giorni di noleggio, calcolare e dare in output quanto verr&amp;agrave; a costare il noleggio dell&amp;#39;auto (i giorni non possono essere minori di 1)&lt;/p&gt;\r\n', 1, 1, 3),
(167, 'Dati due numeri naturali A e B, con A diverso da B, aggiungere al maggiore dei due la moltiplicazione dei due numeri', 4, 15, 4, 0, 1, '2022-10-30', '&lt;p&gt;Esempio: se A &amp;egrave; 5 e B &amp;egrave; 7, il maggiore &amp;egrave; B, quindi B diventa B = B+(A*B) = 7+(5*7)=42&lt;/p&gt;\r\n', 1, 3, 3),
(168, 'Creare con Flowgorithm il diagramma a blocchi che risolva il seguente problema:', 5, 15, 4, 0, 1, '2022-10-30', '&lt;p&gt;Un sarto deve creare dalla stoffa una tovaglia per un tavolo rotondo. Il tavolo ha un diametro di X centimetri. La stoffa deve essere di 1 metro pi&amp;ugrave; lunga rispetto al bordo del tavolo per avere una tovaglia che scenda dai bordi. La stoffa ha un costo in euro al metro quadrato. Chiedere in input all&amp;#39;utente il diametro in centimetri del tavolo ed il costo al metro quadro della tovaglia. Dare in output il costo totale della tovaglia.&lt;/p&gt;\r\n\r\n&lt;p&gt;Come valore di pi greco usare 3.14&lt;/p&gt;\r\n', 1, 2, 3),
(169, 'Utilizzare un diagramma a blocchi e un ciclo while per risolvere il seguente problema:', 5, 15, 4, 0, 1, '2022-10-30', '&lt;p&gt;La lepre e la tartaruga fanno una gara. La lunghezza del percorso &amp;egrave; di X metri. La tartaruga ogni 10 minuti riesce a percorrere %%3,5?? metri. La lepre, invece, percorre %%10,15?? metri in 10 minuti. Chiedere in input all&amp;#39;utente la lunghezza X del percorso, che deve essere di almeno 50 metri e dare in output dopo quanto tempo la lepre e la tartaruga riescono a tagliare il traguardo, dando in output dove si trovano ogni 10 minuti.&lt;/p&gt;\r\n', 1, 2, 1),
(170, 'Un mutuo agevolato in banca applica le seguenti tariffe:', 5, 15, 4, 0, 1, '2022-10-30', '&lt;table border=&quot;1&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;width:100%&quot;&gt;\r\n	&lt;thead&gt;\r\n		&lt;tr&gt;\r\n			&lt;th scope=&quot;col&quot;&gt;DURATA IN ANNI&lt;/th&gt;\r\n			&lt;th scope=&quot;col&quot;&gt;COSTI DA RIPAGARE&lt;/th&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/thead&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;1-10 anni&lt;/td&gt;\r\n			&lt;td&gt;%%18,25??0 euro al mese&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;11-20 anni&lt;/td&gt;\r\n			&lt;td&gt;%%16,18??0 euro al mese + %%8,12??00 euro all&amp;#39;anno&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Oltre i 20 anni&lt;/td&gt;\r\n			&lt;td&gt;%%12,16??0 euro al mese + %%4,7??00 euro all&amp;#39;anno&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Dato in input il numero di anni del mutuo, che non pu&amp;ograve; essere negativo, calcolare il costo totale da ripagare alla banca per il mutuo concesso&lt;/p&gt;\r\n', 1, 1, 3),
(171, 'Dati due numeri naturali A e B, con A diverso da B, controllare e dare in output se il maggiore dei due &egrave; pi&ugrave; grande del primo di almeno 5', 4, 15, 4, 0, 1, '2022-10-30', '&lt;p&gt;Esempio: se A &amp;egrave; 5 e B &amp;egrave; 7 allora il pi&amp;ugrave; grande &amp;egrave; B ed &amp;egrave; pi&amp;ugrave; grande di A di 2, quindi do in output la scritta &amp;quot;B &amp;egrave; il maggiore e non supera di 5 il valore di A&amp;quot;&lt;/p&gt;\r\n', 1, 3, 3),
(172, 'Creare con Flowgorithm il diagramma a blocchi che risolva il seguente problema:', 5, 15, 4, 0, 1, '2022-10-30', '&lt;p&gt;Un agricoltore possiede un campo a forma di trapezio. Vuole coltivare il campo ad orzo, che ha un costo al kilo. Per ogni metro quadro del campo vanno piantati un tot di chili di semi di orzo. Dati in input la base maggiore, la base minore e l&amp;#39;altezza del trapezio, il costo al kilo dei semi d&amp;#39;orzo e i kili di semi di orzo per metro quadrato (tutti devono essere maggiori di 0), calcolare e dare in output il costo di coltivazione del campo ad orzo.&lt;/p&gt;\r\n\r\n&lt;p&gt;Vi ricordo che un trapezio ha la seguente forma:&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/CreatoreTest/kcfinder/public/image/trapezio-isoscele.png&quot; style=&quot;height:123px; width:250px&quot; /&gt;&lt;/p&gt;\r\n', 1, 2, 3),
(173, 'Risolvere il seguente problema utilizzando un diagramma a blocchi con ciclo indefinito:', 5, 15, 4, 0, 1, '2022-10-30', '&lt;p&gt;In Africa ogni giorno una gazzella si alza e dovr&amp;agrave; correre pi&amp;ugrave; del leone. Sapendo che la gazzella corre per %%5,8?? metri al secondo e che il leone corre %%9,12?? metri al secondo e che la gazzella ha un vantaggio di X metri, calcolare dopo quanti secondi il leone raggiunge la gazzella, stampando le posizioni di leone e gazzella dopo ogni secondo. I metri di vantaggio della gazzella vanno inseriti dall&amp;#39;utente e non possono essere inferiori a 80.&lt;/p&gt;\r\n', 1, 2, 1),
(174, 'Crea il diagramma a blocchi per risolvere il seguente problema:', 5, 15, 4, 0, 1, '2022-10-31', '&lt;p&gt;Il Pentagono (foto sotto) decide di tappezzare il tetto dell&amp;#39;edificio di pannelli solari. Ogni pannello solare ha un certo costo in dollari e in un metro quadrato possono stare 3 pannelli solari. Sapendo che l&amp;#39;area di un pentagono si calcola come (Perimetro*Apotema)/2, chiedere in input all&amp;#39;utente lato e apotema del pentagono esterno, lato e apotema del pentagono interno, calcolare e dare in output il costo totale per riempire il tetto di pannelli. Controllare l&amp;#39;input dell&amp;#39;utente affinch&amp;egrave; sia corretto (il pentagono interno &amp;egrave; pi&amp;ugrave; piccolo dell&amp;#39;esterno).&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/CreatoreTest/kcfinder/public/image/pentagono-ufo.jpg&quot; style=&quot;float:left; height:174px; width:246px&quot; /&gt;&lt;/p&gt;\r\n', 1, 2, 4),
(175, 'Creare con Flowgorithm il diagramma a blocchi che risolva il seguente problema:', 5, 15, 4, 0, 1, '2022-11-09', '&lt;p&gt;Carlo ha comprato una piramide souvenir dell&amp;#39;Egitto. La piramide &amp;egrave; a base quadrata. La piramide &amp;egrave; di colore giallo, ma Carlo la vuole ridipingere di blu con colori a tempera, ogni tubetto di tempera ha un certo costo. Scrivi il programma che aiuti Carlo a capire quanto gli coster&amp;agrave; ridipingere la sua piramide souvenir. Il programma deve richiedere in input il lato del quadrato di base della piramide (in centimetri), l&amp;#39;altezza dei triangoli che costituiscono i lati della piramide (in centimetri), il costo di un tubetto di tempera,&amp;nbsp; quanti cm quadrati si riesce a dipingere con un tubetto. Tutti i dati di input devono essere maggiori di 0, altrimenti il programma deve dare un errore. Dare in output il numero di tubetti di tempera necessari per dipingere la piramide ed il loro costo totale.&lt;/p&gt;\r\n', 1, 2, 4),
(176, 'Dati due numeri naturali A e B, con A diverso da B, dire se il pi&ugrave; piccolo dei due &egrave; pi&ugrave; piccolo di almeno 4 rispetto al pi&ugrave; grande', 4, 15, 4, 0, 1, '2022-11-09', '&lt;p&gt;Esempio: A=9, B=6 il pi&amp;ugrave; piccolo &amp;egrave; B ed &amp;egrave; pi&amp;ugrave; piccolo di 3. Quindi il programma scrive qualcosa del tipo &amp;quot;Il pi&amp;ugrave; piccolo &amp;egrave; B ed &amp;egrave; pi&amp;ugrave; piccolo di A di un valore inferiore a 4&amp;quot;.&lt;/p&gt;\r\n', 1, 3, 3);
INSERT INTO `ct_domande` (`id_domanda`, `domanda`, `punti`, `fk_argomento`, `fk_tipo_domanda`, `num_righe`, `fk_libro`, `data_creazione`, `ese_num`, `fk_utente`, `num_gruppo`, `livello_diff`) VALUES
(177, 'Una compagnia di scavatori applica le seguenti tariffe in base al terreno da scavare:', 5, 15, 4, 0, 1, '2022-11-09', '&lt;table border=&quot;1&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;width:95%&quot;&gt;\r\n	&lt;thead&gt;\r\n		&lt;tr&gt;\r\n			&lt;th scope=&quot;col&quot; style=&quot;background-color:#efefef&quot;&gt;Metri quadri da scavare&lt;/th&gt;\r\n			&lt;th scope=&quot;col&quot; style=&quot;background-color:#efefef&quot;&gt;Costo&lt;/th&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/thead&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:50%&quot;&gt;1 - 120&lt;/td&gt;\r\n			&lt;td style=&quot;width:50%&quot;&gt;%%20,39?? euro al metro quadro&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;width:50%&quot;&gt;121 - 400&lt;/td&gt;\r\n			&lt;td style=&quot;width:50%&quot;&gt;%%40,49?? euro al metro quadro + %%5,15?? euro per ogni metro quadro oltre i 120&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Oltre i 401&lt;/td&gt;\r\n			&lt;td&gt;%%50,65?? euro al metro quadro + %%16,22?? euro per ogni metro quadro oltre i 400&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Leggere in input i metri quadrati da scavare e dare in output il costo richiesto per scavare quei metri quadrati. Il programma deve dare un errore se i metri sono inferiori a 1. I dati in tabella sono fissi e non vanno letti in input.&lt;/p&gt;\r\n', 1, 1, 3),
(178, 'Risolvere il seguente problema utilizzando un ciclo indefinito (Achille e la tartaruga)', 5, 15, 4, 0, 1, '2022-11-09', '&lt;p&gt;Achille (famoso erore dell&amp;#39;Iliade) e la tartaruga fanno una gara. Dato che Achille &amp;egrave; pi&amp;ugrave; veloce concede alla tartaruga un vantaggio, che parte pi&amp;ugrave; avanti nel percorso. Il percorso &amp;egrave; di %%3,6??00 metri. Leggere il vantaggio della tartaruga in input (deve essere maggiore di 20 e minore di 250). La tartaruga viaggia a %%3,8?? metri al secondo. Ogni secondo Achille dimezza lo svantaggio che ha sulla tartaruga (usare variabili intere). Il programma deve dirmi se Achille riesce a superare la tartaruga prima del traguardo e se lo fa a quanti secondi &amp;egrave; avvenuto il sorpasso. Il programma continua fino a che la tartaruga non taglia il traguardo, dicendo a quanti secondi lo taglia.&lt;/p&gt;\r\n\r\n&lt;p&gt;Esempio di dimezza lo svantaggio: la tartaruga &amp;egrave; a 104, Achille &amp;egrave; a 0, il vantaggio della tartaruga &amp;egrave; di 104.&lt;/p&gt;\r\n\r\n&lt;p&gt;Achille &amp;egrave; a 0, la sua posizione diviene: 104 meno la posizione di Achille, il tutto diviso 2, quindi Achille arriva in posizione 52 metri= 0+52.&lt;/p&gt;\r\n\r\n&lt;p&gt;Prossima iterazione: la taratruga va avanti di 4, arriva a 108, il suo vantaggio su Achille &amp;egrave; 108-52 = 56.&lt;/p&gt;\r\n\r\n&lt;p&gt;Achille dimezza lo svantaggio, cio&amp;egrave; alla sua posizone di 52 aggiungo&amp;nbsp;56/2 = 28, che &amp;egrave; il vantaggio della tartaruga dimezzato, quindi arriva a 80 metri. E cos&amp;igrave; via.&lt;/p&gt;\r\n', 1, 2, 1),
(179, 'Perch&egrave; si utilizza la programmazione ad oggetti?', 3, 17, 1, 5, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(180, 'Cosa rappresentano attributi e metodi di una classe?', 3, 17, 1, 5, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(181, 'Cos&amp;#039;&egrave; e a cosa serve il Costruttore?', 3, 17, 1, 5, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(182, 'Quali sono i livelli d ivisibilit&agrave; possibili? Dare una spiegazione per ognuno', 3, 17, 1, 7, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(183, 'Qual &egrave; la caratteristica di un attributo static per una classe?', 3, 17, 1, 6, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(184, 'Cosa si intende con information hiding? Perch&egrave; viene utilizzato?', 3, 17, 1, 6, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(185, 'Disegnare il diagramma delle classi per la classe Quadrato', 4, 17, 4, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;La classe Quadrato rappresenta una figura geometrica con quattro lati e quattro angoli uguali. Inserire possibili attributi e metodi per la classe.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(186, 'Disegnare il diagramma delle classi per la classe Ebook:', 4, 17, 4, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;La classe rappresenta un libro letto dall&amp;amp;#39;utente di un ebook reader (lettore di libri digitali). Il libro digitale deve tener conto, tra le altre cose, della pagina dove si &amp;amp;egrave; arrivati a leggere (tipo segnalibro).&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(187, 'Disegnare il diagramma delle classi per la classe: Sveglia', 4, 17, 4, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Una sveglia da la possibilit&amp;amp;agrave; di leggere l&amp;amp;#39;orario, ma anche di impostare l&amp;amp;#39;ora in cui suonare per svegliarci.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(188, 'Disegnare il diagramma delle classi per la classe Cisterna:', 4, 17, 4, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Una cisterna contiene una certa quantit&amp;amp;agrave; di liquido di un certo tipo.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(189, 'Disegnare il diagramma delle classi per la classe: Televisore', 4, 17, 4, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Un televisore acceso sar&amp;amp;agrave; sintonizzato su un certo canale, modificabile con telecomando&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(190, 'Istanza di una classe &egrave; sinonimo di:', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(191, 'Incapsulamento', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(192, 'Il costruttore in Java', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(193, 'Una variabile d&amp;#039;istanza:', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(194, 'Quale tra le seguenti &egrave; una possibile dicitura per creare un oggetto della classe Cerchio in Java?', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(195, 'Quale tra le seguenti NON &egrave; la dichiarazione corretta di un metodo in Java?', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(196, 'Una variabile locale:', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(197, 'La parola chiave final in Java:', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(198, 'La parola chiave null in Java:', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(200, 'Come dichiaro un array contenente 5 oggetti di tipo Automobile in Java?', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(201, 'Cosa stampa? (uguaglianza)', 2, 17, 4, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;/CreatoreTest/kcfinder/public/image/domanda1.jpg&amp;quot; style=&amp;quot;height:720px; width:734px&amp;quot; /&amp;gt;&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(202, 'Cosa stampa? (static)', 2, 17, 4, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;/CreatoreTest/kcfinder/public/image/domanda2.jpg&amp;quot; style=&amp;quot;height:603px; width:732px&amp;quot; /&amp;gt;&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(203, 'Cosa stampa? (array)', 2, 17, 4, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;/CreatoreTest/kcfinder/public/image/domanda3.jpg&amp;quot; style=&amp;quot;height:627px; width:702px&amp;quot; /&amp;gt;&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(206, 'Cos&amp;#039;&egrave; l&amp;#039;interfaccia di una classe?', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(208, 'Cos&amp;#039;&egrave; un oggetto in programmazione?', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(210, 'Se creo un oggetto della classe Rettangolo con nome r1, come posso accedere ad un suo attributo privato denominato altezza da una classe esterna Main?', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(211, 'Come posso richiamare il metodo &amp;#039;calcolaPerimetro&amp;#039; senza parametri sull&amp;#039;oggetto &amp;#039;ogg&amp;#039; in Java?', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(212, 'Cosa si intende con information hiding?', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(213, 'Quale delle seguenti affermazioni &egrave; pi&ugrave; accurata per la dichiarazione Cerchio x = new Cerchio()?', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(215, 'Cosa stampa (array2)', 2, 17, 4, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;/CreatoreTest/kcfinder/public/image/domanda4.jpg&amp;quot; style=&amp;quot;height:573px; width:646px&amp;quot; /&amp;gt;&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(216, 'Si realizza Information Hiding quando:', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(217, 'Quando dichiaro una variabile di tipo riferimento (quindi in pratica un riferimento ad un oggetto di una classe), ma non richiamo il costruttore con la parola chiave new:', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(218, 'La parola chiave final in Java serve a:', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(219, 'In Java &egrave; possibile dichiarare due costruttori per una classe:', 1, 17, 2, 0, 1, '2022-11-19', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(220, 'Disegnare il diagramma ER per la seguente realt&agrave; (stazione ferroviaria):', 6, 18, 4, 0, 1, '2022-11-28', '&amp;lt;p&amp;gt;Una stazione ferroviaria deve gestire treni in partenza e in arrivo tramite database. I treni che transitano per la stazione hanno un certo numero di vagoni ed un codice identificativo, un numero massimo di passeggeri che possono salire, un tipo di motore (elettrico o diesel), una tipologia (regionale, regionale veloce, intercity&amp;amp;hellip;). I treni che transitano per la stazione hanno un orario di partenza ed una stazione di arrivo, oppure un orario di arrivo ed una stazione di partenza. Al treno &amp;amp;egrave; associato un macchinista ed un controllore. Non vengono salvate informazioni sui passeggeri o sui biglietti venduti.&amp;lt;br /&amp;gt;\r\nInserire un commento sulla scelta delle molteplicit&amp;amp;agrave;.&amp;lt;br /&amp;gt;\r\nEsempio di dato completo: La stazione che deve gestire i treni &amp;amp;egrave; la stazione di Verona. Il treno 45 &amp;amp;egrave; un intercity con 6 vagoni e pu&amp;amp;ograve; trasportare al massimo 300 passeggeri, ha un motore elettrico. Parte alle ore 15.00 con destinazione Padova. Il macchinista &amp;amp;egrave; Carlo Verdi ed il controllore &amp;amp;egrave; Mario Rossi.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(221, 'Disegnare il diagramma ER per la seguente realt&agrave; (autonoleggio):', 6, 18, 4, 0, 1, '2022-11-28', '&amp;lt;p&amp;gt;Un servizio di noleggio auto vuole registrare i dati necessari all&amp;amp;rsquo;attivit&amp;amp;agrave; tramite un database. Il servizio vuole registrare i dati riguardanti le automobili in suo possesso (marca, modello, km percorsi, colore, tipo di motore) ed i dati delle persone che noleggiano le auto. Il noleggio avviene in una certa data, per un certo numero di giorni. Il servizio vuole registrare i dati del personale, associando il noleggio effettuato alla persona che ha fatto sottoscrivere il contratto di noleggio. Va registrato inoltre il pagamento finale effettuato alla riconsegna dell&amp;amp;rsquo;automobile, con l&amp;amp;rsquo;importo pagato ed il metodo di pagamento, associando la riconsegna all&amp;amp;rsquo;impiegato che ritira l&amp;amp;rsquo;automobile e fa effettuare il pagamento.&amp;lt;br /&amp;gt;\r\nInserire un commento sulla scelta delle molteplicit&amp;amp;agrave;.&amp;lt;br /&amp;gt;\r\nEsempio di dato completo: Il signor Mario Rossi, con CF RSSMRA78C12G892K noleggia il giorno 24 di dicembre 2022 per 10 giorni l&amp;amp;rsquo;auto Fiat Panda rossa con motore a metano, km percorsi 18.400. Il contratto di noleggio &amp;amp;egrave; stato fatto sottoscrivere dall&amp;amp;rsquo;impiegato Giuseppe Verdi. Alla fine del noleggio, dopo 10 giorni, il signor Mario Rossi restituisce l&amp;amp;rsquo;auto all&amp;amp;rsquo;impiegata Valeria Bruni, pagando un importo di 450&amp;amp;euro; in contanti.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(222, 'Dopo aver raffinato il diagramma ER sviluppato al punto 1, creare il modello logico conseguente, inserendo chiavi primarie, chiavi esterne e tipo dei campi per ogni tabella da creare.', 4, 18, 4, 0, 1, '2022-11-28', '', 1, 0, 1),
(223, 'Qual &egrave; la differenza tra un linguaggio compilato ed uno interpretato?', 3, 35, 1, 8, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(224, 'Descrivere vantaggi e svantaggi di un linguaggio compilato', 3, 35, 1, 8, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(225, 'Descrivere vantaggi e svantaggi di un linguaggio interpretato', 3, 35, 1, 8, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(226, 'Cos&rsquo;&egrave; un IDE?', 3, 35, 1, 6, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(227, 'Cosa significa che Python utilizza i tipi dinamici?', 3, 19, 1, 5, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(228, 'Cosa significa casting e come si esegue in Python?', 3, 19, 1, 5, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(229, 'Quali tipi di errore possiamo incontrare quando programmiamo? Fare degli esempi per ognuno.', 3, 35, 1, 8, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(230, 'Come si documenta il codice e perch&eacute; &egrave; importante farlo?', 3, 35, 1, 7, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(231, 'Qual &egrave; la differenza tra un linguaggio compilato ed uno interpretato? Dire un vantaggio di ognuno.', 3, 35, 1, 8, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(232, 'Cos&rsquo;&egrave; un linguaggio pseudo-interpretato?', 3, 35, 1, 6, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(233, 'Cosa significa indentare il codice e perch&eacute; &egrave; importante in Python?', 3, 19, 1, 6, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(234, 'Che cos&rsquo;&egrave; un debugger e cosa permette di fare?', 3, 35, 1, 5, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(235, 'Python ha una licenza:', 1, 19, 2, 0, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(236, 'Ho a disposizone un programma .exe su Windows, significa che:', 1, 35, 2, 0, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(237, 'Ho a disposizione un programma .exe su Windows:', 1, 35, 2, 0, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(238, 'Un programma compilato:', 1, 35, 2, 0, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(240, 'Un programma compilato per Linux:', 1, 35, 2, 0, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(241, 'Se passo il mio programma Python ad un amico:', 1, 35, 2, 0, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(242, 'Generalmente un IDE contiene:', 1, 35, 2, 0, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(243, 'In Python l&amp;#039;indentazione:', 1, 19, 2, 0, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(244, 'Voglio dare lo stesso valore a 3 variabili in Python:', 1, 19, 2, 0, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(245, '&amp;quot;a&amp;quot; * 5 in Python mi da:', 1, 19, 2, 0, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(246, 'Casting significa:', 1, 19, 2, 0, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(247, 'Esempio di errore lessicale:', 1, 35, 2, 0, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(248, 'Il debugger NON permette:', 1, 35, 2, 0, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(249, 'NON ha a che fare con la documentazione del codice:', 1, 35, 2, 0, 1, '2022-12-03', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(250, 'Disegna il diagramma a blocchi per il seguente programma:', 4, 15, 4, 0, 1, '2022-12-03', '&amp;lt;p&amp;gt;Dato un elenco di 8 numeri inseriti dall&amp;amp;#39;utente in input, scegli quelli che sono maggiori di 10 e minori di 100. Di questi calcola la somma e stampa il risultato.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(251, 'Crea il diagramma a blocchi per risolvere il seguente problema:', 4, 15, 4, 0, 1, '2022-12-03', '&amp;lt;p&amp;gt;Date 6 coppie di numeri interi in input dall&amp;amp;#39;utente contare quelle che generano un prodotto pari. (per vedere se un numero &amp;amp;egrave; pari possiamo controllare il resto della divisione per 2, usando l&amp;amp;rsquo;operatore %)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(252, 'Creare il seguente con un diagramma a blocchi:', 4, 15, 4, 0, 1, '2022-12-03', '&amp;lt;p&amp;gt;Scrivere un programma che verifica se un numero &amp;amp;egrave; un numero primo. Esempio: 13 &amp;amp;egrave; primo perch&amp;amp;egrave; non &amp;amp;egrave; divisibile n&amp;amp;egrave; per 2, n&amp;amp;egrave; per 3, n&amp;amp;egrave; per 4, n&amp;amp;egrave; per 5..... Ricordo che il resto della divisione si ottiene con l&amp;amp;#39;operatore %&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(253, 'Realizza in Python il seguente programma:', 4, 21, 4, 0, 1, '2022-12-08', '&amp;lt;p&amp;gt;Si vuole realizzare una calcolatrice che trasformi un numero dato in formato binario, esadecimale o ottale in base a quanto scelto dall&amp;amp;#39;utente.&amp;lt;br /&amp;gt;\r\nL&amp;amp;#39;utente inserisce un numero ed il programma chiede se lo vuole trasformare in binario, in esadecimale o in ottale. Il programma legge in input la scelta dell&amp;amp;#39;utente e restituisce in output il valore del numero trasformato nella base scelta.&amp;lt;br /&amp;gt;\r\nUtilizzare un elif per controllare la scelta dell&amp;amp;#39;utente.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(254, 'Realizza in Python il seguente programma:', 4, 21, 4, 0, 1, '2022-12-08', '&amp;lt;p&amp;gt;Chiedere in input due numeri all&amp;amp;#39;utente, trasformarli in binario e dare in output il valore binario dei due numeri.&amp;lt;br /&amp;gt;\r\nFare la somma dei due numeri interi e dare in output il numero binario somma dei primi due numeri.&amp;lt;br /&amp;gt;\r\nDare poi in output anche il valore in ottale e in esadecimale della somma ottenuta.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(255, 'Scrivere il seguente programma in Python', 4, 21, 4, 0, 1, '2022-12-08', '&amp;lt;p&amp;gt;Chidere in input all&amp;amp;#39;utente una frase che rappresenti la prima riga di una poesia o di un libro famosi (esempi: &amp;amp;quot;la donzelletta vien dalla campagna&amp;amp;quot; o &amp;amp;quot;nel mezzo del cammin di nostra vita&amp;amp;quot;).&amp;lt;br /&amp;gt;\r\nControllare la lunghezza della frase ottenuta. Prendere la sottostringa che inizia dalla met&amp;amp;agrave; della frase fino alla fine e darla in output. Se la sottostringa &amp;amp;egrave; abbastanza lunga, stampare i caratteri della sottostringa che si trovano in posizione 3, 5 e 9 (quindi il quarto, il sesto e il decimo carattere)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(256, 'Scrivere il seguente programma in Python', 4, 21, 4, 0, 1, '2022-12-08', '&amp;lt;p&amp;gt;Chidere in input all&amp;amp;#39;utente una frase che rappresenti un verso di una canzone famosa (esempi: &amp;amp;quot;il pomeriggio &amp;amp;egrave; sempre azzurro&amp;amp;quot; o &amp;amp;quot;eravamo quattro amici al bar&amp;amp;quot;).&amp;lt;br /&amp;gt;\r\nControllare la lunghezza della frase ottenuta. Prendere la sottostringa che va dall&amp;amp;#39;inizio del verso fino ad un terzo dello stesso. Se la sottostringa &amp;amp;egrave; abbastanza lunga, stampare i caratteri della sottostringa che si trovano in posizione 2, 4 e 8 (quindi il terzo, il quinto ed il nono carattere)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(257, 'Creare il seguente programma Python:', 4, 21, 4, 0, 1, '2022-12-08', '&amp;lt;p&amp;gt;Scrivi un programma che prenda in input tre numeri e stampi il maggiore ed il minore tra essi.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(258, 'Creare il seguente programma Python:', 4, 21, 4, 0, 1, '2022-12-08', '&amp;lt;p&amp;gt;Scrivi un programma che legga un carattere da tastiera e che dica se il carattere &amp;amp;egrave; o meno una vocale.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(259, 'Creare il programma Python che risolva il seguente problema:', 4, 21, 4, 0, 1, '2022-12-08', '&amp;lt;p&amp;gt;Un verduriere ha comprato X quintali(1 quintale = 100 Kg) di patate a euro Y il quintale. Le ha rivendute tutte per euro Z.&amp;lt;br /&amp;gt;\r\nDare in input i quintali X comprati, la spesa&amp;amp;nbsp; Y del verduriere al quintale ed il totale incassato dalla rivendita Z. Dare in output se il verduriere ha effettuato un guadagno o una perdita e quanto ha guadagnato/perso&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(260, 'Creare in Python il programma che risolva il seguente problema:', 4, 21, 4, 0, 1, '2022-12-08', '&amp;lt;p&amp;gt;Un calzolaio vende X paia di pantofole, al prezzo medio di euro Y l&amp;amp;#39;uno. Ha pure venduto Z paia di scarpe da signora e W da uomo per la somma complessiva di euro K.&amp;lt;br /&amp;gt;\r\nQuanto incassa per le pantofole vendute? Quale incasso totale ha fatto nella giornata?&amp;lt;br /&amp;gt;\r\nRiflettere su quali dati servono in input per risolvere il problema ed utilizzare il minor numero di input possibili per dare le due risposte in output.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(261, 'Scrivere il seguente programma usando le liste di Python:', 4, 36, 4, 0, 1, '2022-12-08', '&amp;lt;p&amp;gt;Creare una lista contenente 4 cognomi di alunni della 3EI.&amp;lt;br /&amp;gt;\r\nChiedere all&amp;amp;#39;utente il proprio cognome. Controllare se il cognome &amp;amp;egrave; contenuto all&amp;amp;#39;interno della lista e dire in output se &amp;amp;egrave; presente o meno.&amp;lt;br /&amp;gt;\r\nSe il cognome fornito dall&amp;amp;#39;utente non &amp;amp;egrave; contenuto nella lista, aggiungerlo nella prima posizione della lista.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(262, 'Scrivere il seguente programma usando le liste di Python:', 4, 36, 4, 0, 1, '2022-12-08', '&amp;lt;p&amp;gt;Creare una lista contenente 4 sport.&amp;lt;br /&amp;gt;\r\nChiedere all&amp;amp;#39;utente qual &amp;amp;egrave; il suo sport preferito. Controllare se lo sport dell&amp;amp;#39;utente &amp;amp;egrave; contenuto all&amp;amp;#39;interno della lista e dire in output se &amp;amp;egrave; presente o meno.&amp;lt;br /&amp;gt;\r\nSe lo sport dato dall&amp;amp;#39;utente non &amp;amp;egrave; contenuto nella lista, aggiungerlo nell&amp;amp;#39;ultima posizione della lista.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(263, 'Creare il seguente programma Python:', 5, 21, 4, 0, 1, '2022-12-09', '&amp;lt;p&amp;gt;L&amp;amp;#39;industria Nike deve acquistare il cuoio per rivestire i propri palloni da calcio. Un pallone &amp;amp;egrave; una sfera con un certo raggio. L&amp;amp;#39;industria vuole sapere quanto sar&amp;amp;agrave; il costo per rivestire un certo numero di palloni da fornire al campionato di serie A.&amp;lt;br /&amp;gt;\r\nCreare un programma per l&amp;amp;#39;industria che chieda in input:&amp;lt;br /&amp;gt;\r\n- il raggio dei palloni in cm&amp;lt;br /&amp;gt;\r\n- il numero di palloni da ricoprire&amp;lt;br /&amp;gt;\r\n- quanto costa il cuoio al cm quadrato&amp;lt;br /&amp;gt;\r\nE mostri in output il costo di ogni pallone ed il costo totale dei palloni. I due costi dovranno essere separati da un a capo e formattati in maniera da occupare esattamente lo spazio di 8 caratteri, con 2 cifre decimali&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;La superficie di una sfera si calcola con la formula: 4*3.14*raggio al quadrato&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(264, 'Creare in Python il programma che risolva il seguente problema:', 5, 21, 4, 0, 1, '2022-12-09', '&amp;lt;p&amp;gt;L&amp;amp;#39;azienda Modiano crea dadi da gioco. Deve creare dei nuovi dadi colorati di blu di Prussia e le serve un programma per calcolare i costi da sostenere per rifornire di dadi il casin&amp;amp;ograve; di Venezia.&amp;lt;br /&amp;gt;\r\nCreare il programma per l&amp;amp;#39;azienda chiedendo in input: il lato del dado in centimetri, quanti dadi deve creare, quanto costa la vernice al cm quadrato.&amp;lt;br /&amp;gt;\r\nIl programma deve dare in output il costo per ogni dado e il costo totale da pagare. I due dati devono stare su due righe diverse e devono essere formattati in maniera da occupare esattamente 6 caratteri con due cifre decimali.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(265, 'Creare il seguente programma Python con le liste', 4, 36, 4, 0, 1, '2022-12-18', '&amp;lt;p&amp;gt;Creare una lista di 5 animali domestici. Chiedere all&amp;amp;#39;utente quale &amp;amp;egrave; il suo animale domestico preferito. Controllare se l&amp;amp;#39;animale dell&amp;amp;#39;utente &amp;amp;egrave; contenuto all&amp;amp;#39;interno della lista e dire in output se &amp;amp;egrave; presente o meno. Se l&amp;amp;#39;animale dato dall&amp;amp;#39;utente non &amp;amp;egrave; contenuto nella lista, sostituire il terzo elemento della lista con quello dato in input dall&amp;amp;#39;utente.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(266, 'Scrivere il seguente programma in Python:', 4, 21, 4, 0, 1, '2022-12-18', '&amp;lt;p&amp;gt;Chiedere in input all&amp;amp;#39;utente una frase che rappresenti un proverbio famoso (esempi: &amp;amp;quot;chi lascia la strada vecchia per quella nuova sa quel che lascia ma non sa quel che trova&amp;amp;quot; o &amp;amp;quot;chi va piano va sano e va lontano&amp;amp;quot;). Controllare e dare in output la lunghezza della frase data in input. Chiedere all&amp;amp;#39;utente un numero inferiore alla lunghezza della frase. Prendere la sottostringa che va dal numero inserito dall&amp;amp;#39;utente fino alla fine del proverbio. Se la sottostringa &amp;amp;egrave; abbastanza lunga, stampare i caratteri della sottostringa che si trovano in posizione 1, 3 e 5 (quindi il secondo, il quarto ed il sesto carattere).&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(267, 'Creare in Python il programma che risolva il seguente problema:', 5, 21, 4, 0, 1, '2022-12-18', '&amp;lt;p&amp;gt;L&amp;amp;#39;azienda Alimentari s.r.l. produce e vende conserve di pomodoro. Deve creare un nuovo tipo di confezione e le serve un programma per calcolare i costi da sostenere per produrre le conserve. Creare il programma per l&amp;amp;#39;azienda chiedendo in input: quanti grammi di pomodoro contiene una confezione, quante confezioni deve produrre, quanto costa il pomodoro al chilo. Il programma deve dare in output il costo per ogni confezione e il costo totale da pagare. I due dati devono stare su due righe diverse e devono essere formattati in maniera da occupare esattamente 8 caratteri con due cifre decimali.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(268, 'Realizzare in Python:', 4, 21, 4, 0, 1, '2022-12-18', '&amp;lt;p&amp;gt;Scrivi un programma che legga un carattere da tastiera e che dica se il carattere &amp;amp;egrave; o meno una consonante.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(269, 'Realizza in Python il seguente programma:', 4, 21, 4, 0, 1, '2022-12-18', '&amp;lt;p&amp;gt;Chiedere in input due numeri interi all&amp;amp;#39;utente, trasformarli in ottale e dare in output il valore ottale dei due numeri. Fare la sottrazione dei due numeri in decimale e dare in output il numero ottale sottrazione dei primi due numeri. Dare in output anche il valore esadecimale della sottrazione.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(270, 'Scrivere il programma Python che risolve il seguente problema:', 4, 21, 4, 0, 1, '2022-12-18', '&amp;lt;p&amp;gt;Un&amp;amp;#39;azienda che produce e vende candele artigianali deve calcolare i profitti ottenuti dalle vendite di un mese. Nel mese ha venduto N candele al prezzo di P euro l&amp;amp;#39;una. Ogni candela ha un costo in cera di Q euro.&amp;lt;br /&amp;gt;\r\nScrivere un programma Python che, dati in input N, P e Q, calcoli il profitto ottenuto dalle vendite delle candele in un mese e il profitto totale ottenuto dall&amp;amp;#39;azienda in un anno.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(271, 'Risolvi il seguente problema tramite Python:', 4, 21, 4, 0, 1, '2022-12-18', '&amp;lt;p&amp;gt;In una classe ci sono X studenti, di cui Y maschi e Z femmine. W% degli studenti &amp;amp;egrave; stato promosso, i rimanenti hanno ottenuto una pagella insufficiente. Dare in output il numero di studenti promossi ed il numero di studenti insufficienti. Chiedere in input i soli dati necessarei alla risoluzione del problema. Effettuare un controllo sui dati in input affinch&amp;amp;egrave; siano corretti e realistici.&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(272, 'Cos&rsquo;&egrave; e come funziona il Garbage Collector in un linguaggio ad oggetti? ', 4, 24, 1, 6, 1, '2023-01-15', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(273, 'Cosa si intende con deallocazione della memoria in un linguaggio di programmazione ad oggetti? ', 4, 24, 1, 3, 1, '2023-01-15', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(274, 'Lo stack nella gestione della memoria in programmazione ad oggetti', 4, 24, 1, 5, 1, '2023-01-15', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 4),
(275, 'Lo Heap e l&#039;allocazione della memoria in Programmazione ad Oggetti', 4, 24, 1, 6, 1, '2023-01-15', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 4),
(276, 'Una classe che eredita attributi e metodi di un&#039;altra classe &egrave; anche detta:', 1, 22, 2, 0, 1, '2023-01-15', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(277, 'Quali sono i due modi per differenziare una sottoclasse dalla sua superclasse?', 1, 22, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(278, 'Se una sottoclasse estende una sola superclasse ho:', 1, 22, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(279, 'Se una sottoclasse estende pi&ugrave; superclassi abbiamo:', 1, 22, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(280, 'In Java &egrave; possibile avere ereditariet&agrave; multipla?', 1, 22, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(281, 'La parola chiave in Java per ereditare da una superclasse &egrave;:', 1, 22, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(282, 'In Java ogni classe &egrave; sottoclasse della classe:', 1, 22, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(283, 'Quando nella stessa classe definisco 2 metodi che abbiano lo stesso nome (diverso da quello della classe) e lo stesso tipo di ritorno, ma parametri diversi, sono di fronte a:', 1, 22, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(284, 'Quando scrivo un metodo su una sottoclasse che abbia stessi parametri, stesso nome e stesso tipo di ritorno di un metodo della superclasse, sto realizzando:', 1, 22, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(286, 'In Java gli attributi privati di una classe:', 1, 22, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(287, 'Definire quale sia la differenza tra un array statico ed un array dinamico in Java. Quale classe si pu&ograve; utilizzare in Java per gli array dinamici? In quale package la si trova?', 4, 23, 1, 5, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(288, 'Descrivere la classe vector di Java, indicando cosa sia la capacit&agrave; del Vector e perch&egrave; si differenzia dal numero di elementi in esso contenuti e cosa accade ai due valori quando si aggiungono o rimuovono elementi.', 4, 23, 1, 6, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(289, 'Descrivere cosa sia il tipo di un Vector in Java, quali tipi possono essere inseriti all&amp;#039;itnerno di un Vector e cosa siano le classi Wrapper', 4, 23, 1, 7, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(290, 'I file servono a:', 1, 25, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(291, 'Quale tra le seguenti NON &egrave; un&amp;#039;operazione che possiamo fare su file da Java', 1, 25, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(292, 'L&amp;#039;apertura di un file:', 1, 25, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(293, 'Lettura da file', 1, 25, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(294, 'Scrittura su file', 1, 25, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(295, 'Il package per getire input/output su Java &egrave;:', 1, 25, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(296, 'Uno stream &egrave;:', 1, 25, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(297, 'Abbiamo due categorie di classi per leggere e scrivere su file:', 1, 25, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(298, 'I due tipi di file che posso salvare su Java:', 1, 25, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(299, 'Un file strutturato:', 1, 25, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(300, 'Se voglio salvare un oggetto su file strutturato, la classe deve:', 1, 25, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(301, 'I metodi per leggere/scrivere su file in Java', 1, 25, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(302, 'Per suddividere una stringa in base ad uno specifico carattere possiamo usare la classe:', 1, 25, 2, 0, 1, '2023-01-15', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(303, 'Descrivi la struttura dati a pila. Quale strategia di inserimento/rimozione usa per i dati? Quali sono le operazioni di modifica e ricerca che possiamo utilizzare all&rsquo;interno della pila? Qual &egrave; l&rsquo;idea per implementare la pila in un linguaggio di programmazione a tua scelta?', 3, 26, 1, 8, 1, '2023-02-24', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(304, 'Descrivi la struttura dati lista concatenata, avvalendoti magari di un disegno. Perch&eacute; utilizzare questa struttura dati anzich&eacute; un semplice array dinamico? Come avviene l&#039;inserimento di un nuovo elemento nella lista?', 4, 26, 1, 8, 1, '2023-02-24', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(305, 'Descrivi la struttura dati a coda. Quale strategia di inserimento/rimozione usa per i dati? Quali sono le operazioni di modifica e ricerca che possiamo utilizzare all&rsquo;interno della coda? Qual &egrave; l&rsquo;idea per implementare la coda in un linguaggio di programmazione a tua scelta?', 3, 26, 1, 8, 1, '2023-02-24', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(306, 'Il seguente disegno rappresenta una struttura dati ad albero con nodi contenenti lettere. Indicare quali sono i nodi foglia, qual &egrave; il nodo radice e quali sono i nodi interni:', 2, 26, 4, 0, 1, '2023-02-24', '&amp;lt;p&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;/CreatoreTest/kcfinder/public/image/albero.jpg&amp;quot; style=&amp;quot;height:286px; width:371px&amp;quot; /&amp;gt;&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(307, 'l seguente disegno rappresenta una struttura dati ad albero con nodi contenenti numeri. Indicare quali sono i nodi foglia, qual &egrave; il nodo radice e quali sono i nodi interni', 2, 26, 4, 0, 1, '2023-02-24', '&amp;lt;p&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;/CreatoreTest/kcfinder/public/image/alberonum.jpg&amp;quot; style=&amp;quot;height:215px; width:247px&amp;quot; /&amp;gt;&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(308, 'Disegnare come cambia il seguente albero binario di ricerca inserendo i nodi con i valori: 9, 16, 5, 2', 2, 26, 4, 0, 1, '2023-02-24', '&amp;lt;p&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;/CreatoreTest/kcfinder/public/image/alberobin1.jpg&amp;quot; style=&amp;quot;height:197px; width:231px&amp;quot; /&amp;gt;&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(309, 'Disegnare come cambia il seguente albero binario di ricerca inserendo i nodi con i valori: 4, 17, 33, 51, 58, 67', 2, 26, 4, 0, 1, '2023-02-24', '&amp;lt;p&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;/CreatoreTest/kcfinder/public/image/alberobin2.jpg&amp;quot; style=&amp;quot;height:360px; width:400px&amp;quot; /&amp;gt;&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(310, 'Dato il seguente albero scrivi la sequenza dei nodi nella visita in preordine e nella visita in postordine', 2, 26, 4, 0, 1, '2023-02-24', '&amp;lt;p&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;/CreatoreTest/kcfinder/public/image/alberobin3.jpg&amp;quot; style=&amp;quot;height:250px; width:470px&amp;quot; /&amp;gt;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;_____________________________________________________________________________________________________&amp;lt;br /&amp;gt;\r\n&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;_____________________________________________________________________________________________________&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(311, 'Dato il seguente albero con nodi contenenti numeri scrivi la sequenza dei nodi nella visita in preordine e nella visita in postordine', 2, 26, 4, 0, 1, '2023-02-24', '&amp;lt;p&amp;gt;&amp;lt;img alt=&amp;quot;&amp;quot; src=&amp;quot;/CreatoreTest/kcfinder/public/image/alberobin4.jpg&amp;quot; style=&amp;quot;height:250px; width:444px&amp;quot; /&amp;gt;&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(312, 'Perch&eacute; utilizzare le funzioni nei linguaggi di programmazione?', 3, 27, 1, 4, 1, '2023-03-13', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(313, 'Quali sono gli elementi necessari a dichiarare una funzione in Python?', 3, 27, 1, 3, 1, '2023-03-13', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(314, 'Scrivere il codice per la funzione che fa la moltiplicazione di due numeri. Scrivere inoltre il codice per richiamare la funzione con i numeri 5 e 8 come parametri attuali', 3, 27, 1, 4, 1, '2023-03-13', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(315, 'Cosa si intende per visibilit&agrave; locale e per visibilit&agrave; globale di una variabile?', 3, 27, 1, 4, 1, '2023-03-13', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(316, 'Cosa si intende con parametri formali e parametri attuali?', 3, 27, 1, 3, 1, '2023-03-13', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(317, 'Quali sono le 3 regole di corrispondenza tra parametri formali e parametri attuali in Python?', 3, 27, 1, 5, 1, '2023-03-13', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(318, 'Spiegare la differenza del passaggio dei parametri per valore e per riferimento', 3, 27, 1, 3, 1, '2023-03-13', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(319, 'Cosa si intende con namespace?', 3, 27, 1, 3, 1, '2023-03-13', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(320, 'Cosa si intende per shadowing? Fare un esempio', 3, 27, 1, 4, 1, '2023-03-13', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(321, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;def percentuale(x,y):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; z=x*(y/100)&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; return z&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nprint(percentuale(%%7,10??0,%%1,3??0))&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n___________________________________________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1),
(322, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;def assoluto(x):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; if x&amp;gt;=0:&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; return x&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; else:&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; return -x&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nprint(assoluto(%%-4,4??))&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;_____________________________________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1);
INSERT INTO `ct_domande` (`id_domanda`, `domanda`, `punti`, `fk_argomento`, `fk_tipo_domanda`, `num_righe`, `fk_libro`, `data_creazione`, `ese_num`, `fk_utente`, `num_gruppo`, `livello_diff`) VALUES
(323, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;def power(x,y):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; if(y&amp;gt;0):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; return x**y&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; else:&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; return &amp;quot;Errore&amp;quot;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nprint(power(2,%%-4,4??))&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;___________________________________________________________________________________________&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n___________________________________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1),
(324, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;def intercetta_x(m,q):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; x=-q/m&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; return x&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nprint(intercetta_x(%%2,4??,%%8,10??))&lt;/p&gt;\r\n', 1, 0, 1),
(325, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;def somma():&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; c=a+b&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; print(c)&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\na=%%2,8??&lt;br /&gt;\r\nb=%%3,12??&lt;br /&gt;\r\nprint(somma())&lt;/p&gt;\r\n\r\n&lt;p&gt;___________________________________________________________________________________________________________&lt;/p&gt;\r\n\r\n&lt;p&gt;___________________________________________________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1),
(326, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;def somma(a,b):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; c=a+b&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; return c&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\na=%%3,6??&lt;br /&gt;\r\nb=%%6,10??&lt;br /&gt;\r\nprint(somma(%%5,11??,%%9,14??))&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;________________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1),
(327, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;def somma():&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; c=a+b&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; return c&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nprint(somma(%%3,5??,%%10,13??))&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;_________________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1),
(328, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;a=6&lt;/p&gt;\r\n\r\n&lt;p&gt;def somma(b):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; c=a+b&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nsomma(10)&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n____________________________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1),
(329, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;a=%%2,10??&lt;/p&gt;\r\n\r\n&lt;p&gt;def somma(b):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; c=a+b&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; return c&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nsomma(%%1,7??)&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;_______________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1),
(330, 'Cosa stampa il seguente frammento di codice?', 2, 27, 4, 0, 1, '2023-03-13', '&amp;lt;p&amp;gt;a=%%1,8??&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;def somma(b):&amp;lt;br /&amp;gt;\r\n&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; c=a+b&amp;lt;br /&amp;gt;\r\n&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; return c&amp;lt;br /&amp;gt;\r\n&amp;amp;nbsp;&amp;amp;nbsp; &amp;amp;nbsp;&amp;lt;br /&amp;gt;\r\nprint(somma(a))&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;lt;br /&amp;gt;\r\n________________________________________________________________________&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(331, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;def somma(b):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; a=%%4,12??&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; c=a+b&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; return c&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nprint(somma(a))&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n___________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1),
(332, 'Cosa stampa il seguente frammento di codice?', 2, 27, 4, 0, 1, '2023-03-13', '&amp;lt;p&amp;gt;def somma(a=%%3,8??,b):&amp;lt;br /&amp;gt;\r\n&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; c=a+b&amp;lt;br /&amp;gt;\r\n&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; return c&amp;lt;br /&amp;gt;\r\n&amp;amp;nbsp;&amp;amp;nbsp; &amp;amp;nbsp;&amp;lt;br /&amp;gt;\r\nprint(somma())&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;lt;br /&amp;gt;\r\n_____________________________________________________________&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(333, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;def somma(a=%%1,7??,b=%%10,15??):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; c=a+b&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; return c&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nprint(somma())&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n____________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1),
(334, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;def somma(a,b=%%2,5??):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; c=a+b&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; return c&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nprint(somma(%%1,5??,%%7,12??))&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n______________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1),
(335, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;def somma(a,b=%%2,6??):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; c=a+b&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; return c&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nprint(somma(%%1,7??))&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;___________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1),
(336, 'Cosa stampa il seguente frammento di codice?', 2, 27, 4, 0, 1, '2023-03-13', '&amp;lt;p&amp;gt;a=%%4,8??&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;def somma(a,b):&amp;lt;br /&amp;gt;\r\n&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; return a+b&amp;lt;br /&amp;gt;\r\n&amp;amp;nbsp;&amp;amp;nbsp; &amp;amp;nbsp;&amp;lt;br /&amp;gt;\r\ndef main():&amp;lt;br /&amp;gt;\r\n&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; a=%%1,3??&amp;lt;br /&amp;gt;\r\n&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; print(somma(a,%%10,14??))&amp;lt;br /&amp;gt;\r\n&amp;amp;nbsp;&amp;amp;nbsp; &amp;amp;nbsp;&amp;lt;br /&amp;gt;\r\nmain()&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;lt;br /&amp;gt;\r\n____________________________________________________________________&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(337, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;a=%%1,5??&lt;/p&gt;\r\n\r\n&lt;p&gt;def somma(a,b):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; a=%%6,10??&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; return a+b&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\ndef main():&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; print(somma(a,5))&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nmain()&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n____________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1),
(338, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;a=%%1,5??&lt;/p&gt;\r\n\r\n&lt;p&gt;def somma(a,b):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; return a+b&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\ndef main():&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; print(somma(a,%%6,10??))&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nmain()&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n____________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1),
(339, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;a=%%1,5??&lt;/p&gt;\r\n\r\n&lt;p&gt;def somma(b=%%6,10??):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; return a+b&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\ndef main():&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; print(somma(%%11,15??))&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nmain()&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n___________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1),
(340, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;a=%%1,5??&lt;/p&gt;\r\n\r\n&lt;p&gt;def somma(b=%%6,10??):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; return a+b&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\ndef main():&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; print(somma())&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nmain()&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n___________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1),
(341, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;a=%%6,10??&lt;/p&gt;\r\n\r\n&lt;p&gt;def somma(b):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; global a&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; a=%%1,5??&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; return a+b&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\ndef main():&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; print(somma(10))&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nmain()&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1),
(342, 'Cosa stampa il seguente frammento di codice?', 1, 27, 4, 0, 1, '2023-03-13', '&lt;p&gt;def somma(b):&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; global a&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; a=%%3,8??&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; return a+b&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\ndef main():&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; print(somma(%%10,14??))&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp; print(a)&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nmain()&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n___________________________________________________________________________&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;___________________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 1),
(343, 'Cos&rsquo;&egrave; e a cosa serve un modulo in Python?', 3, 27, 1, 5, 1, '2023-03-13', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(344, 'Inserire di seguito il codice per importare un modulo denominato funzioni, al cui interno vi siano 2 funzioni denominate somma e prodotto. Inserire anche come si importa la sola funzione somma e come si importa dando un alias (ad esempio f) al modulo', 3, 27, 1, 3, 1, '2023-03-13', '&amp;lt;p&amp;gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&amp;lt;/p&amp;gt;\r\n', 1, 0, 1),
(345, 'Il nome NoSQL significa', 1, 28, 2, 0, 1, '2023-09-26', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(346, 'I database NoSQL:', 1, 28, 2, 0, 1, '2023-09-26', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(347, 'Cosa si intende con basically available per db NoSQL?', 1, 28, 2, 0, 1, '2023-09-26', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(348, 'Cosa significa eventually consistent per un database NoSQL?', 1, 28, 2, 0, 1, '2023-09-26', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(349, 'Il teorema di Brewer sostiene che:', 1, 28, 2, 0, 1, '2023-09-26', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(350, 'Quale propriet&agrave; NON riesce ad avere un db relazionale rispetto al teorema di Brewer?', 1, 28, 2, 0, 1, '2023-09-26', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(351, 'Perch&eacute; se ho Partition Tolerance e Availability non posso avere consistency?', 1, 28, 2, 0, 1, '2023-09-26', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(352, 'Quale tra i seguenti NON &egrave; un tipo di db NoSQL?', 1, 28, 2, 0, 1, '2023-09-26', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(353, 'Quale tra i seguenti NON &egrave; un DBMS NoSQL?', 1, 28, 2, 0, 1, '2023-09-26', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(354, 'MongoDB utilizza documenti in formato:', 1, 28, 2, 0, 1, '2023-09-26', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(355, 'Il DBMS NoSQL Cassandra utilizza una topologia:', 1, 28, 2, 0, 1, '2023-09-26', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 1),
(356, 'Cos&#039;&egrave; un&#039;istanza di una classe? Cos&#039;&egrave; un attributo? Fare degli esempi', 3, 31, 1, 4, 1, '2023-10-02', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(357, 'Qual &egrave; la differenza tra attributi identificatori e descrittori? Fare un esempio di ognuno', 3, 31, 1, 4, 1, '2023-10-02', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(358, 'Qual &egrave; la differenza tra attributi identificatori e descrittori? Fare un esempio di un attributo identificatore e di un descrittore', 3, 31, 1, 4, 1, '2023-10-02', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(359, 'Indicare e dare una breve descrizione di alcune tipologie o classificazioni per gli attributi di una classe', 3, 31, 1, 5, 1, '2023-10-02', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(360, 'Descrivere le propriet&agrave; ACID di una transazione su un database', 3, 13, 1, 6, 1, '2023-10-02', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(361, 'Disegnare con notazione UML la classe che rappresenta un Libro con i suoi attributi', 3, 31, 4, 0, 1, '2023-10-02', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 1, 0, 3),
(362, 'Disegnare con notazione UML la classe che rappresenta un Film con i suoi attributi', 3, 31, 4, 0, 1, '2023-10-02', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 1, 0, 3),
(363, 'Disegnare con notazione UML la classe che rappresenta uno SmartPhone con i suoi attributi', 3, 31, 4, 0, 1, '2023-10-02', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 1, 0, 3),
(364, 'Disegnare con notazione UML la classe che rappresenta un Quadro di una mostra con i suoi attributi', 3, 31, 4, 0, 1, '2023-10-02', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 1, 0, 3),
(365, 'Disegnare con notazione UML la classe che rappresenta una Bottiglia di Vino con i suoi attributi', 3, 31, 4, 0, 1, '2023-10-02', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 1, 0, 3),
(366, 'Quali sono le caratteristiche dei linguaggi formali? Dare una breve spiegazione di ognuna', 3, 12, 1, 5, 1, '2023-10-09', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(367, 'Dare una definizione di linguaggio ad alto livello e di linguaggio a basso livello', 3, 12, 1, 4, 1, '2023-10-09', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(368, 'Dare una definizione di costante e fare almeno un esempio di costante. Come si scrive per convenzione una costante?', 3, 12, 1, 4, 1, '2023-10-09', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(369, 'Qual &egrave; la differenza tra selezione singola, doppia e multipla? (Si pu&ograve; anche disegnare il blocco relativo del diagramma a blocchi per rispondere)', 3, 12, 1, 4, 1, '2023-10-09', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(371, 'Risolvi l&#039;indovinello di Einstein semplificato (da fare per ultimo per il 10):', 2, 12, 4, 0, 1, '2023-10-09', '&lt;p&gt;In un quartiere ci sono tre case, ognuna di un colore diverso: una rossa, una blu e una verde. In ciascuna casa vive una persona di nazionalit&amp;agrave; diversa: una italiana, una spagnola e una francese. Ognuna di queste persone beve una bevanda diversa: il caff&amp;egrave;, il t&amp;egrave; e il latte. Inoltre, ognuna di loro ha un animale domestico diverso: un cane, un gatto e un pesce. Chi ha il pesce? Ecco alcune informazioni su queste case e i loro abitanti:&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li&gt;La casa rossa &amp;egrave; a sinistra della casa verde.&lt;br /&gt;\r\n	La persona che vive nella casa rossa beve caff&amp;egrave;.&lt;br /&gt;\r\n	La casa verde non &amp;egrave; adiacente alla casa blu.&lt;br /&gt;\r\n	La persona che vive nella casa verde ha un gatto.&lt;br /&gt;\r\n	La persona francese vive nella prima casa.&lt;br /&gt;\r\n	La persona che beve latte non vive nella casa blu.&lt;br /&gt;\r\n	La persona che vive a sinistra dello spagnolo ha un cane.&lt;br /&gt;\r\n	La persona italiana vive vicino a chi beve latte.&lt;/li&gt;\r\n&lt;/ol&gt;\r\n', 1, 3, 3),
(372, 'Qual &egrave; la differenza tra programmazione procedurale, strutturata e ad oggetti?', 3, 9, 1, 5, 1, '2023-10-10', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(373, 'Quali sono i vantaggi della programmazione ad oggetti? Darne una breve descrizione', 3, 9, 1, 5, 1, '2023-10-10', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(374, 'Cosa sono gli attributi ed i metodi di una classe? Fare un esempio', 3, 9, 1, 5, 1, '2023-10-10', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(375, 'Qual &egrave; la differenza tra classe ed oggetto? Fare un esempio', 3, 9, 1, 5, 1, '2023-10-10', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(376, 'Disegnare un possibile diagramma delle classi UML per la classe Film, inserendo almeno 2 attributi e 2 metodi', 3, 9, 4, 0, 1, '2023-10-10', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 1, 0, 3),
(377, 'Disegnare un possibile diagramma delle classi UML per la classe Nave, inserendo almeno 2 attributi e 2 metodi', 3, 9, 4, 0, 1, '2023-10-10', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 1, 0, 3),
(378, 'Disegnare un possibile diagramma delle classi UML per la classe SmartPhone, inserendo almeno 2 attributi e 2 metodi', 3, 9, 4, 0, 1, '2023-10-10', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 1, 0, 3),
(379, 'Disegnare un possibile diagramma delle classi UML per la classe Notebook, inserendo almeno 2 attributi e 2 metodi', 3, 9, 4, 0, 1, '2023-10-10', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 1, 0, 3),
(380, 'A cosa serve il metodo costruttore? Come si dichiara in Python?', 3, 9, 1, 4, 1, '2023-10-10', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(381, 'Spiegare cosa si intende con incapsulamento nella programmazione ad oggetti', 3, 9, 1, 4, 1, '2023-10-10', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(382, 'Spiegare cosa si intende con information hiding in un linguaggio ad oggetti e come si realizza in pratica', 3, 9, 1, 5, 1, '2023-10-10', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(383, 'Cosa si intende con interfaccia di un oggetto?', 3, 9, 1, 3, 1, '2023-10-10', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(386, 'La parola che per convenzione &egrave; usata per riferirsi all&#039;istanza corrente di una classe in Python:', 1, 9, 2, 0, 1, '2023-10-10', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(388, 'Cosa fa la funzione __init__ in Python?', 1, 9, 2, 0, 1, '2023-10-10', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(390, 'Come posso richiamare il metodo &#039;stampa&#039; senza parametri sull&#039;oggetto &#039;ogg&#039; in Python?', 1, 9, 2, 0, 1, '2023-10-10', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(392, 'Qual &egrave; la corretta definizione di un costruttore per creare oggetti con 1 parametro in Python?', 1, 9, 2, 0, 1, '2023-10-10', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(393, 'Un&#039;istanza di una classe &egrave;:', 1, 9, 2, 0, 1, '2023-10-10', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(395, 'Quale delle seguenti non pu&ograve; creare correttamente un oggetto della classe Cane in Python?', 1, 9, 2, 0, 1, '2023-10-10', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(396, 'Un programmatore pratica le seguenti tariffe per la creazione di nuovi programmi in base al numero di giornate che comporta il lavoro:', 5, 15, 4, 0, 1, '2023-10-22', '&lt;table border=&quot;1&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;width:100%&quot;&gt;\r\n	&lt;thead&gt;\r\n		&lt;tr&gt;\r\n			&lt;th style=&quot;background-color:rgb(239, 239, 239); width:50%&quot;&gt;&lt;span style=&quot;font-size:15px&quot;&gt;Giornate di lavoro&lt;/span&gt;&lt;/th&gt;\r\n			&lt;th style=&quot;background-color:rgb(239, 239, 239); width:50%&quot;&gt;&lt;span style=&quot;font-size:15px&quot;&gt;COSTO IN EURO&lt;/span&gt;&lt;/th&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/thead&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:15px&quot;&gt;1 - 10&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:15px&quot;&gt;%%15,30?? euro a giornata&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:15px&quot;&gt;11 - 30&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:15px&quot;&gt;%%25, 40?? euro a giornata + %%5,10?? euro per ogni giornata oltre le 20&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:15px&quot;&gt;31 e oltre&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:15px&quot;&gt;%%45,65?? euro a giornata - il %%5,10?? % sul totale, che applica come sconto&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\nCreare il diagramma a blocchi che, dato il numero di giorni di lavoro, calcoli e stampi l&amp;#39;importo totale che il programmatore chieder&amp;agrave; per effettuare il lavoro. Le giornate di lavoro devono essere come minimo 1, dare errore in caso contrario&lt;/p&gt;\r\n', 1, 1, 3),
(397, 'Creare con Flowgorithm il diagramma a blocchi che risolva il seguente problema:', 5, 15, 4, 0, 1, '2023-10-22', '&lt;p&gt;Mario ha a disposizione due piedistalli a forma di cubo sui quali sistemare delle fioriere all&amp;#39;esterno della sua casa. Vuole dipingere il primo cubo di azzurro ed il secondo di giallo, in modo da intonarsi con i fiori. Creare un programma che indichi quanto spender&amp;agrave; Mario per dipingere i due cubi, chiedendo in input: il lato dei 2&amp;nbsp;cubi&amp;nbsp;in metri, quanti metri quadrati si riesce a dipingere con un barattolo di vernice, quanto costa ogni barattolo di vernice gialla e quanto ogni barattolo di&amp;nbsp;azzurra. I dati in inputnon possono essere minori o uguali a 0, se uno di essi&amp;nbsp;&amp;egrave; minore o uguale a 0 segnalare un errore.&lt;/p&gt;\r\n', 1, 2, 3),
(398, 'Risolvi il seguente problema utilizzando il ciclo FOR', 4, 15, 4, 0, 1, '2023-11-03', '&lt;p&gt;Chiedere in input da tastiera %%3,8??&amp;nbsp;numeri e indicare in output quanti sono i numeri letti pari e quanti sono i numeri letti dispari&lt;/p&gt;\r\n', 1, 1, 3),
(399, 'Usare il ciclo FOR per implementare il seguente programma', 4, 15, 4, 0, 1, '2023-11-03', '&lt;p&gt;Date %%3,7?? coppie di numeri naturali in input, dire in output quante hanno lo stesso valore di parit&amp;agrave;. Quindi dire quante coppie hanno 2 numeri pari o due numeri dispari e quante coppie hanno un pari e un dispari.&lt;/p&gt;\r\n', 1, 1, 3),
(400, 'Risolvi il seguente problema utilizzando il ciclo definito FOR:', 4, 15, 4, 0, 1, '2023-11-03', '&lt;p&gt;Date %%3,7?? coppie di numeri interi, stampare la media dei primi numeri della coppia e la somma dei secondi numeri della coppia. Dire se la somma finale &amp;egrave; pari o dispari, la media deve comparire con la virgola&lt;/p&gt;\r\n', 1, 1, 3),
(401, 'Creare il programma che implementi il seguente algoritmo, con ciclo FOR', 4, 15, 4, 0, 1, '2023-11-03', '&lt;p&gt;Leggere %%4,9?? numeri da tastiera, fare la somma dei pari ed il prodotto dei dispari e dare in output il primo ed il secondo valore calcolato.&amp;nbsp;&lt;/p&gt;\r\n', 1, 1, 3),
(402, 'Utilizzando un doppio ciclo, realizza il programma seguente:', 6, 15, 4, 0, 1, '2023-11-03', '&lt;p&gt;Stampare svariati conti alla rovescia, a partire da un numero dato in input dall&amp;#39;utente. Il primo conto&amp;nbsp;alla rovescia parte&amp;nbsp;dal numero dato in input e arriva&amp;nbsp;fino a 0. Il secondo dal numero - 1 fino a 0, il terzo dal numero - 2 fino a 0 e cos&amp;igrave; via fino a che il conto alla rovescia non parte da 1. Continuare a chiedere in input il numero fino a che l&amp;#39;utente non inserisca un numero maggiore di 1, dare un errore e richiedere il numero se l&amp;#39;utente lo inserisce minore o uguale a 1.&lt;/p&gt;\r\n\r\n&lt;p&gt;Esempio di esecuzione (in grassetto input dell&amp;#39;utente):&lt;/p&gt;\r\n\r\n&lt;p&gt;Inserire numero: &lt;strong&gt;1&lt;/strong&gt;&lt;br /&gt;\r\nErrore! Il numero deve essere minimo 2&lt;br /&gt;\r\nInserire numero: &lt;strong&gt;0&lt;/strong&gt;&lt;br /&gt;\r\nErrore! Il numero deve essere minimo 2&lt;br /&gt;\r\nInserire numero: &lt;strong&gt;5&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;5 4 3 2 1 0&lt;br /&gt;\r\n4 3 2 1 0&lt;br /&gt;\r\n3 2 1 0&lt;br /&gt;\r\n2 1 0&lt;br /&gt;\r\n1 0&lt;/p&gt;\r\n', 1, 3, 3),
(403, 'Utilizzando un doppio ciclo realizzare il programma seguente:', 6, 15, 4, 0, 1, '2023-11-03', '&lt;p&gt;Chiedere un input all&amp;#39;utente. Continuare a chiedere l&amp;#39;input all&amp;#39;utente fino a che non inserisce un numero inferiore a 10 e superiore a 1. Se il numero inserito non &amp;egrave; corretto segnalare un errore e chiedere nuovamente il numero.&amp;nbsp;Il programma deve stampare le tabelline dei numeri da 1 al numero letto.&lt;/p&gt;\r\n\r\n&lt;p&gt;Esempio di esecuzione (in grassetto l&amp;#39;input dell&amp;#39;utente)&lt;/p&gt;\r\n\r\n&lt;p&gt;Inserire un numero: &lt;strong&gt;12&lt;/strong&gt;&lt;br /&gt;\r\nErrore! Il numero deve essere compreso tra 1 e 10&lt;br /&gt;\r\nInserire un numero: &lt;strong&gt;0&lt;/strong&gt;&lt;br /&gt;\r\nErrore! Il numero deve essere compreso tra 1 e 10&lt;br /&gt;\r\nInserire un numero: &lt;strong&gt;5&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;1 2 3 4 5 6 7 8 9 10&lt;br /&gt;\r\n2 4 6 8 10 12 14 16 18 20&lt;br /&gt;\r\n3 6 9 12 15 18 21 24 27 30&lt;br /&gt;\r\n4 8 12 16 20 24 28 32 36 40&lt;br /&gt;\r\n5 10 15 20 25 30 35 40 45 50&lt;/p&gt;\r\n', 1, 3, 3),
(404, 'Utilizzando un doppio ciclo FOR risolvere il seguente problema:', 6, 15, 4, 0, 1, '2023-11-03', '&lt;p&gt;Chiedere un numero in input all&amp;#39;utente. L&amp;#39;input deve essere compreso tra 10 e 100. Continuare a chiedere il numero fino a che l&amp;#39;utente non ne inserisce uno valido. Se l&amp;#39;input non &amp;egrave; valido dare un errore e chiedere nuovamente il numero in input.&lt;/p&gt;\r\n\r\n&lt;p&gt;Il programma deve stampare la somma di&amp;nbsp;tutti i numeri dispari compresi tra 5 e 10, tra 5&amp;nbsp;e 15, tra 5&amp;nbsp;e 20&amp;nbsp;e cos&amp;igrave; via, incrementando di volta in volta il limite superiore di 5 e arrivando al numero letto in input.&lt;/p&gt;\r\n\r\n&lt;p&gt;Esempio di esecuzione (input dell&amp;#39;utente in grassetto):&lt;/p&gt;\r\n\r\n&lt;p&gt;Inserisci numero: 5&lt;br /&gt;\r\nErrore! Il numero deve stare tra 10 e 100&lt;br /&gt;\r\nInserisci numero: 120&lt;br /&gt;\r\nErrore! Il numero deve stare tra 10 e 100&lt;br /&gt;\r\nInserisci numero: 28&lt;br /&gt;\r\n21&amp;nbsp;&lt;br /&gt;\r\n60&lt;br /&gt;\r\n96&lt;br /&gt;\r\n165&lt;/p&gt;\r\n\r\n&lt;p&gt;N.B: 21 = 5+7+9, 60&amp;nbsp;= 5+7+9+11+13+15, 96 =&amp;nbsp;5+7+9+11+13+15+17+19, 165&amp;nbsp;=&amp;nbsp;5+7+9+11+13+15+17+19+21+23+25, poi si ferma perch&amp;egrave; 25+5=30, superiore al 28&lt;/p&gt;\r\n', 1, 3, 3),
(405, 'Utilizzare il ciclo indefinito while per risolvere il seguente problema:', 5, 15, 4, 0, 1, '2023-11-03', '&lt;p&gt;Chiedere in input all&amp;#39;utente una sequenza di numeri fino a che non inserisce 0. Fare la somma di tutti i numeri letti. Stampare se la somma finale &amp;egrave; maggiore o minore di 0&lt;/p&gt;\r\n', 1, 0, 3),
(406, 'Creare con Flowgorithm il diagramma a blocchi che risolva il seguente problema:', 6, 15, 4, 0, 1, '2023-11-03', '&lt;p&gt;Chiedere all&amp;#39;utente un numero compreso tra 5 e 10, chiameremo questo numero NUM. Dare un errore se il numero non rispetta la condizione.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chiedere all&amp;#39;utente una serie di NUM&amp;nbsp;coppie di numeri. Sommare in una variabile il prodotto dei due numeri della coppia, ma solo se questo &amp;egrave; pari.&lt;/p&gt;\r\n\r\n&lt;p&gt;Esempio: viene inserita la coppia 5 e 8. 5*8=40, 40 &amp;egrave; pari quindi far&amp;agrave; parte della somma.&lt;br /&gt;\r\nviene inserito 9 e 3, il prodotto da 27, numero dispari, non lo sommo al 40.&lt;/p&gt;\r\n', 1, 0, 3),
(407, 'Utilizzare un ciclo indefinito per risolvere il seguente problema', 5, 15, 4, 0, 1, '2023-11-18', '&lt;p&gt;Vi sono 2 centometristi: Jacobs e Bolt,&amp;nbsp;che devono effettuare una gara sui 100 metri piani.&amp;nbsp;&lt;br /&gt;\r\nChiedere all&amp;#39;utente la velocit&amp;agrave; massima dei 2 velocisti in metri al secondo. Le velocit&amp;agrave; massime devono essere superiori a 10, altrimenti dare errore e chiudere il programma.&lt;br /&gt;\r\nSimulare la corsa dei cento metri, indicando dove si trova ogni concorrente ogni secondo. Ad ogni secondo i 2 concorrenti avanzano di un numero casuale di metri estratto tra 5 e il valore della loro velocit&amp;agrave; massima data dall&amp;#39;utente.&lt;br /&gt;\r\nIndicare chi arriva primo e secondo in base alle loro posizioni finali, dopo che entrambi hanno tagliato il traguardo.&lt;/p&gt;\r\n\r\n&lt;p&gt;Esempio:&lt;br /&gt;\r\nVelocit&amp;agrave; massima Jacobs: 40&lt;br /&gt;\r\nVelocit&amp;agrave; massima Bolt: 37&lt;/p&gt;\r\n\r\n&lt;p&gt;Dopo 1 secondo -&amp;gt; Jacobs valore a caso tra 5 e 40, ad esempio&amp;nbsp;viene estratto 24, quindi la posizione di Jacobs sar&amp;agrave; 24, Bolt altro valore a caso tra 5 e 37, esempio 16, quindi Bolt si trova a 16 metri&lt;br /&gt;\r\nDopo 2 secondi -&amp;gt;&amp;nbsp;Jacobs valore a caso tra 5 e 40, ad esempio&amp;nbsp;viene estratto 12, quindi la posizione di Jacobs sar&amp;agrave; 24+12=36, Bolt estare a caso 15, quindi arriva a 31 metri... e cos&amp;igrave; via fino a che non tagliano il traguardo a 100 metri.&lt;/p&gt;\r\n\r\n&lt;p&gt;Al primo posto arriva Bolt&lt;br /&gt;\r\nAl secondo posto arriva Jacobs&lt;/p&gt;\r\n', 1, 2, 3),
(408, 'Utilizzare il ciclo FOR per risolvere il seguente esercizio:', 4, 15, 4, 0, 1, '2023-11-18', '&lt;p&gt;Scrivi un programma che chieda all&amp;#39;utente di inserire una sequenza di %%5,10??&amp;nbsp;numeri interi. Il programma dovrebbe quindi determinare e stampare il numero massimo&amp;nbsp;tra quelli inseriti&lt;/p&gt;\r\n', 1, 1, 3),
(409, 'Realizza il seguente programma, utilizzando un doppio ciclo', 6, 15, 4, 0, 1, '2023-11-19', '&lt;p&gt;Chiedi in input un numero all&amp;#39;utente. Il numero richiesto deve essere compreso tra 10 e 20. Continua a chiedere in input il numero nel caso l&amp;#39;utente sbagli ad inserirlo.&lt;br /&gt;\r\nCalcola e stampa la somma di tutti i numeri compresi tra 1 ed il numero inserito, poi tra 1 ed il numero inserito -1, poi tra 1 ed il numero inserito -2 e cos&amp;igrave; via fino ad arrivare alla somma di 1 e 2.&lt;/p&gt;\r\n\r\n&lt;p&gt;Esempio di esecuzione (in grassetto l&amp;#39;input dell&amp;#39;utente):&lt;br /&gt;\r\nInserisci un numero tra 10 e 20: &lt;strong&gt;25&lt;/strong&gt;&lt;br /&gt;\r\nErrore! Il numero deve essere compreso tra 10 e 20&lt;br /&gt;\r\nInserisci un numero tra 10 e 20: &lt;strong&gt;8&lt;/strong&gt;&lt;br /&gt;\r\nErrore! Il numero deve essere compreso tra 10 e 20&lt;br /&gt;\r\nInserisci un numero tra 10 e 20: &lt;strong&gt;18&lt;/strong&gt;&lt;br /&gt;\r\nSomma fino a 18:&amp;nbsp; 171&lt;br /&gt;\r\nSomma fino a 17:&amp;nbsp; 153&lt;br /&gt;\r\nSomma fino a 16:&amp;nbsp; 136&lt;br /&gt;\r\n.........&lt;/p&gt;\r\n', 1, 3, 3),
(410, 'Crea il diagramma delle classi UML per la seguente realt&agrave;:', 7, 31, 4, 0, 1, '2023-11-23', '&lt;p&gt;Una singola stazione ferroviaria deve gestire treni in partenza e in arrivo tramite database.&lt;br /&gt;\r\nI treni che transitano per la stazione hanno un certo numero di vagoni ed un codice identificativo, un numero massimo di passeggeri che possono trasportare, un tipo di motore (elettrico o diesel), una tipologia (regionale, regionale veloce, intercity&amp;hellip;).&lt;br /&gt;\r\nI treni che transitano per la stazione hanno un orario di partenza, un binario di partenza, una stazione di arrivo&amp;nbsp;ed una stazione dalla quale sono partiti. Non interessa sapere tutte le fermate dei treni, solo da dove partono e dove arrivano.&lt;br /&gt;\r\nAl treno &amp;egrave; associato un macchinista ed uno o pi&amp;ugrave; controllori. Il macchinista lavora solo e sempre sullo stesso treno. I controllori possono lavorare su pi&amp;ugrave; treni.&amp;nbsp;&lt;br /&gt;\r\nSi vogliono inoltre salvare i dati dei clienti che acquistano i biglietti e del biglietto. Il biglietto nel nostro caso sar&amp;agrave; valido per un certo giorno e per una stazione di partenza ed una di arrivo, quindi non va indicato l&amp;#39;orario, &amp;egrave; valido per tutta la giornata su quel percorso. Il biglietto &amp;egrave; nominativo, quindi valido solo per il cliente che lo acquista.&lt;br /&gt;\r\n&lt;em&gt;Inserire un commento sulla scelta delle molteplicit&amp;agrave;.&lt;/em&gt;&lt;br /&gt;\r\n&lt;strong&gt;Esempio di dato completo:&lt;/strong&gt;&lt;br /&gt;\r\nLa stazione che deve gestire i treni &amp;egrave; la stazione di Verona. Il treno codice 45 &amp;egrave; un intercity con 6 vagoni e pu&amp;ograve; trasportare al massimo 300 passeggeri, ha un motore elettrico. Parte alle ore 15.00 dalla stazione di Verona con destinazione Padova, arriva dalla stazione di Milano. Il macchinista &amp;egrave; Carlo Verdi ed i controllori sono Mario Rossi e Veronica Gialli. Il cliente Fabio Bianchi acquista un biglietto per il 16/01/2024 per le stazioni di partenza/arrivo: Firenze - Verona.&lt;/p&gt;\r\n', 1, 0, 3),
(411, 'Dopo aver raffinato il diagramma delle classi sviluppato al punto 1, creare il modello logico conseguente, inserendo chiavi primarie, chiavi esterne e tipo dei campi per ogni tabella da creare.', 3, 31, 4, 0, 1, '2023-11-23', '', 1, 0, 3),
(412, 'Disegnare il diagramma UML delle classi per la seguente realt&agrave;:', 7, 31, 4, 0, 1, '2023-11-23', '&lt;p&gt;Un servizio di noleggio auto vuole registrare i dati necessari all&amp;rsquo;attivit&amp;agrave; tramite un database.&lt;br /&gt;\r\nIl servizio vuole registrare i dati riguardanti le automobili in suo possesso (marca, modello, km percorsi, colore, tipo di motore) ed i dati delle persone che noleggiano le auto.&lt;br /&gt;\r\nIl noleggio avviene in una certa data, per un certo numero di giorni.&lt;br /&gt;\r\nIl servizio vuole registrare anche&amp;nbsp;i dati del personale, associando il noleggio effettuato alla persona che ha fatto sottoscrivere il contratto di noleggio. Va registrato inoltre il pagamento finale effettuato alla riconsegna dell&amp;rsquo;automobile, con l&amp;rsquo;importo pagato ed il metodo di pagamento, associando la riconsegna all&amp;rsquo;impiegato che ritira l&amp;rsquo;automobile e fa effettuare il pagamento.&lt;br /&gt;\r\n&lt;em&gt;Inserire un commento sulla scelta delle molteplicit&amp;agrave;.&lt;/em&gt;&lt;br /&gt;\r\n&lt;strong&gt;Esempio di dato completo:&lt;/strong&gt; Il signor Mario Rossi, con CF RSSMRA78C12G892K noleggia il giorno 24 di dicembre 2022 per 10 giorni l&amp;rsquo;auto Fiat Panda rossa con motore a metano, km percorsi 18.400. Il contratto di noleggio &amp;egrave; stato fatto sottoscrivere dall&amp;rsquo;impiegato Giuseppe Verdi. Alla fine del noleggio, dopo 10 giorni, il signor Mario Rossi restituisce l&amp;rsquo;auto all&amp;rsquo;impiegata Valeria Bruni, pagando un importo di 450&amp;euro; in contanti.&lt;/p&gt;\r\n', 1, 0, 3),
(413, 'Crea il modello concettuale con diagramma delle classi UML per la seguente realt&agrave;:', 7, 31, 4, 0, 1, '2023-11-23', '&lt;p&gt;Una singola stazione ferroviaria deve gestire treni in partenza e in arrivo tramite database.&lt;br /&gt;\r\nI treni che transitano per la stazione hanno un certo numero di vagoni ed un codice identificativo, un numero massimo di passeggeri che possono trasportare, un tipo di motore (elettrico o diesel), una tipologia (regionale, regionale veloce, intercity&amp;hellip;).&lt;br /&gt;\r\nI treni che transitano per la stazione hanno un orario di partenza, un binario di partenza, una stazione di arrivo&amp;nbsp;ed una stazione dalla quale sono partiti. Non interessa sapere tutte le fermate dei treni, solo da dove partono e dove arrivano.&lt;br /&gt;\r\nAl treno &amp;egrave; associato un macchinista ed uno o pi&amp;ugrave; controllori. Il macchinista lavora solo e sempre sullo stesso treno. I controllori possono lavorare su pi&amp;ugrave; treni.&amp;nbsp;&lt;br /&gt;\r\n&lt;em&gt;Inserire un commento sulla scelta delle molteplicit&amp;agrave;.&lt;/em&gt;&lt;br /&gt;\r\n&lt;strong&gt;Esempio di dato completo:&lt;/strong&gt;&lt;br /&gt;\r\nLa stazione che deve gestire i treni &amp;egrave; la stazione di Verona. Il treno codice 45 &amp;egrave; un intercity con 6 vagoni e pu&amp;ograve; trasportare al massimo 300 passeggeri, ha un motore elettrico. Parte alle ore 15.00 dalla stazione di Verona con destinazione Padova, arriva dalla stazione di Milano. Il macchinista &amp;egrave; Carlo Verdi ed i controllori sono Mario Rossi e Veronica Gialli.&lt;/p&gt;\r\n', 1, 0, 3),
(414, 'Disegnare il diagramma delle classi UML per la seguente realt&agrave;:', 7, 31, 4, 0, 1, '2023-11-24', '&lt;p&gt;Una fumetteria vuole registrare i dati riguardanti il negozio su database.&lt;br /&gt;\r\nLa fumetteria, gestita da svariati dipendenti, vuole salvare i dati dei fumetti in suo possesso, con titolo, numero, data di pubblicazione, numero di pagine, prezzo. La fumetteria vende anche gadget, suddivisi in action figures (pupazzi) e magliette dei fumetti e vuole salvare i dati anche di questi oggetti, in particolare vuole conoscere quanti pezzi ha a disposizione di ogni oggetto. La fumetteria vuole tener traccia anche delle vendite, indicando i dati che vengono emessi con lo scontrino: fumetto o oggetto venduto, quantit&amp;agrave;, prezzo, totale, data scontrino. Vuole anche registrare nome e cognome del cliente che ha acquistato i prodotti. Si devono inoltre salvare i dati dei dipendenti e dei giorni nei quali lavorano al negozio.&lt;br /&gt;\r\n&lt;em&gt;Inserire un commento sulla scelta delle molteplicit&amp;agrave;.&lt;/em&gt;&lt;br /&gt;\r\n&lt;strong&gt;Esempio di dato completo&lt;/strong&gt;: la fumetteria ha a disposizione il fumetto &amp;ldquo;Superman&amp;rdquo; numero 2, pubblicato il 5/8/1965 con 30 pagine e che vende a 50&amp;euro;. Vende l&amp;rsquo;action figure di Superman, del peso di 70g a 30&amp;euro; e ne ha 2 a disposizione. In magazzino ha anche 10 magliette di Superman, taglia L, che vende a 15&amp;euro; l&amp;rsquo;una. Il signor Mario Rossi acquista il fumetto di Superman, una action figure e una maglietta di Superman, per un totale di 95&amp;euro; il 10/12/2022. I dipendenti che lavoravano il 10/12/2022 erano Giuseppe Verdi e Maria Bianchi.&lt;/p&gt;\r\n', 1, 0, 3),
(415, 'Cosa si intende per &quot;information hiding&quot; in programmazione ad oggetti?', 1, 32, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(416, 'Qual &egrave; l&#039;obiettivo principale dell&#039;ereditariet&agrave; in programmazione ad oggetti?', 1, 32, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(417, 'Cosa rappresenta una classe in programmazione ad oggetti?', 1, 32, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(418, 'Qual &egrave; la differenza tra una classe e un oggetto?', 1, 32, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(419, 'Cosa significa override in programmazione ad oggetti?', 1, 32, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(420, 'In che modo l&#039;ereditariet&agrave; contribuisce alla modularit&agrave; del codice in programmazione ad oggetti?', 1, 32, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(421, 'In Java, qual &egrave; il costruttore di default per una classe se non &egrave; definito esplicitamente?', 1, 17, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(422, 'In Python, qual &egrave; il metodo che viene chiamato automaticamente quando viene creata una nuova istanza di una classe?', 1, 9, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(423, 'In Java, qual &egrave; la parola chiave utilizzata per indicare l&#039;ereditariet&agrave; tra classi?', 1, 17, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(424, 'In Python, quale metodo di una classe &egrave; chiamato automaticamente quando si tenta di convertire un&#039;istanza in una stringa (overload dell&#039;operatore di stampa)?', 1, 9, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(425, 'In Python e java, quale &egrave; il simbolo utilizzato per accedere agli attributi e ai metodi di un oggetto?', 1, 32, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(426, 'In Java, quale &egrave; il modificatore di accesso che rende un membro della classe accessibile solo all&#039;interno della stessa classe o delle sue sottoclassi?', 1, 17, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(427, 'In Python, qual &egrave; il metodo utilizzato per chiamare un metodo sovrascritto della classe genitore all&#039;interno di una sottoclasse?', 1, 9, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(428, 'In Java, quale parola chiave &egrave; utilizzata per indicare che un metodo non restituisce alcun valore?', 1, 17, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(429, 'In Python, quale parola chiave &egrave; utilizzata per indicare che una funzione non restituisce alcun valore?', 1, 9, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(430, 'In programmazione ad oggetti, qual &egrave; il concetto utilizzato per raggruppare dati e operazioni che manipolano quei dati?', 1, 32, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(431, 'In programmazione ad oggetti, qual &egrave; il tipo di relazione tra due classi dove una classe &egrave; un&#039;estensione di un&#039;altra?', 1, 32, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(432, 'Qual &egrave; il principio di inserimento e rimozione degli elementi di una pila?', 1, 32, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(433, 'Qual &egrave; il principio di inserimento e rimozione degli elementi di una coda?', 1, 32, 2, 0, 1, '2024-04-20', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(434, 'Data la classe seguente indicare cosa stampa il programma Java quando viene lanciato:', 1, 17, 4, 0, 1, '2024-04-20', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/CreatoreTest/kcfinder/public/image/CosaStampa1.jpg&quot; style=&quot;height:1010px; width:1347px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;_____________________________________________________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 3);
INSERT INTO `ct_domande` (`id_domanda`, `domanda`, `punti`, `fk_argomento`, `fk_tipo_domanda`, `num_righe`, `fk_libro`, `data_creazione`, `ese_num`, `fk_utente`, `num_gruppo`, `livello_diff`) VALUES
(435, 'Data la classe seguente indicare cosa stampa il programma Java quando viene lanciato:', 1, 17, 4, 0, 1, '2024-04-20', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/CreatoreTest/kcfinder/public/image/CosaStampa2.jpg&quot; style=&quot;height:997px; width:1353px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;_________________________________________________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 3),
(436, 'Data la classe seguente indicare cosa stampa il programma Java quando viene lanciato:', 1, 17, 4, 0, 1, '2024-04-20', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/CreatoreTest/kcfinder/public/image/CosaStampa3.jpg&quot; style=&quot;height:1040px; width:1307px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;______________________________________________________________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 3),
(437, 'Data la classe seguente indicare cosa stampa il programma Java quando viene lanciato:', 1, 17, 4, 0, 1, '2024-04-20', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/CreatoreTest/kcfinder/public/image/CosaStampa4.jpg&quot; style=&quot;height:961px; width:1326px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;____________________________________________________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 3),
(438, 'Qual &egrave; uno dei principali utilizzi delle interfacce in Java?', 1, 17, 2, 0, 1, '2024-04-27', '&lt;p&gt;Esercizio con numeri. Se si vogliono aggiungere numeri casuali inserirli con %%3,7?? (da 3 a 7)&lt;/p&gt;\r\n', 1, 0, 3),
(439, 'Cos&#039;&egrave; un diagramma di flusso?', 1, 12, 2, 1, 1, '2024-05-09', '', 1, 0, 3),
(440, 'Cosa rappresenta un rombo in un diagramma di flusso?', 1, 12, 2, 2, 1, '2024-05-09', '', 1, 0, 3),
(441, 'Quale istruzione viene utilizzata per eseguire un&#039;azione solo se una condizione &egrave; vera in Python?', 1, 19, 2, 5, 1, '2024-05-09', '', 1, 0, 3),
(442, 'Come si dichiara una variabile in Python?', 1, 19, 2, 4, 1, '2024-05-09', '', 1, 0, 3),
(443, 'Quali sono le strutture dati principali in Python?', 1, 36, 2, 2, 1, '2024-05-09', '', 1, 0, 3),
(444, 'Cosa sono i sottoprogrammi in programmazione?', 1, 27, 2, 1, 1, '2024-05-09', '', 1, 0, 3),
(445, 'Quale dei seguenti &egrave; un esempio di sottoprogramma in Python?', 1, 27, 2, 3, 1, '2024-05-09', '', 1, 0, 3),
(446, 'Cosa si intende per ricorsione in programmazione?', 1, 37, 2, 3, 1, '2024-05-09', '', 1, 0, 3),
(448, 'Quale istruzione &egrave; necessario eseguire sempre per prima su un file?', 1, 38, 2, 3, 1, '2024-05-09', '', 1, 0, 3),
(450, 'Dove sono memorizzate le variabili di un linguaggio di programmazione?', 1, 12, 2, 4, 1, '2024-05-09', '', 1, 0, 3),
(451, 'Qual &egrave; lo scopo principale dei diagrammi di flusso nella programmazione?', 1, 12, 2, 1, 1, '2024-05-09', '', 1, 0, 3),
(452, 'Cosa viene utilizzato in un diagramma di flusso per eseguire un&#039;azione diversa in base a una condizione specifica?', 1, 12, 2, 2, 1, '2024-05-09', '', 1, 0, 3),
(453, 'Qual &egrave; lo scopo delle variabili in programmazione?', 1, 12, 2, 1, 1, '2024-05-09', '', 1, 0, 3),
(454, 'Qual &egrave; l&#039;obiettivo principale delle strutture dati nella programmazione?', 1, 36, 2, 2, 1, '2024-05-09', '', 1, 0, 3),
(455, 'Cosa rappresenta un sottoprogramma in programmazione?', 1, 27, 2, 3, 1, '2024-05-09', '', 1, 0, 3),
(456, 'Dove &egrave; visibile una variabile globale?', 1, 27, 2, 4, 1, '2024-05-09', '', 1, 0, 3),
(457, 'Qual &egrave; un algoritmo di ordinamento che confronta gli elementi due a due e scambia quelli fuori posizione?', 1, 34, 2, 1, 1, '2024-05-09', '', 1, 0, 3),
(458, 'Quale algoritmo di ordinamento seleziona ripetutamente l&#039;elemento pi&ugrave; piccolo e lo sposta nella posizione corretta?', 1, 34, 2, 3, 1, '2024-05-09', '', 1, 0, 3),
(459, 'Qual &egrave; un metodo di ricerca che divide iterativamente l&#039;array a meta e confronta l&#039;elemento cercato con quello centrale?', 1, 34, 2, 1, 1, '2024-05-09', '', 1, 0, 3),
(460, 'Quale algoritmo di ordinamento suddivide ripetutamente a met&agrave; l&#039;array per poi ricomporlo ordinato?', 1, 34, 2, 4, 1, '2024-05-09', '', 1, 0, 3),
(461, 'Qual &egrave; un metodo di ricerca che controlla elemento per elemento dall&#039;inizio alla fine dell&#039;array?', 1, 34, 2, 2, 1, '2024-05-09', '', 1, 0, 3),
(462, 'Quale &egrave; la complessit&agrave; dell&#039;algoritmo di ordinamento bubblesort?', 1, 34, 2, 1, 1, '2024-05-09', '', 1, 0, 3),
(463, 'Qual e&#039; la complessita&#039; della ricerca lineare?', 1, 34, 2, 1, 1, '2024-05-09', '', 1, 0, 3),
(464, 'Quale e&#039; la complessita&#039; della ricerca binaria?', 1, 34, 2, 4, 1, '2024-05-09', '', 1, 0, 3),
(465, 'Dato il codice seguente indicare cosa stampa il programma Python quando viene lanciato:', 1, 9, 4, 0, 1, '2024-05-20', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/CreatoreTest/kcfinder/public/image/recupero1.jpg&quot; style=&quot;height:691px; width:1006px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br /&gt;\r\n________________________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 3),
(466, 'Dato il codice seguente indicare cosa stampa il programma Python quando viene lanciato:', 1, 9, 4, 0, 1, '2024-05-20', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/CreatoreTest/kcfinder/public/image/recupero2.jpg&quot; style=&quot;height:669px; width:890px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;_______________________________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 3),
(467, 'Dato il codice seguente indicare cosa stampa il programma Python quando viene lanciato:', 1, 9, 4, 0, 1, '2024-05-20', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/CreatoreTest/kcfinder/public/image/recupero3.jpg&quot; style=&quot;height:924px; width:1013px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;________________________________________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 3),
(468, 'Dato il codice seguente indicare cosa stampa il programma Python quando viene lanciato:', 1, 9, 4, 0, 1, '2024-05-20', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/CreatoreTest/kcfinder/public/image/recupero4.jpg&quot; style=&quot;height:913px; width:950px&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;____________________________________________________________________________________________&lt;/p&gt;\r\n', 1, 0, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_esercizi`
--

CREATE TABLE `ct_esercizi` (
  `id_esercizio` int(11) NOT NULL,
  `testo_esercizio` text NOT NULL,
  `punti_esperienza` int(11) NOT NULL,
  `storia_esercizio` text NOT NULL,
  `fk_argomento` int(11) NOT NULL,
  `tipo_esercizio` int(11) NOT NULL,
  `nome_capitolo` varchar(300) NOT NULL,
  `num_domande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ct_esercizi`
--

INSERT INTO `ct_esercizi` (`id_esercizio`, `testo_esercizio`, `punti_esperienza`, `storia_esercizio`, `fk_argomento`, `tipo_esercizio`, `nome_capitolo`, `num_domande`) VALUES
(1, 'Per poter comprendere cosa successe agli altri eroi, abbiamo bisogno di dati. Individua i dati iniziali e finali dei seguenti problemi, inserendoli come risposta al compito:\r\n1) Il guerriero 4 comincia ad imporre delle tasse perché intende arricchirsi. Ogni suo suddito deve pagare 1000 denari in un anno. Il primo dell\'anno è tenuto a versare 70 denari immediatamente, poi deve pagare una quota ogni fine del mese. Quanto diviene ogni quota del debito?\r\n2) Il guerriero 7 costringe un gruppo di uomini a costruire per lui un castello. Una torre a sezione quadrata ha lato di 30 metri ed altezza di 20 metri. Un blocco di pietra per la costruzione ha una lunghezza di 1 metro, una larghezza di 50 cm ed un\'altezza di 50 cm. ogni pietra costa 3 denari. Quanti denari servono per la costruzione della torre?\r\n3) Il guerriero 12 assolda un esercito, perché troppo pigro per combattere con i suoi poteri. L\'esercito sarà composto da 1200 persone e deve avere dei comandanti. Ogni 80 persone va creato un capitano, ogni 5 capitani va creato un generale. Di quanti generali avrà bisogno l\'esercito?\r\n', 60, 'Prima della nascita della civiltà come la consideriamo oggi 14 guerrieri furono creati: 14 eroi con incredibili capacità. Chi li creò resta un mistero, fatto sta che 14 tra uomini e donne furono scelti tra gli esseri umani affinché con le loro abilità potessero assicurare pace e prosperità alla Terra: donne e uomini retti, pronti a sacrificare le loro stesse vite pur di mantenere la pace e portare la felicità a tutti i popoli. La scelta del Creatore, che aveva dato grandi poteri ai 14 guerrieri, sembrava corretta. Purtroppo, il Creatore non aveva capito che l\'animo umano è facile alla corruzione. Infatti, alcuni dei guerrieri, dato il fatto di essere così potenti, cominciarono a non curarsi più del benessere del prossimo, ma più che altro del proprio. In particolar modo uno dei guerrieri, colui che più degli altri aveva potere, poiché prima dell\'investitura aveva sempre posto il bene degli altri prima del proprio, divenne il più egoista, mettendo in catene gli altri uomini e sottomettendoli alla sua volontà. Altri guerrieri caddero schiavi dell\'egoismo, della superbia e dell\'oscurità, mentre i restanti continuavano ad operare per il bene del prossimo. Gli eroi vennero così a schierarsi in 3 differenti fazioni: 6 al servizio di sé stessi, 6 al servizio degli altri, gli ultimi 2 presero la decisione di rimanere neutrali, ritirandosi in un luogo isolato e non volendo più saperne dei loro doveri, né di quelli degli altri. ', 12, 1, 'La creazione dei 14 guerrieri', 0),
(2, '&lt;p&gt;Aiuta anche tu gli eroi del bene: per il problema seguente identifica quali sono i dati di input e quali quelli di output. Elenca le variabili che devi dichiarare per poter avere i dati di input, di output e per effettuare le elaborazioni di dati.&lt;/p&gt;\r\n\r\n&lt;p&gt;Il primo guerriero del bene vuole utilizzare un contingente di tartarughe azzannatrici per colpire il nemico. Un buon numero sarebbe di 3000 tartarughe. Ha inizialmente a disposizione 2 tartarughe (maschio e femmina). Ogni coppia di tartarughe produce 20 uova in un anno. Solo la met&amp;agrave; delle tartarughe nate da una nidiata sopravvive e pu&amp;ograve; riprodursi, creando a loro volta 20 uova per coppia. Dopo quanti anni, si riesce ad ottenere almeno 3000 tartarughe, tenendo presente che quelle vecchie non sono morte e si riproducono a loro volta?&lt;/p&gt;\r\n', 80, '&lt;p&gt;A questo punto una tremenda lotta si scaten&amp;ograve; tra le forze del bene e quelle del male. Sebbene gli eroi del bene non avessero finora utilizzato delle armi, dato che il loro scopo non era uccidere, ma preservare la vita in ogni sua forma, si videro allora costretti ad impugnarne per poter proteggere s&amp;eacute; stessi e gli altri esseri umani dalla sete di potere degli eroi malvagi. La guerra che si scaten&amp;ograve; tra le due fazioni fu di portata mondiale. I guerrieri altruisti non avevano i poteri dei loro antagonisti, che erano i pi&amp;ugrave; forti tra i 14, ma potevano contare sull&amp;#39;aiuto delle genti, che accorsero ad aiutare i loro protettori.&lt;/p&gt;\r\n', 12, 1, 'Guerra tra il bene ed il male', 0),
(3, '&lt;p&gt;Utilizza un diagramma a blocchi per aiutare il Creatore a creare delle teche di cristallo per sigillare i guerrieri. Per costruire una teca serve sapere l&amp;#39;altezza in cm dell&amp;#39;eroe da racchiudere. La teca avr&amp;agrave; forma di parallelepipedo, la larghezza &amp;egrave; di 1,5 metri, la lunghezza dipende dall&amp;#39;altezza dell&amp;#39;eroe e la profondit&amp;agrave; sar&amp;agrave; di 1 metro. Calcola in cm quadrati quanto sar&amp;agrave; la superficie di cristallo da adoperare per costruire la teca.&lt;/p&gt;\r\n', 110, '&lt;p&gt;Il Creatore dei 14 si rese conto del danno che aveva provocato assegnando grandi poteri ad alcuni degli uomini. Non potendo tuttavia revocare i doni elargiti, decise che i guerrieri andavano in qualche modo fermati. Il Creatore invi&amp;ograve; sulla Terra una nube gassosa iridescente, al cui interno era nascosto un potente narcotico che avrebbe fatto piombare nel sonno gli individui dotati di grande potere che ne fossero venuti in contatto. Tutti i guerrieri, tranne i due neutrali, nascosti in un luogo sperduto, caddero addormentati. Il Creatore decise che gli eroi avrebbero dormito per sempre e lui con loro. Il Creatore sigill&amp;ograve; i 12 eroi in teche di cristallo per poi rinchiudere s&amp;eacute; stesso in una tredicesima teca d&amp;#39;oro&amp;nbsp;dove, nei suoi piani, avrebbe riposato per l&amp;#39;eternit&amp;agrave; assieme alle sue creature.&lt;/p&gt;\r\n', 15, 3, 'L&#039;intervento del creatore', 0),
(5, '', 140, '&lt;p&gt;sadasdas&lt;/p&gt;\r\n', 12, 2, 'Test quiz', 2),
(6, '', 180, '&lt;p&gt;test&lt;/p&gt;\r\n', 12, 4, 'Test tipo 4', 21),
(7, '&lt;p&gt;Ciao da me &lt;strong&gt;che sono io.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Adesso metto una lista:&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;uno&lt;/li&gt;\r\n	&lt;li&gt;due&lt;/li&gt;\r\n	&lt;li&gt;tre&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 200, '&lt;p&gt;Ciao&lt;/p&gt;\r\n', 9, 1, 'Test grassetto..', 0),
(8, '&lt;p&gt;Ciao da me&lt;/p&gt;\r\n', 400, '&lt;p&gt;ciao&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/CreatoreTest/kcfinder/public/image/Aionios%281%29.png&quot; style=&quot;float:left; height:150px; width:150px&quot; /&gt;&amp;nbsp;Ehi&lt;/p&gt;\r\n', 9, 1, 'Nome capitolo', 0),
(9, '&lt;p&gt;Ciao&lt;/p&gt;\r\n', 500, '&lt;p&gt;Ciao&lt;/p&gt;\r\n', 9, 1, 'Altro ese', 0),
(10, '', 350, '&lt;p&gt;dfdfdfdf&lt;/p&gt;\r\n', 9, 2, '', 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_esercizio_domande`
--

CREATE TABLE `ct_esercizio_domande` (
  `id_ese_dom` int(11) NOT NULL,
  `fk_esercizio` int(11) NOT NULL,
  `fk_domanda` int(11) NOT NULL,
  `fk_studente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ct_esercizio_domande`
--

INSERT INTO `ct_esercizio_domande` (`id_ese_dom`, `fk_esercizio`, `fk_domanda`, `fk_studente`) VALUES
(1, 5, 439, 14),
(2, 5, 440, 14),
(4, 6, 126, 14),
(5, 6, 127, 14),
(6, 5, 453, 14),
(7, 5, 134, 14),
(8, 5, 134, 14),
(9, 5, 451, 14),
(10, 5, 453, 14),
(11, 5, 452, 14),
(12, 5, 134, 14),
(13, 5, 451, 14),
(14, 5, 134, 14),
(15, 5, 451, 14),
(16, 5, 453, 14),
(17, 5, 439, 14),
(18, 5, 451, 14),
(19, 5, 453, 14),
(20, 5, 439, 14),
(21, 5, 452, 14),
(22, 5, 440, 14),
(23, 5, 439, 14),
(24, 5, 440, 14),
(25, 5, 134, 14),
(26, 5, 450, 14),
(27, 5, 453, 14),
(28, 5, 134, 14),
(29, 5, 440, 14),
(30, 5, 453, 14),
(31, 5, 450, 14),
(32, 5, 439, 14),
(33, 5, 134, 14),
(34, 5, 453, 14),
(35, 5, 452, 14),
(36, 5, 450, 14),
(37, 5, 451, 14),
(38, 5, 450, 14),
(39, 5, 440, 14),
(40, 5, 451, 14),
(41, 5, 450, 14),
(42, 5, 440, 14),
(43, 5, 450, 14),
(44, 5, 453, 14),
(45, 5, 452, 14),
(46, 5, 134, 14),
(47, 5, 451, 14),
(48, 5, 440, 14),
(49, 5, 450, 14),
(50, 5, 453, 14),
(51, 5, 450, 14),
(52, 5, 452, 14),
(53, 5, 439, 14),
(54, 5, 451, 14),
(55, 5, 452, 14),
(56, 5, 450, 14),
(57, 5, 453, 14),
(58, 5, 439, 14),
(59, 5, 440, 14),
(60, 5, 440, 14),
(61, 5, 452, 14),
(62, 5, 453, 14),
(63, 5, 452, 14),
(170, 10, 87, 14),
(171, 10, 89, 14),
(172, 10, 75, 14),
(173, 10, 422, 14),
(174, 10, 76, 14),
(175, 10, 393, 14);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_esercizio_risposte`
--

CREATE TABLE `ct_esercizio_risposte` (
  `id_ese_risp` int(11) NOT NULL,
  `fk_esercizio` int(11) NOT NULL,
  `fk_studente` int(11) NOT NULL,
  `fk_risposta` int(11) DEFAULT NULL,
  `testo_risposta` text NOT NULL,
  `fk_domanda` int(11) DEFAULT NULL,
  `data_risposta` date NOT NULL,
  `fk_consegna` int(11) NOT NULL,
  `commento_prof` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ct_esercizio_risposte`
--

INSERT INTO `ct_esercizio_risposte` (`id_ese_risp`, `fk_esercizio`, `fk_studente`, `fk_risposta`, `testo_risposta`, `fk_domanda`, `data_risposta`, `fk_consegna`, `commento_prof`) VALUES
(1, 1, 14, 0, 'Ciao mamma guarda come mi diverto', 0, '2024-09-01', 1, '&lt;p&gt;Non va del tutto bene&lt;/p&gt;\r\n'),
(2, 5, 14, 900, '', 439, '2024-09-02', 6, ''),
(3, 5, 14, 902, '', 440, '2024-09-02', 6, ''),
(4, 6, 14, NULL, 'Ciao', 126, '2024-09-07', 7, '&lt;p&gt;round round&lt;/p&gt;\r\n'),
(5, 6, 14, 0, 'rr', 127, '2024-09-07', 7, '&lt;p&gt;ciao&lt;/p&gt;\r\n'),
(6, 2, 14, NULL, '&lt;p&gt;Io rispondo&lt;/p&gt;\r\n', NULL, '2024-12-28', 9, '&lt;p&gt;Mi sembra un po&amp;#39; laconica come risposta...&lt;/p&gt;\r\n'),
(7, 7, 14, NULL, '&lt;p&gt;Ciao bello&lt;/p&gt;\r\n', NULL, '2024-12-28', 10, ''),
(8, 8, 14, NULL, '&lt;p&gt;Consegno&lt;/p&gt;\r\n', NULL, '2024-12-28', 11, ''),
(9, 9, 14, NULL, '&lt;p&gt;ciao2&lt;/p&gt;\r\n', NULL, '2024-12-29', 12, '&lt;p&gt;Da inserire&amp;nbsp;&lt;/p&gt;\r\n'),
(150, 10, 14, 256, '', 87, '2024-12-30', 74, ''),
(151, 10, 14, 262, '', 89, '2024-12-30', 74, ''),
(152, 10, 14, 208, '', 75, '2024-12-30', 74, ''),
(153, 10, 14, 827, '', 422, '2024-12-30', 74, ''),
(154, 10, 14, 211, '', 76, '2024-12-30', 74, ''),
(155, 10, 14, 788, '', 393, '2024-12-30', 74, '');

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_esercizi_quest`
--

CREATE TABLE `ct_esercizi_quest` (
  `id_ese_quest` int(11) NOT NULL,
  `fk_quest` int(11) NOT NULL,
  `fk_esercizio` int(11) NOT NULL,
  `progressivo` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ct_esercizi_quest`
--

INSERT INTO `ct_esercizi_quest` (`id_ese_quest`, `fk_quest`, `fk_esercizio`, `progressivo`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 3),
(5, 1, 5, 4),
(6, 1, 6, 5),
(7, 1, 7, 6),
(8, 1, 8, 7),
(9, 1, 9, 8),
(10, 1, 10, 9);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_griglie_valutazione`
--

CREATE TABLE `ct_griglie_valutazione` (
  `id_griglia` int(11) NOT NULL,
  `nome_griglia` varchar(40) NOT NULL,
  `griglia` text NOT NULL,
  `fk_utente` int(11) NOT NULL,
  `attiva` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_griglie_valutazione`
--

INSERT INTO `ct_griglie_valutazione` (`id_griglia`, `nome_griglia`, `griglia`, `fk_utente`, `attiva`) VALUES
(1, 'Griglia quinta intro db', '&amp;lt;p&amp;gt;Punteggio massimo: 26 punti&amp;lt;br /&amp;gt;\r\nVoto massimo: 9,5&amp;lt;br /&amp;gt;\r\nPer la sufficienza: 16&amp;amp;nbsp;punti&amp;lt;/p&amp;gt;\r\n', 1, 1),
(2, 'Griglia punti generale', '&amp;lt;p&amp;gt;Totale: 30&amp;amp;nbsp;punti&amp;lt;br /&amp;gt;\r\nSufficienza: 18&amp;amp;nbsp;punti&amp;lt;br /&amp;gt;\r\nFormula di calcolo voto: (Punteggio ottenuto/Punteggio Totale)*10&amp;lt;/p&amp;gt;\r\n', 1, 1),
(3, 'Classi Python quarta', '&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Punti totali: 26&amp;lt;br /&amp;gt;\r\nPunti per la sufficienza: 15,5&amp;lt;br /&amp;gt;\r\nIl compito mira a identificare la conoscenza acquisita di quali siano le principali caratteristiche della programmazione ad oggetti rispetto alla creazione di classi in Python&amp;lt;/p&amp;gt;\r\n', 1, 1),
(4, 'Diagramma delle classi e modello logico', '&amp;lt;p&amp;gt;&amp;lt;br /&amp;gt;\r\n&amp;lt;span style=&amp;quot;font-size:16px&amp;quot;&amp;gt;&amp;lt;strong&amp;gt;Griglia di valutazione:&amp;lt;/strong&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;table border=&amp;quot;1&amp;quot; cellpadding=&amp;quot;0&amp;quot; cellspacing=&amp;quot;0&amp;quot; style=&amp;quot;width:95%&amp;quot;&amp;gt;\r\n	&amp;lt;tbody&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;background-color:#dfdfdf; height:19px; width:336px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;&amp;lt;strong&amp;gt;Indicatore&amp;lt;/strong&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;background-color:#dfdfdf; width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;&amp;lt;strong&amp;gt;Descrittore&amp;lt;/strong&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;background-color:#dfdfdf; width:139px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;&amp;lt;strong&amp;gt;Punteggio&amp;lt;/strong&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:19px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;&amp;lt;em&amp;gt;Comprensione del testo dell&amp;amp;#39;esercizio&amp;lt;/em&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Totale mancanza di comprensione di quanto si deve fare, consegna in bianco&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:19px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Non riesce ad identificare i punti chiave della realt&amp;amp;agrave; da rappresentare&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0,4&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:19px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Riesce ad identificare i punti chiave della realt&amp;amp;agrave;, ma non la comprende nella sua interezza&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0,8&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:39px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;background-color:#f7f792; width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Riesce ad identificare i punti chiave, a capire quali sono i dati necessari al loro salvataggio, ma ha comunque difficolt&amp;amp;agrave; nel comprendere interamente il testo&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;background-color:rgb(247, 247, 146); text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;1,2&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:39px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Riesce ad identificare tutti i punti chiave della realt&amp;amp;agrave; da rappresentare, sa quali dati dovr&amp;amp;agrave; salvare il progetto, riesce a comprendere il testo nella sua interezza&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;1,6&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:39px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Riesce ad identificare tutti i punti chiave della realt&amp;amp;agrave; da rappresentare, sa quali dati dovr&amp;amp;agrave; salvare il progetto, riesce a comprendere il testo nella sua interezza. Integra il testo dell&amp;amp;#39;esercizio con proprie osservazioni&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;2&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:19px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;&amp;lt;em&amp;gt;Realizzazione delle classi&amp;lt;/em&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Consegna in bianco&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:19px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Non riesce a realizzare correttamente nessuna delle classi che il problema richiede&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0,4&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:19px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Riesce a realizzare alcune delle classi richieste, ma con errori negli attributi o nella notazione&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0,8&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:19px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;background-color:#f7f792; width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Riesce a realizzare alcune delle classi richieste con pochissimi errori negli attributi o nella notazione&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;background-color:rgb(247, 247, 146); text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;1,2&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:39px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Riesce a realizzare le classi che il problema richiede, ma non tutte o aggiungendone di non necessarie. Pochissimi errori negli attrributi o nella notazione&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;1,6&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:39px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Riesce a realizzare tutte le classi che il problema richiede, senza aggiungerne di non necessarie. Nessun errore negli attributi o nella notazione&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;2&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:19px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;&amp;lt;em&amp;gt;Realizzazione delle associazioni&amp;lt;/em&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Nessuna associazione inserita nel diagramma&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:19px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Inserisce alcune associazioni, ma non tutte e con gravi errori nelle cardinalit&amp;amp;agrave;. Nessun chiarimento sulla scelta delle molteplicit&amp;amp;agrave;&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0,4&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:39px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Inserisce alcune associazioni con cardinalit&amp;amp;agrave; corrette, ma ne mancano alcune o fa errori nelle cardinalit&amp;amp;agrave;. Spiegazioni delle cardinalit&amp;amp;agrave; inserite&amp;amp;nbsp; non chiara&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0,8&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:39px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Inserisce quasi tutte le associazioni correttamente, ma con errori nelle cardinalit&amp;amp;agrave; o con spiegazioni non del tutto chiare sulle scelte effettuate&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;1,2&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:21px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Inserisce correttamente tutte le associazioni, ma commette qualche errore nelle cardinalit&amp;amp;agrave; o le spiegazioni non appaiono convincenti&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;1,6&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:25px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Tutte le associazioni e le cardinalit&amp;amp;agrave; sono inserite correttamente. Le spiegazioni sulla scelta delle cardinalit&amp;amp;agrave; sono corrette e complete&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;2&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:19px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;&amp;lt;em&amp;gt;Raffinamento del diagramma&amp;lt;/em&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Non viene effettuata nessuna raffinazione del diagramma delle classi&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:39px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Vengono effettuate delle raffinazioni solo in pochi casi, per la maggior parte vengono lasciati attributi multivalore, non vengono eliminate le gerarchie, non vi sono classi associative&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0,2&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:19px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Vengono effettuate delle corrette raffinazioni del diagramma, ma non tutte o non in maniera del tutto corretta&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0,4&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:39px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;background-color:#f7f792; width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Vengono effettuate correttamente le raffinazioni del diagramma, ma non tutte quelle possibili o non tutte in maniera del tutto corretta&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;background-color:rgb(247, 247, 146); text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0,6&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:19px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Vengono effettuate quasi tutte le possibili raffinazioni del diagramma ed in maniera praticamente sempre corretta&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0,8&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:19px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Vengono effettuate tutte le possibili raffinazioni del diagramma ed in maniera del tutto corretta.&amp;amp;nbsp;&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;1&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:19px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;&amp;lt;em&amp;gt;Trasposizione delle tabelle nel modello logico&amp;lt;/em&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Modello logico non compilato&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:39px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Solo alcune delle tabelle del modello logico sono state compilate e quelle compilate non sono corrette rispetto al modello concettuale o nella notazione&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0,3&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:39px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Solo alcune delle tabelle del modello logico sono state compilate, mancano attributi o tipi (varchar, int&amp;amp;hellip;). Chiavi primarie non sempre corrette. Rispetto comunque del modello concettuale.&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0,6&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:39px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;background-color:#f7f792; width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Sono state trasposte tutte le tabelle del diagramma UML in maniera corretta, ma vi sono errori negli attributi inseriti o nelle chiavi primarie&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;background-color:rgb(247, 247, 146); text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0,9&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:39px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Sono state trasposte tutte le tabelle del diagramma in maniera corretta, ma vi sono alcuni lievi errori o mancanze negli attributi, tipi o nelle chiavi primarie&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;1,2&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:39px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Sono state trasposte tutte le tabelle del diagramma in maniera corretta, non vi sono errori n&amp;amp;eacute; mancanze negli attributi, tipi o nelle chiavi primarie&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;1,5&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:19px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;&amp;lt;em&amp;gt;Trasposizione delle associazioni nel modello logico&amp;lt;/em&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Nessuna chiave esterna inserita&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:19px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Solo alcune chiavi esterne sono state inserite in maniera corretta, le rimanenti o non vi sono o non sono corrette&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0,3&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:39px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;La maggior parte delle chiavi esterne &amp;amp;egrave; stata inserita, ma vi sono degli errori nel posizionamento o nella corretta trasposizione da diagramma concettuale&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0,6&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:39px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;background-color:#f7f792; width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;La maggior parte delle chiavi esterne &amp;amp;egrave; stata inserita, le chiavi esterne uno a uno e uno a molti sono prevalentemente corrette. Le chiavi esterne per le relazioni molti a molti sono mancanti o scorrette&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;background-color:rgb(247, 247, 146); text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;0,9&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:39px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Tutte le chiavi esterne sono state inserite correttamente a seconda del raffinamento effettuato del modello concettuale, ma vi sono errori nella notazione effettuata (mancano i tipi o l&amp;amp;#39;indicazione di chiave esterna)&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;1,2&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td style=&amp;quot;height:19px&amp;quot;&amp;gt;&amp;amp;nbsp;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;width:827px&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;Tutte le chiavi esterne sono state inserite correttamente a seconda del raffinamento effettuato del modello concettuale&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n			&amp;lt;td style=&amp;quot;text-align:center&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;font-size:18px&amp;quot;&amp;gt;1,5&amp;lt;/span&amp;gt;&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n	&amp;lt;/tbody&amp;gt;\r\n&amp;lt;/table&amp;gt;\r\n', 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_libri_testo`
--

CREATE TABLE `ct_libri_testo` (
  `id_libro_testo` int(11) NOT NULL,
  `titolo_libro` varchar(200) NOT NULL,
  `casa_editrice` varchar(150) NOT NULL,
  `autori` varchar(200) NOT NULL,
  `disattivato` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_libri_testo`
--

INSERT INTO `ct_libri_testo` (`id_libro_testo`, `titolo_libro`, `casa_editrice`, `autori`, `disattivato`) VALUES
(1, 'Nessuno', '', '', 0),
(2, 'Teknolab', 'Hoepli', 'Camagni, Nikolassy', 0),
(3, 'Gestione progetto Organizzazione Impresa', 'Zanichelli', 'Ollari', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_materie`
--

CREATE TABLE `ct_materie` (
  `id_materia` int(11) NOT NULL,
  `nome_materia` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_materie`
--

INSERT INTO `ct_materie` (`id_materia`, `nome_materia`) VALUES
(1, 'TPSIT'),
(2, 'Informatica Biennio'),
(3, 'Sistemi e Reti'),
(4, 'GPOI'),
(5, 'Informatica');

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_personaggi`
--

CREATE TABLE `ct_personaggi` (
  `id_personaggio` int(11) NOT NULL,
  `nome_personaggio` varchar(100) NOT NULL,
  `immagine` varchar(300) NOT NULL,
  `vita_iniziale` int(11) NOT NULL,
  `descrizione` text NOT NULL,
  `color` varchar(15) NOT NULL,
  `bordercolor` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ct_personaggi`
--

INSERT INTO `ct_personaggi` (`id_personaggio`, `nome_personaggio`, `immagine`, `vita_iniziale`, `descrizione`, `color`, `bordercolor`) VALUES
(1, 'Jambalaya', './img/Personaggi/Jambalaya.jpg', 4, 'Jambalaya è un ragazzo di 17 anni proveniente dalla Jamaica, con una corporatura atletica e un sorriso contagioso. Cresciuto vicino al mare, ha una profonda passione per il nuoto e la navigazione. Ama la musica reggae, che lo accompagna in ogni momento libero, e spesso suona il tamburo djembe. Jambalaya è avventuroso e coraggioso, sempre pronto a tuffarsi in nuove sfide, ma anche riflessivo e rispettoso delle tradizioni della sua terra. Nonostante le difficoltà, mantiene sempre viva la speranza, guidato dalla convinzione che il bene possa prevalere.', 'aqua', 'green'),
(2, 'Isabela', './img/Personaggi/Isabela.png', 3, 'Isabela è una ragazza di 16 anni, proveniente dal Brasile. Di natura determinata e ambiziosa, è cresciuta vicino alla foresta amazzonica, sviluppando un legame profondo con la natura e gli animali. È appassionata di arti marziali brasiliane, in particolare della capoeira, e ama danzare la samba, immergendosi nella cultura e nella musica del suo paese. La sua passione per l’avventura e il rischio la porta a volte a compiere scelte estreme.', 'yellow', '#d19330'),
(3, 'Aionios', './img/Personaggi/Aionios.png', 5, 'Aionios è un anziano saggio, di età non stimabile, proveniente dall\'India. Avvolto in un\'aura di mistero, possiede una conoscenza profonda delle arti arcane, della filosofia e delle antiche tradizioni. Vive in armonia con la natura e spesso medita per giorni interi, cercando risposte nei regni spirituali. È appassionato di astronomia e musica classica indiana, utilizzando il sitar per accompagnare i suoi momenti di riflessione. Con il suo comportamento calmo e una voce che trasmette saggezza, Aionios è una guida spirituale e morale per gli eroi, sempre pronto a dispensare consigli o a svelare enigmi celati nelle pieghe del tempo.', '#a6a39f', '#52514f'),
(4, 'Aisha', './img/Personaggi/Aisha.png', 4, 'Aisha è una ragazza di 17 anni, proveniente dalla Costa d\'Avorio, nota per la sua incredibile agilità e destrezza. Parte del gruppo degli eroi malvagi, Aisha combina la sua grazia felina con una mente astuta e una determinazione inflessibile. Cresciuta in un ambiente che l\'ha temprata, è abile nel combattimento corpo a corpo e nelle missioni furtive. Sebbene il suo cuore sia stato corrotto dal desiderio di potere, il suo passato rivela una profondità che potrebbe celare un conflitto interiore. Elegante e letale, Aisha è una figura che incute rispetto e timore nei suoi avversari.', 'black', 'black'),
(5, 'Klaus', './img/Personaggi/Klaus.png', 6, 'Klaus è un ragazzo di 16 anni, originario della Germania, caratterizzato da un\'indole introversa e riflessiva. Pur preferendo la solitudine, possiede un profondo senso di giustizia che lo ha spinto a unirsi agli eroi del bene. Klaus eccelle nel pensiero strategico, spesso trovando soluzioni innovative ai problemi più complessi. Ama leggere e approfondire la storia e la filosofia, e il suo intuito lo rende un prezioso alleato in battaglia. Nonostante la sua natura riservata, la sua lealtà verso i compagni è incrollabile, e nei momenti di crisi sa dimostrare un coraggio silenzioso ma potente.', '#a8ecff', 'blue'),
(6, 'Shinzo Hanzei', './img/Personaggi/Shinzo.jpg', 5, 'Shinzo Hanzei è un giovane giapponese dal carattere ribelle e determinato, segnato da un passato di dolore e ingiustizia che lo ha condotto a schierarsi con gli eroi del male. Appassionato di corse e velocità, vive per l’adrenalina del rischio e si distingue per la sua incredibile rapidità nei movimenti, che lo rende un avversario quasi inafferrabile. Shinzo è un pilota esperto e un combattente astuto, che utilizza la sua velocità sia per attaccare con precisione che per sfuggire ai pericoli. Dietro la sua maschera di freddezza si nasconde un cuore ferito, che ancora lotta contro i demoni del suo passato.', '#7706c2', '#41016b'),
(7, 'Budi', './img/Personaggi/Budi.jpg', 8, 'Budi è un ragazzo di 18 anni proveniente dalla Thailandia, noto per la sua natura oscura e per la sua impressionante fame. Nonostante la sua corporatura tarchiata, che lo rende piuttosto imponente, è un combattente temibile, grazie alla sua abilità unica: il suo corpo è elastico come la gomma, permettendogli di sfuggire a colpi e attacchi con una sorprendente agilità. La sua passione per il cibo è leggendaria, e spesso può essere visto mangiare a dismisura, ma il suo appetito insaziabile non è solo un vizio: è anche una forma di energia che alimenta il suo potere. Membro degli eroi del male, Budi è cinico e opportunista, pronto a usare la sua forza per distruggere chiunque osi sfidare la sua volontà. Il suo umore può variare rapidamente, ma quando si tratta di portare a termine una missione, è determinato e spietato.', '#4a7515', '#71bf11'),
(8, 'Nuliajuk', './img/Personaggi/Nuliajuk.jpg', 5, 'Nuliajuk è una ragazza di 16 anni proveniente dall\'Alaska, una fiera Inuit e una delle eroine del bene. La sua connessione con la natura è profonda, ed è cresciuta imparando le tradizioni del suo popolo, tra cui la pesca tra i ghiacci. Abile e determinata, ha un\'incredibile resistenza e una forza interiore che le permette di affrontare le sfide più dure. Il suo spirito indomito e la sua saggezza sono fondamentali per il gruppo, e il suo legame con gli elementi naturali le conferisce poteri unici legati al ghiaccio e alla neve. Oltre alla pesca, Nuliajuk ama esplorare il paesaggio selvaggio che la circonda, trovando sempre un senso di pace e forza nella solitudine. La sua lealtà verso i suoi compagni è incrollabile, e combatterà sempre per proteggere chi ama, utilizzando le sue abilità per mantenere l\'armonia tra il mondo umano e quello naturale.', '#f7bc0a', '#b08505'),
(9, 'Camila', './img/Personaggi/Camila.jpg', 4, 'Camila è una ragazza di 18 anni proveniente dall\'Argentina, una delle eroine malvagie. Astuta e determinata, è una manipolatrice nata, in grado di controllare le menti altrui con il suo potere, piegandole alla propria volontà. Cresciuta in un ambiente difficile, il suo desiderio di potere e autonomia l\'ha portata a scegliere il lato oscuro, convinta che solo la forza e l\'astuzia possano garantire il suo posto nel mondo. Elegante e carismatica, Camila è una stratega formidabile e sa sfruttare ogni debolezza del nemico a suo vantaggio. Nonostante la sua natura spietata, conserva un’intelligenza affilata e una profonda ambizione che la rendono una figura temibile e complessa.', '#4287f5', '#06388a'),
(10, 'Lachlan', './img/Personaggi/Lachlan.jpg', 5, 'Lachlan, detto il Distruttore, è un ragazzo di 18 anni proveniente dall\'Australia, uno degli eroi malvagi più temuti. Dietro al suo aspetto solare e al sorriso ingannevole si cela una personalità spietata e ambiziosa. Lachlan è un amante degli sport estremi, come il surf su onde gigantesche e l’arrampicata su scogliere inaccessibili, attività che hanno affinato la sua forza fisica e la sua destrezza. Tuttavia, il suo vero interesse è l’adrenalina della distruzione: ama sfruttare la sua abilità di manipolare l\'energia cinetica per seminare il caos e piegare gli avversari. Sebbene sia un eccellente stratega, Lachlan si lascia spesso guidare dal desiderio di dimostrare la sua superiorità, rendendolo un avversario tanto astuto quanto pericoloso.', '#f0137e', 'pink'),
(11, 'Nikolaj', './img/Personaggi/Nikolaj.jpg', 6, 'Nikolaj, 19 anni, proveniente dalla gelida Russia, è il leader indiscusso degli eroi del male. La sua presenza è imponente, con occhi di ghiaccio che sembrano scrutare nell’anima, capelli scuri e corti, e una postura sempre eretta, che trasmette autorità e potere. Nikolaj è un maestro della strategia e dell’inganno, capace di manipolare chiunque per raggiungere i suoi scopi.\r\n\r\nDotato di un oscuro potere che sembra attingere energia direttamente dalla sua malvagità interiore, è in grado di generare onde d’urto devastanti, controllare l’oscurità e intaccare la volontà altrui.\r\n\r\nFreddo, spietato e ambizioso, Nikolaj disprezza qualsiasi forma di debolezza e crede che il potere assoluto sia l’unico scopo degno di essere perseguito. Nonostante la sua crudeltà, è anche incredibilmente intelligente e carismatico, attirando a sé gli altri eroi del male con promesse di gloria e dominio. Il suo unico vero interesse, però, è consolidare la sua posizione come sovrano del mondo.', '#8a0606', 'red'),
(12, 'Chijioke', './img/Personaggi/Chijioke.jpg', 5, 'Chijioke è un ragazzo di 17 anni proveniente dalla Nigeria, un eroe del bene noto per la sua calma risolutezza e la sua straordinaria intelligenza. Alto e snello, con capelli ricci scuri e occhi vivaci, Chijioke è profondamente legato alla sua terra natale e alle sue tradizioni. È appassionato di musica, in particolare del suono delle percussioni tradizionali, e trascorre il suo tempo libero suonando i tamburi o raccontando storie intorno al fuoco.\r\n\r\nChijioke ama anche il calcio, unendo le sue doti atletiche alla strategia, e porta questo spirito di squadra anche nelle sue avventure. Oltre a ciò, ha un grande interesse per la natura e spesso si perde a contemplare i paesaggi selvaggi, raccogliendo erbe curative e studiando il mondo naturale. La sua mente analitica e il suo cuore generoso lo rendono una guida preziosa per il gruppo, sempre pronto a sacrificarsi per il bene degli altri.', '#13f01b', '#068a0a'),
(13, 'Emily', './img/Personaggi/Emily.jpg', 5, 'Emily, 17 anni, è una ragazza canadese che rappresenta gli ideali degli eroi del bene con la sua determinazione e il suo spirito gentile. Con i suoi capelli biondo cenere e occhi azzurri come i laghi del suo paese natale, Emily è un simbolo di grazia e forza.\r\n\r\nAppassionata di pattinaggio su ghiaccio fin da bambina, le sue movenze riflettono l\'eleganza e la precisione di questo sport. Durante le battaglie, queste qualità si traducono in una straordinaria agilità e capacità di anticipare i movimenti degli avversari.\r\n\r\nEmily è coraggiosa e altruista, sempre pronta a mettere gli altri al primo posto. La sua passione per la natura canadese e per il ghiaccio la rende particolarmente legata alle sfide che coinvolgono il freddo e gli ambienti ostili.', '#0407c9', 'navy'),
(14, 'Strogar', './img/Personaggi/Strogar.jpg', 6, 'Strogar, 45 anni, è un enigmatico eroe neutrale, il cui volto segnato da cicatrici racconta una vita di battaglie e difficoltà. Non si è schierato né con il bene né con il male, preferendo osservare il mondo e i suoi conflitti da una posizione esterna.\r\n\r\nLa sua forza fisica è eguagliata solo dalla sua determinazione a mantenere un equilibrio in un mondo costantemente diviso tra luce e oscurità.\r\n\r\nAppassionato di storia, Strogar conserva una collezione di manoscritti e testi antichi sulla storia dell\'umanità, che aggiorna meticolosamente con gli eventi che vive in prima persona. Nonostante non abbia la saggezza mistica di Aionios, il suo pragmatismo e la sua conoscenza della storia lo rendono una figura rispettata. Strogar è una presenza silenziosa, ma decisiva, capace di influenzare il corso degli eventi con un solo intervento al momento giusto.', '#a2c904', '#5a7003');

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_personaggi_poteri`
--

CREATE TABLE `ct_personaggi_poteri` (
  `id_per_pot` int(11) NOT NULL,
  `fk_personaggio` int(11) NOT NULL,
  `fk_potere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ct_personaggi_poteri`
--

INSERT INTO `ct_personaggi_poteri` (`id_per_pot`, `fk_personaggio`, `fk_potere`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_poteri`
--

CREATE TABLE `ct_poteri` (
  `id_potere` int(11) NOT NULL,
  `nome_potere` varchar(100) NOT NULL,
  `descrizione_potere` text NOT NULL,
  `img_potere` varchar(60) NOT NULL,
  `livello` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ct_poteri`
--

INSERT INTO `ct_poteri` (`id_potere`, `nome_potere`, `descrizione_potere`, `img_potere`, `livello`) VALUES
(1, 'Colpisci al centro', 'grazie ai poteri dell\'arco dorato puoi chiedere un aiuto su una risposta a crocette durante un compito in classe: rimarranno solo 2 risposte.', './img/Poteri/arrowcenter.jpg', 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_quest`
--

CREATE TABLE `ct_quest` (
  `id_quest` int(11) NOT NULL,
  `nome_quest` text NOT NULL,
  `image_quest` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ct_quest`
--

INSERT INTO `ct_quest` (`id_quest`, `nome_quest`, `image_quest`) VALUES
(1, 'Intro 14 Eroi - Programmazione iniziale', './img/Quest/mappa_tesoro.jpg'),
(2, '14 Eroi - Python di base', './img/Quest/ragazzi_avv.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_quiz`
--

CREATE TABLE `ct_quiz` (
  `id_quiz` int(11) NOT NULL,
  `nome_quiz` varchar(200) NOT NULL,
  `fk_utente` int(11) NOT NULL,
  `data_creazione` date NOT NULL,
  `casuale` int(11) NOT NULL,
  `mix_answer` int(11) NOT NULL,
  `fk_materia` int(11) NOT NULL,
  `mostra_punti_dom` int(11) NOT NULL DEFAULT 1,
  `fk_griglia` int(11) NOT NULL DEFAULT 0,
  `mix_questions` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_quiz`
--

INSERT INTO `ct_quiz` (`id_quiz`, `nome_quiz`, `fk_utente`, `data_creazione`, `casuale`, `mix_answer`, `fk_materia`, `mostra_punti_dom`, `fk_griglia`, `mix_questions`) VALUES
(83, 'Test', 1, '2024-07-21', 1, 1, 5, 1, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_quiz_argomenti`
--

CREATE TABLE `ct_quiz_argomenti` (
  `id_quiz_argomento` int(11) NOT NULL,
  `fk_quiz` int(11) NOT NULL,
  `fk_argomento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_quiz_argomenti`
--

INSERT INTO `ct_quiz_argomenti` (`id_quiz_argomento`, `fk_quiz`, `fk_argomento`) VALUES
(301, 83, 11),
(302, 83, 22);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_quiz_domande`
--

CREATE TABLE `ct_quiz_domande` (
  `id_quiz_domanda` int(11) NOT NULL,
  `fk_quiz` int(11) NOT NULL,
  `fk_domanda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_quiz_tipo_domande`
--

CREATE TABLE `ct_quiz_tipo_domande` (
  `id_quiz_tipo` int(11) NOT NULL,
  `fk_tipo_domande` int(11) NOT NULL,
  `num_domande` int(11) NOT NULL,
  `fk_quiz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_quiz_tipo_domande`
--

INSERT INTO `ct_quiz_tipo_domande` (`id_quiz_tipo`, `fk_tipo_domande`, `num_domande`, `fk_quiz`) VALUES
(87, 0, 10, 83);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_risposte`
--

CREATE TABLE `ct_risposte` (
  `id_risposta` int(11) NOT NULL,
  `risposta` text NOT NULL,
  `corretta` int(11) NOT NULL,
  `fk_domanda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_risposte`
--

INSERT INTO `ct_risposte` (`id_risposta`, `risposta`, `corretta`, `fk_domanda`) VALUES
(20, 'Come in PHP vi sono dei tag di apertura e chiusura che si possono inserire all&#039;interno di codice HTML', 1, 11),
(21, 'Come per le Servlet &egrave; codice JAVA da compilare manualmente tramite compilatore', 0, 11),
(22, 'E&#039; una tecnologia che si basa su JAVA e serve unicamente per la connessione ai database', 0, 11),
(23, 'Le pagine JSP vengono caricate in un container che le fa eseguire direttamente ad una JVM', 0, 11),
(40, 'Risp a', 1, 32),
(41, 'Risp b', 0, 32),
(42, 'Risp c', 1, 32),
(43, 'Risp d', 0, 32),
(50, 'SPA', 0, 37),
(51, 'SRL', 0, 37),
(52, 'SAPA', 0, 37),
(53, 'SNC', 1, 37),
(54, 'I soci si occupano di gestire la societ&agrave;', 1, 38),
(55, 'La societ&agrave; viene generalmente gestita da un&rsquo;unica persona, l&rsquo;amministratore delegato', 0, 38),
(56, 'La societ&agrave; viene generalmente gestita da un gruppo di persone, il consiglio di amministrazione', 0, 38),
(57, 'La societ&agrave; non ha bisogno di essere seguita da nessuna, una volta costituita lavorer&agrave; in autonomia senza l&rsquo;intervento dei soci (quindi gestita direttamente dai lavoratori)', 0, 38),
(58, 'Che nel caso la societ&agrave; produca degli utili, questi rimarranno sempre all&rsquo;interno dell&rsquo;azienda e nulla verr&agrave; dato ai soci', 0, 39),
(59, 'Che nel caso la societ&agrave; fallisca i debitori potranno rivalersi solo sul patrimonio dell&rsquo;azienda e non su quello dei soci', 1, 39),
(60, 'Che la societ&agrave; ha un conto in banca intestato all&rsquo;azienda', 0, 39),
(61, 'Che in caso di frodi &egrave; l&rsquo;azienda a risponderne legalmente e non i singoli soci', 0, 39),
(62, 'I soci possiedono quote societarie anzich&eacute; gestire in autonomia il capitale della societ&agrave;', 0, 40),
(63, 'I soci non possiedono la societ&agrave;, che &egrave; di propriet&agrave; del consiglio di amministrazione', 0, 40),
(64, 'I soci possiedono azioni emesse dalla societ&agrave; e non quote societarie', 1, 40),
(65, 'I soci ottengono gli utili in base ai conferimenti iniziali e non in base a quanto scritto sull&rsquo;atto costitutivo', 0, 40),
(66, 'L&rsquo;unico obiettivo della societ&agrave; &egrave; creare valore per gli azionisti, quindi massimizzare gli utili in modo che vengano pagati pi&ugrave; dividendi', 0, 41),
(67, 'L&rsquo;unico obiettivo della societ&agrave; &egrave; far contenti i dipendenti, in modo che si crei un forte legame con l&rsquo;azienda e non la abbandonino anche in caso di difficolt&agrave;', 0, 41),
(68, 'L&rsquo;obiettivo della societ&agrave; &egrave; far contenti tutti coloro che hanno un interesse all&rsquo;interno della societ&agrave;: azionisti, clienti, fornitori, dipendenti, persone che abitano nei pressi dell&rsquo;azienda, etc..', 1, 41),
(69, 'L&rsquo;obiettivo della societ&agrave; &egrave; fraudolento: la societ&agrave; viene costituita in modo da acquistare dai fornitori creando debiti, per poi dichiarare fallimento e non dover pagare i debiti', 0, 41),
(70, 'Ha le ferie pagate', 0, 36),
(71, 'Ha necessariamente un contratto con un&rsquo;azienda per poter lavorare', 0, 36),
(72, 'Deve avere una partita IVA per poter emettere fatture', 1, 36),
(73, 'Deve pagare un fondo pensionistico, altrimenti non avr&agrave; la pensione dato che non gli vengono detratti contributi INPS dal datore di lavoro', 1, 36),
(74, 'Non paga nessuna tassa', 0, 36),
(75, 'E&rsquo; generalmente autonomo nella gestione del suo lavoro e nel mantenere i contatti con i clienti', 1, 36),
(76, 'Se lavora di pi&ugrave; facendo gli straordinari, viene pagato di pi&ugrave;', 0, 36),
(77, 'Pu&ograve; avere un contratto a tempo determinato', 0, 43),
(78, 'Pu&ograve; avere un contratto a tempo indeterminato', 0, 43),
(79, 'Pu&ograve; avere un contratto a progetto', 0, 43),
(80, 'Pu&ograve; avere un contratto a mansione di tempo', 0, 43),
(81, 'Deve necessariamente aprire partita IVA', 0, 43),
(82, 'Se si ammala rimane a casa e percepisce un&rsquo;indennit&agrave; dal governo', 0, 43),
(83, 'Se si ammala rimane a casa, ma perde il guadagno dei giorni in cui &egrave; assente dal lavoro', 0, 43),
(84, 'Se lavora di pi&ugrave; facendo gli straordinari, viene pagato di pi&ugrave;', 0, 43),
(85, 'Il debito deve essere sanato subito, quindi il primo socio deve versare, se possibile, anche la parte del secondo socio', 0, 44),
(86, 'I soci di una SNC rispondono dei debiti con il loro patrimonio presente e futuro, quindi il secondo socio ripagher&agrave; il debito il mese successivo', 1, 44),
(87, 'Il debito viene pagato dalle casse della societ&agrave;, non sono i soci che devono pagare con il loro patrimonio personale. Se le casse sono vuote, i fornitori non verranno pagati', 0, 44),
(88, 'Una SNC non pu&ograve; dichiarare fallimento, se ci sono dei debiti in essere. Pertanto la societ&agrave; non potr&agrave; essere sciolta, fintanto che i debiti non siano ripagati dai soci', 0, 44),
(89, 'Se citata in giudizio, per esempio per frode, risponde la societ&agrave; e non i soci', 1, 45),
(90, 'Se la societ&agrave; dichiara fallimento ed ha dei debiti, i soci non devono pagare con il loro patrimonio personale', 0, 45),
(91, 'La societ&agrave; pu&ograve; emettere delle leggi che dovranno essere prese in considerazione dallo Stato', 0, 45),
(92, 'La societ&agrave; non pu&ograve; in alcun modo modificare la sua denominazione o ragione sociale', 0, 45),
(93, 'Vi &egrave; divisione tra propriet&agrave; e controllo: i soci hanno il controllo, il consiglio di amministrazione la propriet&agrave;', 0, 46),
(94, 'Non vi &egrave; divisione tra propriet&agrave; e controllo: i soci hanno sempre entrambi, essendo i soli che possono far parte del consiglio di amministrazione', 0, 46),
(95, 'Vi &egrave; divisione tra propriet&agrave; e controllo: i soci hanno la propriet&agrave;, il consiglio di amministrazione il controllo', 1, 46),
(96, 'Non vi &egrave; divisione tra propriet&agrave; e controllo: il consiglio di amministrazione detiene entrambi. I soci possiedono solo le azioni, che danno loro diritto di incassare parte degli utili', 0, 46),
(97, 'E&rsquo; in pratica la rete aziendale, che collega i vari pc nei locali dell&rsquo;azienda', 0, 47),
(98, 'E&rsquo; il server dell&rsquo;azienda, che contiene cartelle con i file di tutta l&rsquo;azienda. I file vengono caricati da chiunque, ma sono visibili solo all&rsquo;amministratore delegato, che cos&igrave; pu&ograve; essere informato di ci&ograve; che succede nell&rsquo;azienda', 0, 47),
(99, 'E&rsquo; l&rsquo;insieme di persone, applicazioni, procedure che interagendo tra loro possono fornire ad un soggetto richiedente una serie di dati ed informazioni nel momento e luogo desiderati', 1, 47),
(100, 'E&rsquo; la possibilit&agrave; data ai dipendenti di un&rsquo;azienda di potersi collegare alla rete Internet per poter ricercare informazioni su siti quali WikiPedia o altri siti specializzati riguardanti ci&ograve; che produce l&rsquo;azienda', 0, 47),
(101, 'Solo i contatti con i clienti', 0, 48),
(102, 'Solo i contatti con i fornitori', 0, 48),
(103, 'Solo la fatturazione e la contabilit&agrave; aziendale', 0, 48),
(104, 'Tutte le possibili funzioni aziendali', 1, 48),
(105, 'Ha una data certa di inizio e una data certa di fine', 0, 49),
(106, 'E&rsquo; un&rsquo;impresa unica, complessa, che coinvolge pi&ugrave; funzioni aziendali, con un obiettivo ben determinato, con vincoli di costo e qualit&agrave;', 0, 49),
(107, 'E&rsquo; un insieme di attivit&agrave; ripetitive e consolidate usate per il raggiungimento di determinati obiettivi', 1, 49),
(108, 'Non si pu&ograve; mai rappresentare tramite diagramma di flusso, ma &egrave; possibile rappresentarlo con un diagramma di Gantt', 0, 49),
(109, 'Toyotismo', 1, 50),
(110, 'Industria 2.0', 0, 50),
(111, 'Manierismo', 0, 50),
(112, 'Fordismo', 1, 50),
(113, 'Total Quality Improvement', 0, 50),
(114, 'Total Quality Management', 1, 50),
(115, 'Agility Production', 0, 50),
(116, 'Management di Friedman', 0, 50),
(117, 'Cerca di avere a disposizione a magazzino tutte le possibili componenti necessarie per la creazione dei prodotti', 0, 51),
(118, 'Cerca di non avere merce a magazzino, ma di ordinare i componenti quando ne ha la necessit&agrave;', 1, 51),
(119, 'Cerca di ottimizzare al massimo i tempi di produzione, creando il prodotto ordinato dal cliente solo all&rsquo;ultimo momento', 0, 51),
(120, 'Cerca di ottimizzare al massimo la componentistica dei prodotti, riducendo il pi&ugrave; possibile il numero di componenti che formano un prodotto, in modo da risparmiare sul magazzino', 0, 51),
(121, 'Societ&agrave; a rendita limitata', 0, 52),
(122, 'Societ&agrave; relazioni limitrofe', 0, 52),
(123, 'Societ&agrave; a responsabilita limitrofa', 0, 52),
(124, 'Societ&agrave; a responsabilit&agrave; limitata', 1, 52),
(133, 'Riusabilit&agrave; del codice', 1, 55),
(134, 'Portabilit&agrave; del codice su altri sistemi operativi', 0, 55),
(135, 'Facilit&agrave; di manutenzione', 1, 55),
(136, 'Maggiore rapidit&agrave; enll&#039;esecuzione delle istruzioni', 0, 55),
(137, 'Sviluppo collaborativo da parte di pi&ugrave; programmatori', 1, 55),
(138, 'Minore quantit&agrave; di bug al&#039;interno del codice', 1, 55),
(139, 'Un&#039;istanza di una classe &egrave; la definizione della classe', 0, 57),
(140, 'Un&#039;istanza di una classe &egrave; un oggetto della classe', 1, 57),
(141, 'Un&#039;istanza di una classe &egrave; un&#039;astrazione che comprende attributi e metodi', 0, 57),
(142, 'Un&#039;istanza di una classe &egrave; la funzione principale di un programma', 0, 57),
(143, 'Tramite un diagramma delle classi UML', 1, 58),
(144, 'Tramite un diagramma di flusso RST', 0, 58),
(145, 'Tramite il diagramma delle componenti UML', 0, 58),
(146, 'Tramite diagramma delle gerarchie RST', 0, 58),
(147, 'Quando si vuole creare un nuovo oggetto di quella classe', 1, 60),
(148, 'Quando si devono definire i metodi della classe', 0, 60),
(149, 'Quando si vuole richiamare la funzione principale del programma', 0, 60),
(150, 'Quando si deve eliminare dalla memoria un oggetto', 0, 60),
(151, 'La tecnica con la quale si racchiudono all&#039;interno della classe attributi e metodi', 1, 61),
(152, 'La tecnica grazie alla quale posso definire una classe all&#039;interno di un modulo', 0, 61),
(153, 'Il fatto che posso richiamare un metodo su di un oggetto', 0, 61),
(154, 'La possibilit&agrave; di riutilizzare classi su pi&ugrave; programmi', 0, 61),
(163, 'class Automobile(object):', 1, 64),
(164, 'class Automobile:', 0, 64),
(165, 'object Automobile(class):', 0, 64),
(166, 'object Automobile():', 0, 64),
(167, 'def nomeMetodo(self, par_a, par_b):', 1, 65),
(168, 'classe.nomeMetodo(self, x, y):', 0, 65),
(169, 'def nomeMetodo(par_a, par_b):', 0, 65),
(170, 'function nomeMetodo(self,x,y):', 0, 65),
(171, 'ogg.stampa()', 1, 66),
(172, 'from ogg import stampa()', 0, 66),
(173, 'ogg-&gt;stampa()', 0, 66),
(174, 'stampa(ogg)', 0, 66),
(175, 't1 = new Triangolo()', 0, 67),
(176, 't1 = Triangolo(5,3)', 1, 67),
(177, 'Triangolo(base=5, altezza=3) = t1', 0, 67),
(178, 't1 = class Triangolo(self, 5, 3)', 0, 67),
(179, 'def __init__(self, a):', 1, 68),
(180, 'def init(self, x):', 0, 68),
(181, 'def __const__(self,a):', 0, 68),
(182, 'def __init(self):', 0, 68),
(183, '__colore = &quot; &quot;', 1, 69),
(184, 'colore__ = &quot; &quot;', 0, 69),
(185, 'private colore = &quot; &quot;', 0, 69),
(186, 'def colore(self, private):', 0, 69),
(187, 'r1.__base', 0, 70),
(188, 'Non &egrave; possibile accedere direttamente agli attributi privati di una classe da una funzione esterna', 1, 70),
(189, 'r1.base', 0, 70),
(190, 'get(r1,__base)', 0, 70),
(191, 'Classe base', 0, 71),
(192, 'Classe derivata', 1, 71),
(193, 'Sopraclasse', 0, 71),
(194, 'Classe multipla', 0, 71),
(195, 'class Cerchio inehrit from FiguraGeometrica:', 0, 72),
(196, 'from FiguraGeometrica import Cerchio', 0, 72),
(197, 'class Cerchio(FiguraGeometrica):', 0, 72),
(198, 'class Cerchio(object) -&gt; FiguraGeometrica:', 0, 72),
(199, 'super()', 1, 73),
(200, 'greater()', 0, 73),
(201, 'import()', 0, 73),
(202, 'class()', 0, 73),
(203, 'Significa che una classe deriva da una singola superclasse', 0, 74),
(204, 'Significa che pi&ugrave; sottoclassi derivano da una singola superclasse', 0, 74),
(205, 'Significa che una classe deriva da pi&ugrave; superclassi', 0, 74),
(206, 'Significa che una classe non deriva da nessun&#039;altra classe', 0, 74),
(207, 'E&#039; un sinonimo di programmazione ad oggetti', 0, 75),
(208, 'La capacit&agrave; di un metodo di assumere pi&ugrave; forme', 1, 75),
(209, 'La capacit&agrave; di un attributo di essere pubblico o privato', 0, 75),
(210, 'Il fatto che si possono richiamare pi&ugrave; metodi sullo stesso oggetto', 0, 75),
(211, 'Un metodo di una superclasse viene ridefinito in una sottoclasse, cambiandone il codice', 1, 76),
(212, 'Vi sono pi&ugrave; metodi in una classe con lo stesso nome, ma parametri differenti', 0, 76),
(213, 'Vi sono dei metodi ereditati di default dalla classe object, che possiamo utilizzare nelle sottoclassi', 0, 76),
(214, 'Una classe pu&ograve; ereditare attributi e metodi di una superclasse senza doverli riscrivere', 0, 76),
(215, '__init__', 0, 77),
(216, '__str__', 0, 77),
(217, '__add__', 0, 77),
(218, '__len__', 0, 77),
(219, 'Un tipo di programmazione in cui si suddivide il programma in funzioni e moduli riutilizzabili in altri programmi', 1, 53),
(220, 'Un tipo di programmazione dove vengono inserite classi che rappresentano oggetti reali', 0, 53),
(221, 'Un tipo di programmazione dove tutto &egrave; una funzione: ad esempio per creare cicli si devono utilizzare funzioni ricorsive', 0, 53),
(222, 'Un tipo di programmazione dove si utilizzano solo funzioni logiche per ottenere risultati logici a partire da predicati', 0, 53),
(223, 'Metodo', 1, 78),
(224, 'Funzione di classe', 0, 78),
(225, 'Operazione', 0, 78),
(226, 'Fabbrica', 0, 78),
(231, 'Ereditariet&agrave; multipla', 1, 81),
(232, 'Ereditariet&agrave; multilivello', 0, 81),
(233, 'Ereditariet&agrave; gerarchica', 0, 81),
(234, 'Ereditariet&agrave; single-level', 0, 81),
(235, 'Oggetto', 1, 82),
(236, 'Attributo', 0, 82),
(237, 'Metodo', 0, 82),
(238, 'OOP', 0, 82),
(239, 'shadow = Cane(&quot;Shadow&quot;)', 0, 83),
(240, 'cane = Cane(&quot;Shadow&quot;)', 0, 83),
(241, 'rex = Cane()', 0, 83),
(242, 'stella = new Cane(&quot;Stella&quot;)', 1, 83),
(243, 'Uno dei vantaggi della OOP &egrave; che pu&ograve; nascondere la complessit&agrave; dell&#039;implementazione di un oggetto tramite incapsulamento', 0, 84),
(244, 'Una grossa opportunit&agrave; che d&agrave; la OOP &egrave; la possibilit&agrave; di costruire una classe a partire da una classe base, estendendola con nuove funzionalit&agrave;', 0, 84),
(245, 'Una classe contiene funzioni dette metodi e variabili dette attributi, che vengono utilizzate dai metodi', 0, 84),
(246, 'Un vantaggio della OOP &egrave; che rende i programmi portabili su diversi sistemi operativi', 1, 84),
(247, 'class', 1, 85),
(248, 'instance', 0, 85),
(249, 'object', 0, 85),
(250, 'import', 0, 85),
(255, 'Vero', 0, 87),
(256, 'Falso', 1, 87),
(257, 'def __init__(titolo, autore):', 0, 88),
(258, 'def __init__(self, titolo, autore):', 1, 88),
(259, 'def __init__():', 0, 88),
(260, '__init__(self, titolo, autore):', 0, 88),
(261, 'x contiene un valore intero', 0, 89),
(262, 'x contiene un riferimento ad un oggetto di calsse Cerchio', 1, 89),
(263, 'x contiene il valore dell&#039;area di un cerchio', 0, 89),
(264, 'la classe Cerchio contiene un attributo denominato x', 0, 89),
(265, '__str__', 0, 90),
(266, '__init__', 0, 90),
(267, '__add__', 1, 90),
(268, '__many__', 0, 90),
(269, 'Dichiarazione', 0, 12),
(270, 'Scriptlet', 1, 12),
(271, 'Espressione', 0, 12),
(272, 'Commento', 0, 12),
(273, '1 euro', 1, 93),
(274, '10.000 euro', 0, 93),
(275, '5.000 euro', 0, 93),
(276, '100.000 euro', 0, 93),
(277, 'class', 0, 86),
(278, 'def', 0, 86),
(279, 'self', 1, 86),
(280, 'init', 0, 86),
(281, 'java', 0, 0),
(282, 'javac', 1, 0),
(283, 'rmic', 0, 0),
(284, 'gcc', 0, 0),
(285, 'javac', 1, 0),
(286, 'java', 0, 0),
(287, 'rmic', 0, 0),
(288, 'gcc', 0, 0),
(289, 'java', 0, 0),
(290, 'javac', 1, 0),
(291, 'rmic', 0, 0),
(292, 'gcc', 0, 0),
(293, 'java', 0, 0),
(294, 'javac', 0, 0),
(295, 'rmic', 0, 0),
(296, 'gcc', 0, 0),
(297, 'javac', 1, 95),
(298, 'java', 0, 95),
(299, 'rmic', 0, 95),
(300, 'gcc', 0, 95),
(301, 'REPLIT', 1, 96),
(302, 'Eclipse', 1, 96),
(303, 'Netbeans', 1, 96),
(304, 'Visual Studio Code', 1, 96),
(305, 'PyCharm', 0, 96),
(306, 'Photopea', 0, 96),
(307, 'GIMP', 0, 96),
(308, 'Adobe Coding App', 0, 96),
(309, 'Una speciale variabile salvata a livello di sistema operativo', 1, 97),
(310, 'Una variabile di tipo intero dichiarata senza assegnare un valore', 0, 97),
(311, 'E&#039; un sinonimo di costante in Java', 0, 97),
(312, 'Una variabile speciale Java visibile a tutte le possibili classi di un programma', 0, 97),
(313, 'JDK (Java Development Kit)', 1, 98),
(314, 'JRE (Java Runtime Environment)', 0, 98),
(315, 'J2EE (Java 2 Enterprise Edition)', 0, 98),
(316, 'JSP (Java Server Pages)', 0, 98),
(317, 'java.lang', 1, 99),
(318, 'java.net', 1, 99),
(319, 'java.util', 1, 99),
(320, 'java.awt', 1, 99),
(321, 'java.random', 0, 99),
(322, 'java.pooler', 0, 99),
(323, 'java.something', 0, 99),
(324, 'java.deal', 0, 99),
(325, 'Un comando per eseguire un&#039;istruzione, per esempio if', 0, 100),
(326, 'Il nome che assegnamo ad una variabile', 1, 100),
(327, 'Una lista di elementi', 0, 100),
(328, 'Un ciclo indefinito', 0, 100),
(329, 'Parole che identificano i comandi del linguaggio, ad esempio if', 1, 101),
(330, 'I nomi che vengono assegnati alle variabili', 0, 101),
(331, 'Una convenzione dei programmatori per dichiarare costanti', 0, 101),
(332, 'La possibilit&agrave; di inserire caratteri speciali all&#039;interno delle stringhe usando backslash prima del carattere', 0, 101),
(333, 'Che lettere maiuscole e minuscole fanno differenza nei nomi di variabile, ad esempio pippo e Pippo sono due variabili diverse', 1, 102),
(334, 'Che non &egrave; pi&ugrave; possibile cambiare il tipo di una variabile dopo la sua dichiarazione', 0, 102),
(335, 'Che il tipo di una variabile viene dedotto dal valore che le assegnamo', 0, 102),
(336, 'Che la convenzione per la scrittura delle variabili in Java &egrave; prima lettera minuscola, se vi sono pi&ugrave; parole, dalla seconda in poi vanno con l&#039;iniziale maiuscola', 0, 102),
(337, 'lato', 0, 103),
(338, '3lato', 1, 103),
(339, 'lato3', 0, 103),
(340, 'latoTriangolo', 0, 103),
(341, 'latoQuadrato', 1, 104),
(342, 'lato_quadrato', 0, 104),
(343, 'LatoQuadrato', 0, 104),
(344, 'latoquadrato', 0, 104),
(345, 'const PIGRECO = 3.14;', 0, 105),
(346, 'final double PIGRECO = 3.14;', 1, 105),
(347, 'static float PIGRECO = 3.14f;', 0, 105),
(348, 'double PIGRECO = 3.14;', 0, 105),
(356, 'Modificare il tipo di una variabile, per esempio trasformando un double in un intero', 1, 107),
(357, 'Che il compilatore capisce da solo qual &egrave; il tipo di una variabile', 0, 107),
(358, 'Che non possiamo modificare il tipo di una variabile dopo la sua dichiarazione', 0, 107),
(359, 'Che posso assegnare un valore ad una variabile', 0, 107),
(360, 'Che java esegue in automatico il cast tra tipi diversi se non c&#039;&egrave; perdita di informazione', 1, 108),
(361, 'Che posso sempre modificare il tipo di una variabile', 0, 108),
(362, 'Che in Java devo sempre effettuare un cast esplicito per modificare il tipo di una variabile', 0, 108),
(363, 'Che in Java non &egrave; mai possibile modificare il tipo di una variabile', 0, 108),
(364, 'Che una volta assegnato un tipo ad una variabile, poi non lo posso pi&ugrave; modificare', 1, 109),
(365, 'Che posso modificare dinamicamente il tipo di una variabile, assegnandole un diverso valore', 0, 109),
(366, 'Che il compilatore capisce da solo qual &egrave; il tipo di una variabile, in base al valore assegnatole', 0, 109),
(367, 'Che vi sono 4 tipi di variabile: int, float, boolean, char', 0, 109),
(368, 'Ogni variabile deve avere un suo tipo, non modificabile', 0, 110),
(369, 'Le variabili possono assumere tipi diversi durante l&#039;esecuzione del programma', 0, 110),
(370, 'Il compilatore o l&#039;interprete capiscono da soli il tipo della variabile in base al valore assegnato', 0, 110),
(371, 'Che vi &egrave; una differenziazione tra tipi primitivi e tipi riferimento', 0, 110),
(372, 'AND', 0, 111),
(373, '&amp;&amp;', 1, 111),
(374, '||', 0, 111),
(375, '!%', 0, 111),
(376, '&amp;&amp;', 0, 112),
(377, 'OR', 0, 112),
(378, '||', 1, 112),
(379, '!?', 0, 112),
(380, 'int', 1, 106),
(381, 'double', 1, 106),
(382, 'String', 0, 106),
(383, 'Random', 0, 106),
(384, 'char', 1, 106),
(385, 'Float', 0, 106),
(386, 'Image', 0, 106),
(387, 'Una libreria che posso importare all&#039;interno dei miei programmi, simile ai moduli di Python', 1, 113),
(388, 'E&#039; l&#039;istruzione di assegnazione in Java', 0, 113),
(389, 'E&#039; uno strumento per creare liste di elementi, simile alle liste di Python', 0, 113),
(390, 'E&#039; il programma eseguibile su JVM ottenuto dal compilatore', 0, 113),
(391, 'E&#039; il codice ottenuto dalla compilazione di un programma Java, interpretabile dalla JVM', 1, 114),
(392, 'E&#039; una libreria Java che posso importare all&#039;interno dei programmi, come per i moduli in Python', 0, 114),
(393, 'E&#039; un programma direttamente eseguibile dal sistema operativo con estensione .exe', 0, 114),
(394, 'E&#039; un sinonimo di codice binario formato da 0 e 1', 0, 114),
(395, 'E&#039; una via di mezzo tra il linguaggio di alto livello Java e il linguaggio macchina', 1, 115),
(396, 'Pu&ograve; essere mandato in esecuzione direttamente alla CPU, senza che vi sia bisogno di altri programmi', 0, 115),
(397, 'E&#039; il file Java scritto dal programmatore con il codice sorgente', 0, 115),
(398, 'E&#039; l&#039;interprete che trasforma codice Java in codice macchina eseguibile dal processore', 0, 115),
(399, 'E&#039; la Java Virtual Machine, l&#039;interprete che trasforma il ByteCode in codice eseguibile dalla CPU', 1, 116),
(400, 'E&#039; la Java Visual Procedure, una specifica procedura per effettuare input in Java', 0, 116),
(401, 'E&#039; la Java Vehicle Merge, il compilatore che trasforma il codice sorgente in codice eseguibile', 0, 116),
(402, 'Sta per Just Virtual Merchandise, indica il fatto che Java &egrave; portabile su pi&ugrave; sistemi operativi', 0, 116),
(403, 'Scanner', 1, 117),
(404, 'Input', 0, 117),
(405, 'String', 0, 117),
(406, 'System.out', 0, 117),
(407, 'System.out.println(&quot;stringa&quot;);', 1, 118),
(408, 'System.in;', 0, 118),
(409, 'print(&quot;stringa&quot;);', 0, 118),
(410, 'Scanner output = new Scanner(&quot;stringa&quot;);', 0, 118),
(411, 'int x = myScanner.nextInt();', 1, 119),
(412, 'double x = myScanner.nextDouble();', 0, 119),
(413, 'int x = new Scanner(System.in);', 0, 119),
(414, 'int x = myScanner.input(&quot;Inserire un numero intero&quot;);', 0, 119),
(415, 'Con due barre //', 1, 120),
(416, 'Con /* pe iniziare e */ per finire', 0, 120),
(417, 'Con il carattere cancelletto #', 0, 120),
(418, 'Con i caratteri ?$', 0, 120),
(419, 'Con due barre //', 0, 121),
(420, 'Con /* per iniziare e */ per finire', 1, 121),
(421, 'Inizia con i caratteri &lt;!-- e finisce con --&gt;', 0, 121),
(422, 'Con tre asterischi *** per iniziare e due per finire **', 0, 121),
(423, 'Il risultato sar&agrave; di tipo int e la parte decimale verr&agrave; troncata senza arrotondamenti', 1, 122),
(424, 'Il risultato sar&agrave; di tipo int se non c&#039;&egrave; resto nella divisione, di tipo double altrimenti', 0, 122),
(425, 'Il risultato sar&agrave; sempre di tipo double', 0, 122),
(426, 'Il risultato sar&agrave; di tipo int e il numero verr&agrave; arrotondato (quindi se parte decimale &egrave; superiore a .5 si arrotonda per eccesso)', 0, 122),
(427, 'La variabile sar&agrave; sempre visibile anche all&#039;esterno di quel blocco di codice', 0, 123),
(428, 'La variabile sar&agrave; visibile solo all&#039;interno di quel blocco di codice e nei suoi blocchi interni', 1, 123),
(429, 'Se il blocco di codice contiene un altro blocco di codice, la variabile non sar&agrave; visibile nel blocco interno', 0, 123),
(430, 'Le variabili devono essere dichiarate all&#039;inizio e non le posso dichiarare all&#039;interno di blocchi di codice successivi', 0, 123),
(435, 'Il doppio || si ferma non appena trova una condizione vera e ritorna vero, senza controllare le altre condizioni, il singolo | controlla sempre tutte le condizioni', 1, 125),
(436, 'Il doppio || si ferma non appena trova una condizione vera e ritorna falso, senza controllare le altre condizioni, il singolo | controlla sempre tutte le condizioni', 0, 125),
(437, 'Il singolo | si ferma non appena trova una condizione vera e ritorna vero, senza controllare le altre condizioni, il doppio || controlla sempre tutte le condizioni', 0, 125),
(438, 'Non vi sono differenze tra i due', 0, 125),
(439, 'Sono equivalenti, non vi sono differenze tra i due', 0, 124),
(440, 'Il doppio &amp;&amp; si ferma appena trova una condizione falsa ritornando falso, senza controllare le altre condizioni, il singolo &amp; controlla sempre tutte le condizioni', 1, 124),
(441, 'Il singolo &amp; si ferma appena trova una condizione falsa ritornando vero, senza controllare le altre condizioni, il doppio &amp;&amp; controlla sempre tutte le condizioni', 0, 124),
(442, 'Il doppio &amp;&amp; controlla sempre tutte le condizioni inserite, il singolo &amp; si ferma appena trova una condizione vera ritornando vero', 0, 124),
(443, '3lato', 0, 134),
(444, 'lato triangolo', 0, 134),
(445, 'latoTriangolo', 1, 134),
(446, 'lato_triangolo!', 0, 134),
(447, 'Oggetto della classe', 1, 190),
(448, 'Costruttore della classe', 0, 190),
(449, 'Attributo della classe', 0, 190),
(450, 'Metodo della classe', 0, 190),
(451, ' Indica la propriet&agrave; degli oggetti di incorporare al loro interno attributi e metodi', 1, 191),
(452, 'Indica il fatto che gli attributi di una classe sono privati', 0, 191),
(453, 'Indica il fatto che una classe non pu&ograve; avere sottoclassi', 0, 191),
(454, 'E&#039; una propriet&agrave; Java che ci permette di creare delle costanti', 0, 191),
(455, 'E&#039; un metodo speciale con lo stesso nome della classe', 1, 192),
(456, 'E&#039; un qualsiasi metodo della classe', 0, 192),
(457, 'Non pu&ograve; avere parametri', 0, 192),
(458, 'E&#039; una variabile d&#039;istanza della classe', 0, 192),
(459, 'E&#039; un attributo valorizzato per un dato oggetto', 1, 193),
(460, 'E&#039; una variabile dichiarata all&#039;interno di un qualsiasi metodo', 0, 193),
(461, 'E&#039; una variabile dichiarata nel metodo main', 0, 193),
(462, 'E&#039; una variabile globale visibile a tutto il programma Java', 0, 193),
(463, 'Cerchio c  = new Cerchio(8);', 1, 194),
(464, 'Cerchio c = __init__(8);', 0, 194),
(465, 'Cerchio c = new Cerchio[8];', 0, 194),
(466, 'Cerchio c = Cerchio(8);', 0, 194),
(467, 'public int somma()', 0, 195),
(468, 'protected double divisione(int x,int y)', 0, 195),
(469, 'String saluto()', 0, 195),
(470, 'public versamento(int denaro)', 1, 195),
(471, 'E&#039; un attributo della classe', 0, 196),
(472, 'E&#039; una variabile definita all&#039;interno di un metodo e visibile solo al suo interno', 1, 196),
(473, 'E&#039; una varaibile visibile dall&#039;intero programma Java', 0, 196),
(474, 'E&#039; una variabile definita con la parola chiave static', 0, 196),
(475, 'Viene usata per definire costanti', 1, 197),
(476, 'Viene usata per creare varaibili globali', 0, 197),
(477, 'Viene usata per creare variabili d&#039;istanza', 0, 197),
(478, 'Viene usata per definire metodi richiamabili con nomeClasse.nomeMetodo()', 0, 197),
(479, 'Viene usata quando ci si riferisce ad un riferimento nullo, che non punta a nessun oggetto', 1, 198),
(480, 'Viene usata quando non &egrave; stato dato un valore ad un tipo primitivo, come int', 0, 198),
(481, 'Viene usata quando voglio confrontare due stringhe ed essere sicuro che siano uguali', 0, 198),
(482, 'Viene usata quando voglio riferirmi ad un attributo della classe all&#039;interno del codice di un metodo', 0, 198),
(487, 'Array a1 = new Array(5,Automobile)', 0, 200),
(488, 'Automobile a1 = new Array[5]', 0, 200),
(489, 'Automobile a1[] = new Automobile[5]', 1, 200),
(490, 'Automobile a1 = new Automobile(5)', 0, 200),
(499, 'L&#039;insieme di attributi e metodi privati di una classe', 0, 206),
(500, 'L&#039;insieme dei metodi che il programmatore pu&ograve; utilizzare su di un oggetto di una certa classe', 0, 206),
(501, 'E&#039; un sinonimo di costruttore della classe', 0, 206),
(502, 'E&#039; il package contenente la classe', 0, 206),
(507, 'Un modello di un oggetto reale, con le sue caratterisitche e funzionalit&agrave;', 1, 208),
(508, 'Una particolare funzione che pu&ograve; essere importata all&#039;interno dei programmi', 0, 208),
(509, 'E&#039; un sinonimo di package in Java', 0, 208),
(510, 'E&#039; una libreria che mi permette di eseguire operazioni complesse', 0, 208),
(515, 'r1.altezza', 0, 210),
(516, 'Non &egrave; possibile accedere direttamente agli attributi privati di una classe da una classe esterna', 1, 210),
(517, 'r1.__altezza', 0, 210),
(518, 'get(r1,altezza)', 0, 210),
(519, 'ogg.calcolaPerimetro()', 1, 211),
(520, 'ogg-&gt;calcolaPerimetro()', 0, 211),
(521, 'calcolaPerimetro(ogg)', 0, 211),
(522, 'import ogg.calcolaPerimetro()', 0, 211),
(523, 'Il mascheramento delle modalit&agrave; di implementazione di un oggetto, rendendone disponibili le sole funzionalit&agrave;', 1, 212),
(524, 'Il fatto di poter attribuire alle classi attributi e metodi pubblici', 0, 212),
(525, 'Il fatto che non possiamo sapere come sia implementato il package java.util.Random', 0, 212),
(526, 'La condivisione di informazioni tra oggetti della stessa classe', 0, 212),
(527, 'x contiene un valore intero', 0, 213),
(528, 'x contiene un riferimento ad un oggetto di classe Cerchio', 1, 213),
(529, 'x contiene il valore dell&#039;area di un cerchio', 0, 213),
(530, 'la classe Cerchio contiene un attributo denominato x', 0, 213),
(535, 'Tutti gli attributi della classe sono pubblici', 0, 216),
(536, 'Una parte degli attributi della classe sono privati', 1, 216),
(537, 'Si inserisce un metodo toString() all&rsquo;interno della classe per trasformarla in stringa', 0, 216),
(538, 'Inserisco attributi statici all&rsquo;interno della classe', 0, 216),
(539, 'Ho un riferimento null', 1, 217),
(540, 'Posso chiamare il metodo toString() su quel riferimento, perch&eacute; ereditato dalla classe Object', 0, 217),
(541, 'Posso accedere agli attributi dell&rsquo;oggetto con l&rsquo;operatore . (punto)', 0, 217),
(542, 'Non posso farlo a meno che la classe non sia stata dichiarata static', 0, 217),
(543, 'Dichiarare una variabile di classe, anzich&eacute; legata agli oggetti', 0, 218),
(544, 'Dichiarare un metodo Costruttore', 0, 218),
(545, 'Dichiarare una costante, che una volta inizializzata non pu&ograve; pi&ugrave; essere modificata', 1, 218),
(546, 'Dichiarare che la classe che stiamo costruendo eredita da una superclasse', 0, 218),
(547, 'Solo se i nomi dei due costruttori sono diversi', 0, 219),
(548, 'Solo se contengono gli stessi parametri', 0, 219),
(549, 'Solo se contengono parametri diversi', 1, 219),
(550, 'Falso, non &egrave; mai possibile dichiarare pi&ugrave; costruttori per una classe in Java', 0, 219),
(551, 'Chiusa di tipo EULA', 0, 235),
(552, 'Open Source', 1, 235),
(553, 'Creative Commons', 0, 235),
(554, 'ADWare', 0, 235),
(555, 'Il programma &egrave; stato compilato, creando un eseguibile. Lo posso lanciare direttamente dal sistema operativo', 1, 236),
(556, 'Il programma ha bisogno di un interprete per essere eseguito', 0, 236),
(557, 'Il programma non &egrave; stato scritto da un programmatore', 0, 236),
(558, 'Il programma &egrave; stato compilato, ma serve anche un programma interprete per eseguirlo', 0, 236),
(559, 'Il programma &egrave; in codice macchina, praticamente direttamente eseguibile dalla CPU', 1, 237),
(560, 'Il programma &egrave; in bytecode, &egrave; stato compilato, ma necessita di un interprete per essere eseguito', 0, 237),
(561, 'Il programma &egrave; in codice sorgente, viene mandato in esecuzione riga per riga da un interprete', 0, 237),
(562, 'Il programma &egrave; in codice ottale, accede alla memoria ROM', 0, 237),
(563, 'Esegue pi&ugrave; rapidamente di un programma interpretato', 1, 238),
(564, 'Esegue pi&ugrave; lentamente rispetto un programma interpretato', 0, 238),
(565, 'Esegue pi&ugrave; o meno alla stessa velocit&agrave; di un programma interpretato', 0, 238),
(566, 'Non pu&ograve; accedere alla memoria RAM, quindi &egrave; limitato rispetto un programma interpretato', 0, 238),
(571, 'Posso utilizzarlo tranquillamente anche su Windows', 0, 240),
(572, 'Funzioner&agrave; solo per il sistema Linux', 1, 240),
(573, 'Viene eseguito pi&ugrave; velocemente rispetto a Windows, ma utilizzo lo stesso programma compilato', 0, 240),
(574, 'Non lo posso mai compilare anche per Windows, utilizzando un diverso compilatore', 0, 240),
(575, 'Lo pu&ograve; lanciare direttamente dal sistema operativo', 0, 241),
(576, 'Deve installare l&#039;interprete Python per poterlo eseguire', 1, 241),
(577, 'Deve installare un compilatore, compilare il programma e poi lo pu&ograve; lanciare', 0, 241),
(578, 'Non potr&agrave; mai lanciare il programma Python', 0, 241),
(579, 'Editor di testo, compilatore o interprete, debugger', 1, 242),
(580, 'Editor di testo, programma eseguibile, cartella di progetto', 0, 242),
(581, 'Debugger, compilatore o interprete, ma non l&#039;editor di testo', 0, 242),
(582, 'Solo editor di testo', 0, 242),
(583, 'Crea un nuovo blocco di codice, la inseriamo ad esempio dopo un if', 1, 243),
(584, 'Pu&ograve; essere inserita ovunque, non d&agrave; problemi', 0, 243),
(585, 'Serve ad inserire un commento', 0, 243),
(586, 'Serve solamente ad avere del codice pi&ugrave; ordinato', 0, 243),
(587, 'a=b=c=5', 1, 244),
(588, 'a=5, b=5, c=5', 0, 244),
(589, 'a==b==c==5', 0, 244),
(590, 'a!=b=!c!=5', 0, 244),
(591, 'la stringa &quot;a5&quot;', 0, 245),
(592, 'la stringa &quot;5a&quot;', 0, 245),
(593, 'la stringa &quot;aaaaa&quot;', 1, 245),
(594, 'Errore', 0, 245),
(595, 'Modificare il valore di una variabile', 0, 246),
(596, 'Modificare il tipo di una variabile', 1, 246),
(597, 'Solo trasformare una stringa in un intero', 0, 246),
(598, 'Richiedere in input un tipo intero', 0, 246),
(599, 'wile scritto al posto di while', 1, 247),
(600, 'if: senza la condizione', 0, 247),
(601, 'Calcolare l&#039;area del triangolo come base * altezza (senza /2)', 0, 247),
(602, 'Tentare di dividere per 0', 0, 247),
(603, 'di seguire il programma un&rsquo;istruzione per volta, cos&igrave; da verificarne la corretta evoluzione', 0, 248),
(604, 'di controllare i valori assunti dalle variabili durante l&rsquo;esecuzione del programma', 0, 248),
(605, 'di stabilire punti di interruzione (breakpoint) durante l&rsquo;esecuzione per stabilire dei controlli', 0, 248),
(606, 'la correzione in automatico degli errori (bug) senza l&#039;intervento del programmatore', 1, 248),
(607, 'Dare nomi significativi alle variabili', 0, 249),
(608, 'Inserire molti commenti', 0, 249),
(609, 'Scrivere un manuale di istruzioi per l&#039;utilizzatore finale', 0, 249),
(610, 'Inserire meno cicli possibile per non appesantire il programma', 1, 249),
(615, 'Estensione e ridefinizione', 1, 277),
(616, 'Estensione e polimorfismo', 0, 277),
(617, 'Ridefinizione e polimorfismo', 0, 277),
(618, 'Overloading e overriding', 0, 277),
(619, 'Ereditariet&agrave; singola', 1, 278),
(620, 'Ereditariet&agrave; multipla', 0, 278),
(621, 'Ereditariet&agrave; gerarchica', 0, 278),
(622, 'Ereditariet&agrave; multilivello', 0, 278),
(623, 'Ereditariet&agrave; singola', 0, 279),
(624, 'Ereditariet&agrave; multilivello', 0, 279),
(625, 'Ereditariet&agrave; multipla', 1, 279),
(626, 'Ereditariet&agrave; gerarchica', 0, 279),
(627, 'No, mai', 0, 280),
(628, 'Si, sempre, per qualsiasi classe', 0, 280),
(629, 'Si, ma solo se ereditiamo da una classe singola e pi&ugrave; interfacce', 1, 280),
(630, 'Si, solo se ereditiamo da una singola interfaccia e pi&ugrave; classi', 0, 280),
(631, 'extends', 1, 281),
(632, 'super', 0, 281),
(633, 'implements', 0, 281),
(634, 'Inserisco la superclasse tra parentesi dopo la dichiarazione della classe', 0, 281),
(635, 'Object', 1, 282),
(636, 'Main', 0, 282),
(637, 'Util', 0, 282),
(638, 'Javac', 0, 282),
(639, 'Overloading', 1, 283),
(640, 'Overriding', 0, 283),
(641, 'Information Hiding', 0, 283),
(642, 'Dei costruttori della classe', 0, 283),
(643, 'Overriding', 1, 284),
(644, 'Overloading', 0, 284),
(645, 'Information Hiding', 0, 284),
(646, 'Encapsulation', 0, 284),
(651, 'Non vengono mai ereditati dalle sottoclassi', 1, 286),
(652, 'Vengono sempre ereditati dalle sottoclassi', 0, 286),
(653, 'Vengono ereditati dalle sottoclassi solo se sono anche protected', 0, 286),
(654, 'Vengono ereditati dalle sottoclassi solo se le sottoclassi sono interfacce', 0, 286),
(655, 'Salvare dati all&#039;interno di una memoria secondaria', 1, 290),
(656, 'Salvare dati all&#039;interno della memoria RAM', 0, 290),
(657, 'Salvare dati all&#039;interno di una memoria ROM', 0, 290),
(658, 'Visualizzare dati all&#039;interno del blocco note', 0, 290),
(659, 'Apertura', 0, 291),
(660, 'Chiusura', 0, 291),
(661, 'Scrittura', 0, 291),
(662, 'Modellazione', 1, 291),
(663, 'Crea un collegamento tra memoria centrale e memoria secondaria', 1, 292),
(664, 'Crea un collegamento tra la RAM e la stampante', 0, 292),
(665, 'Non &egrave; mai possibile se il file non &egrave; gi&agrave; presente su hard disk', 0, 292),
(666, 'Crea un collegamento tra il disco fisso e lo schermo dove visualizzo il file', 0, 292),
(667, 'Operazione di input: i dati passano dalla memoria secondaria al programma in esecuzione', 1, 293),
(668, 'Operazione di output: i dati passano dalla memoria secondaria al programma in esecuzione', 0, 293),
(669, 'Operazione di input: i dati passano dal programma in esecuzione alla memoria secondaria', 0, 293),
(670, 'Operazione di output: i dati passano dal programma in esecuzione alla memoria secondaria', 0, 293),
(671, 'Operazione di output: i dati passano dal programma in esecuzione alla memoria secondaria', 1, 294),
(672, 'Operazione di input: i dati passano dal programma in esecuzione alla memoria secondaria', 0, 294),
(673, 'Operazione di input: i dati passano dalla memoria secondaria al programma in esecuzione', 0, 294),
(674, 'Operazione di output: i dati passano dalla memoria secondaria al programma in esecuzione', 0, 294),
(675, 'java.io', 1, 295),
(676, 'java.util', 0, 295),
(677, 'java.lang', 0, 295),
(678, 'java.awt', 0, 295),
(679, 'Un flusso di dati', 1, 296),
(680, 'Una connessione Internet', 0, 296),
(681, 'Un programma per visualizzare film o ascoltare musica (appunto in streaming)', 0, 296),
(682, 'Una classe Java ereditata', 0, 296),
(683, 'Basate sui Byte e basate sui Caratteri', 1, 297),
(684, 'Basate sulle Stringhe e basate sui bit', 0, 297),
(685, 'Basate sull&#039;input e basate sull&#039;output', 0, 297),
(686, 'Basate su binario e basate su eadecimale', 0, 297),
(687, 'File strutturati e File di testo', 1, 298),
(688, 'File binari e File esadecimali', 0, 298),
(689, 'File eseguibili e file di dati', 0, 298),
(690, 'File pesanti e file leggeri', 0, 298),
(691, 'Deve avere una struttura definita che devo conoscere se voglio leggere il file', 1, 299),
(692, 'Contiene solo righe di testo', 0, 299),
(693, 'Non pu&ograve; mai contenere stringhe', 0, 299),
(694, 'Ha una struttura variabile e posso leggere i dati nell&#039;ordine che preferisco', 0, 299),
(695, 'Ereditare dalla classe Object', 0, 300),
(696, 'Implementare l&#039;interfaccia Serializable', 1, 300),
(697, 'Non essere sottoclasse di nesssuna superclasse', 0, 300),
(698, 'Ereditare dalla classe Stream', 0, 300),
(699, 'Non possono mai dare errori', 0, 301),
(700, 'Possono generare eccezioni che vanno gestite con blocchi try..catch', 1, 301),
(701, 'Possono generare eccezioni che possiamo anche non gestire, della gestione si preoccupa la JVM', 0, 301),
(702, 'Generano in ogni caso l&#039;eccezione IOException, che deve essere dichiarata all&#039;inizio del programma', 0, 301),
(703, 'Split', 0, 302),
(704, 'StringTokenizer', 1, 302),
(705, 'StringExplode', 0, 302),
(706, 'StripCharacter', 0, 302),
(707, 'Not SQL', 0, 345),
(708, 'Not Only SQL', 1, 345),
(709, 'Near Only SQL', 0, 345),
(710, 'Not or SQL', 0, 345),
(711, 'Utilizzano tabelle a schema fisso', 0, 346),
(712, 'Sono schema-less', 1, 346),
(713, 'Utilizzano sia tabelle a schema fisso che documenti a schema libero', 0, 346),
(714, 'Hanno necessit&agrave; di definire lo schema di dati da utilizzare in anticipo', 0, 346),
(715, 'La propriet&agrave; di avere tutti i dati in un unico server sempre attivo', 0, 347),
(716, 'La propriet&agrave; di garantire la disponibilit&agrave; dei dati anche nel caso di caduta di alcuni nodi in un sistema distribuito', 1, 347),
(717, 'La propriet&agrave; di garantire transazioni con modalit&agrave; ACID', 0, 347),
(718, 'La propriet&agrave; di garantire la consistenza dei dati in ogni singolo istante', 0, 347),
(719, 'Che i dati sono sempre disponibili fintanto che l&#039;host di database &egrave; online', 0, 348),
(720, 'Che viene garantito il fatto che i dati siano consistenti dopo un certo tempo se non avvengono modifiche', 1, 348),
(721, 'Che si garantisce in ogni istante la completa consistenza dell&#039;intero database', 0, 348),
(722, 'Che i dati vengono salvati su documenti anzich&eacute; su tabelle', 0, 348),
(723, 'Posso avere al massimo 2 tra le seguenti propriet&agrave; per un db: Coerenza, Disponibilit&agrave;, Tolleranza di partizione ', 1, 349),
(724, 'Solo in rari casi riesco ad ottenere tutte e tre le seguenti propriet&agrave; per un db: Coerenza, Disponibilit&agrave;, Tolleranza di partizione', 0, 349),
(725, 'Posso avere al massimo una tra le seguenti propriet&agrave;: Coerenza, Disponibilit&agrave;, Scalabilit&agrave; orizzontale', 0, 349),
(726, 'Posso avere al massimo 2 tra le seguenti propriet&agrave; per un db: Coerenza, Flessibilit&agrave;, Tolleranza di partizione ', 0, 349),
(727, 'Coerenza: tutti i nodi vedono gli stessi dati allo stesso tempo', 0, 350),
(728, 'Availability: ogni operazione riceve sempre una risposta', 0, 350),
(729, 'Partition Tolerance: il sistema pu&ograve; aggiungere nodi, un nodo pu&ograve; cadere o essere rimosso in ottica distribuita', 1, 350),
(730, 'Elevate prestazioni: i dati sono raggiungibili in breve tempo', 0, 350),
(731, 'Se ogni richiesta deve avere risposta e tutti devono vedere lo stesso dato, allora non posso avere distribuzione del db', 0, 351),
(732, 'Se ogni richiesta deve avere risposta e ho un db distribuito, devo necessariamente duplicare i dati, che potrebbero essere diversi da un nodo all&#039;altro per un certo tempo', 1, 351),
(733, 'Se ho db distribuito e i dati devono essere gli stessi per tutti, allora potrei non avere risposta ad alcune domande, fintanto che si propagano le modifiche', 0, 351),
(734, 'Se ogni richiesta deve avere risposta e ho un db distribuito, allora se cade un nodo della rete non riesco pi&ugrave; ad accedere ai dati', 0, 351),
(735, 'Orientato alle colonne', 0, 352),
(736, 'A documenti', 0, 352),
(737, 'A grafo', 0, 352),
(738, 'A valori duplicati', 1, 352),
(739, 'MongoDB', 0, 353),
(740, 'Cassandra', 0, 353),
(741, 'CouchDB', 0, 353),
(742, 'Oracle', 1, 353),
(743, 'XML', 0, 354),
(744, 'YAML', 0, 354),
(745, 'JSON', 1, 354),
(746, 'Testo semplice', 0, 354),
(747, 'A bus', 0, 355),
(748, 'A maglia', 0, 355),
(749, 'Ad anello', 1, 355),
(750, 'A stella', 0, 355),
(759, 'class', 0, 386),
(760, 'def', 0, 386),
(761, 'self', 1, 386),
(762, 'init', 0, 386),
(767, 'Definisce attributi e metodi di una classe ', 0, 388),
(768, 'Viene richiamata quando un nuovo oggetto viene istanziato', 1, 388),
(769, 'Inizializza sempre tutti gli attributi a 0 quando viene richiamata', 0, 388),
(770, 'Nessuna delle altre risposte &egrave;  corretta', 0, 388),
(775, 'ogg.stampa()', 1, 390),
(776, 'from ogg import stampa()', 0, 390),
(777, 'ogg-&gt;stampa()', 0, 390),
(778, 'stampa(ogg)', 0, 390),
(783, 'def __init__(self, a):', 1, 392),
(784, 'def init(self, x):', 0, 392),
(785, 'def __const__(self,a):', 0, 392),
(786, 'def __init(self):', 0, 392),
(787, 'Un Oggetto', 1, 393),
(788, 'Un Attributo', 0, 393),
(789, 'Un Metodo', 0, 393),
(790, 'Una OOP', 0, 393),
(795, 'cane = Cane(&quot;Shadow&quot;)', 0, 395),
(796, 'rex = Cane()', 0, 395),
(797, 'stella = new Cane(&quot;Stella&quot;)', 1, 395),
(798, 'shadow = Cane(&quot;Shadow&quot;)', 0, 395),
(799, 'Nascondere informazioni sensibili all&#039;interno della classe', 1, 415),
(800, 'Mostrare tutte le informazioni pubblicamente', 0, 415),
(801, 'Condividere le informazioni con altre classi', 0, 415),
(802, 'Ignorare le informazioni all&#039;interno della classe', 0, 415),
(803, 'Nascondere le informazioni all&#039;interno della classe', 0, 416),
(804, 'Creare nuove istanze di una classe', 0, 416),
(805, 'Estendere il comportamento di una classe esistente', 1, 416),
(806, 'Eliminare le informazioni dalla classe genitore', 0, 416),
(807, 'Un&#039;istanza di un oggetto', 0, 417),
(808, 'Una collezione di attributi e metodi', 1, 417),
(809, 'Un&#039;istanza di un metodo', 0, 417),
(810, 'Una funzione che opera su dati', 0, 417),
(811, 'Una classe &egrave; istanza di un oggetto, mentre un oggetto &egrave; un&#039;istanza di una classe', 0, 418),
(812, 'Una classe contiene metodi, mentre un oggetto contiene dati', 0, 418),
(813, 'Una classe &egrave; statica, mentre un oggetto &egrave; dinamico', 0, 418),
(814, 'Una classe &egrave; astratta, mentre un oggetto &egrave; concreto', 1, 418),
(819, 'Nascondendo i dettagli di implementazione', 0, 420),
(820, 'Consentendo la riutilizzazione del codice esistente', 1, 420),
(821, 'Aggregando oggetti in una classe', 0, 420),
(822, 'Creando classi intermedie', 0, 420),
(823, 'public void ClassName()', 0, 421),
(824, 'public ClassName()', 1, 421),
(825, 'private ClassName()', 0, 421),
(826, 'Non &egrave; possibile definire una classe senza un costruttore', 0, 421),
(827, '__init__()', 1, 422),
(828, '__new__()', 0, 422),
(829, '__create__()', 0, 422),
(830, '__instance__()', 0, 422),
(832, 'extends', 1, 423),
(833, 'inherits', 0, 423),
(834, 'implements', 0, 423),
(835, 'extendsOf', 0, 423),
(836, '__str__()', 1, 424),
(837, '__repr__()', 0, 424),
(838, '__tostring__()', 0, 424),
(839, '__convert__()', 0, 424),
(840, '::', 0, 425),
(841, '-&gt;', 0, 425),
(842, '.', 1, 425),
(843, '&gt;&gt;', 0, 425),
(844, 'public', 0, 426),
(845, 'private', 0, 426),
(846, 'protected', 1, 426),
(847, 'default', 0, 426),
(848, 'super().methodName()', 1, 427),
(849, 'super.methodName()', 0, 427),
(850, 'parent.methodName()', 0, 427),
(851, 'parent().methodName()', 0, 427),
(852, 'void', 1, 428),
(853, 'null', 0, 428),
(854, 'none', 0, 428),
(855, 'empty', 0, 428),
(856, 'void', 0, 429),
(857, 'null', 0, 429),
(858, 'None', 1, 429),
(859, 'empty', 0, 429),
(860, 'Funzione', 0, 430),
(861, 'Classe', 1, 430),
(862, 'Oggetto', 0, 430),
(863, 'Interfaccia', 0, 430),
(864, 'Composizione', 0, 431),
(865, 'Aggregazione', 0, 431),
(866, 'Ereditariet&agrave;', 1, 431),
(867, 'Associazione', 0, 431),
(868, 'LIFO Last In First Out', 1, 432),
(869, 'FIFO First In First Out', 0, 432),
(870, 'LILO Last In Last Out', 0, 432),
(871, 'Round Robin', 0, 432),
(872, 'LIFO Last In First Out', 0, 433),
(873, 'FIFO First In First Out', 1, 433),
(874, 'Round Robin', 0, 433),
(875, 'FILO First In Last Out', 0, 433),
(876, 'Poter creare degli oggetti semplificati a partire dall&#039;interfaccia', 0, 438),
(877, 'Specificare un contratto che le classi devono seguire', 1, 438),
(878, 'Danno la possibilit&agrave; di aggiungere metodi statici alle classi', 0, 438),
(879, 'Consentono l&#039;Information hiding dato che tutti gli attributi sono privati', 0, 438),
(880, 'Sottoclasse', 1, 276),
(881, 'Superclasse', 0, 276),
(882, 'Classe ad oggetti', 0, 276),
(883, 'Costruttore', 0, 276),
(892, 'Nascondere un metodo di una classe genitore', 0, 419),
(893, 'Aggiungere un nuovo metodo a una classe', 0, 419),
(894, 'Sostituire un metodo di una classe genitore in una sottoclasse', 1, 419),
(895, 'Eliminare un metodo da una classe', 0, 419),
(896, 'Una rappresentazione grafica del flusso delle istruzioni di un programma', 1, 439),
(897, 'Una lista delle parole chiave del linguaggio di programmazione', 0, 439),
(898, 'Un elenco delle funzioni disponibili in Python', 0, 439),
(899, 'Una tabella riassuntiva delle variabili utilizzate nel programma', 0, 439),
(900, 'Una collezione di esempi di codice Python', 0, 439),
(901, 'Una funzione da richiamare', 0, 440),
(902, 'Una condizione da verificare', 1, 440),
(903, 'Un&#039;operazione aritmetica da compiere', 0, 440),
(904, 'Una variabile da inizializzare', 0, 440),
(905, 'Un&#039;istruzione da eseguire', 0, 440),
(911, 'Utilizzando la parola chiave &quot;final&quot;', 0, 442),
(913, 'Utilizzando la parola chiave &quot;constant&quot;', 0, 442),
(914, 'Utilizzando il simbolo &quot;=&quot; per assegnare un valore al nome della variabile', 1, 442),
(915, 'Utilizzando il simbolo &quot;:&quot; davanti al nome della variabile', 0, 442),
(916, 'Record e File', 0, 443),
(917, 'Liste e Dizionari', 1, 443),
(918, 'Pile e Code', 0, 443),
(919, 'Array e Matrici', 0, 443),
(920, 'Stringhe e Booleani', 0, 443),
(921, 'Sezioni di codice che possono essere richiamate pi&ugrave; volte all&#039;interno di un programma', 1, 444),
(922, 'Cicli for con variabili di iterazione complesse', 0, 444),
(923, 'Istruzioni condizionali annidate', 0, 444),
(924, 'Variabili locali all&#039;interno di una funzione', 0, 444),
(925, 'Instradamenti di flusso alternativi', 0, 444),
(926, 'Un&#039;istruzione break', 0, 445),
(927, 'Una struttura condizionale if-else', 0, 445),
(928, 'Una funzione definita dall&#039;utente che calcola la media di una lista di numeri', 1, 445),
(929, 'Una variabile globale', 0, 445),
(930, 'Un&#039;istruzione pass', 0, 445),
(931, 'L&#039;utilizzo di una variabile senza inizializzarla', 0, 446),
(932, 'L&#039;annidamento di pi&ugrave; funzioni all&#039;interno di una stessa funzione', 0, 446),
(933, 'La chiamata di una funzione da parte di se stessa', 1, 446),
(934, 'La ricreazione di una variabile ogni volta che viene utilizzata', 0, 446),
(935, 'La ripetizione di un&#039;istruzione per un numero definito di volte', 0, 446),
(936, 'Quello in cui non ci sono condizioni da rispettare', 0, 447),
(937, 'Quello in cui la funzione ricorsiva deve chiamare una funzione ausiliaria', 0, 447),
(938, 'Quello in cui la ricorsione &egrave; evitata totalmente', 0, 447),
(939, 'Quello in cui la variabile contatore raggiunge un valore massimo', 0, 447),
(940, 'Quello in cui si verifica la condizione di uscita dalla funzione ricorsiva', 1, 447),
(941, 'write', 0, 448),
(942, 'append', 0, 448),
(943, 'open', 1, 448),
(944, 'update', 0, 448),
(945, 'readline', 0, 448),
(946, 'Un valore', 0, 449),
(947, 'L&#039;associazione di un nome ad un valore', 1, 449),
(948, 'Una stringa', 0, 449),
(949, 'Un insieme di valori', 0, 449),
(950, 'Un&#039;area di memoria ROM', 0, 449),
(951, 'Su un disco fisso', 0, 450),
(952, 'Nella memoria ROM', 0, 450),
(953, 'Nella CPU', 0, 450),
(954, 'Nella memoria RAM', 1, 450),
(955, 'Nell&#039;ALU', 0, 450);
INSERT INTO `ct_risposte` (`id_risposta`, `risposta`, `corretta`, `fk_domanda`) VALUES
(956, 'Rappresentare graficamente l&#039;algoritmo', 1, 451),
(957, 'Definire le variabili del programma', 0, 451),
(958, 'Eseguire istruzioni condizionali', 0, 451),
(959, 'Creare strutture dati complesse', 0, 451),
(960, 'Variabili', 0, 452),
(961, 'Istruzioni condizionali', 1, 452),
(962, 'Strutture dati', 0, 452),
(963, 'Sottoprogrammi', 0, 452),
(964, 'Memorizzare dati temporanei', 1, 453),
(965, 'Creare cicli di ripetizione', 0, 453),
(966, 'Definire funzioni personalizzate', 0, 453),
(967, 'Creare diagrammi di flusso', 0, 453),
(968, 'Definire le istruzioni condizionali', 0, 454),
(969, 'Organizzare e gestire raccolte di dati', 1, 454),
(970, 'Creare diagrammi di flusso complessi', 0, 454),
(971, 'Rappresentare insiemi matematici', 0, 454),
(972, 'Un&#039;istruzione condizionale', 0, 455),
(973, 'Una variabile globale', 0, 455),
(974, 'Una funzione o procedura separata', 1, 455),
(975, 'Un&#039;operazione matematica', 0, 455),
(976, 'Solo nei sottoprogrammi', 0, 456),
(977, 'Solo tra gli argomenti', 0, 456),
(978, 'In nessun punto del programma', 0, 456),
(979, 'In qualunque punto del programma', 1, 456),
(980, 'Bubble sort', 1, 457),
(981, 'Insertion sort', 0, 457),
(982, 'Selection sort', 0, 457),
(983, 'Merge sort', 0, 457),
(984, 'Bubble sort', 0, 458),
(985, 'Insertion sort', 0, 458),
(986, 'Selection sort', 1, 458),
(987, 'Merge sort', 0, 458),
(992, 'Bubble sort', 0, 460),
(993, 'Insertion sort', 0, 460),
(994, 'Selection sort', 0, 460),
(995, 'Merge sort', 1, 460),
(1000, 'O(n^2)', 1, 462),
(1001, 'O(1)', 0, 462),
(1002, 'O(n)', 0, 462),
(1003, 'O(n log n)', 0, 462),
(1004, 'O(n)', 1, 463),
(1005, 'O(n^2)', 0, 463),
(1006, 'O(1)', 0, 463),
(1007, 'O(log n)', 0, 463),
(1008, 'O(n)', 0, 464),
(1009, 'O(n^2)', 0, 464),
(1010, 'O(1)', 0, 464),
(1011, 'O(log n)', 1, 464),
(1012, 'try', 0, 441),
(1013, 'for', 0, 441),
(1014, 'switch', 0, 441),
(1015, 'if', 1, 441),
(1016, 'Ricerca binaria', 1, 459),
(1017, 'Ricerca ordinata', 0, 459),
(1018, 'Ricerca per tentativi', 0, 459),
(1019, 'Ricerca lineare', 0, 459),
(1020, 'Ricerca binaria', 0, 461),
(1021, 'Ricerca sequenziale', 1, 461),
(1022, 'Ricerca per tentativi', 0, 461),
(1023, 'Ricerca ordinata', 0, 461);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_studenti`
--

CREATE TABLE `ct_studenti` (
  `id_studente` int(11) NOT NULL,
  `fk_utente` int(11) NOT NULL,
  `xp` int(11) NOT NULL,
  `livello` int(11) NOT NULL DEFAULT 1,
  `fk_personaggio` int(11) NOT NULL,
  `vite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ct_studenti`
--

INSERT INTO `ct_studenti` (`id_studente`, `fk_utente`, `xp`, `livello`, `fk_personaggio`, `vite`) VALUES
(2, 6, 0, 1, 0, 0),
(3, 5, 0, 1, 0, 0),
(4, 6, 80, 1, 1, 2),
(5, 7, 600, 3, 2, 3),
(7, 8, 300, 2, 3, 2),
(8, 9, 100, 1, 5, 6),
(9, 10, 300, 3, 4, 2),
(10, 11, 150, 2, 6, 4),
(11, 12, 100, 1, 9, 3),
(12, 13, 0, 1, 7, 2),
(13, 14, 0, 1, 8, 4),
(14, 15, 1450, 5, 10, 1),
(15, 16, 0, 1, 11, 2),
(16, 17, 0, 1, 12, 3),
(17, 18, 0, 1, 13, 4),
(18, 19, 0, 1, 14, 1),
(19, 15, 0, 1, 3, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_studenti_classi`
--

CREATE TABLE `ct_studenti_classi` (
  `id_stud_classe` int(11) NOT NULL,
  `fk_studente` int(11) NOT NULL,
  `fk_classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ct_studenti_classi`
--

INSERT INTO `ct_studenti_classi` (`id_stud_classe`, `fk_studente`, `fk_classe`) VALUES
(1, 4, 5),
(2, 2, 4),
(3, 3, 4),
(4, 5, 5),
(5, 6, 4),
(6, 7, 5),
(7, 8, 5),
(8, 9, 5),
(9, 10, 5),
(10, 11, 5),
(11, 12, 5),
(12, 13, 5),
(13, 14, 5),
(14, 15, 5),
(15, 16, 5),
(16, 17, 5),
(17, 18, 5),
(18, 19, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_studenti_poteri`
--

CREATE TABLE `ct_studenti_poteri` (
  `id_stud_pot` int(11) NOT NULL,
  `fk_studente` int(11) NOT NULL,
  `fk_potere` int(11) NOT NULL,
  `usato` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_temporary_dom`
--

CREATE TABLE `ct_temporary_dom` (
  `id_temporary_dom` int(11) NOT NULL,
  `fk_utente` int(11) NOT NULL,
  `fk_domanda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_tipi_domande`
--

CREATE TABLE `ct_tipi_domande` (
  `id_tipo_domanda` int(11) NOT NULL,
  `tipo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_tipi_domande`
--

INSERT INTO `ct_tipi_domande` (`id_tipo_domanda`, `tipo`) VALUES
(1, 'Risposta aperta'),
(2, 'Scelta multipla'),
(3, 'Risposta multipla'),
(4, 'Esercizio con Numeri');

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_tipi_esercizio`
--

CREATE TABLE `ct_tipi_esercizio` (
  `id_tipo_esercizio` int(11) NOT NULL,
  `tipo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ct_tipi_esercizio`
--

INSERT INTO `ct_tipi_esercizio` (`id_tipo_esercizio`, `tipo`) VALUES
(1, 'Domanda aperta'),
(2, 'Quiz a risposta multipla'),
(3, 'Esercizio da consegnare'),
(4, 'Quiz con risposte multiple e domande aperte');

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_tipo_utente`
--

CREATE TABLE `ct_tipo_utente` (
  `id_tipo_utente` int(11) NOT NULL,
  `tipo_utente` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_tipo_utente`
--

INSERT INTO `ct_tipo_utente` (`id_tipo_utente`, `tipo_utente`) VALUES
(1, 'Professore'),
(2, 'Alunno'),
(3, 'Amministratore');

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_utente_domande`
--

CREATE TABLE `ct_utente_domande` (
  `id_utente_dom` int(11) NOT NULL,
  `fk_utente` int(11) NOT NULL,
  `fk_domanda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_utente_domande`
--

INSERT INTO `ct_utente_domande` (`id_utente_dom`, `fk_utente`, `fk_domanda`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 3, 11),
(4, 1, 12),
(5, 1, 13),
(6, 1, 14),
(7, 1, 15),
(8, 1, 16),
(9, 1, 17),
(10, 1, 18),
(11, 1, 19),
(12, 1, 20),
(13, 1, 21),
(14, 1, 22),
(15, 1, 23),
(16, 1, 24),
(17, 1, 25),
(18, 1, 26),
(19, 1, 27),
(20, 1, 28),
(21, 1, 29),
(22, 1, 30),
(23, 1, 31),
(25, 1, 36),
(26, 1, 37),
(27, 1, 38),
(28, 1, 39),
(29, 1, 40),
(30, 1, 41),
(31, 1, 43),
(32, 1, 44),
(33, 1, 45),
(34, 1, 46),
(35, 1, 47),
(36, 1, 48),
(37, 1, 49),
(38, 1, 50),
(39, 1, 51),
(40, 1, 52),
(41, 1, 53),
(43, 1, 55),
(44, 1, 56),
(45, 1, 57),
(46, 1, 58),
(47, 1, 59),
(48, 1, 60),
(49, 1, 61),
(52, 1, 64),
(53, 1, 65),
(54, 1, 66),
(55, 1, 67),
(56, 1, 68),
(57, 1, 69),
(58, 1, 70),
(59, 1, 71),
(60, 1, 72),
(61, 1, 73),
(62, 1, 74),
(63, 1, 75),
(64, 1, 76),
(65, 1, 77),
(66, 1, 78),
(68, 1, 80),
(69, 1, 81),
(70, 1, 82),
(71, 1, 83),
(72, 1, 84),
(73, 1, 85),
(74, 1, 86),
(75, 1, 87),
(76, 1, 88),
(77, 1, 89),
(78, 1, 90),
(79, 1, 91),
(128, 1, 11),
(129, 1, 92),
(130, 7, 93),
(131, 1, 93),
(132, 7, 36),
(133, 7, 38),
(134, 7, 41),
(135, 1, 0),
(136, 1, 0),
(137, 1, 0),
(138, 1, 0),
(139, 1, 95),
(140, 1, 96),
(141, 1, 97),
(142, 1, 98),
(143, 1, 99),
(144, 1, 100),
(145, 1, 101),
(146, 1, 102),
(147, 1, 103),
(148, 1, 104),
(149, 1, 105),
(150, 1, 106),
(151, 1, 107),
(152, 1, 108),
(153, 1, 109),
(154, 1, 110),
(155, 1, 111),
(156, 1, 112),
(157, 1, 113),
(158, 1, 114),
(159, 1, 115),
(160, 1, 116),
(161, 1, 117),
(162, 1, 118),
(163, 1, 119),
(164, 1, 120),
(165, 1, 121),
(166, 1, 122),
(167, 1, 123),
(168, 1, 124),
(169, 1, 125),
(170, 1, 126),
(171, 1, 127),
(172, 1, 128),
(173, 1, 129),
(174, 1, 130),
(176, 1, 132),
(177, 1, 133),
(178, 1, 134),
(181, 1, 137),
(182, 1, 138),
(183, 1, 139),
(184, 1, 140),
(185, 1, 141),
(186, 1, 142),
(187, 1, 143),
(188, 1, 144),
(190, 1, 146),
(192, 1, 148),
(193, 1, 149),
(194, 1, 150),
(195, 1, 151),
(196, 1, 152),
(197, 1, 153),
(198, 1, 154),
(199, 1, 155),
(200, 1, 156),
(201, 1, 157),
(202, 1, 158),
(203, 1, 159),
(204, 1, 160),
(205, 1, 161),
(206, 1, 162),
(207, 1, 163),
(209, 1, 165),
(210, 1, 166),
(211, 1, 167),
(212, 1, 168),
(213, 1, 169),
(214, 1, 170),
(215, 1, 171),
(216, 1, 172),
(217, 1, 173),
(218, 1, 174),
(219, 1, 175),
(220, 1, 176),
(221, 1, 177),
(222, 1, 178),
(223, 1, 179),
(224, 1, 180),
(225, 1, 181),
(226, 1, 182),
(227, 1, 183),
(228, 1, 184),
(229, 1, 185),
(230, 1, 186),
(231, 1, 187),
(232, 1, 188),
(233, 1, 189),
(234, 1, 190),
(235, 1, 191),
(236, 1, 192),
(237, 1, 193),
(238, 1, 194),
(239, 1, 195),
(240, 1, 196),
(241, 1, 197),
(242, 1, 198),
(244, 1, 200),
(245, 1, 201),
(246, 1, 202),
(247, 1, 203),
(250, 1, 206),
(252, 1, 208),
(254, 1, 210),
(255, 1, 211),
(256, 1, 212),
(257, 1, 213),
(259, 1, 215),
(260, 1, 216),
(261, 1, 217),
(262, 1, 218),
(263, 1, 219),
(264, 1, 220),
(265, 1, 221),
(266, 1, 222),
(268, 1, 224),
(269, 1, 225),
(270, 1, 226),
(271, 1, 227),
(272, 1, 228),
(273, 1, 229),
(274, 1, 230),
(275, 1, 231),
(276, 1, 232),
(277, 1, 233),
(278, 1, 234),
(279, 1, 235),
(280, 1, 236),
(281, 1, 237),
(282, 1, 238),
(284, 1, 240),
(285, 1, 241),
(286, 1, 242),
(287, 1, 243),
(288, 1, 244),
(289, 1, 245),
(290, 1, 246),
(291, 1, 247),
(292, 1, 248),
(293, 1, 249),
(294, 1, 250),
(295, 1, 251),
(296, 1, 252),
(297, 1, 253),
(298, 1, 254),
(299, 1, 255),
(300, 1, 256),
(301, 1, 257),
(302, 1, 258),
(303, 1, 259),
(304, 1, 260),
(305, 1, 261),
(306, 1, 262),
(307, 1, 263),
(308, 1, 264),
(309, 1, 265),
(310, 1, 266),
(311, 1, 267),
(312, 1, 268),
(313, 1, 269),
(314, 1, 270),
(315, 1, 271),
(316, 1, 272),
(317, 1, 273),
(318, 1, 274),
(319, 1, 275),
(320, 1, 276),
(321, 1, 277),
(322, 1, 278),
(323, 1, 279),
(324, 1, 280),
(325, 1, 281),
(326, 1, 282),
(327, 1, 283),
(328, 1, 284),
(330, 1, 286),
(331, 1, 287),
(332, 1, 288),
(333, 1, 289),
(334, 1, 290),
(335, 1, 291),
(336, 1, 292),
(337, 1, 293),
(338, 1, 294),
(339, 1, 295),
(340, 1, 296),
(341, 1, 297),
(342, 1, 298),
(343, 1, 299),
(344, 1, 300),
(345, 1, 301),
(346, 1, 302),
(347, 1, 303),
(348, 1, 304),
(349, 1, 305),
(350, 1, 0),
(351, 1, 306),
(352, 1, 307),
(353, 1, 308),
(354, 1, 309),
(355, 1, 310),
(356, 1, 311),
(357, 1, 312),
(358, 1, 313),
(359, 1, 314),
(360, 1, 315),
(361, 1, 316),
(362, 1, 317),
(363, 1, 318),
(364, 1, 319),
(365, 1, 320),
(366, 1, 321),
(367, 1, 322),
(368, 1, 323),
(369, 1, 324),
(370, 1, 325),
(371, 1, 326),
(372, 1, 327),
(373, 1, 328),
(374, 1, 329),
(375, 1, 330),
(376, 1, 331),
(377, 1, 332),
(378, 1, 333),
(379, 1, 334),
(380, 1, 335),
(381, 1, 336),
(382, 1, 337),
(383, 1, 338),
(384, 1, 339),
(385, 1, 340),
(386, 1, 341),
(387, 1, 342),
(388, 1, 343),
(389, 1, 344),
(390, 1, 345),
(391, 1, 346),
(392, 1, 347),
(393, 1, 348),
(394, 1, 349),
(395, 1, 350),
(396, 1, 351),
(397, 1, 352),
(398, 1, 353),
(399, 1, 354),
(400, 1, 355),
(401, 1, 356),
(403, 1, 358),
(404, 1, 359),
(405, 1, 360),
(406, 1, 361),
(407, 1, 362),
(408, 1, 363),
(409, 1, 364),
(410, 1, 365),
(411, 1, 366),
(412, 1, 367),
(413, 1, 368),
(414, 1, 369),
(416, 1, 371),
(417, 1, 372),
(418, 1, 373),
(419, 1, 374),
(420, 1, 375),
(421, 1, 376),
(422, 1, 377),
(423, 1, 378),
(424, 1, 379),
(425, 1, 380),
(426, 1, 381),
(427, 1, 382),
(428, 1, 383),
(431, 1, 386),
(433, 1, 388),
(435, 1, 390),
(437, 1, 392),
(438, 1, 393),
(440, 1, 395),
(441, 1, 396),
(442, 1, 397),
(443, 1, 398),
(444, 1, 399),
(445, 1, 400),
(446, 1, 401),
(447, 1, 402),
(448, 1, 403),
(449, 1, 404),
(450, 1, 405),
(451, 1, 406),
(452, 1, 407),
(453, 1, 408),
(454, 1, 409),
(455, 1, 410),
(456, 1, 411),
(457, 1, 412),
(458, 1, 413),
(459, 1, 414),
(460, 1, 415),
(461, 1, 416),
(462, 1, 417),
(463, 1, 418),
(464, 1, 419),
(465, 1, 420),
(466, 1, 421),
(467, 1, 422),
(468, 1, 423),
(469, 1, 424),
(470, 1, 425),
(471, 1, 426),
(472, 1, 427),
(473, 1, 428),
(474, 1, 429),
(475, 1, 430),
(476, 1, 431),
(477, 1, 432),
(478, 1, 433),
(479, 1, 434),
(480, 1, 435),
(481, 1, 436),
(482, 1, 437),
(483, 1, 438),
(484, 1, 439),
(485, 1, 440),
(486, 1, 441),
(487, 1, 442),
(488, 1, 443),
(489, 1, 444),
(490, 1, 445),
(491, 1, 446),
(492, 1, 447),
(493, 1, 448),
(494, 1, 449),
(495, 1, 450),
(496, 1, 451),
(497, 1, 452),
(498, 1, 453),
(499, 1, 454),
(500, 1, 455),
(501, 1, 456),
(502, 1, 457),
(503, 1, 458),
(504, 1, 459),
(505, 1, 460),
(506, 1, 461),
(507, 1, 462),
(508, 1, 463),
(509, 1, 464),
(510, 1, 465),
(511, 1, 466),
(512, 1, 467),
(513, 1, 468),
(515, 1, 357);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_utenti`
--

CREATE TABLE `ct_utenti` (
  `id_utente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `codice_conf` varchar(10) NOT NULL,
  `validato` int(11) NOT NULL,
  `fk_tipo_utente` int(11) DEFAULT NULL,
  `ricevi_mail` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_utenti`
--

INSERT INTO `ct_utenti` (`id_utente`, `nome`, `cognome`, `username`, `password`, `email`, `codice_conf`, `validato`, `fk_tipo_utente`, `ricevi_mail`) VALUES
(1, 'Mario', 'Rossi', 'mrossi', '
21232f297a57a5a743894a0e4a801fc3', '', '0', 1, 3, 0),
(3, 'admin', 'admin', 'admin', '
21232f297a57a5a743894a0e4a801fc3', '', 'uMEoH598', 1, 1, 0),
(5, 'Luigi', 'Bianchini', 'lbianchi', '6e6bc4e49dd477ebc98ef4046c067b5f', '1234@gmail.com', '', 1, 2, 0),
(6, 'Carlo', 'Verdi', 'cverdi', 'ece8623b8092f7c07d07c65045fef179', 'cverdi@gmail.com', '', 1, 2, 0),
(7, 'Elisa', 'Gialli', 'egialli', '9b8e501b75e049237e3ccf7e117cd4a3', 'egialli@gmail.com', '', 1, 2, 0),
(8, 'Paolo', 'Bruni', 'pbruni', '7c70f0fdfb4583d89de30dcdaaeef418', 'pbruni@gmail.com', '', 1, 2, 0),
(9, 'Bruno', 'Bruni', 'bbruni', 'a0ae96e597e061a9f1fe412c14e9a605', 'bruno@gmail.com\r\n', '', 1, 2, 0),
(10, 'Maria', 'Aranci', 'maranci', '21605d752b5a312680f75329f8e47d1f', 'maranci@gmail.com\r\n', '', 1, 2, 0),
(11, 'Giacomo', 'Neri', 'gneri', '9184f05acc6835708ce4d0a54ab7ee76', 'gneri@gmail.com\r\n', '', 1, 2, 0),
(12, 'Simona', 'Rosi', 'srosi', 'ac03d82e41cefca924f33f5927273c30', 'srosi@gmail.com\r\n', '', 1, 2, 0),
(13, 'Bruni', 'Bruno', 'bbruno', 'bc43e5c9c03c99addcfdcacfa890f761', 'bbbruni@gmail.com', '', 1, 2, 0),
(14, 'Bruni', 'Bruno', 'bbruno2', 'bc43e5c9c03c99addcfdcacfa890f761', 'ciao@gmail.com', '', 1, 2, 0),
(15, 'Prova', 'Prova', 'pprova', '1e4e888ac66f8dd41e00c5a7ac36a32a9950d271', 'prova@gmail.com', '', 1, 2, 0),
(16, 'Lac', 'Lac', 'llac', 'a9999c3e6a4a11c9b162d892718085c0', 'lac@gmail.com', '', 1, 2, 0),
(17, 'nik', 'nik', 'nnik', '94099683a79dd05ed30650ab6128247a', 'nik@gmail.com', '', 1, 2, 0),
(18, 'Emily', 'a', 'ea', '5b344ac52a0192941b46a8bf252c859c', 'a@b.it', '', 1, 2, 0),
(19, 'Strogar', 's', 'ss', '3691308f2a4c2f6983f2880d32e29c84', 's@b.it', '', 1, 2, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_utenti_classi`
--

CREATE TABLE `ct_utenti_classi` (
  `id_utente_classe` int(11) NOT NULL,
  `fk_utente` int(11) NOT NULL,
  `fk_classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_utenti_classi`
--

INSERT INTO `ct_utenti_classi` (`id_utente_classe`, `fk_utente`, `fk_classe`) VALUES
(2, 1, 4),
(6, 1, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_utenti_materie`
--

CREATE TABLE `ct_utenti_materie` (
  `id_utmat` int(11) NOT NULL,
  `fk_utente` int(11) NOT NULL,
  `fk_materia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_utenti_materie`
--

INSERT INTO `ct_utenti_materie` (`id_utmat`, `fk_utente`, `fk_materia`) VALUES
(2, 2, 1),
(11, 1, 5),
(16, 7, 4),
(17, 1, 6),
(18, 1, 7),
(21, 3, 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `ct_utenti_tipi`
--

CREATE TABLE `ct_utenti_tipi` (
  `id_utenti_tipi` int(11) NOT NULL,
  `fk_utente` int(11) NOT NULL,
  `fk_tipo_utente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ct_utenti_tipi`
--

INSERT INTO `ct_utenti_tipi` (`id_utenti_tipi`, `fk_utente`, `fk_tipo_utente`) VALUES
(1, 1, 1),
(4, 1, 3),
(8, 2, 1),
(9, 3, 1),
(10, 4, 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `ct_alerts`
--
ALTER TABLE `ct_alerts`
  ADD PRIMARY KEY (`id_alert`);

--
-- Indici per le tabelle `ct_anni_scolastici`
--
ALTER TABLE `ct_anni_scolastici`
  ADD PRIMARY KEY (`id_anno`);

--
-- Indici per le tabelle `ct_argomenti`
--
ALTER TABLE `ct_argomenti`
  ADD PRIMARY KEY (`id_argomento`);

--
-- Indici per le tabelle `ct_argomenti_kahoot`
--
ALTER TABLE `ct_argomenti_kahoot`
  ADD PRIMARY KEY (`id_arg_kahoot`);

--
-- Indici per le tabelle `ct_badge`
--
ALTER TABLE `ct_badge`
  ADD PRIMARY KEY (`id_badge`);

--
-- Indici per le tabelle `ct_badge_alunni`
--
ALTER TABLE `ct_badge_alunni`
  ADD PRIMARY KEY (`id_badge_alunno`);

--
-- Indici per le tabelle `ct_classi`
--
ALTER TABLE `ct_classi`
  ADD PRIMARY KEY (`id_classe`);

--
-- Indici per le tabelle `ct_classi_esercizi_attivi`
--
ALTER TABLE `ct_classi_esercizi_attivi`
  ADD PRIMARY KEY (`id_attivi`);

--
-- Indici per le tabelle `ct_classi_quest`
--
ALTER TABLE `ct_classi_quest`
  ADD PRIMARY KEY (`id_classe_quest`);

--
-- Indici per le tabelle `ct_consegne_studenti`
--
ALTER TABLE `ct_consegne_studenti`
  ADD PRIMARY KEY (`id_consegna`);

--
-- Indici per le tabelle `ct_domande`
--
ALTER TABLE `ct_domande`
  ADD PRIMARY KEY (`id_domanda`);

--
-- Indici per le tabelle `ct_esercizi`
--
ALTER TABLE `ct_esercizi`
  ADD PRIMARY KEY (`id_esercizio`);

--
-- Indici per le tabelle `ct_esercizio_domande`
--
ALTER TABLE `ct_esercizio_domande`
  ADD PRIMARY KEY (`id_ese_dom`);

--
-- Indici per le tabelle `ct_esercizio_risposte`
--
ALTER TABLE `ct_esercizio_risposte`
  ADD PRIMARY KEY (`id_ese_risp`);

--
-- Indici per le tabelle `ct_esercizi_quest`
--
ALTER TABLE `ct_esercizi_quest`
  ADD PRIMARY KEY (`id_ese_quest`);

--
-- Indici per le tabelle `ct_griglie_valutazione`
--
ALTER TABLE `ct_griglie_valutazione`
  ADD PRIMARY KEY (`id_griglia`);

--
-- Indici per le tabelle `ct_libri_testo`
--
ALTER TABLE `ct_libri_testo`
  ADD PRIMARY KEY (`id_libro_testo`);

--
-- Indici per le tabelle `ct_materie`
--
ALTER TABLE `ct_materie`
  ADD PRIMARY KEY (`id_materia`);

--
-- Indici per le tabelle `ct_personaggi`
--
ALTER TABLE `ct_personaggi`
  ADD PRIMARY KEY (`id_personaggio`);

--
-- Indici per le tabelle `ct_personaggi_poteri`
--
ALTER TABLE `ct_personaggi_poteri`
  ADD PRIMARY KEY (`id_per_pot`);

--
-- Indici per le tabelle `ct_poteri`
--
ALTER TABLE `ct_poteri`
  ADD PRIMARY KEY (`id_potere`);

--
-- Indici per le tabelle `ct_quest`
--
ALTER TABLE `ct_quest`
  ADD PRIMARY KEY (`id_quest`);

--
-- Indici per le tabelle `ct_quiz`
--
ALTER TABLE `ct_quiz`
  ADD PRIMARY KEY (`id_quiz`);

--
-- Indici per le tabelle `ct_quiz_argomenti`
--
ALTER TABLE `ct_quiz_argomenti`
  ADD PRIMARY KEY (`id_quiz_argomento`);

--
-- Indici per le tabelle `ct_quiz_domande`
--
ALTER TABLE `ct_quiz_domande`
  ADD PRIMARY KEY (`id_quiz_domanda`);

--
-- Indici per le tabelle `ct_quiz_tipo_domande`
--
ALTER TABLE `ct_quiz_tipo_domande`
  ADD PRIMARY KEY (`id_quiz_tipo`);

--
-- Indici per le tabelle `ct_risposte`
--
ALTER TABLE `ct_risposte`
  ADD PRIMARY KEY (`id_risposta`);

--
-- Indici per le tabelle `ct_studenti`
--
ALTER TABLE `ct_studenti`
  ADD PRIMARY KEY (`id_studente`);

--
-- Indici per le tabelle `ct_tipo_utente`
--
ALTER TABLE `ct_tipo_utente`
  ADD PRIMARY KEY (`id_tipo_utente`);

--
-- Indici per le tabelle `ct_utente_domande`
--
ALTER TABLE `ct_utente_domande`
  ADD PRIMARY KEY (`id_utente_dom`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `ct_alerts`
--
ALTER TABLE `ct_alerts`
  MODIFY `id_alert` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT per la tabella `ct_anni_scolastici`
--
ALTER TABLE `ct_anni_scolastici`
  MODIFY `id_anno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `ct_argomenti`
--
ALTER TABLE `ct_argomenti`
  MODIFY `id_argomento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT per la tabella `ct_argomenti_kahoot`
--
ALTER TABLE `ct_argomenti_kahoot`
  MODIFY `id_arg_kahoot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `ct_badge`
--
ALTER TABLE `ct_badge`
  MODIFY `id_badge` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ct_badge_alunni`
--
ALTER TABLE `ct_badge_alunni`
  MODIFY `id_badge_alunno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ct_classi`
--
ALTER TABLE `ct_classi`
  MODIFY `id_classe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `ct_classi_esercizi_attivi`
--
ALTER TABLE `ct_classi_esercizi_attivi`
  MODIFY `id_attivi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `ct_classi_quest`
--
ALTER TABLE `ct_classi_quest`
  MODIFY `id_classe_quest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `ct_consegne_studenti`
--
ALTER TABLE `ct_consegne_studenti`
  MODIFY `id_consegna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT per la tabella `ct_domande`
--
ALTER TABLE `ct_domande`
  MODIFY `id_domanda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=470;

--
-- AUTO_INCREMENT per la tabella `ct_esercizi`
--
ALTER TABLE `ct_esercizi`
  MODIFY `id_esercizio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `ct_esercizio_domande`
--
ALTER TABLE `ct_esercizio_domande`
  MODIFY `id_ese_dom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT per la tabella `ct_esercizio_risposte`
--
ALTER TABLE `ct_esercizio_risposte`
  MODIFY `id_ese_risp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT per la tabella `ct_esercizi_quest`
--
ALTER TABLE `ct_esercizi_quest`
  MODIFY `id_ese_quest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `ct_griglie_valutazione`
--
ALTER TABLE `ct_griglie_valutazione`
  MODIFY `id_griglia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `ct_libri_testo`
--
ALTER TABLE `ct_libri_testo`
  MODIFY `id_libro_testo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `ct_materie`
--
ALTER TABLE `ct_materie`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `ct_personaggi`
--
ALTER TABLE `ct_personaggi`
  MODIFY `id_personaggio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `ct_personaggi_poteri`
--
ALTER TABLE `ct_personaggi_poteri`
  MODIFY `id_per_pot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `ct_poteri`
--
ALTER TABLE `ct_poteri`
  MODIFY `id_potere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `ct_quest`
--
ALTER TABLE `ct_quest`
  MODIFY `id_quest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `ct_quiz`
--
ALTER TABLE `ct_quiz`
  MODIFY `id_quiz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT per la tabella `ct_quiz_argomenti`
--
ALTER TABLE `ct_quiz_argomenti`
  MODIFY `id_quiz_argomento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- AUTO_INCREMENT per la tabella `ct_quiz_domande`
--
ALTER TABLE `ct_quiz_domande`
  MODIFY `id_quiz_domanda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ct_quiz_tipo_domande`
--
ALTER TABLE `ct_quiz_tipo_domande`
  MODIFY `id_quiz_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT per la tabella `ct_risposte`
--
ALTER TABLE `ct_risposte`
  MODIFY `id_risposta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1033;

--
-- AUTO_INCREMENT per la tabella `ct_studenti`
--
ALTER TABLE `ct_studenti`
  MODIFY `id_studente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT per la tabella `ct_tipo_utente`
--
ALTER TABLE `ct_tipo_utente`
  MODIFY `id_tipo_utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `ct_utente_domande`
--
ALTER TABLE `ct_utente_domande`
  MODIFY `id_utente_dom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=517;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
