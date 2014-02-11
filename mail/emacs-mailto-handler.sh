#!/bin/sh
# emacs-mailto-handler

elisp_expr="(compose-mail \"${1#mailto:}\")"

emacsclient -c --no-wait --eval "$elisp_expr" \
    '(set-window-dedicated-p (selected-window) t)'
