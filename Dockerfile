FROM maven:3.9.10-eclipse-temurin-11

WORKDIR /app

COPY . /app

RUN mvn clean package -DskipTests

EXPOSE 8080

CMD ["java", "-jar", "target/tanaguru-engine.jar"]
