function v2g() {
  src=""        # required
  target=""     # optional (defaults to source file name)
  resolution="" # optional (defaults to source video resolution)
  fps=10        # optional (defaults to 10 fps -- helps drop frames)

  while [ $# -gt 0 ]; do
    if [[ $1 == "--help" ]]; then
      cat <<'EOF'

v2g — convert a video file to an optimized GIF

USAGE:
  v2g --src <video_file> [options]

REQUIRED:
  --src <file>           Source video file (e.g. demo.mp4)

OPTIONAL:
  --target <name>        Output file name (default: source name)
                         .gif extension is added automatically
  --resolution <WxH>     Output resolution (e.g. 800x400)
                         Default: original video resolution
  --fps <number>         Frames per second (default: 10)

EXAMPLES:
  v2g --src demo.mp4
  v2g --src demo.mp4 --target preview
  v2g --src demo.mp4 --resolution 800x400 --fps 30

NOTES:
  • Uses ffmpeg for conversion and gifsicle for optimization
  • Lower FPS and resolution greatly reduce file size

EOF
      return 0
    fi

    if [[ $1 == *"--"* ]]; then
      param="${1/--/}"
      declare $param="$2"
    fi
    shift
  done

  if [[ -z $src ]]; then
    echo -e "\n❌ Missing required argument: --src\nRun 'v2g --help' for usage.\n"
    return 1
  fi

  if [[ -z $target ]]; then
    target=$src
  fi

  basename=${target%.*}
  [[ ${#basename} = 0 ]] && basename=$target
  target="$basename.gif"

  if [[ -n $resolution ]]; then
    resolution="-s $resolution"
  fi

  echo "ffmpeg -i \"$src\" -pix_fmt rgb8 $resolution \"$target\" && gifsicle -O3 \"$target\" -o \"$target\""
  ffmpeg -i "$src" -pix_fmt rgb8 $resolution "$target" && gifsicle -O3 "$target" -o "$target"
  osascript -e "display notification \"$target successfully converted and saved\" with title \"v2g complete\""
}

