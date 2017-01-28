FROM haskell:8
RUN cabal update && cabal install idris-0.99
WORKDIR /source
ENV PATH ${PATH}:/root/.cabal/bin
CMD ["idris"]
