FROM golang:1.20.4-alpine3.18
RUN apk add --no-cache make bash git wine
RUN addgroup -S golangdocker \
  && adduser -S -u 10000 -g golangdocker golangdocker
WORKDIR /go/src/app
COPY . .
RUN rm -rf bin && mkdir bin
RUN chown -R golangdocker:golangdocker /go/src/app
USER golangdocker
RUN make golang-build-linux64
RUN make golang-build-linux64-beta
RUN make golang-build-linux64-subscription
RUN make golang-build-windows64
RUN make golang-build-windows64-beta
RUN make golang-build-windows64-subscription
ENTRYPOINT ["bash", "scripts/golang_linux_build_tests.sh"]