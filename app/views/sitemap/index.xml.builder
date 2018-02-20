xml.instruct!

xml.urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9") do
  xml.url do
    xml.loc root_url
    xml.changefreq("hourly")
    xml.priority "1.0"
  end
  @photos.each do |photo|
    xml.url do
      xml.loc photo_url(photo)
      xml.changefreq("daily")
      xml.priority "0.8"
      xml.lastmod photo.updated_at.strftime("%Y-%m-%dT%H:%M:%S.%2N%:z")
    end
  end
end
