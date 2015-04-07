require File.dirname(File.expand_path(__FILE__)) + '/test_helper'

describe Journal do

  context 'Testing the built in normalizers' do
    # default normalization [ :strip, :blank ]
    it { should normalize_attribute(:name) }
    it { should normalize_attribute(:name).from(' Physical Review ').to('Physical Review') }
    it { should normalize_attribute(:name).from('   ').to(nil) }

    # default attributes [ :country ]
    it { should normalize_attribute(:country) }
    it { should normalize_attribute(:country).from(' Canada ').to('Canada') }
    it { should normalize_attribute(:country).from('   ').to(nil) }
  end

end
