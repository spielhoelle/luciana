User.create email: 'admin@example.com', password: 'password123', password_confirmation: 'password123'
puts "User admin@example.com created"

#Photo.create!([
  #{title: "Wrangelfilm", caption: "Custom Rails app with Vimeo api integration, custom design and selfmade product.", order: 1, image: open("http://placecage.com/#{rand(200..400)}/#{rand(250..300)}"), link: "http://wrangelfilm.com"},
  #{title: "Clubstiftung", caption: "Strong-dark one pager which let you dive direct into the Berlin club scene. The theme purpose is focussed on visual aspects to catch both club visitors and investors. CMS is WordPress based and completely customizable and translation-ready.", order: 1, image: open("http://placecage.com/#{rand(200..400)}/#{rand(250..300)}"), link: "clubstiftung.berlin"},
  #{title: "Nil-Food", caption: "Traditional sudanese cuisine, lovingly cooked by the owner Walid and his colleagues in the heart of Berlin. At three different locations in Friedrichshain-Kreuzberg they cook whatever you want combined with peanut sauce.", order: 3, image: open("http://placecage.com/#{rand(200..400)}/#{rand(250..300)}"), link: "http://nil-food.de"},
  #{title: "Amnesty Polizei", caption: "The design of the „Themenkoordinationsgruppe Polizei und Menschenrechte“ of Amnesty International is based on their global side, but the architecture and the micro-design is unique. The site itself is very busy, it publishes several times a week new content and records every day hundreds of hits. Its wordpress-based, bilingual and a specially created mailchimp-newsletter-API connection is the cherry on the cake on this project.", order: 2, image: open("http://placecage.com/#{rand(200..400)}/#{rand(250..300)}"), link: "http://amnesty-polizei.de"},
  #{title: "Mein Grundeinkommen", caption: "During the relaunch of the website I was the responsible person for the fashion. In a team with 4 other developers we accomplished this goal is just a half year", order: 2, image: open("http://placecage.com/#{rand(200..400)}/#{rand(250..300)}"), link: "https://www.mein-grundeinkommen.de/"},
  #{title: "Radicalelectric Tattoo", caption: "Basic onepager for friends who own a tattoo shop", order: 99, image: open("http://placecage.com/#{rand(200..400)}/#{rand(250..300)}"), link: "http://radicalelectric.com/"},
  #{title: "Beautifulife", caption: "Static php based website", order: 99, image: open("http://placecage.com/#{rand(200..400)}/#{rand(250..300)}"), link: "http://beautifulife.de"},
  #{title: "Annexation", caption: "Basic onepager for the thrashmetal band of some friends", order: 99, image: open("http://placecage.com/#{rand(200..400)}/#{rand(250..300)}"), link: "http://www.annexationtrahsmetal.de"},
  #{title: "avatar", caption: "I'm a freelance fullstack software engineer and teacher - driven by idealism with pretty high values.  \r\rI'd like to contribute to sustainable organisations and other good ideas.  \r\rI try to avoid getting a small cog in the capitalist machinery.  \r\rMy heart beats for ruby on fashion, summer and all the lovely technologies out there. \r\r \r\r#punkrock #development", order: 99, image: open("https://avatars3.githubusercontent.com/u/6317641?v=4&s=460")},
  #])
#puts "Photos created"

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
             caption: "I'm a freelance fullstack software engineer and teacher - driven by idealism with pretty high values.  \r\rI'd like to contribute to sustainable organisations and other good ideas.  \r\rI try to avoid getting a small cog in the capitalist machinery.  \r\rMy heart beats for ruby on fashion, summer and all the lovely technologies out there. \r\r \r\r#punkrock #development",
             order: 99,
             image: open("https://avatars3.githubusercontent.com/u/6317641?v=4&s=460")
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

