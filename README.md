# E-Commerce Microservices Application

Application e-commerce basée sur une architecture microservices utilisant Spring Cloud, Eureka, et Spring Boot.

## 📋 Table des matières

- [Description](#description)
- [Architecture](#architecture)
- [Technologies utilisées](#technologies-utilisées)
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Démarrage des services](#démarrage-des-services)
- [URLs des services](#urls-des-services)
- [Captures d'écran](#captures-décran)
- [Structure du projet](#structure-du-projet)

## 📝 Description

Cette application est une plateforme e-commerce construite avec une architecture microservices. Elle comprend plusieurs services indépendants qui communiquent entre eux via des API REST et utilisent la découverte de services (Eureka) pour la communication inter-services.

## 🏗️ Architecture

L'application est composée de 6 microservices :

1. **Config Service** (port 9999) - Service de configuration centralisée
2. **Discovery Service** (port 8761) - Serveur Eureka pour la découverte de services
3. **Gateway Service** (port 8888) - API Gateway pour router les requêtes
4. **Customer Service** (port 8081) - Gestion des clients
5. **Inventory Service** (port 8082) - Gestion des produits/inventaire
6. **Billing Service** (port 8083) - Gestion de la facturation

### Diagramme d'architecture

```
┌─────────────────┐
│  Gateway (8888) │
└────────┬────────┘
         │
    ┌────┴────┐
    │ Eureka  │
    │  (8761) │
    └────┬────┘
         │
    ┌────┴──────────────────────────────┐
    │                                   │
┌───▼────┐  ┌──────────┐  ┌──────────┐ │
│Customer│  │Inventory │  │ Billing  │ │
│ (8081) │  │  (8082)  │  │  (8083)  │ │
└────────┘  └──────────┘  └──────────┘ │
                                       │
                              ┌────────▼────┐
                              │   Config    │
                              │   (9999)    │
                              └─────────────┘
```

## 🛠️ Technologies utilisées

- **Java 21**
- **Spring Boot 3.5.7**
- **Spring Cloud**
- **Spring Cloud Netflix Eureka** - Service Discovery
- **Spring Cloud Gateway** - API Gateway
- **Spring Cloud Config** - Configuration centralisée
- **Spring Cloud OpenFeign** - Client HTTP déclaratif
- **Spring Data JPA** - Persistence des données
- **H2 Database** - Base de données en mémoire
- **Maven** - Gestion des dépendances

## 📦 Prérequis

- Java 21 ou supérieur
- Maven 3.6+
- Git

## 🚀 Installation

1. Clonez le repository :
```bash
git clone https://github.com/VOTRE_USERNAME/ecom-ii-bdcc-app.git
cd ecom-ii-bdcc-app
```

2. Compilez le projet :
```bash
mvn clean install
```

## ▶️ Démarrage des services

### Ordre de démarrage (IMPORTANT)

Les services doivent être démarrés dans l'ordre suivant :

1. **Config Service** (port 9999)
2. **Discovery Service** (port 8761)
3. **Gateway Service** (port 8888)
4. **Customer Service** (port 8081)
5. **Inventory Service** (port 8082)
6. **Billing Service** (port 8083)

### Méthode 1 : Script automatique

Utilisez le script fourni pour démarrer tous les services :

```bash
chmod +x start-services.sh
./start-services.sh
```

Pour arrêter tous les services :

```bash
./stop-services.sh
```

### Méthode 2 : Démarrage manuel

Dans des terminaux séparés, exécutez :

```bash
# Terminal 1
cd config-service && mvn spring-boot:run

# Terminal 2 (attendre ~10 secondes)
cd discovery-service && mvn spring-boot:run

# Terminal 3 (attendre ~10 secondes)
cd gateway-service && mvn spring-boot:run

# Terminal 4 (attendre ~10 secondes)
cd customer-service && mvn spring-boot:run

# Terminal 5 (attendre ~10 secondes)
cd inventory-service && mvn spring-boot:run

# Terminal 6 (attendre ~10 secondes)
cd billing-service && mvn spring-boot:run
```

⚠️ **Important** : Attendez 10-15 secondes entre chaque démarrage pour permettre aux services de s'initialiser complètement.

## 🔗 URLs des services

Une fois tous les services démarrés, vous pouvez accéder aux interfaces suivantes :

| Service | URL | Description |
|---------|-----|-------------|
| **Config Service** | http://localhost:9999 | Service de configuration |
| **Discovery Service (Eureka)** | http://localhost:8761 | Dashboard Eureka |
| **Gateway Service** | http://localhost:8888 | API Gateway |
| **Customer Service** | http://localhost:8081 | API des clients |
| **Inventory Service** | http://localhost:8082 | API des produits |
| **Billing Service** | http://localhost:8083 | API de facturation |

### Endpoints API

#### Customer Service
- `GET /api/customers` - Liste tous les clients
- `GET /api/customers/{id}` - Détails d'un client

#### Inventory Service
- `GET /api/products` - Liste tous les produits
- `GET /api/products/{id}` - Détails d'un produit

#### Billing Service
- `GET /api/bills` - Liste toutes les factures
- `GET /api/bills/{id}` - Détails d'une facture

## 📸 Captures d'écran

### Dashboard Eureka
![Eureka Dashboard](docs/images/eureka-dashboard.png)
*Interface Eureka montrant tous les services enregistrés*

### API Gateway
![Gateway](docs/images/gateway.png)
*API Gateway en action*

### Customer Service
![Customer Service](docs/images/customer-service.png)
*Interface du service client*

### Inventory Service
![Inventory Service](docs/images/inventory-service.png)
*Interface du service d'inventaire*

### Billing Service
![Billing Service](docs/images/billing-service.png)
*Interface du service de facturation*

### Résultats des tests
![Test Results](docs/images/test-results.png)
*Résultats des tests d'intégration*

> 💡 **Note** : Pour ajouter vos propres captures d'écran :
> 1. Créez un dossier `docs/images/` à la racine du projet
> 2. Ajoutez vos images (format PNG ou JPG recommandé)
> 3. Mettez à jour les liens dans cette section avec le nom de vos fichiers

## 📁 Structure du projet

```
ecom-ii-bdcc-app/
├── config-service/          # Service de configuration
├── discovery-service/       # Service de découverte (Eureka)
├── gateway-service/          # API Gateway
├── customer-service/         # Service client
├── inventory-service/        # Service inventaire
├── billing-service/          # Service facturation
├── config-repo/              # Repository de configuration
├── start-services.sh         # Script de démarrage
├── stop-services.sh          # Script d'arrêt
└── README.md                 # Ce fichier
```

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à ouvrir une issue ou une pull request.

## 📄 Licence

Ce projet est sous licence MIT.

## 👤 Auteur

Votre nom - [Votre GitHub](https://github.com/VOTRE_USERNAME)

---

⭐ Si ce projet vous a été utile, n'hésitez pas à lui donner une étoile !
