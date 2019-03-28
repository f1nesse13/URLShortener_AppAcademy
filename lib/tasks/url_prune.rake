namespace :url_shortener do
  desc "Goes through the database and delete old records"
  task :prune_urls, [:mins] => [:environment] do |t, args|
    puts "Deleteing old record..."
    ShortenedURL.prune(args[:mins].to_i)
  end
end

# 0       0       1       3       * cd /home/f1nesse13/Documents/AppAcademy/projects/Rails/URLShortener && /home/f1nesse13/.rbenv/shims/rake RAILS_ENV=development url_shortener:prune_urls[500] automated rake task
