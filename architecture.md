#Ubuntu Repo for JioCloud Compute
This repository contains package build for JioCloud compute. It is structured as follows:

- jiocloudcompute: Packages of Jiocloud compute team like nova, glance
- jiocloud: Other packages of Jiocloud like ceph, neutron or required by us will come here.
- deb: Other debian packages.

To add package, following steps are required:

- Checkout to a new branch from master.
- Add package via the script update.sh as follows:

    source update.sh <package file path> [<path which is default to deb>]
- Run git commit.
- Push the branch and make sure that it will merge with master cleanly, else package cannot be located as it involves change Packages.gz file.
- Reviewer will review the packages and merge if everything is okay.

For example, to add nova kilo package into `jiocloudcompute`, do the following

    git checkout -b add_nova_kilo #From master branch
    source update.sh ~/Download/nova_kilo.deb jiocloudcompute
    git commit -m "Add nova kilo package"
    git push origin add_nova_kilo

After that, reviewer will merge this into master branch.

