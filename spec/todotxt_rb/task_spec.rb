require 'spec_helper'

describe TodotxtRb::Task do

  let(:undone_task_text) { "2015-04-28 Clean yo' desk @work +cleanliness" }
  let(:simple_task_text) { "Clean desk" }
  let(:undone_task) { TodotxtRb::Task.new(undone_task_text) }
  let(:simple_task) { TodotxtRb::Task.new(simple_task_text) }

  describe "the task #{:undone_task_text}" do

    subject { undone_task }

    it { is_expected.to_not be_done }
    it { is_expected.to have_context('@work') }
    it { is_expected.to have_project('+cleanliness') }

    specify "should know it's added date" do
      expect(undone_task.added).to eq(Date.parse('2015-04-28'))
    end

    specify "should have a callable context" do
      expect(undone_task.contexts).to eq(['@work'])
    end

    specify "should have a callable project" do
      expect(undone_task.projects).to eq(['+cleanliness'])
    end
    
    specify "should not have a defined priority" do
      expect(undone_task.priority).to be_nil
    end

    specify "should not have a defined completed date" do
      expect(undone_task.completed).to be_nil
    end
  end

  describe "the task #{:simple_task_text}" do

    subject { simple_task }

    it { is_expected.to_not be_done }

    specify "should have an added date anyway" do
      expect(simple_task.added).to eq(Date.today)
    end
    
    specify "should not have a context" do
      expect(simple_task.contexts).to eq []
    end

    specify "should not have a project" do
      expect(simple_task.projects).to eq []
    end
    
    specify "should not have a priority" do
      expect(simple_task.priority).to be_nil
    end
    
    specify "should not have a completed date" do
      expect(simple_task.completed).to be_nil
    end
  end
end
