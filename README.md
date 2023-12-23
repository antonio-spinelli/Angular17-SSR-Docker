# Angular 17 SSR with Docker

## Docker

```sh
docker build -t angular-ssr-image .
```

```sh
docker run --name angular-ssr-container -d -p 8080:4200 angular-ssr-image
```
