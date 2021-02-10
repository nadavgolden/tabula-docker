FROM openjdk:buster

ARG TABULA_VERSION

ADD https://github.com/tabulapdf/tabula/releases/download/v$TABULA_VERSION/tabula-jar-$TABULA_VERSION.zip .

RUN unzip tabula-jar-$TABULA_VERSION.zip && \
    rm tabula-jar-$TABULA_VERSION.zip

EXPOSE 8080

CMD ["java", "-Dfile.encoding=utf-8", "-Xms256M", "-Xmx1024M", "-jar", "tabula/tabula.jar"]
