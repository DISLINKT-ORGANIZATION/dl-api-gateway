FROM adoptopenjdk:11-jre-hotspot
COPY "target/api-gateway-service.jar" api-gateway-service.jar
ENTRYPOINT ["java", "-jar", "api-gateway-service.jar"]