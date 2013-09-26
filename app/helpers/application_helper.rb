module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  def check_admin(uid)
    if uid
      User.find(uid).admin
    else
      false
    end
  end

  def find_user_name(uid)
    User.find(uid).name
  end
end
