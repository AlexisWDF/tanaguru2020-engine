FROM tanaguru/tanaguru-engine:latest

EXPOSE 8080

CMD ["java", "-jar", "/app/tanaguru-engine.jar"]
