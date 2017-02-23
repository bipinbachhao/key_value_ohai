Ohai.plugin(:Keyvalueohai) do
  provides 'keyvalueohai'
  collect_data(:linux) do
    keyvalueohai Mash.new unless keyvalueohai
    # This will allow loading key pair values from a plain file containing key values
    # with assuming the location
    # I am too lazy i could use a template and define this path through attributes
    file = File.open('/etc/chef/ohai/plugins/key_pair_ohai.txt')
      file.each_line do |line|
        line = line.tr('"','')
        line.match(/(?<key>[^=]+)=(?<value>.+)/) { |match| keyvalueohai[match[:key]] = match[:value] }
      end
  end
end
