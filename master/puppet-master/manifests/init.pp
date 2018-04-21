#Delete main SVN directory 
file { 'remove-main-svn-directory':
		ensure => absent,
		path => '/etc/puppetlabs/puppet/modules/puppet-auto',
		recurse => true,
		purge => true,
		force => true,
	}

#Re-initialize SVN repo	
vcsrepo { '/etc/puppetlabs/puppet/modules/puppet-auto':
			ensure => latest,
			provider => git,
			source => 'git://github.com/Bibhuti93/puppet-auto.git',
			revision => 'master',
		}
		
#Create an agent instance
gce_instance { 'puppet-agent-1':
  ensure                   => present,
  description              => "Puppetagent1",
  zone 			   => 'us-central1-a',
  image 		   => 'projects/rhel-cloud/global/images/rhel-6-v20180401',
  tags			   => ['puppet-agent','agent'],
  startup_script           => 'puppet-enterprise.sh',
  block_for_startup_script => true,
  metadata                 => {
    'pe_role'    => 'agent',
    'pe_master'  => "$fqdn",
    'pe_version' => '3.8.7',
  }
}