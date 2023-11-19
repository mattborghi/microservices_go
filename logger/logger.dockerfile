# build a tiny docker image
FROM alpine:latest

RUN mkdir /app

# copy the executable of loggerApp to the smaller docker image
COPY loggerApp /app

CMD [ "/app/loggerApp" ]
