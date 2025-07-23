FROM maven As builder
WORKDIR /opt/server
COPY code/src .
COPY pom.xml .
RUN mvn clean package
RUN ls -ltr target

# FROM
# RUN mkdir /opt/server
# RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
# RUN chmod roboshop:roboshop
# WORKDIR /opt/server
# COPY --from=builder /opt/server/targets/shipping.jar /opt/server/targets
# RUN
