class Course < ActiveRecord::Base
  enum status: [ :draft, :published ]
  
  belongs_to :user
  belongs_to :category
  
  alias_attribute :location, :city
  
  validates :title, :description, :price, :city, :date, :duration, presence: true
  validates_presence_of :category_id, numericality: { only_integer: true }
  
  scope :title_like, -> title { where(arel[:title].matches("%#{sanitize_sql_like(title)}%")) }

  private
  
  def self.arel
    Course.arel_table
  end
end
