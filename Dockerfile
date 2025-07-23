FROM maven As builder
WORKDIR /opt/server
COPY code/src /opt/server/src
COPY code/pom.xml .
RUN mvn clean package
RUN ls -ltr target

FROM eclipse-temurin:17-jre-alpine
EXPOSE 8080
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
# RUN addgroup -S <group-name> && adduser -S <user-name> -G <group-name>
RUN mkdir /opt/server
run chown roboshop:roboshop /opt/server
# chown <user>:<group> <path>
WORKDIR /opt/server
COPY --from=builder /opt/server/target/shipping-1.0.jar /opt/server/shipping.jar
USER roboshop
CMD ["java", "-jar", "shipping.jar"]
