#!/bin/bash

# Récupération automatique du nom d'utilisateur Linux
USERPATH="/home/$USER/Games/star-citizen/drive_c/Program Files/Roberts Space Industries/StarCitizen"

LIVE_DIR="$USERPATH/LIVE"
PTU_DIR="$USERPATH/PTU"
TECH_PREVIEW_DIR="$USERPATH/TECH-PREVIEW"

# URL du fichier global.ini mise à jour (dépôt Scefra)
TRANSLATION_URL="https://raw.githubusercontent.com/SPEED0U/Scefra/main/french_(france)/global.ini"

show_menu() {
    clear
    echo "Menu :"
    echo "1. Traduire la version Live"
    echo "2. Traduire la version PTU"
    echo "3. Traduire la version TECH-PREVIEW"
    echo "4. Récupérer le fichier de traduction dans le dossier du script"
    echo "5. Quitter"
}

convert_to_utf8_bom() {
    local filepath="$1"
    if ! command -v iconv &> /dev/null; then
        echo "Erreur : iconv non installé, impossible de convertir en UTF-8 BOM."
        return 1
    fi
    local tmpfile="${filepath}.tmp"
    # Ajout du BOM EF BB BF hex au début du fichier
    echo -ne '\xEF\xBB\xBF' > "$tmpfile"
    iconv -f UTF-8 -t UTF-8 "$filepath" >> "$tmpfile"
    mv "$tmpfile" "$filepath"
    echo "Conversion UTF-8 avec BOM effectuée sur $filepath"
}

set_language() {
    local target_dir="$1"

    if [ ! -d "$target_dir" ]; then
        echo "Je ne trouve pas la version ciblée ($target_dir). Veuillez vérifier que le dossier existe."
        read -p "Appuyez sur Entrée pour continuer..."
        return
    fi

    echo "Création du fichier user.cfg dans $target_dir"
    echo -e "g_language = french_(france)\ng_languageAudio = english" > "$target_dir/user.cfg"

    local localization_dir="$target_dir/data/Localization/french_(france)"
    if [ ! -d "$localization_dir" ]; then
        echo "Création du dossier de localisation $localization_dir"
        mkdir -p "$localization_dir"
    fi

    echo "Téléchargement du fichier de traduction dans $localization_dir"
    local output_path="$localization_dir/global.ini"

    curl -sSL "$TRANSLATION_URL" -o "$output_path"

    convert_to_utf8_bom "$output_path"

    echo "Installation du dernier fichier de traduction terminée."
    read -p "Appuyez sur Entrée pour continuer..."
}

while true; do
    show_menu
    read -p "Choisissez une option: " choice
    case $choice in
        1)
            set_language "$LIVE_DIR"
            ;;
        2)
            set_language "$PTU_DIR"
            ;;
        3)
            set_language "$TECH_PREVIEW_DIR"
            ;;
        4)
            echo "Téléchargement du fichier de traduction dans le dossier du script"
            output_path="$USERPATH/global.ini"
            curl -sSL "$TRANSLATION_URL" -o "$output_path"
            convert_to_utf8_bom "$output_path"
            echo "Récupération terminée."
            read -p "Appuyez sur Entrée pour continuer..."
            ;;
        5)
            exit 0
            ;;
        *)
            echo "Choix invalide. Veuillez choisir une option valide."
            read -p "Appuyez sur Entrée pour continuer..."
            ;;
    esac
done
