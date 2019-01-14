FROM mono:latest AS unpacker

ADD https://github.com/picklesdoc/pickles/releases/download/v2.20.1/Pickles-exe-2.20.1.zip /pickles.zip

RUN apt-get update
RUN apt-get install unzip

RUN mkdir /pickles
RUN unzip /pickles.zip -d /pickles

FROM mono:latest
COPY --from=unpacker /pickles /pickles
ENTRYPOINT [ "mono",  "/pickles/Pickles.exe" ]
