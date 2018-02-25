User.create email: 'admin@example.com', password: 'password123', password_confirmation: 'password123'
puts "User admin@example.com created"

tag_list = [
  'summer',
  'winter',
  'spring',
  'autumn',
  'easy',
  'nice',
]
tag_list.each do |tag|
  Tag.create(title: tag)
  puts "tag #{tag} created"
end
category_list = [
  'fashion',
  'product',
  'analog',
]
category_list.each do |category|
  Category.create(title: category)
  puts "Category #{category} created"
end

photo_list = [
  [ 'Product photography #1', [ 'nice' ], 'product' ],
  [ 'Product photography #2', [ 'easy' ], 'product' ],
  [ 'Product photography #3', [ 'easy' ], 'product' ],
  [ 'New dress Summer 2018', [ 'spring' ], 'fashion' ],
  [ 'Go out with me tonight - andy shippton venture shooting', [ 'summer' ], 'fashion' ],
  [ 'CSS overflow: hidden', [ 'autumn', 'summer' ], 'fashion' ],
  [ 'Hey hidden', [ 'autumn' ], 'fashion' ],
  [ 'Analog', [ 'summer' ], 'analog' ],
  [ 'Stuff', [ 'winter' ], 'analog' ],
  [ 'Photo', [ 'nice' ], 'analog' ],
  [ 'Stuff', [ 'easy' ], 'analog' ]
]
Photo.create(title: "avatar",
             caption: "I'm a freelance photographer  \r\rMy heart beats for ruby on fashion, summer and all the lovely technologies out there.",
             order: 99,
             image: open("http://lorempixel.com/#{rand(200..400)}/#{rand(250..300)}"),
            )

photo_list.each_with_index do |photo, index|
  time = Time.now - rand(0..20000)
  p = Photo.create!(title: photo[0],
              caption: "",
              order: 99,
              in_slider: index < 3 ? index : nil,
              image: open("http://lorempixel.com/#{rand(1000..1200)}/#{rand(800..1000)}"),
              link: "http://www.annexationtrahsmetal.de",
              created_at: time,
              updated_at: time)

  p.tags = Tag.where('title IN (?)', photo[1])
  p.categories = Category.where('title IN (?)', photo[2])
  puts "Photo #{photo[0]} created"
end

