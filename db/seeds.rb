# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

require 'faker'
puts 'Cleaning database...'
Favorite.destroy_all
Dog.destroy_all
User.destroy_all
Message.destroy_all

puts 'Creating fake admin & shelter...'

user_1 = User.create(
  name: "Silvia",
  username: "SiSa",
  email: "silviasartor@ymail.com",
  password: "123456",
  phone: "334-9753029",
  role: "user"
)

user_2 = User.create(
  name: "Andrea",
  username: "Andrea1",
  email: "andrea@gmail.com",
  password: "123456",
  phone: "331-6733028",
  role: "user"
)


shelter_1 = User.create(
  name: "Dogs Pound",
  username: "Jonny",
  email: "jonathanblanga@gmail.com",
  phone: "02 9934 6310",
  password: "123456",
  role: "shelter",
  hours_of_operation: "24h a day, monday through sunday",
  address: "Corso Magenta, 52, Milano, Italy"
)

shelter_2 = User.create(
  name: "Homeless Dogs",
  username: "Homeless Dog",
  email: "ivan.radeljevic12345@gmail.com",
  phone: "02 5541 49101",
  password: "123456",
  role: "shelter",
  hours_of_operation: "24h a day, mon through sunday",
  address: "Via Caradosso, 18, 20123 Milano MI"
)

shelter_3 = User.create(
  name: "Help pets!",
  username: "Help pets!",
  email: "audrey@gmail.com",
  phone: "02 2141 45801",
  password: "123456",
  role: "shelter",
  hours_of_operation: "24h a day, mon through sunday",
  address: "Via Matteo Bandello, 2, 20123 Milano MI"
)

10.times do
    user = User.new(
    name: Faker::Name.name,
    username: Faker::Name.unique.name,
    email: Faker::Internet.email,
    password: "123456",
    phone: Faker::PhoneNumber.cell_phone_with_country_code,
    role: "user"
  )
  user.save
end


User.create(
  name: "Dogs lover",
  username: "Dogs lover",
  email: "silvia@libero.com",
  phone: "02 2241 49190",
  password: "123456",
  role: "shelter",
  hours_of_operation: "24h a day, mon through sunday",
  address: "Corso Magenta, 78, 20123 Milano MI"
)

User.create(
  name: "Dog shelter",
  username: "Dog shelter",
  email: "fra@gmail.com",
  phone: "02 5652 9761",
  password: "123456",
  role: "shelter",
  hours_of_operation: "24h a day, mon through sunday",
  address: "Via Nirone, 5, 20123 Milano MI"
)

User.create(
  name: "Audrey's Dog Shelter",
  username: "Audrey's Dog Shelter",
  email: "aud@aud.aud",
  phone: "02 9901 9851",
  password: "123456",
  role: "shelter",
  hours_of_operation: "24h a day, mon through sunday",
  address: "400 Armada Rd, Arcadia, CA 91007, USA"
)

User.create(
  name: "Pasadena Humane Society",
  username: "Pasadena Humane Society",
  email: "auds@auds.auds",
  phone: "02 9728 9871",
  password: "123456",
  role: "shelter",
  hours_of_operation: "24h a day, mon through sunday",
  address: "361 S Raymond Ave, Pasadena, CA 91105, USA"
)

all_shelters = User.where(role: "shelter")
good_shelter = all_shelters.first

puts 'Creating fake dogs...'

dog = Dog.new(name: "Joey", gender: "male", date_of_birth: "2017-01-02", size: "large", breed: "Norrbottenspets", color: ["white", "beige"], is_hypoallergenic: "false", is_sterilized: "true", user_id: good_shelter.id)
dog.remote_photo_url = "https://www.101dogbreeds.com/wp-content/uploads/2016/12/Norrbottenspets-Pictures.jpg"
dog.remote_pictures_urls = [
  "http://skadi.se/wp-content/uploads/2015/04/agnar11.jpg",
  "https://upload.wikimedia.org/wikipedia/en/7/7b/Norrbottenspets_Karina_2008.jpg"
]
dog.save

dog = Dog.new(name: "Jamie", gender: "female", date_of_birth: "2017-12-15", size: "large", breed: "Norrbottenspets", color: ["white", "beige"], is_hypoallergenic: "false", is_sterilized: "false", user_id: good_shelter.id)
dog.remote_photo_url = "https://www.101dogbreeds.com/wp-content/uploads/2016/12/Norrbottenspets.jpg"
dog.save

dog = Dog.new(name: "Nancy", gender: "female", date_of_birth: "2014-06-11", size: "medium", breed: "Old English Sheepdog", color: ["white", "gray"], is_hypoallergenic: "false", is_sterilized: "true", user_id: good_shelter.id)
dog.remote_photo_url = "https://quattrozampe.online/wp-content/uploads/2015/09/Bobtail2.jpg"
dog.save

