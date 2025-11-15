from maven:3.9.9-eclipse-temurin-21 as build
workdir /app
copy pom.xml .
copy src src
run mvn -B -DskipTests package

from eclipse-temurin:17-jre-alpine 
workdir /app                                                                                                                                                                                
copy --from=build /app/target/*.jar app.jar
cmd ["java", "-jar", "app.jar"]
