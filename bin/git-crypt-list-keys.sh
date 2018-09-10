#!/usr/bin/env bash

gpg_program="$(git config --get gpg.program)"
if [ -x "$gpg_program" ] ; then
	GPG="$gpg_program"
else
	GPG=gpg
fi

for key in .git-crypt/keys/default/0/* ; do $GPG -k $(echo $(basename $key) | sed -e 's/.gpg//') ; done ;
