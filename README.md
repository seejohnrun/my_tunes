= Setup

_mytunes_ is a rails application which exposes your iTunes library to the network
via a somewhat nice interface.

== Syncing your Library (Mac-only right now)

    $ rake itunes:import_xml

== Starting the server (tested with ruby 1.9.2) 

    $ bundle install
    $ rails server
