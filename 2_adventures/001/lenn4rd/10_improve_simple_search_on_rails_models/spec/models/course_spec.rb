require 'rails_helper'

describe Course do
  describe '.title_like' do
    it 'is not vulnerable to SQL injection' do
      course = create(:course, title: 'A random title')
      query  = "random%'); DELETE FROM courses; -- "
      
      expect(course).to be
      expect { Course.title_like(query) }.to_not change(Course, :count)
    end
  end
end
