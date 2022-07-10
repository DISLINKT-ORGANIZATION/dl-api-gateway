FROM maven:3.8.6-jdk-11 AS appServerBuild
WORKDIR /usr/src/api-gateway
COPY . .
RUN mvn package -DskipTests

FROM openjdk:11-jre-slim AS appServerRuntime
WORKDIR /app
COPY --from=appServerBuild /usr/src/api-gateway/target/api-gateway.jar ./
EXPOSE 8080
CMD ["java", "-jar", "api-gateway.jar"]