#!/bin/bash
# Copyright (c) 2013 Niggler
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Source: https://gist.github.com/Niggler/5426452

GITHUBUSER=${1:-"Niggler"}
curl https://api.github.com/users/$GITHUBUSER/repos 2>/dev/null | grep html_url | grep $GITHUBUSER/ | awk '{ gsub(/[",]/,""); print $2}' | while read x; do echo $x $(curl -I $x/blob/master/LICENSE 2>/dev/null | grep "404 Not Found" | wc -l); done | awk '$2>0 {print $1}' | awk -F/ '{print $NF}'
