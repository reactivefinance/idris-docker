FROM haskell:8

MAINTAINER Patrick Haener <contact@haenerconsulting.com>

ENV IDRIS_VERSION=0.99
RUN cabal update && cabal install idris-${IDRIS_VERSION}
WORKDIR /source
ENV PATH ${PATH}:/root/.cabal/bin
CMD ["idris"]
