# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Status.create(
          name:"Planung"
)




User.create(
    id:"1", firstname:"Patrick", lastname:"Rieser", birthdate:"1990-05-23T15:33:00.000",  address:"Platz 1",
    city:"wien", email:"patrickrieser@msn.com", username:"riasa", passwort:"ddad", createdFrom:"riesa",
    changedFrom:"roli", syncedFrom:"1", deleteFlag:"0"
)

User.create(
    id:"2", firstname:"Roli", lastname:"Puhwein", birthdate:"1991-05-01T15:33:00.000",  address:"Hoechstpl 1",
    city:"wien", email:"roli@msn.com", username:"roli", passwort:"ddad", createdFrom:"roli",
    changedFrom:"roli", syncedFrom:"1", deleteFlag:"0"
)
User.create(
    id:"3", firstname:"Lukas", lastname:"Liebhart", birthdate:"1850-05-23T15:33:00.000",  address:"Am Weg 1",
    city:"wien", email:"luki@msn.com", username:"llll", passwort:"ddad", createdFrom:"riesa",
    changedFrom:"roli", syncedFrom:"1", deleteFlag:"0"
)



Customer.create(
            user_id:"2", note:"testeintrag"
)

Customer.create(
    user_id:"3", note:"testeintrag2"
)

Agency.create(
    id: "1", name:"Agency1", entranceDate:"2016-01-01T00:00:00", deleteFlag:"0"
)

TourGuide.create(
    user_id:"1", tourGuideSince:"2016-01-01T00:00:00", createdFrom:"rieser", changedFrom:"rieser", syncedFrom:"", deleteFlag:"0", agency_id:"1"
)
Tour.create(

    name:'SchoenbrunnTour',maxAttendees:12,price:1234.0,startDate:'2017-05-23T15:33:00.000',endDate:'2017-05-23T15:33:00.000',createdFrom:'Mr' ,changedFrom:'Roland',syncedFrom:1 , Tour_Guide_id: "1"
)
Tour.create(

    name:'Innenstadt',maxAttendees:22,price:134.0,startDate:'2017-04-21T15:33:00.000',endDate:'2017-04-21T15:33:00.000',createdFrom:'RM' ,changedFrom:'DA',syncedFrom:1, Tour_Guide_id: "1"
)
Tour.create(

    name:'Flodo',maxAttendees:122,price:5.0,startDate:'2016-04-21T15:33:00.000',endDate:'2016-04-21T15:33:00.000',createdFrom:'RM' ,changedFrom:'DA',syncedFrom:1, Tour_Guide_id: "1"
)
TourPosition.create(
     name:"Schlafzimmer Sisi", position:"113111", createdFrom:"rieser", changedFrom:"rieser", syncedFrom:"0", deleteFlag:"0"
)


TourPosition.create(
    name:"Riesenrad Prater", position:"4532432", createdFrom:"rieser", changedFrom:"rieser", syncedFrom:"0", deleteFlag:"0"
)
