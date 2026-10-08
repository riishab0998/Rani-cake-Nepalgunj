# 🎂 Rani Cake Nepalgunj (रानी केक नेपालगञ्ज) – Dockerized Bakery Website

A bakery website for Rani Cake, located in Nepalgunj, Banke, Nepal. Cake names in Nepali + English, prices in NPR (रु).

A bakery website with 3 containers managed by Docker Compose:

| Container  | Technology        | Role                                     |
|------------|-------------------|------------------------------------------|
| `rani-web` | Nginx             | Serves the website, proxies `/api` calls |
| `rani-api` | Node.js + Express | REST API (cakes, orders)                 |
| `rani-db`  | PostgreSQL 16     | Stores cakes and customer orders         |

## Run

Install Docker Desktop, open this folder in VS Code, then in the terminal:

```bash
docker compose up --build
```

- Website: http://localhost:8080
- Orders page: http://localhost:8080/orders.html
- API test: http://localhost:8080/api/cakes

Check containers: `docker compose ps`
Stop: `docker compose down` (add `-v` to also delete database data)

## Push to GitHub

```bash
git init
git add .
git commit -m "Rani Cake dockerized app"
git branch -M main
git remote add origin https://github.com/<your-username>/rani-cake.git
git push -u origin main
```
(Create an empty repo named `rani-cake` on github.com first.)
