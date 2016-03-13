# 1dv450-webbramverk

## Assignment 3

### Rails API (Vagrant)
``` Powershell
> git clone https://github.com/OskarKlintrotSkolarbeteWP14/1dv450-oklib08-webbramverk.git
> cd 1dv450-oklib08-webbramverk
> git checkout tags/v3.0-beta
> vagrant plugin install vagrant-vbguest # Only if you use VBoxGuestAdditions
> vagrant up
> vagrant ssh # Make sure you have a ssh-client installed. If not, add
              # C:\Program Files\Git\usr\bin to your path to use Git's
```

If there is an issue with mounting the shared folders, try updating the guests VBoxGuestAdditions:
``` Bash
$ sudo ln -s /opt/VBoxGuestAdditions-5.0.14/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions #5.0.14 should match the VBoxGuestAdditions on your host
```

SSH into the guest (the password is `vagrant`) and install the dependencies:
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

### Angular-Node-Express App

This app needs npm and Node to be installed and up to date.

#### Setup

Install the dependencies for building the project:
```Powershell
> npm install -g grunt-cli bower nodemon
# Make sure it works
> grunt --version
> bower -v
> nodemon -v
```

If Grunt, Bower and Nodemon is not working, try to add `%AppData%\Roaming\npm` to your __user variable__ `PATH` and restart Windows.

Install the project dependencies:
```Powershell
> cd .\angularApp\server
> npm install
> cd ..\client
> npm install # This will take a lot of time!
> bower install
```

#### Development

Open two different terminals, one for Grunt and one for Node. Both will be running continuously.

Serve the Angular app with Grunt:
```Powershell
> cd .\angularApp\client
> npm start
```

Start the Node server hosting the Angular app that is being built with Grunt. In Windows:
```Powershell
> cd .\angularApp\server
> npm run dev
```

On Mac and Linux:
```Bash
$ cd .\angularApp\server
$ npm run dev:nix
```

The node server will be running at http://localhost:3000/.

### Production

The Angular app is built for production with Grunt:
```Powershell
> cd .\angularApp\client
> npm run build
```

Test it with Node. In Windows:
```Powershell
> cd .\angularApp\server
> npm start
```

On Mac and Linux:
```Bash
$ cd .\angularApp\server
$ npm run start:nix
```

The node server will be running at http://localhost:3000/.

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
