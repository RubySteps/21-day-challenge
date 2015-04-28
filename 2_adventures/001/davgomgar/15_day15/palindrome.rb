class String
  def palindrome?
    self.gsub(/[^\w]/,"").downcase.reverse == self.gsub(/[^\w]/,"").downcase unless self.nil?
  end
end
