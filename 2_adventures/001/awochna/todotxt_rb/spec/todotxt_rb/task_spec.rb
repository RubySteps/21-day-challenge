require 'spec_helper'

describe TodotxtRb::Task do

  it "requires a string for initialization" do
    expect { TodotxtRb::Task.new() }.to raise_error
  end

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
      expect(simple_task.to_str).to eq "#{Date.today} #{simple_task_text}"
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

  let(:priority_task_text) { "(A) Clean desk" }
  let(:priority_task) { TodotxtRb::Task.new(priority_task_text) }

  describe "the task #{:priority_task_text}" do

    subject { priority_task }

    it { is_expected.to_not be_done }
    it { is_expected.to have_priority }

    specify "knows it's top priority" do
      expect(subject.priority).to eq 'A'
    end
  end

  let(:task_with_two_projects_text) { "Clean desk +cleandesk +cleanoffice" }
  let(:task_with_two_projects) { TodotxtRb::Task.new(task_with_two_projects_text) }

  describe "the task #{:task_with_two_projects_text}" do

    subject { task_with_two_projects }

    it { is_expected.to_not be_done }
    it { is_expected.to_not have_priority }
    it { is_expected.to have_project '+cleandesk' }
    it { is_expected.to have_project '+cleanoffice' }

    specify "should express it's projects as an array" do
      expect(subject.projects).to eq ['+cleandesk', '+cleanoffice']
    end
  end

  let(:task_with_two_contexts_text) { "Clean desk @work @computer" }
  let(:task_with_two_contexts) { TodotxtRb::Task.new(task_with_two_contexts_text) }

  describe "the task #{:task_with_two_contexts_text}" do

    subject { task_with_two_contexts }

    it { is_expected.to_not be_done }
    it { is_expected.to_not have_priority }
    it { is_expected.to have_context '@work' }
    it { is_expected.to have_context '@computer' }

    specify "should express it's contexts as an array" do
      expect(subject.contexts).to eq ['@work', '@computer']
    end
  end

  describe "can be built from attributes" do

    let(:string) { "Clean desk" }

    specify "to set priority" do
      task = TodotxtRb::Task.new(string, priority: 'A')
      expect(task.priority).to eq 'A'
    end

    specify "to set added date" do
      task = TodotxtRb::Task.new(string, added: '2015-04-28')
      expect(task.added).to eq Date.parse('2015-04-28')
    end

    specify "to set completed date" do
      task = TodotxtRb::Task.new(string, completed: '2015-04-28')
      expect(task.completed).to eq Date.parse('2015-04-28')
    end

    describe "completely" do
      let(:task) { TodotxtRb::Task.new(string, done: true, added: '2015-04-28',
                                 completed: '2015-04-29', priority: 'B',
                                 projects: ['+new-site'], contexts: ['@work']) }

      subject { task }

      it { is_expected.to be_done }
      it { is_expected.to have_priority }
      it { is_expected.to have_context '@work' }
      it { is_expected.to have_project '+new-site' }

      it "should have added date" do
        expect(subject.added).to eq Date.parse('2015-04-28')
      end

      it "should have completed date" do
        expect(subject.completed).to eq Date.parse('2015-04-29')
      end

      it "should have the 'B' priority" do
        expect(subject.priority).to eq 'B'
      end

      it "should print nicely" do
        expect(subject.to_str).to eq "x (B) 2015-04-29 2015-04-28 Clean desk @work +new-site"
      end
    end
  end

  describe "attributes override information from string" do
    
    let(:string) { "x (A) 2015-04-29 2015-04-28 Clean desk +cleandesk @work" }
    let(:task) { TodotxtRb::Task.new(string, done: false, added: '2015-05-01',
                                     completed: '2015-05-02', priority: 'B',
                                     projects: ['+cleanoffice'],
                                     contexts: ['@home']) }

    subject { task }

    it { is_expected.to_not be_done }
    it { is_expected.to have_priority }
    it { is_expected.to have_context '@home' }
    it { is_expected.to have_project '+cleanoffice' }

    it "should have new added date" do
      expect(subject.added).to eq Date.parse('2015-05-01')
    end

    it "should have completed date" do
      expect(subject.completed).to eq Date.parse('2015-05-02')
    end

    it "should have the 'B' priority" do
      expect(subject.priority).to eq 'B'
    end
  end
end
