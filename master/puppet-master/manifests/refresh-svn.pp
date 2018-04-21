vcsrepo { '/etc/puppetlabs/puppet/modules/'
			ensure => latest,
			provider => git,
			source => 'git://github.com/Bibhuti93/puppet-auto.git',
			revision => 'master',
		}