FST4 - Backend

# create scaffold like this
`rails generate scaffold Tour Bezeichnung:string MaxTeilnehmer:integer Preis:float TourStartDatum:datetime TourEndeDatum:datetime EintragErstelltVon:string EintragGeaendertVon:string SyncedFrom:integer`

if you missed something or there are some typos you can destroy it with

`rails destory scaffold Tour` or you can fix the typos and add `--force` after command.