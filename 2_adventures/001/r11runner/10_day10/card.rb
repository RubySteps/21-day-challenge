class Card
  include Mongoid::Document
  include Mongoid::TagsArentHard

  field :front_side, type: String
  field :back_side, type: String

  field :remarks, type: String

  field :correct_answers_in_a_row, type: Integer, default: 0
  field :next_time_to_ask, type: Time

  belongs_to :owner, class_name: "User"

  taggable_with :topics

  index :owner => 1

  scope :can_be_asked_now, -> {where("$or" => [{next_time_to_ask: nil}, {"next_time_to_ask" => {"$lte" => Time.now}}])}

  validates :front_side, length: { minimum: 1, maximum: 240 }
  validates :back_side, length: { minimum: 1, maximum: 40 }
  validates_uniqueness_of :front_side, :scope => [:owner], :case_sensitive => false, :message => "There is already another card with this front side."

  def has_remarks?
    remarks?
  end

  def add_correct_answer
    self.correct_answers_in_a_row += 1
    days_to_wait = FibonacciSequenceStartingWithZeroAtPositionOne.element_at correct_answers_in_a_row
    if days_to_wait == 0
      self.next_time_to_ask = earliest_next_time_to_ask
    else
      self.next_time_to_ask = days_to_wait.days.from_now
    end
    save
  end

  def add_wrong_answer
    self.correct_answers_in_a_row = 0
    self.next_time_to_ask = earliest_next_time_to_ask
    save
  end

  def self.samples
    [{:front_side => "How do you spell the word contin...s?\n(e. g. in the expression contin...s integration)", :back_side => "continuous", :topics => ["English", "spelling"]},
     {:front_side => "What is the plural form of knife?", :back_side => "knives", :topics => ["English", "plurals"]},
     {:front_side => "What is the plural form of index?", :back_side => "indices", :topics => ["English", "plurals"]}]
  end
        
  private
  def earliest_next_time_to_ask
    5.minutes.from_now
  end

end
