# Utiliser une image OpenJDK officielle
FROM openjdk:11-jre-slim

# Répertoire de travail dans le container
WORKDIR /app

# Copier les fichiers sources dans le container
COPY . /app

# Construire Tanaguru (si tu as Maven installé dans l'image)
# Sinon, tu peux builder localement et copier juste le jar
RUN apt-get update && apt-get install -y maven \
    && mvn clean package -DskipTests

# Exposer le port utilisé par Tanaguru
EXPOSE 8080

# Commande pour lancer Tanaguru (en supposant que le jar généré est ici)
CMD ["java", "-jar", "target/tanaguru-engine.jar"]
