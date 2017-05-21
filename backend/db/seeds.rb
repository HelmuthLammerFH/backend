# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Status.create(StatusID: '0', Bezeichnung: 'Laufend', EintragErstelltAm: DateTime.now, EintragErstelltVon: 'Gustaf', EintragGeaendertAm: DateTime.now, EintragGeandertVon: 'Gans')

Tour.create(Bezeichnung: 'Unsere 1. Tour', MaxTeilnehmer: 10, Preis: 100, TourStartDatum: DateTime.now, TourEndeDatum: DateTime.now, EintragErstelltVon: 'Roland', EintragGeaendertVon: 'Patrick', SyncedFrom: 1)