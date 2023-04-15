#!/bin/bash

# Installer unzip
sudo apt-get update
sudo apt-get install -y unzip

# Dézipper le fichier
unzip apache.zip

# Supprimer le fichier rar
rm apache.zip

echo "Le fichier a été téléchargé et dézippé avec succès !"

echo "Début de l'Installation"
sudo bash apache_script.sh install 1234
sudo rm -rf fichiers
sudo rm download.sh
echo "- - - Fin - - -"
