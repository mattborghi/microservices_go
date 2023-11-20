# build a tiny docker image
FROM alpine:latest

RUN mkdir /app

# copy the executable of listenerApp to the smaller docker image
COPY listenerApp /app

CMD [ "/app/listenerApp" ]
