if [[ $(uname -s) == "Darwin" ]]; then

  alias temps='sudo powermetrics --samplers smc'

  # ZIG 0.16.0
  export PATH="$PATH:$HOME/zig-x86_64-macos-0.16.0"
  # ZIG 0.15.1
  #export PATH="$PATH:$HOME/zig-x86_64-macos-0.15.1"
  # ZIG 0.13.0
  #export PATH="$PATH:$HOME/zig-macos-x86_64-0.13.0"

fi
