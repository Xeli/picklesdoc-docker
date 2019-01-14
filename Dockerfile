FROM mono:latest

ADD https://github.com/picklesdoc/pickles/releases/download/v2.20.1/Pickles-exe-2.20.1.zip /pickles.zip

RUN apt-get update
RUN apt-get install unzip

RUN mkdir /pickles
RUN unzip /pickles.zip -d /pickles

CMD [ "mono",  "/pickles/Pickles.exe" ]
