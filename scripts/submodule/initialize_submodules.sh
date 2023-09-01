git submodule update --init --checkout
git submodule foreach -q 'git checkout $(git config -f $toplevel/.gitmodules --get submodule.$name.branch) && git pull || :'
# git submodule foreach -q --recursive git pull
