
# Rails Load Balancer Playground

Um pequeno experimento com **Ruby on Rails**, **Docker**, **Nginx** e **Redis** para demonstrar:

* múltiplas instâncias Rails rodando em paralelo
* balanceamento de carga via Nginx
* estado compartilhado usando Redis
* identificação de cada instância e contagem de hits no endpoint `/status`

## Executando

```sh
docker compose up --build
```

Acesse o load balancer:

```
http://localhost:8080/status
```

A resposta inclui o ID da instância, o número de requisições atendidas por ela e o total global acumulado no Redis.

## Estrutura

* **app1 / app2**: duas instâncias Rails idênticas, diferenciadas por `INSTANCE_ID`.
* **redis**: armazenamento compartilhado para contadores.
* **nginx**: distribui requisições entre app1 e app2.

## Objetivo

Servir como um laboratório simples para entender como aplicações Rails podem ser escaladas horizontalmente e compartilhar estado via Redis.
