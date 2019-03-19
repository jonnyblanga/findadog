# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

require 'faker'
puts 'Cleaning database...'
User.destroy_all
Dog.destroy_all
Message.destroy_all
Favorite.destroy_all

puts 'Creating fake admin & shelter...'

User.create(
  name: "admin",
  email: "silviasartor@ymail.com",
  password: "123456",
  phone: "0534-32534564",
  role: "user"
)

User.create(
  name: "shelter",
  email: "jonathanblanga@gmail.com",
  phone: "0534-32534565",
  password: "123456",
  role: "shelter",
  hours_of_operation: "24h a day, monday through sunday",
  address: "Corso Magenta, 52, Milano, Italy"
)

10.times do
    user = User.new(
    name: Faker::Name.unique.name,
    email: Faker::Internet.email,
    password: "123456",
    phone: Faker::PhoneNumber.cell_phone_with_country_code,
    role: "user"
  )
  user.save
end

User.create(
  name: "Homeless Dog",
  email: "ivan.radeljevic12345@gmail.com",
  phone: "0534-11111111",
  password: "123456",
  role: "shelter",
  hours_of_operation: "24h a day, mon through sunday",
  address: " Via Caradosso, 18, 20123 Milano MI"
)

User.create(
  name: "Help pets!",
  email: "audrey@gmail.com",
  phone: "0534-55555111",
  password: "123456",
  role: "shelter",
  hours_of_operation: "24h a day, mon through sunday",
  address: " Via Matteo Bandello, 2, 20123 Milano MI"
)

User.create(
  name: "Dogs lover",
  email: "silvia@silvial.com",
  phone: "0534-77777111",
  password: "123456",
  role: "shelter",
  hours_of_operation: "24h a day, mon through sunday",
  address: " Corso Magenta, 78, 20123 Milano MI"
)

User.create(
  name: "Dog shelter",
  email: "fra@fra.fra",
  phone: "0534-10101111",
  password: "123456",
  role: "shelter",
  hours_of_operation: "24h a day, mon through sunday",
  address: " Via Nirone, 5, 20123 Milano MI"
)

