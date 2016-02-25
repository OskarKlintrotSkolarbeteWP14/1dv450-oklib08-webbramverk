# 1dv450-webbramverk

## Assignment 2

### Vagrant setup
``` Powershell
> git clone https://github.com/OskarKlintrotSkolarbeteWP14/1dv450-oklib08-webbramverk.git
> cd 1dv450-oklib08-webbramverk
> git checkout tags/v2.0-beta
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
$ cd positioning_api
$ bundle install
```

Setup the database:
``` Bash
$ rake db:setup
```

Start the server:
``` Bash
$ rails server -b 0.0.0.0 # Server runs at http://localhost:8080
```

The Postman test-collection is located under `/positioning_api/test/positioning_api.json.postman_collection` and you also need to import the environment file that is located at `/positioning_api/test/positioning_api.postman_environment`. Before each run you need to restore the database so the seed is matching the tests:
``` Bash
$ rake db:setup
```
Before your first run you must run `POST auth`, mark the token and right-click on it and save it in the `positioning_api` as the `token`. If you can't get the correct menu when right-clicking then just choose the environment-menu and choose `Manage environment`, choose `positioning_api` and paste it as the `token`. Also note that the collection is meant to run in order, starting with getting the JWT and ending with deleting the current user and after that you must restore the database before continuing! On last note, for some very strange reason the very first tokens might be broken after initializing the vagrant box for the first time. Just get a new token and try again, but don't forget to restore the database!

## Deprecated instructions for assignment 1
### Vagrant setup
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

Setup the database:
``` Bash
$ rake db:schema:load
$ rake db:seed # Only if you want a seeded database to play around with,    
               # recommended if you want an admin-account to use
```

Start the server:
``` Bash
$ rails server -b 0.0.0.0 # Server runs at http://localhost:8080
```
