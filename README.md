# Docker Image for Idris

[Alpine Linux](https://alpinelinux.org/) based image.

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

Execute the binary then as follows:

```
./run-idris-compiled ./hello
``` 

#### Node

Compile to JavaScript for Node

```
./idris-codegen-node hello.idr -o hello.js
```

Run in Node:

```
node hello.js
```
#### JavaScript

```
./idris-codegen-javascript hello.idr -o hello.js
```	

### Markdown

The image also includes the `cheapskate` markdown to HTML transformer.

```
./cheapskate ./README.md
``` 
