FROM maven:3.8.4-openjdk-11-slim AS build
WORKDIR /app
COPY . /app
RUN mvn clean package
FROM eclipse-temurin:17-jdk-alpine
COPY --from=build /app/target/TODOBACKEND-0.0.1-SNAPSHOT.jar /TODOBACKEND-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/TODOBACKEND-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080
