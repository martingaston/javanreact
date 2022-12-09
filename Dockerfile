FROM azul/zulu-openjdk:17-latest

EXPOSE 8080

RUN useradd --no-create-home -s /bin/false --uid 999 app

USER 999

COPY backend/target/backend-0.0.1-SNAPSHOT.jar /app.jar
COPY frontend/build/ /static/

ENV SPRING_WEB_RESOURCES_STATIC_LOCATIONS="file:./static/"

ENTRYPOINT ["java", "-Duser.timezone=UTC", "-jar", "/app.jar"]