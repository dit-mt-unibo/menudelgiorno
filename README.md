# Menu del giorno

## Descrizione del progetto

Il Dipartimento di Interpretazione e Traduzione dell'Università di Bologna, sede di Forlì, ha in mente questo progetto da realizzare in collaborazione con ricercatori, dottorandi, e collaborazioni con altri istituti.

Il problema da risolvere è: fornire una traduzione rapida del "menù del giorno" di ristoranti, in varie lingue richieste dal ristoratore. 

Nei piccoli ristoranti di ogni città, soprattutto quelli specializzati in cucina locale, ci sono piatti del giorno che sono difficili da spiegare e comprendere per chi non parla italiano. A volte il menu intero è scritto su una lavagna, a volte semplicemente recitato a voce dal cameriere.

Questo progetto connette i creativi della cucina con i creativi della parola, tramite i creativi del codice.

## Architettura del software

L'architettura software del progetto è composta da un client, situato nella cartella **menu_flutter**, ed un server, situato nella cartella **laravel_api**. Il client è un'applicazione mobile mentre il server offre il servizio web per ottenere i dati tramite delle chiamate **API di tipo HTTP REST** a dei specifici endpoints.

Il client è realizzato usando il linguaggio **Dart** ed il framework **Flutter**.

Per poter avviare il client è necessario installare le librerie di Flutter per il proprio sistema operativo dal sito della documentazione ufficiale. L'installazione di Flutter si occuperà automaticamente di provvedere anche tutti gli strumenti necessari per il supporto al linguaggio Dart.

Allo scopo di riprodurre un'architettura lato server realistica, è stato scelto di adottare uno stack di tipo **LAMP** (GNU/Linux, Apache, MySQL, PHP).

Più precisamente sono stati utilizzati dei pacchetti all-in-one per Windows denominati **XAMPP** e/o **WAMP** per una più semplice installazione e configurazione.

Una volta pronta e attiva l'architettura scelta, l'applicazione ospitata è poi stata realizzata in **Laravel**, un framework per sviluppare applicazioni web costruito con il linguaggio **PHP**, nello specifico la sua versione **8.x**.

## Requisiti softwares

### 1. Editor di testo

Lo sviluppo è stato condotto utilizzando l'editor di testo **Visual Studio Code**.

https://code.visualstudio.com/

### 2. Android Studio

Scaricare il software dal sito ufficiale.

https://developer.android.com/studio

Aprire Android Studio e navigare al pannello *Virtual Device Manager* e creare un nuovo emulatore Android (Android Virtual Device, o AVD).

Per lo sviluppo del progetto è stato utilizzato un device con le seguenti caratteristiche:

*Pixel 3 API 30*  
*5.46 1080x2160 xxhdpi*  
*Android 11.0 x86*

Una volta creato, apparirà nella lista dei dispositivi virtuali.

### 3. Flutter e Dart

Scaricare il software development kit di Flutter dal sito ufficiale.

https://docs.flutter.dev/get-started/install

Seguire le istruzioni di installazione riportate nella documentazione, prestando particolare attenzione ai paragrafi *Update your path*, *Install Android Studio*, *Set up the Android emulator*, *Agree to Android Licenses* e *Additional Windows requirements*.

In condizione ideale, lanciando il comando *flutter doctor* si dovrebbero ottenere tutte le voci spuntate di verde. In caso negativo, rivedere la documentazione ufficiale dell'installazione per risolvere gli eventuali problemi.

### 4. Piattaforma XAMPP

Scaricare il bundle XAMPP adatto al proprio sistema operativo dal sito ufficiale del progetto.

https://www.apachefriends.org/it/index.html

**NON** deve essere scaricata l'ultima edizione ma nello specifico la seguente versione:

*7.4.29 / PHP 7.4.29*

Il software deve essere installato in una cartella che **non** richiede privilegi di amministrazione, come per esempio la root del disco **C:\\** oppure la directory principale dell'utente come **C:\Utenti\NOME_UTENTE\\**.

Una volta installato il software, se utenti Windows, assicurarsi che l'eseguibile venga sempre avviato in modalità *Amministratore*. Per fare questo, fare *click destro* sull'icona del software e vederne le *Proprietà*. Navigare al tab *Compatibilità* e assicurarsi di avere la spunta sull'opzione *Esegui questo programma come amministratore*.

### 5. PHP

Terminata l'installazione della piattaforma XAMPP, localizzare la sua cartella d'installazione.

Una volta trovata, localizzare poi la directory d'installazione del linguaggio PHP (solitamente nel percorso *..\xampp\php*).

Copiare il percorso a questa cartella nella variabile d'ambiente utente *PATH*.

Se tutto è andato a buon fine, lanciando il comando *php --version* dalla riga di comando, si otterrà la versione corrente installata del linguaggio PHP. Un altro modo per validare questo step è lanciare il comando *where php.exe*, ritornerà il percorso d'installazione di PHP all'interno della cartella di XAMPP.

### 6. Composer

Per poter gestire un'applicazione Laravel è indispensabile avere a disposizione il gestore pacchetti di PHP: **Composer**.

Scaricare il software dal sito ufficiale.

https://getcomposer.org/

È presente un eseguibile Windows per rendere l'installazione più semplice ed aggiungere in automatico l'eseguibile alla variabile d'ambiente *PATH*, procedimento altrimenti manuale per coloro che decideranno di installarlo a mano.

Ad installazione completata, lanciando il comando *composer --version*, si otterrà la versione corrente di Composer.

