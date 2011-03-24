namespace :post do
  desc "Populate posts"
  task :populate => :environment do |row|
    [
      {:blogger =>"abc",:title =>"A", :body =>"Thank You"},
      {:blogger =>"def",:title =>"B", :body =>"Thank You Very much"},
      {:blogger =>"ghi",:title =>"C", :body =>"Danke"},
      {:blogger =>"jkl",:title =>"D", :body =>"Fielen Danke"},
      ].each do |attributes|
        Post.find_or_create_by_blogger_and_title_and_body(attributes)
      end
    end

    desc "latest 5 blog posts"
    task :latest_five => :environment do
      posts = Post.order("created_at DESC").limit(5)
      puts "Title" + "\t" + "Created at"
      posts.each do |post|
        puts post.title + "\t" + post.created_at.to_s
      end
    end

    desc "unpublish"
    task :unpublish => :environment do
      Post.where(:publish_status =>true).each do |post|
       post.update_attribute(:publish_status,false)
        # post.publish_status = false.to_s
        puts post.title + "\t" + post.publish_status.to_s
        end
    end

    desc "publish"
    task :publish => :environment do
      posts = Post.where(:publish_status => true)
      posts.each do |post|
        post.update_attribute(:publish_status,true)
        puts post.title + "\t" + post.publish_status.to_s
      end
    end
end