puts 'Creating fake dogs...'
Dog.create(name: "Joey", gender: "male", date_of_birth: "2017-01-02", size: "small", breed: "Norrbottenspets", color: ["white", "beige"], is_hypoallergenic: "", is_sterilized: "true", photo: "https://www.101dogbreeds.com/wp-content/uploads/2016/12/Norrbottenspets-Pictures.jpg", user_id: 2)
Dog.create(name: "Jamie", gender: "female", date_of_birth: "2017-12-15", size: "small", breed: "Norrbottenspets", color: ["white", "beige"], is_hypoallergenic: "", is_sterilized: "false", photo: "https://www.101dogbreeds.com/wp-content/uploads/2016/12/Norrbottenspets.jpg", user_id: 2)
Dog.create(name: "Nancy", gender: "female", date_of_birth: "2014-06-11", size: "medium", breed: "Old English Sheepdog", color: ["white", "gray"], is_hypoallergenic: "", is_sterilized: "true", photo: "https://i.pinimg.com/originals/f5/66/52/f5665206ab52eafa4ad2d65141024eda.jpg", user_id: 2)
Dog.create(name: "Shirley", gender: "female", date_of_birth: "2017-12-15", size: "medium", breed: "Old English Sheepdog", color: ["white", "gray"], is_hypoallergenic: "", is_sterilized: "false", photo: "http://elelur.com/data_images/dog-breeds/old-english-sheepdog/old-english-sheepdog-08.jpg", user_id: 2)
Dog.create(name: "Spot", gender: "male", date_of_birth: "2014-03-24", size: "small", breed: "Parson Russell Terrier", color: ["brown", "white"], is_hypoallergenic: "false", is_sterilized: "", photo: "https://cdn3-www.dogtime.com/assets/uploads/gallery/jack-russel-terrier-dog-breed-pictures/1-runforward.jpg", user_id: 2)
Dog.create(name: "Reece", gender: "male", date_of_birth: "2015-06-20", size: "small", breed: "Parson Russell Terrier", color: ["brown", "white"], is_hypoallergenic: "true", is_sterilized: "", photo: "https://vetstreet.brightspotcdn.com/dims4/default/82dc417/2147483647/crop/0x0%2B0%2B0/resize/645x380/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F65%2F71b210a38611e087a80050568d634f%2Ffile%2FJack-Russell-Terrier-2-645mk062411.jpg", user_id: 2)
Dog.create(name: "Shaniqua", gender: "female", date_of_birth: "2017-04-20", size: "small", breed: "Pomeranian", color: ["white"], is_hypoallergenic: "", is_sterilized: "false", photo: "https://dogbreedatlas.com/images/dog-breed-photos/pomeranian/001/pomeranian-1490682869-1.jpg", user_id: 2)
Dog.create(name: "Floof", gender: "female", date_of_birth: "2018-01-30", size: "small", breed: "Pomeranian", color: ["brown", "orange", "white"], is_hypoallergenic: "", is_sterilized: "", photo: "https://s3.us-west-2.amazonaws.com/photos.puppyspot.com/breeds/238/card/500000283_medium.jpg", user_id: 2)
Dog.create(name: "Hercules", gender: "male", date_of_birth: "2016-08-03", size: "large", breed: "Rottweiler", color: ["brown", "black"], is_hypoallergenic: "", is_sterilized: "", photo: "https://i.pinimg.com/736x/02/8e/17/028e17e5baace88a8f2da2ff19332849.jpg", user_id: 2)
Dog.create(name: "Lucy", gender: "female", date_of_birth: "2016-08-03", size: "large", breed: "Rottweiler", color: ["brown", "black"], is_hypoallergenic: "", is_sterilized: "", photo: "https://s3.amazonaws.com/imagesroot.rescuegroups.org/webpages/s5952nqw9wv2oeyx.jpg", user_id: 13)
Dog.create(name: "Jack", gender: "male", date_of_birth: "2011-05-03", size: "small", breed: "Russell Terrier", color: ["brown", "white"], is_hypoallergenic: "", is_sterilized: "", photo: "https://jrtrescue.net/wp-content/uploads/2017/01/Buddy-Happy-adoption-story-1024x768.jpg", user_id: 13)
Dog.create(name: "Molly", gender: "female", date_of_birth: "2016-11-26", size: "large", breed: "Akita", color: ["beige", "white"], is_hypoallergenic: "", is_sterilized: "true", photo: "https://doctorvetblog.files.wordpress.com/2016/07/happy-akita-inu-dog-wallpaper.jpg", user_id: 13)
Dog.create(name: "Buster", gender: "male", date_of_birth: "2015-03-01", size: "medium", breed: "Beagle", color: ["black", "white", "brown"], is_hypoallergenic: "", is_sterilized: "false", photo: "http://www.breedog.it/wp-content/uploads/2015/12/Beagle.jpg", user_id: 14)
Dog.create(name: "Oliver", gender: "male", date_of_birth: "2018-01-23", size: "medium", breed: "Beagle", color: ["black", "white", "brown"], is_hypoallergenic: "", is_sterilized: "false", photo: "https://4.bp.blogspot.com/-OAAuZwm0Bpo/Vjd1u9uARRI/AAAAAAAF0HU/5lCKvn1bkNU/s1600/beagle.jpg", user_id: 15)
Dog.create(name: "Rocky", gender: "male", date_of_birth: "2013-04-11", size: "small", breed: "French Bulldog", color: ["beige"], is_hypoallergenic: "", is_sterilized: "false", photo: "https://www.pets4homes.co.uk/images/breeds/56/9b8f8158056fc5420a03372c9772678e.jpeg", user_id: 16)
Dog.create(name: "Gus", gender: "male", date_of_birth: "2016-12-06", size: "small", breed: "French Bulldog", color: ["white", "black"], is_hypoallergenic: "", is_sterilized: "false", photo: "http://www.frenchbulldogclubofengland.org.uk/uploads/1/5/9/2/15927418/19225430-1198176706976405-2218419371328741982-n_orig.jpg", user_id: 16)
Dog.create(name: "Tucker", gender: "male", date_of_birth: "2010-04-24", size: "large", breed: "Dalmatian", color: ["white", "black"], is_hypoallergenic: "", is_sterilized: "false", photo: "https://quattrozampe.online/wp-content/uploads/2018/10/dalmata-3-960x662.jpg", user_id: 13)
Dog.create(name: "Luna", gender: "female", date_of_birth: "2013-11-20", size: "large", breed: "Dalmatian", color: ["white", "black"], is_hypoallergenic: "", is_sterilized: "true", photo: "https://www.barinedita.it/public/foto_galleria/dalmata_7.jpg", user_id: 14)
Dog.create(name: "Bear", gender: "male", date_of_birth: "2011-12-19", size: "large", breed: "German Sheperd", color: ["black", "brown"], is_hypoallergenic: "", is_sterilized: "false", photo: "https://www.cesarsway.com/sites/newcesarsway/files/styles/large_article_preview/public/Ten-things-you-didn%27t-know-about-German-shepherds-.jpg?itok=1A6QPRjw", user_id: 15)
Dog.create(name: "Jack", gender: "male", date_of_birth: "2014-09-11", size: "large", breed: "German Sheperd", color: ["black", "brown"], is_hypoallergenic: "", is_sterilized: "true", photo: "https://g77v3827gg2notadhhw9pew7-wpengine.netdna-ssl.com/wp-content/uploads/2017/10/are-german-shepherds-good-with-kids_canna-pet-1024x768.jpg", user_id: 15)
Dog.create(name: "Sadie", gender: "female", date_of_birth: "2015-01-03", size: "large", breed: "German Sheperd", color: ["black", "brown"], is_hypoallergenic: "", is_sterilized: "false", photo: "https://g77v3827gg2notadhhw9pew7-wpengine.netdna-ssl.com/wp-content/uploads/2017/10/german-shepherd-dog-1071592_1920-1024x683.jpg", user_id: 13)
Dog.create(name: "Bailey", gender: "female", date_of_birth: "2013-10-03", size: "large", breed: "Labrador", color: ["beige"], is_hypoallergenic: "", is_sterilized: "true", photo: "http://www.repstatic.it/content/localirep/img/rep-firenze/2017/08/04/113053648-22f51c59-57d4-4d8c-9610-0360c8c530ab.jpg", user_id: 14)
Dog.create(name: "Maggie", gender: "female", date_of_birth: "2010-12-23", size: "large", breed: "Labrador", color: ["white"], is_hypoallergenic: "", is_sterilized: "false", photo: "http://animatch.ca/images/made/images/dogs/Maze18.6_800_570_imageswatermark.png_70_30_100_r_b_-20_-20_c1.jpg", user_id: 15)
Dog.create(name: "Lola", gender: "female", date_of_birth: "2011-04-23", size: "large", breed: "Labrador", color: ["white"], is_hypoallergenic: "", is_sterilized: "false", photo: "https://www.pets4homes.co.uk/images/classifieds/2015/03/23/916864/large/stunning-female-labrador-retriever-2-years-old-551053afa6683.JPG", user_id: 16)
Dog.create(name: "Buddy", gender: "male", date_of_birth: "2014-04-23", size: "large", breed: "Labrador", color: ["beige"], is_hypoallergenic: "", is_sterilized: "false", photo: "http://4.bp.blogspot.com/-2gg6M-dHfJU/Tg-fDZY5r1I/AAAAAAAALlM/v2IcgysOHKU/s1600/2976.jpg", user_id: 13)
Dog.create(name: "Lexy", gender: "female", date_of_birth: "2010-10-10", size: "small", breed: "Maltese", color: ["white"], is_hypoallergenic: "", is_sterilized: "true", photo: "https://bepuppyblog-4fef.kxcdn.com/wp-content/uploads/2017/04/cane-maltese.jpg", user_id: 13)
Dog.create(name: "Maya", gender: "female", date_of_birth: "2015-01-17", size: "small", breed: "Dachshund", color: ["black"], is_hypoallergenic: "", is_sterilized: "true", photo: "https://www.pets4homes.co.uk/images/breeds/57/large/ca02f0e6d0cc2bfa187de33b9565b61e.JPG")
Dog.create(name: "Daisy", gender: "female", date_of_birth: "2013-11-10", size: "small", breed: "Dachshund", color: ["brown"], is_hypoallergenic: "", is_sterilized: "false", photo: "https://ncvs.net.au/wp-content/uploads/dachsund.jpg", user_id: 12)
Dog.create(name: "Cooper", gender: "male", date_of_birth: "2016-12-28", size: "small", breed: "Dachshund", color: ["black", "brown"], is_hypoallergenic: "", is_sterilized: "false", photo: "https://storage.googleapis.com/nom-nom-now/images/breeds/dachshund.jpg", user_id: 13)
Dog.create(name: "Max", gender: "male", date_of_birth: "2012-04-25", size: "large", breed: "Doberman", color: ["black", "brown"], is_hypoallergenic: "", is_sterilized: "false", photo: "https://g77v3827gg2notadhhw9pew7-wpengine.netdna-ssl.com/wp-content/uploads/2018/02/doberman-pinscher-1098804_1920-1024x681.jpg", user_id: 14)
Dog.create(name: "Duke", gender: "male", date_of_birth: "2013-03-09", size: "large", breed: "Doberman", color: ["black", "brown"], is_hypoallergenic: "", is_sterilized: "false", photo: "http://dims.vetstreet.com/dims3/MMAH/crop/0x0%2B0%2B0/resize/645x380/quality/90/?url=http:%2F%2Fs3.amazonaws.com%2Fassets.prod.vetstreet.com%2Fcf%2Ff283009e8911e0a2380050568d634f%2Ffile%2FDoberman-2-645mk062111.jpg", user_id: 15)
Dog.create(name: "Lola", gender: "female", date_of_birth: "2017-08-09", size: "small", breed: "Chihuahua", color: ["black", "beige"], is_hypoallergenic: "", is_sterilized: "false", photo: "https://www.dogster.com/wp-content/uploads/2015/05/shutterstock_1741426311.jpg", user_id: 13)
Dog.create(name: "Bella", gender: "female", date_of_birth: "2018-12-19", size: "small", breed: "Chihuahua", color: ["white", "beige"], is_hypoallergenic: "", is_sterilized: "false", photo: "https://http2.mlstatic.com/chihuahua-cachorro-macho-D_NQ_NP_683900-MLA27566558302_062018-F.jpg", user_id: 14)
Dog.create(name: "Greg", gender: "male", date_of_birth: "2018-10-29", size: "small", breed: "Bulldog", color: ["white", "gold"], is_hypoallergenic: "", is_sterilized: "false", photo: "https://irp-cdn.multiscreensite.com/a123db97/dms3rep/multi/IMG_3571-03-08-17-05-55.JPG", user_id: 2)
Dog.create(name: "Augie", gender: "male", date_of_birth: "2015-07-12", size: "small", breed: "Bulldog", color: ["white", "beige"], is_hypoallergenic: "", is_sterilized: "false", photo: "https://www.pets4homes.co.uk/images/breeds/56/9b8f8158056fc5420a03372c9772678e.jpeg", user_id: 2)

