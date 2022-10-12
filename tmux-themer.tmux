#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
THEME_OPTION="@themer-theme"
DEFAULT_THEME="gruvbox"
MODE_OPTION="@themer-mode"
DEFAULT_MODE="dark"
SEPARATOR_OPTION="@themer-separator"
DEFAULT_SEPARATOR="base"
STATUS_PREFIX="@status-right-prefix"
DEFAULT_STATUS_RIGHT_PREFIX="#{@themer-right-start-blockB}"


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
  status=$(get_option "$STATUS_PREFIX" "$DEFAULT_STATUS_RIGHT_PREFIX") 
  theme_file="$(mktemp)"
 # set -goqF @themer-status-right-prefix "#{@themer-right-start-blockB}" 
  cat "${CURRENT_DIR}/${separator}-separator.tmuxtheme" >> "$theme_file"   
  cat "${CURRENT_DIR}/${theme}-${mode}.tmuxtheme" >> "$theme_file"
  cat "${CURRENT_DIR}/base.tmuxtheme" >> "$theme_file"
#  sed -i 's/set -goqF @themer-status-right-prefix \"#{@themer-right-start-blockB}\"/set -goqF @themer-status-right-prefix \"$status\"/g' $theme_file
  tmux source-file "$theme_file"
  rm "$theme_file"
}

main
