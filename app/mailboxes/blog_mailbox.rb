class BlogMailbox < ApplicationMailbox
  def process
    post = Post.create!(title: mail.subject, text: mail.parts.find{|p| p.content_type =~/text/ }.decode_body)
    # decoded_data = mail.parts.find{|p| p.content_type =~/image/ }.decode_body
    # File.open("#{Rails.root}/tmp/demo.jpg", 'wb'){|f| f.write(decoded_data) }
    # post.image.attach(io: File.open("#{Rails.root}/tmp/demo.jpg"), filename: 'file.jpg')
    # post.save!
  end
end