puts 'Creating fake messages...'

Message.create( context: "Hello I'm interested in adopting a golden retriever from your shelter",  from_user_id: 1,  to_user_id: 2)
Message.create( context: "That is great, he is a very good dog",  from_user_id: 2,  to_user_id: 1)
Message.create( context: "wow that’s amazing",  from_user_id: 1,  to_user_id: 2)
Message.create( context: "Does the dog have all of his vaccine shots, I saw on the dog card that it specified that he in fact has gotten vaccine shots but I am asking just to be sure. Even if he doesn’t have vaccine shots I would love to adopt him",  from_user_id: 1,  to_user_id: 2)
Message.create( context: "Yes he is vaccinated, that’s great, as you see on the website our adoption times are from 9 - 5",  from_user_id: 2,  to_user_id: 1)
Message.create( context: "So when do you want to arrive to adopt Luna, also don’t forget you have to sign some paperwork",  from_user_id: 2,  to_user_id: 1)
Message.create( context: "Yes I would love to arrive tomorrow at 1 to see the dog and hopefully adopt him and I love paperwork",  from_user_id: 1,  to_user_id: 2)
Message.create( context: "I am not allergic to the dog so it shouldn’t be a problem",  from_user_id: 1,  to_user_id: 2)
Message.create( context: "wow this website is amazing so many people adopt dogs through this",  from_user_id: 2,  to_user_id:1)
Message.create( context: "Yes wow such an amazing website I agree",  from_user_id: 1,  to_user_id: 2)
Message.create( context: "Can you send me your whatsapp number so we can chat over the phone a bit.",  from_user_id: 1,  to_user_id: 2)
Message.create( context: "No need because the super capable team at findadog already thought of this and integrated a WhatsApp API into their platform, man they thought of everything.",  from_user_id: 2,  to_user_id:1)
Message.create( context: "wow you are right, they are so amazing, I will call you soon and maybe we could video chat so I can see the dog",  from_user_id: 1,  to_user_id: 2)
Message.create( context:  "yes great idea, so hear from you soon",  from_user_id: 2,  to_user_id:1)
Message.create( context: "yes I’m going to call you soon hear from you then",  from_user_id: 1,  to_user_id: 2)

puts 'Creating favorites...'

Favorite.create(user_id: 1, dog_id: 5)
Favorite.create(user_id: 1, dog_id: 7)
Favorite.create(user_id: 1, dog_id: 10)
Favorite.create(user_id: 1, dog_id: 15)
Favorite.create(user_id: 1, dog_id: 20)
Favorite.create(user_id: 1, dog_id: 22)
Favorite.create(user_id: 1, dog_id: 25)
Favorite.create(user_id: 1, dog_id: 30)

puts 'end...for the love of god'
