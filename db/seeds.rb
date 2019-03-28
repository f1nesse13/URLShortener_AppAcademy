# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = User.create!(email: "abc@gmail.com")
b = User.create!(email: "def@gmail.com")
c = User.create!(email: "ghi@gmail.com")
d = User.create!(email: "jkl@gmail.com")

url1 = a.create_short_url("www.google.com")
url2 = a.create_short_url("www.reddit.com")
url3 = b.create_short_url("www.facebook.com")
url4 = c.create_short_url("www.twitter.com")
url5 = d.create_short_url("www.pintrest.com")

# Visit.record_visit!(a.id, url2.id)
Visit.record_visit!(a.id, url3.id)
Visit.record_visit!(a.id, url4.id)
Visit.record_visit!(a.id, url5.id)
Visit.record_visit!(b.id, url1.id)
Visit.record_visit!(b.id, url3.id)
Visit.record_visit!(b.id, url4.id)
# Visit.record_visit!(c.id, url2.id)
Visit.record_visit!(c.id, url5.id)
Visit.record_visit!(d.id, url1.id)
Visit.record_visit!(d.id, url4.id)
Visit.record_visit!(1, 3)
# Visit.record_visit!(1, 2)
Visit.record_visit!(1, 3)
Visit.record_visit!(2, 3)
Visit.record_visit!(2, 3)
# Visit.record_visit!(3, 2)
# Visit.record_visit!(1, 2)
Visit.record_visit!(2, 1)
# Visit.record_visit!(3, 2)
# Visit.record_visit!(1, 2)

TagTopic.create(topic: "News")
TagTopic.create(topic: "Sports")
TagTopic.create(topic: "Music")
TagTopic.create(topic: "Entertainment")

Tagging.create!(url_id: 1, tag_id: 1)
Tagging.create!(url_id: 2, tag_id: 1)
Tagging.create!(url_id: 1, tag_id: 2)
Tagging.create!(url_id: 1, tag_id: 3)
Tagging.create!(url_id: 2, tag_id: 2)
Tagging.create!(url_id: 3, tag_id: 1)
Tagging.create!(url_id: 4, tag_id: 4)
Tagging.create!(url_id: 5, tag_id: 4)
