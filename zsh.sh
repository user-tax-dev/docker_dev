#!/usr/bin/env bash
exec docker exec -it iuser-dev tmux -2 -u new-session -A -s root "cd ~/;exec zsh"
