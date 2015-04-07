require File.dirname(File.expand_path(__FILE__)) + '/test_helper'

describe Conference do

  context 'Testing the built in normalizers' do
    # default normalization [ :strip, :blank ]
    # default attributes [ :country ]
    it { should normalize_attribute(:country) }
    it { should normalize_attribute(:country).from(' Canada ').to('Canada') }
    it { should normalize_attribute(:country).from('   ').to(nil) }
  end

end
