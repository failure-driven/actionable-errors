class BlogMailbox < ApplicationMailbox
  def process
    text = text_part(mail)
    post = Post.create!(title: mail.subject, text: text)
    decoded_image = decoded_image_part(mail)
    attach_image(post, decoded_image) if decoded_image
  end

  private

  def text_part(mail)
    mail.parts.find{|part| part.content_type =~ /text/ }&.decode_body || mail.decode_body
  end

  def decoded_image_part(mail)
    mail.parts.length > 1 && mail.parts.find{|part| part.content_type =~ /image/ }.decode_body
  end

  def attach_image(model, decoded_image)
    File.open("#{Rails.root}/tmp/demo.jpg", 'wb'){|f| f.write(decoded_image) }
    model.image.attach(io: File.open("#{Rails.root}/tmp/demo.jpg"), filename: 'file.jpg')
    model.save!
  end
end
