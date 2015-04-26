class CourseSearch < Searchlight::Search
  search_on Course.includes(:category)
  
  searches :query, :title, :category_id, :location, :date, :published
  
  
  def initialize(*args)
    super
    self.published ||= true
  end
  
  
  def search_category_id
      search.joins(:category).where("categories.id = ?", category_id)
    end
  
  def search_location
    search.city(query)
  end
  
  def search_published
    search.published
  end
  
  def search_query
    search.title_like(query)
  end
  
  def search_title
    search.title_like(title)
  end
end