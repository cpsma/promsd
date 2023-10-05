# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Service.create(name: "mariadb", port: 9104)
Service.create(name: "haproxy", port: 8404)

Service.create(name: "prometheus", port: 9090)
Service.create(name: "alertmanager", port: 9093)

Service.create(name: "node-exporter", port: 9100)