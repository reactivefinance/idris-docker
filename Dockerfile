FROM alpine:latest as builder
ARG VERSION
ENV IDRIS_VERSION ${VERSION}
RUN apk add --no-cache \
  libffi-dev \
  ncurses-dev \
  alpine-sdk \
  musl-dev \
  zlib-dev \
  ghc \
  cabal
RUN cabal update && cabal install -f FFI -f LLVM -f GMP idris-${IDRIS_VERSION} 

FROM alpine:latest
LABEL maintainer="Patrick Haener <contact@haenerconsulting.com>"
RUN apk add --no-cache \
  gmp \
  libffi \
  ncurses \
  musl \
  zlib

COPY --from=builder /root/.cabal/bin /root/.cabal/bin
ENV PATH ${PATH}:/root/.cabal/bin
CMD ["idris"]
