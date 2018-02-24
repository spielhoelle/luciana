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
]
category_list.each do |category|
  Category.create(title: category)
  puts "Category #{category} created"
end

photo_list = [
  [ 'Product photography #1', [ 'nice' ], 'product' ],
  [ 'New dress Summer 2018', [ 'spring' ], 'fashion' ],
  [ 'Go out with me tonight - andy shippton venture shooting', [ 'summer' ], 'fashion' ],
  [ 'CSS overflow: hidden', [ 'autumn' ], 'fashion' ],
  [ 'Rails with summer', [ 'summer', 'spring' ], 'fashion' ]
]
Photo.create(title: "avatar",
             caption: "I'm a freelance photographer  \r\rMy heart beats for ruby on fashion, summer and all the lovely technologies out there.",
             order: 99,
              image: open("http://placecage.com/#{rand(200..400)}/#{rand(250..300)}"),
            )

photo_list.each do |name, taglist, cat_list|
  p = Photo.create!(title: name,
              caption: "##Purpose \rSed odio dui. **Maecenas** sed diam eget risus varius blandit sit *amet* non magna. *Cum sociis* natoque penatibus et magnis dis parturient **montes**, nascetur ridiculus mus. Donec ullamcorper nulla non metus auctor fringilla.\r \r### Install fashion\r`fashion new app`\r\rConsectetur adipiscing elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Nullam id dolor id nibh ultricies vehicula ut id elit.\r\r```summer\rvar md = new MdEditor('#photo_content', {\r uploader: 'http://local.dev/Lab/MdEditor/app/upload.php',\r preview: true,\r images: [\r {id: '1.jpg', url: 'http://lorempicsum.com/futurama/200/200/1'},\r {id: '1.jpg', url: 'http://lorempicsum.com/futurama/200/200/2'},\r {id: '1.jpg', url: 'http://lorempicsum.com/futurama/200/200/3'},\r {id: '1.jpg', url: 'http://lorempicsum.com/futurama/200/200/4'}\r ]\r});\r```\r### Fix missing dependencies\rConsectetur adipiscing elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, Consectetur adipiscing elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, Consectetur adipiscing elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, Consectetur d\r``````````````````ig``````````````\rdedededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededededtrudedededededel_dededededededededededededededededededed}\rdedededededededededededededededededededededededededededed options)\r markdow markdow .render(text).html_safe\rend\r```",
              order: 99,
              image: open("http://placecage.com/#{rand(200..400)}/#{rand(250..300)}"),
              link: "http://www.annexationtrahsmetal.de",
              created_at: Time.now - rand(0..20000),
              updated_at: Time.now - rand(0..20000))

  p.tags = Tag.where('title IN (?)', taglist)
  p.categories = Category.where('title IN (?)', cat_list)
  puts "Photo #{name} created"
end

