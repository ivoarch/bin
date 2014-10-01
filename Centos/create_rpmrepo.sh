#!/bin/bash
# Create RPM Repository for Rhel/CentOS

ftpdir="$HOME/Dropbox/Public/rpmrepo"
releases=(el6 el7)

for release in "${releases[@]}"; do
    for dir in i386 x86_64 SRPMS; do
        pushd "${ftpdir}/${release}/${dir}" >/dev/null 2>&1
        createrepo -v .
        repoview .
        popd >/dev/null 2>&1
    done
done
