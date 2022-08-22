FROM adoptopenjdk/openjdk11
RUN addgroup spring && adduser  --ingroup spring --disabled-password spring
USER 10001
WORKDIR /home/spring/app
ARG JAR_FILE=build/libs/*.jar
COPY --chown=spring ${JAR_FILE} /home/spring/app/bin/tp-cloud-config-server-1.2.0.jar
ENTRYPOINT ["java", "-Dapplication.name=tp-cloud-config-server", "-jar","/home/spring/app/bin/tp-cloud-config-server-1.2.0.jar"]

EXPOSE 8080