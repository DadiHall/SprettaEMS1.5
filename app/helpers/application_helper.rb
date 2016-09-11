module ApplicationHelper
  ##### For Tags#####
  def tag_cloud(tags, classes)
    max = 0
    tags.each do |t|
      if t.count.to_i > max
        max = t.count.to_i
      end
    end
    tags.each do |tag|
      index = tag.count.to_f / max * (classes.size - 1)
      yield(tag, classes[index.round])
    end
  end
  ##########################
  ####### Gravatars for Mailboxer########
  def gravatar_for(user, size = 30, title = user.name)
    image_tag gravatar_image_url(user.email, size: size), title: title, class: 'img-rounded'
  end
  ###############



  def random_charkick_id
    return 'chart-#'+(Random.rand(10000)).to_s
  end

  
end
