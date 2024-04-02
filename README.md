# Démo - Image Picker

## Implémentation de base avec la librairie image_picker

Un projet démo qui implémente de manière très basique un Image picker.

- La seule complexité ajoutée ici est le composant ImagePickerModal qui permet d'afficher une modale pour choisir la source de notre image (Gallerie / Camera). Ce composant intéragit avec notre page Home au travers d'un callback (onChoice), qui permet de faire "remonter" le choix de l'utilisateur.
- Notez que les plateformes Windows et Linux ne permettent pas, en l'état, d'utiliser la camera.

> **main.dart** permet de lancer ce projet démo.

## Implémentation en exemple sur pub.dev

Le repo contient également l'exemple proposé sur la page pub.dev de la librairie image_picker. Celui-ci me semble toutefois plus compliqué pour comprendre facilement l'implémentation.

> **pubdev_exemple.dart** permet de lancer ce projet 