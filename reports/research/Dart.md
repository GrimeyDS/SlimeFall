# Dart

## Variabelen en Collecties

### Types

- `String`
- `int`
- `double`
- `num` (zowel double als int)
- `bool`
- `Object`
- `var`
- `List<int> = [1, 2, 3, 4, 5]`
  - Georderde lijst
  - Indexed
  - Duplicaten mogelijk
  - Gelijkaardig aan een Array in C#
- `Set<int> = {1, 2, 3, 4, 5, 3}`
  - Niet georderd
  - Geen duplicaten
  - Gelijkaarding aan een List in C#
- `Map<string, int> = {'Alice': 25, 'Bob': 30, 'Charlie': 28}`
  - Niet georderd
  - Unique keys met values (Dictionary in C#)
 
### Nullables
Nullable types kan je hetzelfde gebruiken als in C# door een ? te plaatsen bij de types. bv: `int?`

### Keywords
- `late`: je initialiseerd de variable later. Handig voor top-level variables.
  ![image](https://github.com/user-attachments/assets/17a20ef5-87d8-468a-94ee-81fabe079760)
  
- `const`: constante variabel die geinitialiseerd wordt bij compile time. Gebruiken ipv var.
- `final`: constante variable die geinitialiseerd wordt bij runtime. Gebruiken ipv var.

## Control flow statements

### If/Else
Identiek als C# + short version. \
![image](https://github.com/user-attachments/assets/720cbc8d-ec79-46c6-9f27-c42a2a5f4c6f) \
![image](https://github.com/user-attachments/assets/91d0b0fb-cbc3-4000-bf11-6cb1e46c5c5c)

### Switch
Identiek als C#. \
![image](https://github.com/user-attachments/assets/7bf9db08-c6e8-444f-a221-7cc7f72d51b5)

### For
Identiek als C#. \
![image](https://github.com/user-attachments/assets/cac75612-a039-43bb-82e0-4adb4f3455ca)

### While
Identiek als C#.  \
![image](https://github.com/user-attachments/assets/70d50125-7c47-4192-81d3-54a2070d0b5a)
![image](https://github.com/user-attachments/assets/caef031f-e092-4740-89b6-7a06ce84dcd1)

### Assert
Handig voor error handling. \
![image](https://github.com/user-attachments/assets/20a72555-0b9c-44c7-a3b5-2ba69726f313)
![image](https://github.com/user-attachments/assets/5b85d2aa-184a-4b91-a413-5b55ce57f7f4)

## Functies
Identiek als C# methods \
![image](https://github.com/user-attachments/assets/d63e074a-b700-4cb1-a59b-f381b6127fab)

## Classes

### Normale klasse
Terug Identiek als C# met constructor, properties and methods.
![image](https://github.com/user-attachments/assets/ad41b3f1-d360-455c-8bf2-b81cfeadf55b) \
![image](https://github.com/user-attachments/assets/c1d7d3ec-e2f8-4392-a18c-81d1f2e700d5)

### Subklasse
keyword `extends` gebruiken. \
![image](https://github.com/user-attachments/assets/cd19a8fd-80d9-4c73-8de0-22b316707e82)

### Keywords
`sealed` Wordt gebruikt om een klasse aan te maken die die kan gebruikt worden als subklasse buiten z'n library.
`final` Wordt gebruikt om een klasse aan te maken die niet kan gebruiken als subklasse.

### Mixins
Gebruiken om extra gedrag aan een klasse toe te voegen. Je kan dan meerdere mixins toevoegen aan 1 klasse en zijn niet afhankelijk van een super klasse. Je gebruikt hiervoor de keyword `with` \
bv. \
![image](https://github.com/user-attachments/assets/c0781b79-9cf3-419d-a2f7-c980c75bb60d)

### Interfaces
Je maakt een interface aan zoals een klasse met de keyword `interface`. \
![image](https://github.com/user-attachments/assets/06f88084-76ad-4aac-9093-fe4f22c78624)

Daarna gebruik je de keyword `implements` aan de klasse die de interface gebruikt. In dit voorbeeld zie je ook de `@override`, hiermee overschrijf je het gedrag van de superklasse/interface. \
![image](https://github.com/user-attachments/assets/8f9765b4-61b3-474c-814e-3dd5f67f4727)

Klasse met meerdere interface. \
![image](https://github.com/user-attachments/assets/e8291c98-8fcd-4d27-b44a-73f0593a2c68)

`abstract interface` Er kan ook een abstracte interface aangemaakt worden met de keywords

### Enums
Standaard Enum zoals in C#. \
![image](https://github.com/user-attachments/assets/ece0225d-6926-44b9-a29d-54c4b6298540)

Uitgebreide Enum met constructor en properties. \
![image](https://github.com/user-attachments/assets/86ff1d03-0cd0-4c52-8341-5a7d81e0eb7a) \
![image](https://github.com/user-attachments/assets/b2ae3fa7-ec39-448a-86b1-8e0c41b59db9)

## Async
Ipv `Task` gebruik je `Future`. Keyword `async` gebruiken achteraan de functie. `await` keyword wordt zoals in c# gebruikt. \
![image](https://github.com/user-attachments/assets/3112faa3-39cf-44f3-bf92-37628429fe87)

## Imports
Imports worden gebruikt om API of andere klassen in je library te gebruiken: \
![image](https://github.com/user-attachments/assets/28056456-6842-4032-bc2b-d66c1ea2571a)

## Exceptions en Comment
`throw` keyword gebruiken zoals in C# + `StateError` ipv Exception. \
![image](https://github.com/user-attachments/assets/b481496b-5f67-45f2-927d-70d3ccbf7c71)

`// This is a comment` voor een comment te plaatsen in de code.

## Naming Conventions

- folder: lowercase
- files: lowercase + underscore met meerdere woorden. bv: `slime_fall_game.dart`
- classes: UpperCamelCase. bv: `class SlimeFallGame`
- variabelen/properties: lowerCamelCase. bv `bool hasFallDamage`
