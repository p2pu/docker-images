Docker image for running Knight app

Build image using

    docker build -t p2pu/knight:v2 .

Run image using

    docker run --name knight --link p2pu-postgres:p2pu-postgres -p 8000:80 -e DATABASE_URL=postgres://knight:bob12345@p2pu-postgres:5432/knight -d p2pu/knight:v2

Requirements:

- Postgres db running in seperate image.
