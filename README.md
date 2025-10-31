# Star Citizen French Translation Installer pour Linux

Ce script Bash est une **adaptation** du script PowerShell original de [SPEED0U](https://github.com/SPEED0U). Il permet d’installer ou de mettre à jour la traduction française du jeu Star Citizen sous Linux (Proton/Steam) avec conversion automatique du fichier en UTF-8 BOM.

---

## Fonctionnalités

- Télécharge la dernière version du fichier de traduction depuis le dépôt officiel [SPEED0U/Scefra](https://github.com/SPEED0U/Scefra).
- Installe la traduction dans les versions LIVE, PTU ou TECH-PREVIEW de Star Citizen.
- Convertit automatiquement le fichier en UTF-8 avec BOM, requis pour une bonne prise en compte dans le jeu.
- Interface interactive avec menu de choix.
- Détection automatique du chemin d’installation basé sur le nom d’utilisateur Linux.

---

## Prérequis

- Linux avec bash
- [`curl`](https://curl.se/) installé (utilisé pour télécharger le fichier)
- [`iconv`](https://linux.die.net/man/1/iconv) installé (utilisé pour convertir le fichier en UTF-8 avec BOM)

### Installation des prérequis

- Sur Debian/Ubuntu et dérivés :
```bash
sudo apt update
sudo apt install libc-bin curl
```


(`iconv` est fourni par le paquet `libc-bin`)

- Sur Fedora/RHEL :
```bash
sudo dnf install glibc-common curl
```



- Sur Arch Linux :
```bash
sudo pacman -S glibc curl
```


> **Important :** Si `iconv` n’est pas installé, le script signalera une erreur et ne pourra pas convertir le fichier, ce qui peut entraîner une mauvaise reconnaissance de la traduction dans le jeu.

---

## Installation et utilisation

1. Clonez ou téléchargez ce script.
2. Rendez-le exécutable:
```bash
chmod +x install_fr_linux.sh
```


3. Lancez-le depuis un terminal:
```bash
./install_fr_linux.sh
``` 

4. Suivez les instructions à l’écran pour choisir la version à traduire.

---

## Licence et droits

Ce projet est une adaptation Linux basée sur le travail original de [SPEED0U](https://github.com/SPEED0U) qui fournit la traduction française officielle de Star Citizen.

### Absence de licence explicite

Le dépôt original ne comporte pas de licence open source claire, ce qui signifie que :

- Le code et la traduction sont protégés par droit d’auteur par défaut.
- Toute redistribution ou modification sans autorisation peut être illégale.

### Conditions d’utilisation

- Ce projet est destiné à un usage **personnel et privé**.
- Pour une utilisation publique ou redistribution, il faut obtenir une autorisation explicite de SPEED0U.
- Ce dépôt **mentionne clairement la source** d’origine et précise que le travail est une adaptation.

---

## Remarques

- Le script utilise la variable `$USER` pour détecter l’installation, modifiez-la si nécessaire.
- Vérifiez que `iconv` est installé pour éviter les erreurs de conversion. Si absent, la traduction risque de ne pas fonctionner correctement dans le jeu.
- Pour toute question de licence ou d’autorisation, contactez directement SPEED0U via leur dépôt GitHub.

---

## Remerciements

Merci à SPEED0U et à la communauté Star Citizen pour leur travail sur la traduction française.

