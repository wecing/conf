# for hoogle, both in cmdline and ghci
export PATH="$HOME/Library/Haskell/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

[[ -s ${HOME}/.bashrc ]] && source ${HOME}/.bashrc

# for OCaml
if [ -d "$HOME/.opam" ]; then
    . /Users/w/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
fi