dog = Dog.new(name: "Shirley", gender: "female", date_of_birth: "2017-12-15", size: "medium", breed: "Old English Sheepdog", color: ["white", "gray"], is_hypoallergenic: "false", is_sterilized: "false", user_id: good_shelter.id)
dog.remote_photo_url = "http://elelur.com/data_images/dog-breeds/old-english-sheepdog/old-english-sheepdog-08.jpg"
dog.save

dog = Dog.new(name: "Spot", gender: "male", date_of_birth: "2014-03-24", size: "small", breed: "Parson Russell Terrier", color: ["brown", "white"], is_hypoallergenic: "false", is_sterilized: "false", user_id: good_shelter.id)
dog.remote_photo_url = "https://cdn3-www.dogtime.com/assets/uploads/gallery/jack-russel-terrier-dog-breed-pictures/1-runforward.jpg"
dog.save

dog = Dog.new(name: "Reece", gender: "male", date_of_birth: "2015-06-20", size: "small", breed: "Parson Russell Terrier", color: ["brown", "white"], is_hypoallergenic: "true", is_sterilized: "false", user_id: good_shelter.id)
dog.remote_photo_url =  "https://vetstreet.brightspotcdn.com/dims4/default/82dc417/2147483647/crop/0x0%2B0%2B0/resize/645x380/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F65%2F71b210a38611e087a80050568d634f%2Ffile%2FJack-Russell-Terrier-2-645mk062411.jpg"
dog.save

dog = Dog.new(name: "Shaniqua", gender: "female", date_of_birth: "2017-04-20", size: "small", breed: "Pomeranian", color: ["white"], is_hypoallergenic: "false", is_sterilized: "false", user_id: good_shelter.id)
dog.remote_photo_url = "https://dogbreedatlas.com/images/dog-breed-photos/pomeranian/001/pomeranian-1490682869-1.jpg"
dog.save

dog = Dog.new(name: "Floof", gender: "female", date_of_birth: "2018-01-30", size: "small", breed: "Pomeranian", color: ["brown", "orange", "white"], is_hypoallergenic: "false", is_sterilized: "false", user_id: good_shelter.id)
dog.remote_photo_url = "https://s3.us-west-2.amazonaws.com/photos.puppyspot.com/breeds/238/card/500000283_medium.jpg"
dog.save

dog = Dog.new(name: "Hercules", gender: "male", date_of_birth: "2016-08-03", size: "large", breed: "Rottweiler", color: ["brown", "black"], is_hypoallergenic: "false", is_sterilized: "false", user_id: good_shelter.id)
dog.remote_photo_url = "https://i.pinimg.com/736x/02/8e/17/028e17e5baace88a8f2da2ff19332849.jpg"
dog.save

