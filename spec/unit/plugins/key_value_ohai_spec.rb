require 'spec_helper'

describe_ohai_plugin :Key_pair_ohai do
  let(:plugin_file) { 'files/plugins/key_pair_ohai.rb' }
  let('file_path') { 'files/default/key_pairs.txt'}

  it 'provides keyvalueohai' do
    plugin.run
    expect(plugin).to provides_attribute ('keyvalueohai')
  end

end
