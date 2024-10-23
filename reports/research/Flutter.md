# Flutter

Flutter is een open-source UI-softwareontwikkelingstoolkit gemaakt door Google. Hiermee kunnen ontwikkelaars multi-platform applicaties maken in 1 code base(Denk Maui). Het maakt gebruik van de Dart-programmeertaal.

## Widgets
Alles in Flutter is een widget en zijn de building blocks van het interface. Deze widgets komen in 2 categorien: `Statless` en `Stateful`.

### StatelessWidget
Deze widget is immutable, éénmaal aangemaakt kan het niet meer aangepast worden. Deze zijn handig voor UI elementen die niet veranderen of niet reageren op de gebruikers input. Voorbeelden zijn: `Text`, `TextField`, `ElevatedButton`, ...

### StatefulWidget
Deze widget kan dan wel aangepast worden over zijn lifetime en is dus dynamisch. Deze widget heeft ook altijd een `State` object waarmee je de state altijd kan veranderen met de `setState()` methode. In het project is `app_state.dart` een mooie voorbeeld. Hier wordt de state van de app aangepast naargelang de waarde van de bools.

## MaterialApp
Is een handig widget die het toelaat om meerdere widgets te wrappen. Een paar interessante properties:
- `home`: is de default route van de app.
- `routes`: Hier kan je verschillende widgets aan koppelen. Je kan dan navigeren via verschillende widgets met de `Navigator.pushNamed()` methode.
- `theme`: Je kan hiermee de look veranderen van heel de app zoals `brightness`, `primaryColor`

