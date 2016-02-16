# 1dv450-webbramverk

## Vagrant setup
``` Powershell
> vagrant plugin install vagrant-vbguest # Only if you use VBoxGuestAdditions
> vagrant up
> vagrant ssh # Make sure you have a ssh-client installed. If not, add
              # C:\Program Files\Git\usr\bin to your path to use Git's
```

If there is an issue with mounting the shared folders, try updating the guests VBoxGuestAdditions:
``` Bash
$ sudo ln -s /opt/VBoxGuestAdditions-5.0.14/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions #5.0.14 should match the VBoxGuestAdditions on your host
```

SSH into the guest (if prompted for password, it's `vagrant`) and install the dependencies:
``` Bash
$ cd Rails_API
$ bundle install
```

Set up the database:
``` Bash
$ rake db:schema:load
$ rake db:seed # Only if you want a seeded database to play around with,    
               # recommended if you want an admin-account to use
```

Start the server:
``` Bash
$ rails server -b 0.0.0.0 # Server runs at http://localhost:8080
```
