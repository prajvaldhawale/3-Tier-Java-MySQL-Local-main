#FROM eclipse-temurin:17-jdk-alpine
    
#EXPOSE 8080
 
#ENV APP_HOME /usr/src/app

#COPY target/*.jar $APP_HOME/app.jar
#WORKDIR /app
#COPY  target/*.jar app.jar

#WORKDIR $APP_HOME

#CMD ["java", "-jar", "app.jar"]

FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
