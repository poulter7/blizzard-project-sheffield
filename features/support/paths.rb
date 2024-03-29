module NavigationHelpers
  def path_to(page_name)
   case page_name
     when /^the home(?: )?page$/
       root_path
     when /^(?:the) test(?:ing)(?: )?page$/
       listeningtest_index_path
     when /^sign up/
       new_user_registration_path
     when /^(?:the )sign in page/
       new_user_session_path
     when /^sign in$/
       new_user_session_path
     when /^(?:the )amazon page$/
       amazon_path
     when /^(?:the )users page$/
       users_path
     when /^the sign (.*) page$/
       case $1
          when 'out'
	     destroy_user_session_path
	  when 'in'
	     user_session_path
	  when 'up'
             new_user_session_path
       end
       # Add more mappings here.
       # Here is an example that pulls values out of the Regexp:
       #
       #   when /^(.*)'s profile page$/i
       #     user_profile_path(User.find_by_login($1))

    else
      begin
	page_name =~ /^the (.*) page$/
	path_components = $1.split(/\s+/)
	self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
	raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
	  "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end
World(NavigationHelpers)
