require File.dirname(__FILE__) + '/test_helper'

describe Book do

  it { should normalize_attribute(:author).from(' Michael Deering ').to('Michael Deering') }

  it { should normalize_attribute(:price).from('$3,450.98').to(3450.98) }

  it { should normalize_attribute(:summary).from('Here is my summary that is a little to long').to('Here is m...') }

  it { should normalize_attribute(:title).from('pick up chicks with magic tricks').to('Pick Up Chicks With Magic Tricks')}

  context 'normalization should not interfear with other hooks and aliases on the attribute assignment' do

    before do
      @book = Book.create!(:title => 'Original Title')
    end

    it 'should still reflect that the attribute has been changed through the call to super' do
      lambda { @book.title = 'New Title' }.should change(@book, :title_changed?).from(false).to(true)
    end

  end

  context 'when another instance of the same saved record has been changed' do

    before do
      @book = Book.create!(:title => 'Original Title')
      @book2 = Book.find(@book.id)
      @book2.update_attributes(:title => 'New Title')
    end

    it "should reflect the change when the record is reloaded" do
      lambda { @book.reload }.should change(@book, :title).from('Original Title').to('New Title')
    end

  end

end