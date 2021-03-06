module ApplicationHelper


    def full_title(page_title = '')
        base_title = "Ruby on Rails Tutorial Sample App"
        if page_title.empty?
            base_title
        else
        "#{page_title} | #{base_title}"
        end
    end

    ## grab avatar information of the user
    def gravatar_for(user)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase);
        gravatar_url = "https://secure.gravatar.com/avatar/{#gravatar_id}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end 
    
    def adminornot?
        if (current_user.admin?)
            "ADMIN - #{current_user.name}"
        else
            "#{current_user.name}"
        end
    end
    

    

end
