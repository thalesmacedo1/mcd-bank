postgres:
	docker run --name postgres14 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:14-alpine
createdb:
	docker exec -it postgres14 createdb --username=root --owner=root mcd_bank 
dropdb:
	docker exec -it postgres14 dropdb mcd_bank
migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/mcd_bank?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/mcd_bank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migrateup migratedown