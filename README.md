cloudManagement
===============

Mise en place d'une tâche cron pour l'envoi des alertes par mail.

Pour Ubuntu:

Ouvrir une console et tapez: echo "export EDITOR=nano" >>  ~/.bashrc
Fermer et reouvrir une console.

Dans la console taper: crontab -e
Cette commande va permettre l'édition du fichier qui va exécuter le script d'envoi des mails.

A la fin du fichier ajouter la ligne suivante:

*/5 * * * * wget http://localhost/cloudManagement/index.php?module=sendMail

Cette ligne va ouvrir l'URL toutes les 5 minutes. Vous pouvez modifier les étoiles qui correspondent à l'heure et à la date à laquelle vous shoutaiez exécuter le script.

Une fois la ligne ajoutée, crtl + X pour quitter et la touche O pour sauvegarder.

Plus d'info sur : http://fr.openclassrooms.com/informatique/cours/reprenez-le-controle-a-l-aide-de-linux/executer-un-programme-a-une-heure-differee#r-41154
