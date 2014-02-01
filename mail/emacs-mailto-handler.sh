#!/bin/sh
# emacs-mailto-handler
# <http://permalink.gmane.org/gmane.mail.mu.general/974>

mailto=$1
mailto="mailto:${mailto#mailto:}"
mailto=$(printf '%s\n' "$mailto" | sed -e 's/[\"]/\\&/g')
elisp_expr="(mailto-compose-mail  \"$mailto\")"

# replace mu4e-compose-new/browse-url with mailto-compose-mail if problems

emacsclient -a "" -c -n --eval "$elisp_expr" \
    '(set-window-dedicated-p (selected-window) t)'
