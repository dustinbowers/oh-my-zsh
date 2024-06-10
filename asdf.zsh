. $HOME/.asdf/asdf.sh

# if using oh-my-zsh, add `asdf` to your plugins list
# for example: plugins=(... asdf ...)

# if you are not using oh-my-zsh, add the following to your `.zshrc` file:

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
