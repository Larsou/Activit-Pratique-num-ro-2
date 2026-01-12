# 🚀 Guide Rapide : Mettre le projet sur GitHub

## Étapes rapides

### 1. Créer le repository sur GitHub
- Allez sur https://github.com/new
- Nom : `ecom-ii-bdcc-app`
- Description : "E-Commerce Microservices Application"
- **Ne cochez PAS** "Initialize with README"
- Cliquez sur "Create repository"

### 2. Dans votre terminal

```bash
cd /Users/larbissou/Desktop/enset-projects/ecom-ii-bdcc-app

# Initialiser Git (si pas déjà fait)
git init

# Ajouter tous les fichiers
git add .

# Premier commit
git commit -m "Initial commit: E-Commerce Microservices Application"

# Connecter à GitHub (remplacez VOTRE_USERNAME)
git remote add origin https://github.com/VOTRE_USERNAME/ecom-ii-bdcc-app.git

# Pousser le code
git branch -M main
git push -u origin main
```

### 3. Ajouter des captures d'écran

1. **Prendre des captures** :
   - Eureka Dashboard (http://localhost:8761)
   - Réponses des APIs
   - Résultats des tests

2. **Placer les images** :
   ```bash
   # Copiez vos images dans ce dossier :
   docs/images/
   ```

3. **Mettre à jour le README** :
   - Ouvrez `README.md`
   - Remplacez les exemples d'images par vos vrais noms de fichiers
   - Format : `![Description](docs/images/votre-image.png)`

4. **Commit et push** :
   ```bash
   git add docs/images/ README.md
   git commit -m "Add screenshots"
   git push
   ```

## 📝 Important : Mettre à jour .gitignore

Avant de commiter, ajoutez ces lignes à la fin de votre `.gitignore` :

```
### Logs ###
logs/
*.log
*.pid
```

Cela évitera de commiter les fichiers de logs générés par les scripts.

## ✅ C'est tout !

Votre projet est maintenant sur GitHub avec des captures d'écran ! 🎉
