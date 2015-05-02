require 'spec_helper'

describe TodotxtRb::Task do

  let(:undone_task_text) { "2015-04-28 Clean yo' desk @work +cleanliness" }
  let(:undone_task) { TodotxtRb::Task.new(undone_task_text) }

  describe "the task #{:undone_task_text}" do

    subject { undone_task }

    it { is_expected.to_not be_done }
    it { is_expected.to have_context('@work') }
    it { is_expected.to have_project('+cleanliness') }

    specify "has an added date" do
      expect(undone_task.added).to eq Date.parse('2015-04-28')
    end

    specify "has a callable context" do
      expect(undone_task.contexts).to eq(['@work'])
    end

    specify "has a callable project" do
      expect(undone_task.projects).to eq(['+cleanliness'])
    end

    specify "does not have a defined priority" do
      expect(undone_task.priority).to be_nil
    end

    specify "does not have a defined completed date" do
      expect(undone_task.completed).to be_nil
    end

    specify "outputs using the original text" do
      expect(undone_task.to_str).to eq undone_task_text
    end
  end

  let(:simple_task_text) { "Clean desk" }
  let(:simple_task) { TodotxtRb::Task.new(simple_task_text) }

  describe "the task #{:simple_task_text}" do

    subject { simple_task }

    it { is_expected.to_not be_done }

    specify "has an added date anyway" do
      expect(simple_task.added).to eq Date.today
    end

    specify "does not have a context" do
      expect(simple_task.contexts).to eq []
    end

    specify "does not have a project" do
      expect(simple_task.projects).to eq []
    end

    specify "does not have a priority" do
      expect(simple_task.priority).to be_nil
    end

    specify "does not have a completed date" do
      expect(simple_task.completed).to be_nil
    end

    specify "outputs using the original text" do
      expect(simple_task.to_str).to eq simple_task_text
    end
  end

  let(:complete_task_text) { "x 2015-04-29 2015-04-28 Clean desk @work" }
  let(:complete_task) { TodotxtRb::Task.new(complete_task_text) }

  describe "the task #{:complete_task_text}" do

    subject { complete_task }

    it { is_expected.to be_done }
    it { is_expected.to have_context '@work' }

    specify "has an added date" do
      expect(subject.added).to eq Date.parse('2015-04-28')
    end

    specify "has a context" do
      expect(subject.contexts).to eq ['@work']
    end

    specify "does not have a project" do
      expect(subject.projects).to eq []
    end

    specify "does not have a priority" do
      expect(subject.priority).to be_nil
    end

    specify "has a completed date" do
      expect(subject.completed).to eq Date.parse('2015-04-29')
    end

    specify "outputs using the original text" do
      expect(subject.to_str).to eq complete_task_text
    end
  end
end
