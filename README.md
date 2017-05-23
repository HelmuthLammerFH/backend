# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# create scaffold like this
`rails generate scaffold Tour Bezeichnung:string MaxTeilnehmer:integer Preis:float TourStartDatum:datetime TourEndeDatum:datetime EintragErstelltVon:string EintragGeaendertVon:string SyncedFrom:integer`


if you missed something or there are some typos you can destroy it with

`rails destory scaffold Tour` or you can fix the typos and add `--force` after command.

#Start Project
```
rails db:create
rails db:migrate
rails db:seed
rails s
```

#Change Port
```
rails s -p 4500
```
