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

## Delta Time
In Flame kom je vaak de variabele/parameter `dt` tegen. Dit staat voor Delta Time en vertegenwoordigd het tijdsverschil in seconden tussen 2 frames in de de game loop.
Het zorgt ervoor dat de game logica hetzelfde blijft onder verschillende fps. Je kan dan deze variabele ook gebruiken om calculaties te runnen op objecten voor een smooth experience, bv. de manier waarop het platform omhoog scrolled in mijn game. \
![image](https://github.com/user-attachments/assets/29732fdb-2a94-476f-b705-514c3ab13437)

Als de game op 60 FPS draait dan zal de `dt = 0.016` zijn ( 1 seconde / 60 frames ) we bewegen dan de platform groep met een waarde die in de configuratie file staat. Op het moment van schrijven staat deze op 80.
`80 * 0.016 = 1.28` => de platformen bewegen op 1.28 units per frame naar boven omdat we de Y positie verminderen.

## Components
De Flame engine werkt met een component systeem (FCS: Flame Component System) en inherit van de Component klasse.

### PositionComponent
De voornaamste component is een `PositionComponent`. Deze wordt gebruikt om objecten op een scherm te tonen. Je kan hierbij bv. de `position`, `size`, `scale`, `angle`, `anchor` van definieren.
Je kan deze component ook gebruiken om childern `PositionComponent` aan toe te voegen (groeperen). Gebruikt voor platforms en spikes in het project (`spike_group.md`)
  - `position`: is een `Vector2` type die 2 waarden bevat (x en y).
  - `size`: De grote aanpassen en is niet in relatie met de parent.
  - `angle`: De rotatie aanpassen.

Voorbeelden van subklasses van een `PositionComponents` zijn `SpriteComponent`, `SpriteAnimationComponent`, `ParallaxComponent`.

### SpriteComponent
Het voornaamste `PositionComponent` zal een `SpriteComponent` zijn. Hierbij laad je gewoon een afbeelding in als `Sprite`.

![image](https://github.com/user-attachments/assets/832ef0da-893c-4b04-ae93-688e99e54044)

### ParallaxComponent
Is een component dat je kan gebruiken om images te doen scrollen. Dit is enorm handing om achtergronden te maken die het effect geven dat het spelwereld beweegd.
In dit voorbeeld die ik gebruik, bouw je een parallax op. 
- Dit bestaat uit de images (je kan hier meerdere images aan toevoegen en zo je eigen backgrounds aanmaken). In dit geval werken ik met 1 background image.
- Een `repeat`: dit is niet nodig als je op de x-axis scrolled maar wel op de y-axis.
- Een `baseVelocity`: Hier stel je de basis snelheid in alsook op welke axis het scrolled (x,y).

![image](https://github.com/user-attachments/assets/8d7d746f-e127-4949-97bf-3d166aea0fd9)

### ShapeComponents
Een heel simpel voorbeeld van een component is een `ShapeComponent`. Hierbij teken je een rechthoek, cirkel of polygon op het scherm die je kan beinvloeden. In mijn game gebruiken we dit voor een hitbox te implementeren aan de bovenkant van het beeldscherm.

![image](https://github.com/user-attachments/assets/47e935bd-e43a-49ea-856b-d9ce97b31eea)

### onLoad
In de bovenstaande code zag je dat we vaak de `onLoad` methode overriden. Dit gebruiken we om zo het gedrag en uitzicht te bepalen van de objecten die we aanmaken.

### HasGameRef mixin
Je zal ook zien dat we de mixin `HasGameRef<SlimeGame>` gebruiken. Dit is een helper die ons toelaat om een referentie te krijgen van onze game instance. Deze kunnen we dan bv. gebruiken om de grote van het beeldscherm te raadplegen. `HasGameRef<T>` Waarvan T de game klasse is.

### Vector2
`Vector2` is een type die we gebruiken om een x en y waarde aan mee te geven van het type double. Je hebt ook `Vector3` om een extra z waarde aan mee te geven. Dit laatste gebruiken we niet.

## Collision detection en hitboxes
In het eerste geval moeten we hitboxes toevoegen aan onze objecten. Dit kan je simpelweg met een object toe te voegen aan je reeds aangemakte objecten in de `onLoad` method.
Voor de speler is dit een cirkel hitbox: \
![image](https://github.com/user-attachments/assets/6fd2b0cc-a524-4e3f-b12e-57dbeac6262b)

Voor de platforms en spikes zijn dit rechthoekige hitboxes: \
![image](https://github.com/user-attachments/assets/d842817c-6cca-4feb-9547-d08e0da411b0)

Om collision te detecteren op objecten kan je de mixin `HasCollisionDetection` gebruiken. Deze voegen we toe aan de speler/slime.
Hiermee krijgen we toegang tot event triggers als de speler collided met een object: \
![image](https://github.com/user-attachments/assets/e9d67669-25c5-413a-aab1-b7e9cb90886d)

![image](https://github.com/user-attachments/assets/bf79a35b-7fc8-4891-b30c-60467f271da7)

## Gyro controls
Om gyro controls toe te voegen gebruiken we een nieuwe package genaamd `sensors_plus`. Zoals Flame voegen we dit aan onze pubspec.yaml file. \

![image](https://github.com/user-attachments/assets/479533fe-c172-4fd6-bc3a-7052fc252f5c)

We importen dit onze game klasse: \ 

![image](https://github.com/user-attachments/assets/838a0a6c-5fda-4fee-9ca7-131a7971e098)

We voegen een extra methode toe aan onze klasse die een stream opent en luistert naar de gyro controls van het toestel.
Bij een verandering passen we een variabele aan die we dan kunnen gebruiken in onze update methode om de positie van de speler aan te passen. \

![image](https://github.com/user-attachments/assets/4b2f06af-25ff-4065-b2d6-ee9d424e68f4) 

![image](https://github.com/user-attachments/assets/622d01d7-eb37-446b-8eb1-bdc389627a8d) 

