# Slime Fall

## Verantwoording
Voor mijn project zou ik graag een kleine game maken in Dart/Flutter met de game engine Flame voor android. Door de opleiding ben ik enkel maar bezig geweest met statische elementen (bv. Formulieren), om mijn grenzen te verleggen zou ik nu graag eens iets dynamisch en (audio)visueel programmeren. Om het toch innovatief te maken voor de opleiding zou ik dit verwezenlijken in een andere programeertaal.

## Project
Het zou een auto-scroll game zijn waarbij het scherm naar beneden scrollt. De speler is een object/figuur die via gyro controls manoeuvreert. Je kan hierbij naar links/rechts manoeuvreren, maar ook sneller naar beneden of terug naar boven gaan. Obstakels zullen je proberen tegen te houden en het is “game over” als de speler de bovenkant van het scherm aanraakt of de spikes aan de zijkant.
Omdat gyrocontroles  soms moeilijk zijn zou er ook een gesture of knop zijn om te springen/dashen over/door een obstakel die een cooldown heeft gebaseerd op tijd of punten.

![image](https://github.com/user-attachments/assets/d32f0a4c-2c00-4646-9dff-26320acd2d6c)

## Inhoud demo/prototype

### Score
Je score wordt bepaald op tijd die verstreken is. Je kan inloggen via Firebase en je score wordt daar ook bijgehouden.

### Obstakels
De obstakels zullen vrij simpel zijn maar de moeilijkheid zal zitten in de frequentie dat ze opdagen. Hoe verder je zit in het spel, hoe sneller de obstakels komen. Aan de zijkant van de muren zullen er ook spikes aanwezig zijn.

### Controls
Via gyro kan je links/rechts/omhoog/omlaag manoeuvreren. Dashen/springen over een object zou ik graag met een shake beweging willen realiseren. Indien dit niet lukt zal het een knop op het scherm worden. \
- Update: Shaken met al gyrocontrols om te bewegen is geen ideale oplossing. Er kan gedashed worden met een tap op het scherm
- Update: Beweging omhoog en omlaag is niet nodig voor de game flow/functionaliteit. Kan verwezenlijkt door ook de gyro te checken rond de x-axis. Code staat in comment bij de gyro listener [lijn 42](https://github.com/howest-gp-ipr/st-1-a-ee-project-SvenDS91/blob/dev/src/slime_fall/lib/game/slime_fall_game.dart)

### Audio/Visueel
De game bevat sprites.
- Sprites: een achtergrond, speler, obstakels en zijwanden/spikes (deze zullen het effect tonen van beweging).

### Nice to haves
Als ik meer tijd zou hebben zou ik nog het volgende implementeren:
- Sound effects.
- Versnelling game.
-	Menu items om het bovenstaande te gebruiken.
-	Retry knop.
-	Ingewikkeldere obstakels.

## Roadmap / Planning
1.	Research: algemene documentatie van Flutter/Dart/Flame en tutorials
2.	Aanmaken van het project. 
3.	Assets verzamelen (sprites/afbeeldingen en sound effects).
4.	Objecten plaatsen op het scherm
5.	Obstakels random binnen bepaalde regels laten spawnen en naar boven laten bewegen.
6.	Gedrag/Collision van obstakels programmeren.
7.	Gyro controls toevoegen aan de speler en laten bewegen.
8.	Dash/jump implementeren.
9.	Score implementeren.
10. Login via Firebase.
11. Scrore bijhouden in Firestore.
13.	Grondig testen.
14.	De nice to have's in volgorde:
    - Menu items.
    - Versnelling via tijdsinterval/score implementeren.
    - Retry knop implementeren.
    - Sound effects implementeren.
    - Ingewikkeldere obstakels.

## Extra info
- Login: Je kan altijd een gebruiker aanmaken en testen of inloggen via test@test.com, pw: Test12345
- Database configuraties:
![image](https://github.com/user-attachments/assets/5a85decb-659a-4fe1-b861-7847a992806f)
- Code openen in visual studio code. Je zal wel flutter moeten [installeren](https://docs.flutter.dev/get-started/install/windows/mobile).

## Bronnenlijst
- De officiele documentatie van [Flame](https://docs.flame-engine.org/latest/).
- De officiele documentatie van [Flame Audio](https://pub.dev/packages/flame_audio/example).
- De officiele documentatie van [Flutter](https://docs.flutter.dev/).
- De officiele documentatie van [Dart](https://dart.dev/guides).
- De officiele documentatie van [Firestore](https://firebase.google.com/docs/firestore).
- De officiele documentatie van [getIt](https://pub.dev/packages/get_it/example)
- Documentatie van [sensors_plus](https://pub.dev/packages/sensors_plus).
- Dart [Conventions](https://dart.dev/effective-dart/style).
- Dart file name [Conventions](https://dart.dev/tools/linter-rules/file_names).
- Flutter tutorial op [youtube](https://www.youtube.com/watch?v=VPvVD8t02U8&t=32919s).
- ChatGPT voor bepaalde berekeningen.
