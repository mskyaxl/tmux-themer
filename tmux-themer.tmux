#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
THEME_OPTION="@gruvbox-material_theme"
DEFAULT_THEME="dark"
CONTRAST_OPTION="@gruvbox-material_contrast"
DEFAULT_CONTRAST="medium"

get_option() {
#  local option="$1"
#  local default_value="$2"
#  local option_value
#  option_value=$(tmux show-option -gqv "$option")
#  if [ -z "$option_value" ]; then
#    echo "$default_value"
#  else
#    echo "$option_value"
#  fi
 echo "test"
}

main() {
#  local theme
#  theme=$(get_option "$THEME_OPTION" "$DEFAULT_THEME")
#  local contrast
#  contrast=$(get_option "$CONTRAST_OPTION" "$DEFAULT_CONTRAST")
  tmux source-file "$CURRENT_DIR/gruvbox.conf"
  tmux source-file "$CURRENT_DIR/base.conf"
}

main
