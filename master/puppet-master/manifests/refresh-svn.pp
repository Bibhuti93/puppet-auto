#Added a comment
#Aur ek comment
file { 'remove-main-svn-directory':
		ensure => absent,
		path => '/etc/puppetlabs/puppet/modules/puppet-auto',
		recurse => true,
		purge => true,
		force => true,
	}
	
vcsrepo { '/etc/puppetlabs/puppet/modules/puppet-auto':
			ensure => latest,
			provider => git,
			source => 'git://github.com/Bibhuti93/puppet-auto.git',
			revision => 'master',
		}