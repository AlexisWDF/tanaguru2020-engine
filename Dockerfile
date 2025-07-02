# Étape 1 : build avec Maven + JDK
FROM maven:3.9.10-eclipse-temurin-11 AS build

WORKDIR /app

COPY . /app

RUN mvn clean package -DskipTests

# Étape 2 : image finale légère avec juste OpenJDK pour exécuter le jar
FROM eclipse-temurin:11-jre

WORKDIR /app

# Copier le jar depuis le sous-dossier tanaguru-engine/target
COPY --from=build /app/tanaguru-engine/target/tanaguru-engine-2.3.1.jar /app/tanaguru-engine.jar

EXPOSE 8080

CMD ["java", "-jar", "tanaguru-engine.jar"]
