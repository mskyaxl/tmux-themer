#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
THEME_OPTION="@themer-theme"
DEFAULT_THEME="gruvbox"
MODE_OPTION="@themer-mode"
DEFAULT_MODE="dark"
SEPARATOR_OPTION="@themer-separator"
DEFAULT_SEPARATOR="base"


get_option() {
  local option="$1"
  local default_value="$2"
  local option_value
  option_value=$(tmux show-option -gqv "$option")
  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

main() {
  local theme
  theme=$(get_option "$THEME_OPTION" "$DEFAULT_THEME")
  local separator
  separator=$(get_option "$SEPARATOR_OPTION" "$DEFAULT_SEPARATOR")
  local mode
  mode=$(get_option "$MODE_OPTION" "$DEFAULT_MODE")
  
  tmux source-file "${CURRENT_DIR}/${separator}-separator.conf"
  tmux source-file "${CURRENT_DIR}/${theme}-${mode}.conf"
  tmux source-file "${CURRENT_DIR}/base.conf"
}

main
