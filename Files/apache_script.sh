#!/bin/bash

if [ "$#" -eq 2 ]; then # Verifier s'il y a exactement deux arguments

    if [[ "$1" =~ ^(install|uninstall)$ ]]; then # Verifier si l'argument 1 est valide

        if [ "$1" = "install" ]; then # Verifiez si l'argument est "install"

            echo "Installation d'Apache"
            sudo apt update
            sudo apt install -y apache2
            sudo systemctl stop apache2

            echo "Configuration d'Apache"

            spawn sudo htpasswd -c /etc/apache2/.htpasswd test
            
            expect "New password:" # Expect password prompt
            send "1234\r"          # Send password

            expect "Re-type new password:" # Expect password confirmation prompt
            send "1234\r"                  # Send password again

            # Wait for process to finish
            expect eof
            
            sudo mv 000-default.conf /etc/apache2/sites-enabled/000-default.conf
            sudo mv -v fichiers/* /var/www/html/

            echo "- Installation complete -"
            sudo systemctl start apache2
            exit 0

        elif [ "$1" = "uninstall" ]; then # Verifiez si l'argument est "uninstall"
            echo "Arret d'Apache"
            sudo systemctl stop apache2

            echo "Desinstallation d'Apache"
            sudo apt remove -y apache2

            echo "Suppression des fichiers de configuration"
            sudo rm /etc/apache2/sites-enabled/000-default.conf
            sudo rm -rf /var/www/html
            echo "- Desinstallation complete -"
            exit 0
        fi

    else 
        echo "Erreur: Argument invalide"
        exit 1
    fi
fi

echo "Error: Nombre d'arguments invalide (2 attendus)"
exit 1