dog = Dog.new(name: "Lucy", gender: "female", date_of_birth: "2016-08-03", size: "large", breed: "Rottweiler", color: ["brown", "black"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id)
dog.remote_photo_url = "https://s3.amazonaws.com/imagesroot.rescuegroups.org/webpages/s5952nqw9wv2oeyx.jpg"
dog.save

dog = Dog.new(name: "Jack", gender: "male", date_of_birth: "2011-05-03", size: "small", breed: "Russell Terrier", color: ["brown", "white"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id)
dog.remote_photo_url = "https://jrtrescue.net/wp-content/uploads/2017/01/Buddy-Happy-adoption-story-1024x768.jpg"
dog.save

dog = Dog.new(name: "Molly", gender: "female", date_of_birth: "2016-11-26", size: "large", breed: "Akita", color: ["beige", "white"], is_hypoallergenic: "false", is_sterilized: "true", user_id: all_shelters.last.id)
dog.remote_photo_url = "https://doctorvetblog.files.wordpress.com/2016/07/happy-akita-inu-dog-wallpaper.jpg"
dog.save

dog = Dog.new(name: "Buster", gender: "male", date_of_birth: "2015-03-01", size: "medium", breed: "Beagle", color: ["black", "white", "brown"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id-3)
dog.remote_photo_url = "http://www.breedog.it/wp-content/uploads/2015/12/Beagle.jpg"
dog.save

dog = Dog.new(name: "Oliver", gender: "male", date_of_birth: "2018-01-23", size: "medium", breed: "Beagle", color: ["black", "white", "brown"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id-2)
dog.remote_photo_url = "https://4.bp.blogspot.com/-OAAuZwm0Bpo/Vjd1u9uARRI/AAAAAAAF0HU/5lCKvn1bkNU/s1600/beagle.jpg"
dog.save

dog = Dog.new(name: "Rocky", gender: "male", date_of_birth: "2013-04-11", size: "small", breed: "French Bulldog", color: ["beige"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id)
dog.remote_photo_url = "https://www.pets4homes.co.uk/images/breeds/56/9b8f8158056fc5420a03372c9772678e.jpeg"
dog.save

dog = Dog.new(name: "Gus", gender: "male", date_of_birth: "2016-12-06", size: "small", breed: "French Bulldog", color: ["white", "black"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id)
dog.remote_photo_url = "http://www.frenchbulldogclubofengland.org.uk/uploads/1/5/9/2/15927418/19225430-1198176706976405-2218419371328741982-n_orig.jpg"
dog.save

dog = Dog.new(name: "Tucker", gender: "male", date_of_birth: "2010-04-24", size: "large", breed: "Dalmatian", color: ["white", "black"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id)
dog.remote_photo_url = "https://quattrozampe.online/wp-content/uploads/2018/10/dalmata-3-960x662.jpg"
dog.save

dog = Dog.new(name: "Luna", gender: "female", date_of_birth: "2013-11-20", size: "large", breed: "Dalmatian", color: ["white", "black"], is_hypoallergenic: "false", is_sterilized: "true", user_id: all_shelters.last.id-2)
dog.remote_photo_url = "https://www.barinedita.it/public/foto_galleria/dalmata_7.jpg"
dog.save

dog = Dog.new(name: "Bear", gender: "male", date_of_birth: "2011-12-19", size: "large", breed: "German Sheperd", color: ["black", "brown"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id-2)
dog.remote_photo_url = "https://usercontent1.hubstatic.com/378546_f520.jpg"
dog.save

dog = Dog.new(name: "Jack", gender: "male", date_of_birth: "2014-09-11", size: "large", breed: "German Sheperd", color: ["black", "brown"], is_hypoallergenic: "false", is_sterilized: "true", user_id: all_shelters.last.id-2)
dog.remote_photo_url = "https://g77v3827gg2notadhhw9pew7-wpengine.netdna-ssl.com/wp-content/uploads/2017/10/are-german-shepherds-good-with-kids_canna-pet-1024x768.jpg"
dog.save

dog = Dog.new(name: "Sadie", gender: "female", date_of_birth: "2015-01-03", size: "large", breed: "German Sheperd", color: ["black", "brown"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id)
dog.remote_photo_url = "https://g77v3827gg2notadhhw9pew7-wpengine.netdna-ssl.com/wp-content/uploads/2017/10/german-shepherd-dog-1071592_1920-1024x683.jpg"
dog.save

dog = Dog.new(name: "Bailey", gender: "female", date_of_birth: "2013-10-03", size: "large", breed: "Labrador", color: ["beige"], is_hypoallergenic: "false", is_sterilized: "true", user_id: all_shelters.last.id-3)
dog.remote_photo_url = "http://www.repstatic.it/content/localirep/img/rep-firenze/2017/08/04/113053648-22f51c59-57d4-4d8c-9610-0360c8c530ab.jpg"
dog.save

dog = Dog.new(name: "Maggie", gender: "female", date_of_birth: "2010-12-23", size: "large", breed: "Labrador", color: ["white"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id-2)
dog.remote_photo_url = "http://animatch.ca/images/made/images/dogs/Maze18.6_800_570_imageswatermark.png_70_30_100_r_b_-20_-20_c1.jpg"
dog.save

dog = Dog.new(name: "Loop", gender: "female", date_of_birth: "2011-04-23", size: "large", breed: "Labrador", color: ["white"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id)
dog.remote_photo_url = "https://www.pets4homes.co.uk/images/classifieds/2015/03/23/916864/large/stunning-female-labrador-retriever-2-years-old-551053afa6683.JPG"
dog.save

dog = Dog.new(name: "Buddy", gender: "male", date_of_birth: "2014-04-23", size: "large", breed: "Labrador", color: ["beige"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id)
dog.remote_photo_url = "http://4.bp.blogspot.com/-2gg6M-dHfJU/Tg-fDZY5r1I/AAAAAAAALlM/v2IcgysOHKU/s1600/2976.jpg"
dog.save

dog = Dog.new(name: "Lexy", gender: "female", date_of_birth: "2010-10-10", size: "small", breed: "Maltese", color: ["white"], is_hypoallergenic: "false", is_sterilized: "true", user_id: good_shelter.id)
dog.remote_photo_url = "https://bepuppyblog-4fef.kxcdn.com/wp-content/uploads/2017/04/cane-maltese.jpg"
dog.save

dog = Dog.new(name: "Maya", gender: "female", date_of_birth: "2015-01-17", size: "small", breed: "Dachshund", color: ["black"], is_hypoallergenic: "false", is_sterilized: "true", user_id: all_shelters.last.id-3)
dog.remote_photo_url = "https://www.pets4homes.co.uk/images/breeds/57/large/ca02f0e6d0cc2bfa187de33b9565b61e.JPG"
dog.save

dog = Dog.new(name: "Daisy", gender: "female", date_of_birth: "2013-11-10", size: "small", breed: "Dachshund", color: ["brown"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id-3)
dog.remote_photo_url = "https://ncvs.net.au/wp-content/uploads/dachsund.jpg"
dog.save

dog = Dog.new(name: "Cooper", gender: "male", date_of_birth: "2016-12-28", size: "small", breed: "Dachshund", color: ["black", "brown"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id)
dog.remote_photo_url = "https://storage.googleapis.com/nom-nom-now/images/breeds/dachshund.jpg"
dog.save

dog = Dog.new(name: "Max", gender: "male", date_of_birth: "2012-04-25", size: "large", breed: "Doberman", color: ["black", "brown"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id-3)
dog.remote_photo_url = "https://g77v3827gg2notadhhw9pew7-wpengine.netdna-ssl.com/wp-content/uploads/2018/02/doberman-pinscher-1098804_1920-1024x681.jpg"
dog.save

dog = Dog.new(name: "Duke", gender: "male", date_of_birth: "2013-03-09", size: "large", breed: "Doberman", color: ["black", "brown"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id-2)
dog.remote_photo_url = "http://dims.vetstreet.com/dims3/MMAH/crop/0x0%2B0%2B0/resize/645x380/quality/90/?url=http:%2F%2Fs3.amazonaws.com%2Fassets.prod.vetstreet.com%2Fcf%2Ff283009e8911e0a2380050568d634f%2Ffile%2FDoberman-2-645mk062111.jpg"
dog.save

dog = Dog.new(name: "Lullaby", gender: "female", date_of_birth: "2017-08-09", size: "small", breed: "Chihuahua", color: ["black", "beige"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id)
dog.remote_photo_url = "https://www.dogster.com/wp-content/uploads/2015/05/shutterstock_1741426311.jpg"
dog.save

dog = Dog.new(name: "Bella", gender: "female", date_of_birth: "2018-12-19", size: "small", breed: "Chihuahua", color: ["white", "beige"], is_hypoallergenic: "false", is_sterilized: "false", user_id: all_shelters.last.id-3)
dog.remote_photo_url = "https://http2.mlstatic.com/chihuahua-cachorro-macho-D_NQ_NP_683900-MLA27566558302_062018-F.jpg"
dog.save

dog = Dog.new(name: "Greg", gender: "male", date_of_birth: "2018-10-29", size: "small", breed: "Bulldog", color: ["white", "golden"], is_hypoallergenic: "false", is_sterilized: "false", user_id: good_shelter.id)
dog.remote_photo_url = "https://irp-cdn.multiscreensite.com/a123db97/dms3rep/multi/IMG_3571-03-08-17-05-55.JPG"
dog.save

dog = Dog.new(name: "Augie", gender: "male", date_of_birth: "2015-07-12", size: "small", breed: "Bulldog", color: ["white", "beige"], is_hypoallergenic: "false", is_sterilized: "false", user_id: good_shelter.id)
dog.remote_photo_url = "https://www.pets4homes.co.uk/images/breeds/56/9b8f8158056fc5420a03372c9772678e.jpeg"
dog.save


puts 'Creating favorites...'

i = 0

8.times do (
Favorite.create(user_id: User.all.first.id, dog_id: Dog.all.last.id - i)
)
i += 2
# Favorite.create(user_id: User.all.first.id, dog_id: 7)
# Favorite.create(user_id: User.all.first.id, dog_id: 10)
# Favorite.create(user_id: User.all.first.id, dog_id: 15)
# Favorite.create(user_id: User.all.first.id, dog_id: 20)
# Favorite.create(user_id: User.all.first.id, dog_id: 22)
# Favorite.create(user_id: User.all.first.id, dog_id: 25)
# Favorite.create(user_id: User.all.first.id, dog_id: 30)
end

puts 'Creating messages...'
Message.create(
  from_user_id: user_1.id,
  to_user_id: shelter_1.id,
  content: "I'm interested in adopting Luna. Could I pass by on Monday morning around 10:00?",
)

Message.create(
  from_user_id: user_1.id,
  to_user_id: shelter_2.id,
  content: "Are you open also on Christmas day?",
)

Message.create(
  from_user_id: user_2.id,
  to_user_id: shelter_2.id,
  content: "Hello. I'm very interested in adopting Lexy. I wanted to ask you if she's the correct dog for a family with 2 little kids?",
)

Message.create(
  from_user_id: user_2.id,
  to_user_id: shelter_3.id,
  content: "I'm interested in adopting Lucy. Could I pass by on Monday morning around 10:00?",
)
puts 'end...for the love of god'
