## Setup

_MyTunes_ is a rails application which exposes your iTunes library to the network
via a somewhat nice interface.

### Syncing your Library (Mac-only right now)

    $ rake itunes:import_xml

### Add a user for yourself (by hand)

    [CONSOLE] User.create(:email => 'seejohnrun@gmail.com', :password => 'xxx', :password_confirmation => 'xxx')

### Starting the server (tested with ruby 1.9.2) 

    $ bundle install
    $ rails server

---

MyTunes is licensed under the MIT license.
Contributions welcome.
