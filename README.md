# fpm-aufs - More-automated packaging with unionfs and fpm(1).

## What is it?

This is a script that makes packaging software easier.

Basic idea is to wrap "make install" process with an union
filesystem, and let it pick out actually installed files.
Then user can review that list, edit it appropriately, and
finally use fpm(1) to create a package (or packages).

The goal of fpm-aufs is to make packaging as easy as

    # ./configure && make && make install

Using fpm-aufs, above process changes to

    # ./configure && make && fpm-aufs -t deb -n name -v version -- make install

Or, if your build folder name is in \<name\>-\<version\> format,

    # ./configure && make && fpm-aufs -t deb -- make install

will do. If you want to do the installation interactively, do

    # ./configure && make && fpm-aufs -t deb
    fpm# make install
    fpm# ^D
    #

Any of these will generate ../\<name\>\<version\>\_\<arch\>.deb package.

You can also create RedHat RPMs, Ruby GEMs, etc in similar manner (this
is a feature of fpm(1)).

## Requirements
- You will need AUFS, expect(1), truncate(1), and fpm(1).
- You will need a root priviledge.

## TODO
- Use overlayfs in case aufs is missing (i.e., RedHat)
- Allow creating multiple packages by splitting file listing.
 - Also, add some way to keep track of how each file was grouped.
- If exists, set default packaging parameter from past package.
- Would be great if I can move around files by just editing a list of files.
