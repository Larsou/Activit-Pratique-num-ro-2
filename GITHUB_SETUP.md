# Guide : Mettre le projet sur GitHub

## 📋 Étapes pour publier votre projet sur GitHub

### 1. Créer un nouveau repository sur GitHub

1. Allez sur [GitHub.com](https://github.com)
2. Cliquez sur le bouton **"+"** en haut à droite → **"New repository"**
3. Remplissez les informations :
   - **Repository name** : `ecom-ii-bdcc-app` (ou un autre nom)
   - **Description** : "E-Commerce Microservices Application with Spring Cloud"
   - **Visibilité** : Public ou Private (selon votre choix)
   - ⚠️ **NE COCHEZ PAS** "Initialize this repository with a README" (on a déjà un README)
4. Cliquez sur **"Create repository"**

### 2. Initialiser Git dans votre projet (si pas déjà fait)

Ouvrez un terminal dans le dossier du projet et exécutez :

```bash
cd /Users/larbissou/Desktop/enset-projects/ecom-ii-bdcc-app

# Initialiser Git (si pas déjà fait)
git init

# Vérifier le statut
git status
```

### 3. Ajouter tous les fichiers au staging

```bash
# Ajouter tous les fichiers
git add .

# Vérifier ce qui sera commité
git status
```

### 4. Faire le premier commit

```bash
git commit -m "Initial commit: E-Commerce Microservices Application"
```

### 5. Connecter votre projet local à GitHub

GitHub vous donnera une URL après la création du repository. Utilisez-la dans cette commande :

```bash
# Remplacez VOTRE_USERNAME par votre nom d'utilisateur GitHub
git remote add origin https://github.com/VOTRE_USERNAME/ecom-ii-bdcc-app.git

# Vérifier la connexion
git remote -v
```

### 6. Pousser le code sur GitHub

```bash
# Pousser vers la branche main (ou master selon votre repo)
git branch -M main
git push -u origin main
```

Si c'est la première fois, GitHub vous demandera de vous authentifier.

### 7. Ajouter des captures d'écran

1. **Prendre des captures d'écran** :
   - Dashboard Eureka (http://localhost:8761)
   - Réponses des APIs (via Postman, curl, ou navigateur)
   - Résultats des tests
   - Interface des services

2. **Placer les images** :
   - Copiez vos images dans le dossier `docs/images/`
   - Nommez-les de manière descriptive (ex: `eureka-dashboard.png`)

3. **Mettre à jour le README** :
   - Ouvrez `README.md`
   - Remplacez les liens d'images par les noms de vos fichiers
   - Exemple : `![Eureka Dashboard](docs/images/eureka-dashboard.png)`

4. **Commit et push** :
```bash
git add docs/images/
git add README.md
git commit -m "Add screenshots and update README"
git push
```

## 📸 Comment ajouter des images dans le README

### Méthode 1 : Images dans le repository (Recommandé)

1. Placez vos images dans `docs/images/`
2. Utilisez le format Markdown :
```markdown
![Description de l'image](docs/images/nom-image.png)
```

### Méthode 2 : Images hébergées ailleurs

Vous pouvez aussi utiliser des services comme :
- [Imgur](https://imgur.com)
- [GitHub Issues](https://github.com) (glisser-déposer dans une issue)

Puis utilisez l'URL complète :
```markdown
![Description](https://i.imgur.com/votre-image.png)
```

## 🔄 Commandes Git utiles

```bash
# Voir les changements
git status

# Ajouter des fichiers spécifiques
git add nom-du-fichier

# Commit avec message
git commit -m "Votre message"

# Pousser vers GitHub
git push

# Récupérer les changements
git pull

# Voir l'historique
git log
```

## ✅ Checklist avant de publier

- [ ] Vérifier que `.gitignore` ignore les dossiers `target/` et fichiers sensibles
- [ ] Ajouter un README.md complet
- [ ] Ajouter des captures d'écran dans `docs/images/`
- [ ] Tester que tous les services démarrent correctement
- [ ] Vérifier qu'il n'y a pas de mots de passe ou clés API dans le code
- [ ] Faire un commit initial
- [ ] Pousser vers GitHub

## 🎯 Prochaines étapes

Après avoir publié sur GitHub :

1. **Ajouter une description** sur la page GitHub du repository
2. **Ajouter des topics/tags** : `spring-boot`, `microservices`, `eureka`, `java`
3. **Créer des issues** pour documenter les bugs ou améliorations
4. **Ajouter une licence** si nécessaire

---

💡 **Astuce** : Vous pouvez aussi créer un fichier `.github/workflows/ci.yml` pour ajouter l'intégration continue (CI/CD) plus tard !
