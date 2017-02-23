#!/bin/bash
# menu-to-cli.sh
# Based on an idea by Albert Reiner.

CLI_PROGRAM="${1}"
ARGUMENTS="${2}"
OUTFILE="${HOME}/.tmuxinator/${CLI_PROGRAM}.yml"   # Name of the file to generate

# -----------------------------------------------------------
# 'Here document' containing the body of the config file
# Generated only when one does not already exist
if [[ -e ${OUTFILE} ]]; then
    # All space indented in the here document would be reflected in the
    # resulting file, therefore, indentation needs to be eliminated for that block
    (
    cat << EOF
name: ${CLI_PROGRAM}
root: ~/
windows:
  - cli:
      layout: main-vertical
      panes:
        - ${CLI_PROGRAM} ${ARGUMENTS}
EOF
        ) > "${OUTFILE}"
    notify-send "Success" "Successfully created:\n${OUTFILE}"
fi

terminator -T "${CLI_PROGRAM}" -e "tmuxinator start ${CLI_PROGRAM}" || \
notify-send "ERROR" "Problem in running ${CLI_PROGRAM} in the terminal\n\
You can call the command manually with\n\
${CLI_PROGRAM} ${ARGUMENTS}\n\
You can also report this error to us using 'whisperback'"
