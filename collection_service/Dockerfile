# syntax=docker/dockerfile:1

FROM adoptopenjdk:11-jre-hotspot

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
#RUN ./mvnw dependency:go-offline

COPY src ./src

CMD ["./mvnw", "spring-boot:run"]