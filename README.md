# ubuntu-packages
This repository contains Ubuntu packages for our purpose. A new package can be added/deleted. Currently, it is for 64-bit packages.

##Flow
For flow in details, see the architecture.md.
It tries to automate the adding a new package (as it involves more than one step) by providing update.sh.

##Changes in Ubuntu
To make ubuntu to pick-up from github, add following entry into `/etc/apt/source.list`

    deb <github repo path>/raw/<branch name>/<package group> amd64/

e.g.

For debs package group

deb https://github.com/JioCloudCompute/ubuntu-packages/raw/master/debs amd64/

It will pick-up the debs packages from the master branch of `JioCloudCompute/ubuntu-packages`.


