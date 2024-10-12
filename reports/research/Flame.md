### Flame

## Flame toevoegen aan project
Doe je met `flutter pub add flame` in de terminal van visual studio code binnen het project. Dit zal een dependency toevoegen in het `pubspec.yaml` bestand.

## Assets map structuur en toevoegen van assets
![image](https://github.com/user-attachments/assets/0dcea873-34e0-424b-b729-b5ba84681a7c)

Deze moeten ook vernoemd worden het `pubspec.yaml` bestand. \
![image](https://github.com/user-attachments/assets/31b67a26-3bdd-4d71-85c6-f05dc8eb3329)

## GameWidget
Een GameWidget is een Flutter Widget die je gebruikt om een Game instance te implementeren in de Flutter widget tree.
Dit doe je in de main.dart bestand zo:

![image](https://github.com/user-attachments/assets/3e95adee-0c17-499d-93af-7abf7df89b53)

SlimeFallGame is een klasse in de class library onder de game folder.

## Components
De Flame engine werkt met een component systeem (FCS: Flame Component System) en inherit van de Component klasse.
De voornaamste component is een `PositionComponents`. Deze wordt gebruikt om objecten op een scherm te tonen. Je kan hierbij de `position`, `size`, `scale`, `angle`, `anchor` van definieren.
Je kan deze component ook gebruiken om childern `PositionComponents` aan toe te voegen (groeperen).
  - `position`: is een `Vector2` type die 2 waarden bevat (x en y).
  - `size`: De grote aanpassen en is niet in relatie met de parent.
  - `angle`: De rotatie aanpassen.

Voorbeelden van een `PositionComponents` zijn `SpriteComponent` en `SpriteAnimationComponent`.
