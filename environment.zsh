export PATH="/opt/nvim-linux64/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"


# MacOS only
if [[ $(uname -s) == "Darwin" ]]; then

  export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

fi


# Rust libs
export LD_LIBRARY_PATH=$(rustc --print sysroot)/lib:$LD_LIBRARY_PATH
