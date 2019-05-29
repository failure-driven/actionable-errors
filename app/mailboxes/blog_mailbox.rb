class BlogMailbox < ApplicationMailbox
  def process
    text = text_part(mail)
    post = Post.create!(title: mail.subject, text: text)
    decoded_image = decoded_image_part(mail)
    post.image.attach(io: StringIO.new(decoded_image), filename: 'the_file.jpg')
    post.save!
  end

  private

  def text_part(mail)
    mail.parts.find{|part| part.content_type =~ /text/ }&.decode_body || mail.decode_body
  end

  def decoded_image_part(mail)
    mail.parts.length > 1 && mail.parts.find{|part| part.content_type =~ /image/ }.decode_body
  end
end
