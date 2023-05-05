# Symfony Yourbook
Après avoir récupérer le code du projet, exécuter la commande suivante pour installer les sources vendor
```shell
composer install
```
Le domaine doit pointer vers le dossier public. Ensuite l'interface d'administration se trouve dans le dossier /admin/

##  Installation à partir d'une base de données existante
Créer un fichier .env.local avec les informations de connexion bdd.
exemple:
```shell
DATABASE_URL="mysql://root:@127.0.0.1:3306/symfony_yourbook?serverVersion=5.7&charset=utf8mb4"
```
ou
```shell
DATABASE_URL="postgresql://app:!ChangeMe!@127.0.0.1:5432/app?serverVersion=15&charset=utf8"
```

Générer les migrations pour la table admin
```shell
symfony console make:migration
```

Exécuter les migrations
```shell
php bin/console doctrine:migrations:migrate
```

Dans la table admin, ajouter un administrateur avec [ROLE_ADMIN] dans le champs role et le hash du mot de passe.
Pour générer un hash, exécuter :
```shell
symfony console security:hash-password
```

##  Installation sans base de données  existante
Créer une base de données et importer dans base de données symfony_yourbook.sql

Créer un fichier .env.local avec les informations de connexion bdd.
exemple:
```shell
DATABASE_URL="mysql://root:@127.0.0.1:3306/symfony_yourbook?serverVersion=5.7&charset=utf8mb4"
```
Dans ce jeu de données, l'utilisateur admin est :
Email: admin@test.com
Password: studiINTE@
