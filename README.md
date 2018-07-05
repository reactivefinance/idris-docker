# Docker Image for Idris [![](https://images.microbadger.com/badges/version/reactivefinance/idris.svg)](https://microbadger.com/images/reactivefinance/idris "Get your own version badge on microbadger.com")

[Alpine Linux](https://alpinelinux.org/) based docker image of [Idris](http://www.idris-lang.org).

[![](https://images.microbadger.com/badges/image/reactivefinance/idris.svg)](https://microbadger.com/images/reactivefinance/idris "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/commit/reactivefinance/idris.svg)](https://microbadger.com/images/reactivefinance/idris "Get your own commit badge on microbadger.com")

## Usage

### REPL

```
./idris
```

### Code Generators

#### C

Compile to executable:

```
./idris hello.idr -o hello
```

Generating C code:

```
./idris hello.idr -S -o hello.c
```

Execute the binary then as follows:

```
./run-idris-compiled ./hello
``` 

#### Node

Compile to JavaScript for Node

```
./idris --codegen node hello.idr -o hello
```

Run in Node:

```
./hello
```

#### JavaScript

```
./idris --codegen javascript hello.idr -o hello.js
```	

### Markdown

The image also includes the `cheapskate` markdown to HTML transformer.

```
./cheapskate ./README.md
``` 

