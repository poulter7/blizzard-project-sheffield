class Listeningtest < ActiveRecord::Base
  def sections
    Section.find_all_by_listeningtest_id(self.id)
  end

end
