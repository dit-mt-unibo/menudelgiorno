# Menu del giorno

## Descrizione del progetto

Il Dipartimento di Interpretazione e Traduzione dell'Università di Bologna, sede di Forlì, ha in mente questo progetto da realizzare in collaborazione con ricercatori, dottorandi, e collaborazioni con altri istituti.

Il problema da risolvere è: fornire una traduzione rapida del "menù del giorno" di ristoranti, in varie lingue richieste dal ristoratore. 

Nei piccoli ristoranti di ogni città, soprattutto quelli specializzati in cucina locale, ci sono piatti del giorno che sono difficili da spiegare e comprendere per chi non parla italiano. A volte il menu intero è scritto su una lavagna, a volte semplicemente recitato a voce dal cameriere.

Questo progetto connette i creativi della cucina con i creativi della parola, tramite i creativi del codice.

## Architettura del progetto

L'architettura software del progetto è composta da un client, situato nella cartella **menu_flutter**, ed un server, situato nella cartella **laravel_api**. Il client è un'applicazione mobile mentre il server offre il servizio web per ottenere i dati tramite delle chiamate API di tipo HTTP REST a dei specifici endpoints.

## Editor di testo

Lo sviluppo è stato condotto utilizzando l'editor di testo **Visual Studio Code**.

https://code.visualstudio.com/

## Configurazione del Server

### Installazione PHP

### Installazione Laravel

## Configurazione del servizio web

## Installazione Postman

## Importazione APIs

## Configurazione del Client

### Installazione Flutter e Dart

Il client è realizzato usando il linguaggio **Dart** ed il framework **Flutter**.

Per poter avviare il client è necessario installare le librerie di Flutter per il proprio sistema operativo dal sito della documentazione ufficiale. L'installazione di Flutter si occuperà automaticamente di provvedere anche tutti gli strumenti necessari per il supporto al linguaggio Dart.

https://docs.flutter.dev/get-started/install

Seguire le istruzioni di installazione riportate nella documentazione, prestando particolare attenzione ai paragrafi *Update your path*, *Install Android Studio*, *Set up the Android emulator*, *Agree to Android Licenses* e *Additional Windows requirements*.

In condizione ideale, lanciando il comando *flutter doctor* si dovrebbero ottenere tutte le voci spuntate di verde. In caso negativo, rivedere la documentazione ufficiale dell'installazione per risolvere gli eventuali problemi.

### Configurazione Editor di testo

Seguire questa documentazione ufficiale per installare le relative estensioni per lo sviluppo con Dart e Flutter.

https://docs.flutter.dev/get-started/editor?tab=vscode

Installare l'estensione Flutter.

https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter

Riavviare Visual Studio Code.

### Dipendenze di progetto

Aprire il progetto in Visual Studio Code e aprire la directory **menu_flutter**.

Aprire la command palette di Visual Studio Code con **CTRL + Shift + P** e selezionare il comando *Pub: Get Packages* per utilizzare il gestori di pacchetti Pub di Flutter e installare le dipendenze del progetto. In alternativa, aprire il terminale con **CTRL + ò** e lanciare il comando *flutter pub get packages* dalla riga di comando.

## Avvio ed esecuzione

### Emulatore virtuale

Aprire Android Studio e navigare al pannello *Virtual Device Manager* e creare un nuovo emulatore Android (Android Virtual Device, o AVD).

Per lo sviluppo del progetto è stato utilizzato il seguente device virtuale:

*Pixel 3 API 30*  
*5.46 1080x2160 xxhdpi*  
*Android 11.0 x86*  

Una volta creato e salvato il device nella lista degli emulatori, avviarlo premendo il tasto *Play* (freccia verde) ed attendere il boot del dispositivo fino alla sua schermata di home.

La procedura di creazione è necessaria solo la prima volta, le volte successive è sufficiente avviare semplicemente l'emulatore.

### Avvio Client

Assicurarsi che nella barra di stato di Visual Studio Code, in basso a destra, compaia il nome del device virtuale avviato dal processo di Android Studio, ad esempio *Pixel 3 API 30 (android-x86 emulator)*. In questo modo la compilazione di Flutter è correttamente direzionata verso l'emulatore virtuale.

Aprire la directory **lib** e poi il file **main.dart**.

Navigare al comando *Run* e selezionare l'opzione *Run Without Debugging*.
In alternativa, cliccare sull'icona *Play* (freccia) in alto a destra e selezionare l'opzione *Run Without Debugging*.
In alternativa, da riga di comando, lanciare il comando *flutter run*.

Alla comparsa della notifica di richiesta di installazione e di utilizzo dell'estensione Dart DevTools, selezionare l'opzione *Not now*.