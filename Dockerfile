FROM haskell:8

MAINTAINER Patrick Haener <contact@haenerconsulting.com>

ARG VERSION
ENV IDRIS_VERSION ${VERSION}
RUN cabal update && cabal install idris-${IDRIS_VERSION}
WORKDIR /source
ENV PATH ${PATH}:/root/.cabal/bin
CMD ["idris"]
