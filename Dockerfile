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
ARG BUILD_DATE
ARG VCS_REF
ARG GIT_COMMIT=unspecified
LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL git_commit=$GIT_COMMIT
LABEL maintainer="Patrick Haener <contact@haenerconsulting.com>"
RUN apk add --no-cache \
  libffi \
  ncurses \
  musl \
  zlib \
  musl-dev \
  gmp-dev \
  gcc

COPY --from=builder /root/.cabal/bin /root/.cabal/bin
COPY --from=builder /root/.cabal/share /root/.cabal/share
VOLUME /home/idris
WORKDIR /home/idris
ENV PATH ${PATH}:/root/.cabal/bin
CMD ["idris"]
