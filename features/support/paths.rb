module NavigationHelpers
  def path_to(page_name)
   case page_name
     when /^the home(?: )?page$/
       root_path
     when /^(?:the) test(?:ing)(?: )?page$/
       section_index_path
     when /^sign up/
       new_user_registration_path
     when /^(?:the )sign in page/
       new_user_session_path
     when /^sign in$/
       new_user_session_path
     else
       raise "Can't find mapping from \"#{page_name}\" to a path."
     end
  end
end
World(NavigationHelpers)
