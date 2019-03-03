# encoding: utf-8
# copyright: 2018, The Authors

title 'sample section'

# you add controls here
control 'tmp-1.0' do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title 'Create /tmp directory'             # A human-readable title
  desc 'An optional description...'
  describe file('/tmp') do                  # The actual test
    it { should be_directory }
  end
end

control 'root-equivs' do
  impact 0.7
  title 'No users should be equivelent to root'
  desc 'A common way to get root privs under the radar is to add a extra user with UID 0'
  # If run in a docker container, UID 0 may show up twice as 'root'. DeDup to avoid a false fail.
  describe users.where(uid: 0).usernames.uniq do
    it { should eq ['root'] }
  end
end