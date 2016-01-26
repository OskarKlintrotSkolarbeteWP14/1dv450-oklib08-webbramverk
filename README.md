# 1dv450-webbramverk

## Vagrant setup
``` Powershell
> vagrant plugin install vagrant-vbguest
> vagrant up
> vagrant ssh
```

If there is an issue with mounting the shared folders, try this in the guest:
``` Bash
$ sudo ln -s /opt/VBoxGuestAdditions-5.0.14/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
```

SSH into the guest (if prompted for password, it's `vagrant`) and install the dependencies:
``` Bash
$ bundle install
```

Start the server:
``` Bash
$ rails server -b 0.0.0.0
```
