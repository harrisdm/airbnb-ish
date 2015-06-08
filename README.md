# Airbnb Recreation


### Description
---
This is Project 1 for my GA Web Development Immersive course.
The task was to create and host a website using the Ruby on Rails framework with a Postgresql database. The subject matter of the project was our own choice (original or emulation) and we were given a week to produce it.

This project was set after only 1 week of studying ruby and 1 week of rails, having no previous contact with either.

### Instructions
---
Go to https://pure-sands-9773.herokuapp.com/

### Tech Used
---
- Ruby
- Rails
- Postgresql
- HTML
- CSS
- Bootstrap
- GoogleMaps API

### Approach
---
I used this project to increase my knowledge of the Rails system and how all the parts work together. Unlike any 
other web development I've done before, the rails framework is complex arrangement of files or at least thats how 
it seemed at first. This project has proven to me how well structered the rails mcv is, and how quickly a web app 
can start to take shape.

- Model the database tables and fields based on user roles and actions
- Develop the user authenciation as much of the system relied on it
- Migrate the database and add seed data for development and testing
- Build the CRUD system for users and properties, checking relationships are working
- Use geocoder and GoogleMaps API to displayand search for properties (I tried GMaps4Rails and the JS API and went 
with GMaps4Rails. Looking back, the JS API may have been better for future implementation of ajax)
- Add helper blocks to remove repitition
- Style the site
- Build the CRUD for bookings
- Continue styling and add security to sensitive areas eg Deleting

### The Good Bits
---
##### Data preservation
I decided to make the database keep all records and not allow deletions. Instead a flag is set to indicate that an 
entity is no longer in use. This allows for past records to be viewed without "gaps" due to deleted date. This 
increased the complexity of the database searches but actions can be scoped and chained in rails to make it fairly 
straight forward.

##### Bootstrap
This was my first venture into Bootstrap. I am used to coding my own layouts and have used grid systems before but 
the Bootstrap framework made production and styling very quick. The size of the HTML grew substancially due to it 
but was fairly easy to do 


### The Bad Bits
---
##### Date Validation
I found the validating the booking request against current bookings fairly difficult. I found a few gems to assist 
me with this feature but I couldn't get them working. The method I eventually used simply cycles through the 
bookings and compares each one to the request to detect a conflict. As this is rather search intensive I tried to 
structure my database query to improve speed. This includied ordering the where clauses to remove the highest number 
of false cases first  and leaving the 'OR' case to last.

### Further Work
---
The project ended up being a lot larger than I had first thought so I didn't achieve everything I initially wanted.
- File upload for profile/property images (researched Cloudinary but not implemented)
- Image carousel for properties
- Search by dates as well as location
- Add reviews to bookings and people
- Be able to comment on the reviews
- Add a payment system
