# we expect the application to reside in /srv/www/{application}
app_short_name = release_path.split("/")[3]
rails_env      = node[:deploy][app_short_name][:rails_env]

########################################################################################################################
# Set environment variables
########################################################################################################################

::File.open("#{release_path}/.env.#{rails_env}", "w") do |f|
  node[:deploy][app_short_name][:environment_variables].each do |key, value|
    f.puts %Q(export #{key}=#{value.to_s.inspect})
  end
end
