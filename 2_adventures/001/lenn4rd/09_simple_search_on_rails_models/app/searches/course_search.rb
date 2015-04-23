class CourseSearch < Searchlight::Search
  search_on Course.includes(:category)
  
  searches :query, :title, :category_id, :location, :date, :status, :draft, :published
  
  
  def search_category_id
      search.joins(:category).where("categories.id = ?", category_id)
    end
  
  def search_draft
    search.draft
  end
  
  def search_query
    search.where(title: query)
  end
  
  def search_published
    search.published
  end
  
  def search_title
    search.where(title: title)
  end
end