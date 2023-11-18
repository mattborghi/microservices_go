# build a tiny docker image
FROM alpine:latest

RUN mkdir /app

# copy the executable of brokerApp to the smaller docker image
COPY brokerApp /app

CMD [ "/app/brokerApp" ]