### 7. Postman

Scaricare il software dal sito ufficiale.

https://www.postman.com/

### 8. Installazione NodeJS

Scaricare il runtime di **NodeJS** dal sito ufficiale del progetto, preferibilmente l'edizione LTS.

https://nodejs.org/it/

Al termine dell'installazione, lanciare i comandi *node --version* e *npm --version*, per testare l'installazione e verificare le edizioni dei softwares.

## Client

### 1. Configurazione Visual Studio Code

Seguire questa documentazione ufficiale per installare le relative estensioni per lo sviluppo con Dart e Flutter.

https://docs.flutter.dev/get-started/editor?tab=vscode

Installare l'estensione **Flutter**.

https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter

Riavviare Visual Studio Code.

### 2. Dipendenze di progetto

Aprire il progetto in Visual Studio Code e aprire la directory **menu_flutter**.

Aprire la command palette di Visual Studio Code con **CTRL + Shift + P** e selezionare il comando *Pub: Get Packages* per utilizzare il gestori di pacchetti Pub di Flutter e installare le dipendenze del progetto. In alternativa, aprire il terminale con **CTRL + ò** e lanciare il comando *flutter pub get packages* dalla riga di comando.

## Server

### 1. Configurazione Visual Studio Code

Installare l'estensione **Laravel Extension Pack**.

https://marketplace.visualstudio.com/items?itemName=onecentlin.laravel-extension-pack

Riavviare Visual Studio Code.

### 2. Dipendenze di progetto

Aprire il progetto in Visual Studio Code e aprire la directory **laravel_api**.

Aprire un nuovo Terminale e digitare i seguenti comandi uno dopo l'altro per scaricare i pacchetti necessari ad avviare l'applicazione.

**composer install**, per installare tutte le dipendenze di PHP.  
**npm install**, per installare tutte le dipendenze di JavaScript.  
**npm run dev**, per effettuare il processo di build dei bundles di webpack per HTML, CSS e JavaScript.

### 3. Configurazione ambiente

Localizzare il file **.env.example** e farne una copia.

Rinominarlo in **.env**.

Aprire il file e cercare la voce *DB_DATABASE=* e valorizzarla con il nome **menudelgiorno**.

Cercare le voci *DB_USERNAME=* e *DB_PASSWORD=* e valorizzarle con i nomi forniti dalla piattaforma LAMP installata in precedenza.

Di default, le credenziali d'accesso fornite da XAMPP sono:

*DB_USERNAME=root* (root)
*DB_PASSWORD=* (stringa vuota)

In generale, le credenziali sono salvate nei file di testo di configurazione di MySQL.
Solitamente sono salvati nella directory *mysql* della directory della piattaforma LAMP e sono in formato *.ini*.

Da Terminale, e dalla root della directory del progetto, lanciare il comando *php artisan key:generate* per valorizzare la voce *APP_KEY=* del file .env.

### 4. Creazione Database

Aprire il pannello di controllo dei databases MySQL fornito dalla piattaforma LAMP installata in precedenza.

In genere è un'applicazione web denominata **phpmyadmin**.

Creare un nuovo database **menudelgiorno** con codifica dei caratteri **utf8mb4_unicode_ci**.

### 5. Costruzione Database

Da Terminale, e dalla root della directory del progetto, lanciare il comando *php artisan migrate* per generare tutte le tabelle e relazioni all'interno del database del progetto.

### 6. Seeding Database

Da Terminale, e dalla root della directory del progetto, lanciare il comando *php artisan db:seed* per popolare tutte le tabelle con dati di mockup all'interno del database del progetto.

## Servizi web

### 1. Importazione dati

Aprire l'applicazione Postman.

Selezionare *File* e poi *Import*.

Importare, uno ad uno, tutti i file con estensione .json presenti nella cartella **postman**.

## Avvio ed esecuzione

### 1. Avvio Server

Assicurarsi di aver avviata e funzionante la piattaforma **XAMPP**, con i servizi **Apache** e **MySQL** correttamente attive.

Aprire il progetto in Visual Studio Code e aprire la directory **laravel_api**.

Da Terminale, e dalla root della directory del progetto, lanciare il comando *php artisan serve* per avviare il server locale che rimarrà in attesa delle chiamate del client.

### 2. Avvio Emulatore

Aprire Android Studio e navigare al pannello *Virtual Device Manager* e avviare l'emulatore virtuale.

Avviarlo premendo il tasto *Play* (freccia verde) ed attendere il boot del dispositivo fino alla sua schermata di home.

### 3. Avvio Client

Aprire il progetto in Visual Studio Code e aprire la directory **menu_flutter**.

Assicurarsi che nella barra di stato di Visual Studio Code, in basso a destra, compaia il nome del device virtuale avviato dal processo di Android Studio, ad esempio *Pixel 3 API 30 (android-x86 emulator)*. In questo modo la compilazione di Flutter è correttamente direzionata verso l'emulatore virtuale.

Aprire la directory **lib** e poi il file **main.dart**.

Navigare al comando *Run* e selezionare l'opzione *Run Without Debugging*.
In alternativa, cliccare sull'icona *Play* (freccia) in alto a destra e selezionare l'opzione *Run Without Debugging*.
In alternativa, da riga di comando, lanciare il comando *flutter run*.

Alla comparsa della notifica di richiesta di installazione e di utilizzo dell'estensione Dart DevTools, selezionare l'opzione *Not Now*.

Le credenziali di accesso si trovano nella tabella **users** del database e **le password sono uguali agli user**.