# Firebase

## What
Firebase is een door Google ontwikkeld platform dat een verscheidenheid aan tools en services biedt waarmee ontwikkelaars backend tools kunnen gebruiken.
Hier zijn enkele belangrijke functies van Firebase:

- Database: Je kan data opslaan en syncen in real-time. De data wordt opgeslaan als JSON. Updates worden automatisch gesynced met alle clients die verbonden zijn met de database.
- Authenticatie: Een easy to use manier om gebruikers te laten registeren/inloggen. Je kan hiervoor gebruik maken met email/passwoord, telefoonnummers en zelfs providers zoals google, facebook, twitter en github.
- Storage: Je kan de cloud storage gebruiken om afbeeldinge en andere bestanden up te loaden.

Ik zal enkel gebruik maken van Database en Authenticatie in de app.

## Installatie
Om Firebase eenvoudig te kunnen installeren moeten we eerste 2 CLI's (command line interface) installeren.

### Firebase CLI
De Firebase CLI biedt een verscheidenheid aan tools voor het beheren, bekijken en implementeren van Firebase-projecten. Deze CLI is nodig om ons in te loggen via Firebase. 
We runnen hiervoor deze command op onze computer: `npm install -g firebase-tools` (hiervoor kan moet je wel node.js hebben op de computer).
Na het installeren gebruik je `firebase login`. Dit zal een browser window openen om in te loggen.

### FlutterFire CLI
Met deze CLI kunnen we gemakkelijk commands gebruiken om Firebase te activeren op een project.
We runnen eerst dit commmando: `dart pub global activate flutterfire_cli`. Dit installeert de CLI.
Vervolgens gebruiken we `flutterfire configure` op ons project om de Firebase package te installeren. De terminal zal hiervoor verschillende dingen vragen zoals
- Welke project je wilt gebruiken die reeds aanwezig is op je Firebase Console of als je een nieuw project wilt starten.
- Je selecteerd op welke platformen je Firebase zal gebruiken (android, ios, windows,...)
- En als laatste zal je ook app id moeten ingeven. Dit zou je bij het begin van je project bij aanmaak moeten ingevoerd hebben. bv. `com.example.slime_fall`. Voor android kan je dit terugvinden onder `project/android/app/build.gradle`.

Hierna zal de CLI alles van connecties en API keys installeren voor je. Nu kan je de Firebase packages gebruiken in je project.

## Authenticatie
Om het authenticatie element te gebruiken van Firebase moeten we eerste nog een extra package installeren: `flutter pub add firebase_auth`.
We maken eerst een service aan zodat we niet direct in de frontend code bezig zijn met Firebase instanties. 
Eerst moeten we een instantie maken met de verbinding naar ons Firebase project:

![image](https://github.com/user-attachments/assets/3b295205-2759-4256-b9d6-9111b79d4560)

De `DefaultFirebaseOptions` zitten opgeslaan in ons project onder `firebase_options.dart` en bevat ook onze API-keys voor alle platformen:

![image](https://github.com/user-attachments/assets/60845b82-ed6a-4484-892b-b8faa93f556a)

Om de user op te halen gebruiken we de onderstaande methode. We spreken de instance aan met de `currentUser`

![image](https://github.com/user-attachments/assets/ed81dcc0-7c24-47c0-ae99-aa8db78a2b69)

UserEntity is een entity die we zelf aangemaakt hebben:

![image](https://github.com/user-attachments/assets/aaefc55f-57db-44bd-bf91-cd930e683e20)

Om in te loggen en te registeren gebruiken we een methode met parameters email en passwoord. We gebruiken de methodes van de Firebase instantie `signInWithEmailAndPassword(email, pw)` en `createUserWithEmailAndPassword(email, pw)`

![image](https://github.com/user-attachments/assets/9232976d-6d26-4fba-9d93-a3e9112a1ede)

## Firestore Cloud
Om het database element van Firebase te gebruiken moeten we terug een package installeren: `flutter pub add cloud_firestore`.
Hierna maken we terug een service aan voor opslag/wijzigingen en ophaling.

Eerst moeten we een instantie maken met de verbinding naar ons Firebase project:

![image](https://github.com/user-attachments/assets/1c0416a8-df90-4015-a5a5-d8e99b586f0d)

### Data opslaan
We halen de user op via de eerder geschreven authentication service. We spreken de collectie Highscores aan in onze Firestore DB via `firestore.collection(HighscoreConstants.dbTable)`.
Met `.doc(user.Id)` spreken we de tabel aan en met `.set({HighscoreConstants.scoreField: score})` voegen we de highscore toe aan het veld score. Indien er al een score inzit wordt deze overschreven.
We gebruiken ook een bool om de staat van het saven bij te houden. Indien ik dit niet deed post hij soms 2 waarden.

![image](https://github.com/user-attachments/assets/2b37e92e-9360-45f3-9741-a448d5367e61)

### Data ophalen
We halen terug de user op van onze authentication service en spreken terug de highscore collectie aan met onze user.Id tabel. We halen de data op in een DocumentReference via de `.get()` functie.
Daarna sturen we de data terug. 0 als de data uit onze DocumentReference null zou zijn en anders de data die opgeslaan is in onze database.

![image](https://github.com/user-attachments/assets/6c2ea81f-9acb-471a-ba19-a60a48d39651)

