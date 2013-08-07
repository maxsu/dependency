#!/usr/bin/ruby


# Top Level Package Finder
# It might be a good idea to use dpkg-tools or dpkg-ruby

packages  = `dpkg --get-selections | grep -o '^[a-zA-Z0-9:.+-]*'`.split("\n")

packages.each { |p|

  puts p if `apt-rdepends -r --state-follow=Installed --state-show=Installed #{p}` == "#{p}\n"

 }
