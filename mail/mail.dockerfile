# build a tiny docker image
FROM alpine:latest

RUN mkdir /app

# copy the executable of mailApp to the smaller docker image
COPY mailApp /app

CMD [ "/app/mailApp" ]
