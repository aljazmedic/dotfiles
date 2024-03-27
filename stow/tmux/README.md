# Tmux

## Help commands

In shell type
`tmux list-keys`
to get all the active lists

As tmux command
`list-keys` or 
`?`


| Copy Mode  | Action |
|---|---|
| C-Space              | send-keys -X begin-selection |
| C-a                  | send-keys -X start-of-line |
| C-b                  | send-keys -X cursor-left |
| C-c                  | send-keys -X cancel |
| C-e                  | send-keys -X end-of-line |
| C-f                  | send-keys -X cursor-right |
| C-g                  | send-keys -X clear-selection |
| C-k                  | send-keys -X copy-pipe-end-of-line-and-cancel |
| C-n                  | send-keys -X cursor-down |
| C-p                  | send-keys -X cursor-up |
| C-r                  | command-prompt -i -I "#{pane_search_string}" -T search -p "(search up)" { send-keys -X search-backward-incremental "%%" } |
| C-s                  | command-prompt -i -I "#{pane_search_string}" -T search -p "(search down)" { send-keys -X search-forward-incremental "%%" } |
| C-v                  | send-keys -X page-down |
| C-w                  | send-keys -X copy-pipe-and-cancel |
| Escape               | send-keys -X cancel |
| Space                | send-keys -X page-down |
| !                    | send-keys -X copy-pipe-and-cancel "tr -d '\n' | xclip -selection clipboard" |
| ,                    | send-keys -X jump-reverse |
| \;                   | send-keys -X jump-again |
| F                    | command-prompt -1 -p "(jump backward)" { send-keys -X jump-backward "%%" } |
| N                    | send-keys -X search-reverse |
| P                    | send-keys -X toggle-position |
| R                    | send-keys -X rectangle-toggle |
| T                    | command-prompt -1 -p "(jump to backward)" { send-keys -X jump-to-backward "%%" } |
| X                    | send-keys -X set-mark |
| Y                    | send-keys -X copy-pipe-and-cancel "tmux paste-buffer -p" |
| f                    | command-prompt -1 -p "(jump forward)" { send-keys -X jump-forward "%%" } |
| g                    | command-prompt -p "(goto line)" { send-keys -X goto-line "%%" } |
| n                    | send-keys -X search-again |
| q                    | send-keys -X cancel |
| r                    | send-keys -X refresh-from-pane |
| t                    | command-prompt -1 -p "(jump to forward)" { send-keys -X jump-to-forward "%%" } |
| y                    | send-keys -X copy-pipe-and-cancel "xclip -selection clipboard" |
| Home                 | send-keys -X start-of-line |
| End                  | send-keys -X end-of-line |
| NPage                | send-keys -X page-down |
| PPage                | send-keys -X page-up |
| Up                   | send-keys -X cursor-up |
| Down                 | send-keys -X cursor-down |
| Left                 | send-keys -X cursor-left |
| Right                | send-keys -X cursor-right |
| M-C-b                | send-keys -X previous-matching-bracket |
| M-C-f                | send-keys -X next-matching-bracket |
| M-1                  | command-prompt -N -I 1 -p (repeat) { send-keys -N "%%" } |
| M-2                  | command-prompt -N -I 2 -p (repeat) { send-keys -N "%%" } |
| M-3                  | command-prompt -N -I 3 -p (repeat) { send-keys -N "%%" } |
| M-4                  | command-prompt -N -I 4 -p (repeat) { send-keys -N "%%" } |
| M-5                  | command-prompt -N -I 5 -p (repeat) { send-keys -N "%%" } |
| M-6                  | command-prompt -N -I 6 -p (repeat) { send-keys -N "%%" } |
| M-7                  | command-prompt -N -I 7 -p (repeat) { send-keys -N "%%" } |
| M-8                  | command-prompt -N -I 8 -p (repeat) { send-keys -N "%%" } |
| M-9                  | command-prompt -N -I 9 -p (repeat) { send-keys -N "%%" } |
| M-<                  | send-keys -X history-top |
| M->                  | send-keys -X history-bottom |
| M-R                  | send-keys -X top-line |
| M-b                  | send-keys -X previous-word |
| M-f                  | send-keys -X next-word-end |
| M-m                  | send-keys -X back-to-indentation |
| M-r                  | send-keys -X middle-line |
| M-v                  | send-keys -X page-up |
| M-w                  | send-keys -X copy-pipe-and-cancel |
| M-x                  | send-keys -X jump-to-mark |
| M-y                  | send-keys -X copy-pipe-and-cancel "xclip -selection clipboard; tmux paste-buffer -p" |
| "M-{"                | send-keys -X previous-paragraph |
| "M-}"                | send-keys -X next-paragraph |
| M-Up                 | send-keys -X halfpage-up |
| M-Down               | send-keys -X halfpage-down |
| C-Up                 | send-keys -X scroll-up |
| C-Down               | send-keys -X scroll-down |


| Copy mode vi | Action |
| --- | --- |
| C-b                  | send-keys -X page-up |
| C-c                  | send-keys -X cancel |
| C-d                  | send-keys -X halfpage-down |
| C-e                  | send-keys -X scroll-down |
| C-f                  | send-keys -X page-down |
| C-h                  | send-keys -X cursor-left |
| C-j                  | send-keys -X copy-pipe-and-cancel |
| Enter                | send-keys -X copy-pipe-and-cancel |
| C-u                  | send-keys -X halfpage-up |
| C-v                  | send-keys -X rectangle-toggle |
| C-y                  | send-keys -X scroll-up |
| Escape               | send-keys -X clear-selection |
| Space                | send-keys -X begin-selection |
| !                    | send-keys -X copy-pipe-and-cancel "tr -d '\n' | xclip -selection clipboard" |
| \#                   | send-keys -FX search-backward "#{copy_cursor_word}" |
| \$                   | send-keys -X end-of-line |
| \%                   | send-keys -X next-matching-bracket |
| *                    | send-keys -FX search-forward "#{copy_cursor_word}" |
| ,                    | send-keys -X jump-reverse |
| /                    | command-prompt -T search -p "(search down)" { send-keys -X search-forward "%%" } |
| 0                    | send-keys -X start-of-line |
| 1                    | command-prompt -N -I 1 -p (repeat) { send-keys -N "%%" } |
| 2                    | command-prompt -N -I 2 -p (repeat) { send-keys -N "%%" } |
| 3                    | command-prompt -N -I 3 -p (repeat) { send-keys -N "%%" } |
| 4                    | command-prompt -N -I 4 -p (repeat) { send-keys -N "%%" } |
| 5                    | command-prompt -N -I 5 -p (repeat) { send-keys -N "%%" } |
| 6                    | command-prompt -N -I 6 -p (repeat) { send-keys -N "%%" } |
| 7                    | command-prompt -N -I 7 -p (repeat) { send-keys -N "%%" } |
| 8                    | command-prompt -N -I 8 -p (repeat) { send-keys -N "%%" } |
| 9                    | command-prompt -N -I 9 -p (repeat) { send-keys -N "%%" } |
| :                    | command-prompt -p "(goto line)" { send-keys -X goto-line "%%" } |
| \;                   | send-keys -X jump-again |
| ?                    | command-prompt -T search -p "(search up)" { send-keys -X search-backward "%%" } |
| A                    | send-keys -X append-selection-and-cancel |
| B                    | send-keys -X previous-space |
| D                    | send-keys -X copy-pipe-end-of-line-and-cancel |
| E                    | send-keys -X next-space-end |
| F                    | command-prompt -1 -p "(jump backward)" { send-keys -X jump-backward "%%" } |
| G                    | send-keys -X history-bottom |
| H                    | send-keys -X top-line |
| J                    | send-keys -X scroll-down |
| K                    | send-keys -X scroll-up |
| L                    | send-keys -X bottom-line |
| M                    | send-keys -X middle-line |
| N                    | send-keys -X search-reverse |
| P                    | send-keys -X toggle-position |
| T                    | command-prompt -1 -p "(jump to backward)" { send-keys -X jump-to-backward "%%" } |
| V                    | send-keys -X select-line |
| W                    | send-keys -X next-space |
| X                    | send-keys -X set-mark |
| Y                    | send-keys -X copy-pipe-and-cancel "tmux paste-buffer -p" |
| ^                    | send-keys -X back-to-indentation |
| b                    | send-keys -X previous-word |
| e                    | send-keys -X next-word-end |
| f                    | command-prompt -1 -p "(jump forward)" { send-keys -X jump-forward "%%" } |
| g                    | send-keys -X history-top |
| h                    | send-keys -X cursor-left |
| j                    | send-keys -X cursor-down |
| k                    | send-keys -X cursor-up |
| l                    | send-keys -X cursor-right |
| n                    | send-keys -X search-again |
| o                    | send-keys -X other-end |
| q                    | send-keys -X cancel |
| r                    | send-keys -X refresh-from-pane |
| t                    | command-prompt -1 -p "(jump to forward)" { send-keys -X jump-to-forward "%%" } |
| v                    | send-keys -X rectangle-toggle |
| w                    | send-keys -X next-word |
| y                    | send-keys -X copy-pipe-and-cancel "xclip -selection clipboard" |
| \{                   | send-keys -X previous-paragraph |
| \}                   | send-keys -X next-paragraph |
| BSpace               | send-keys -X cursor-left |
| NPage                | send-keys -X page-down |
| PPage                | send-keys -X page-up |
| Up                   | send-keys -X cursor-up |
| Down                 | send-keys -X cursor-down |
| Left                 | send-keys -X cursor-left |
| Right                | send-keys -X cursor-right |
| M-x                  | send-keys -X jump-to-mark |
| M-y                  | send-keys -X copy-pipe-and-cancel "xclip -selection clipboard; tmux paste-buffer -p" |
| C-Up                 | send-keys -X scroll-up |
| C-Down               | send-keys -X scroll-down |


| Prefix mode |Action |
|---|---|
| C-a                  | send-prefix |
| Enter                | next-window |
| C-n                  | next-window |
| C-o                  | rotate-window |
| C-p                  | previous-window |
| C-r                  | run-shell /home/aljaz/.config/tmux/plugins/tmux-resurrect/scripts/restore.sh |
| C-s                  | run-shell /home/aljaz/.config/tmux/plugins/tmux-resurrect/scripts/save.sh |
| C-z                  | suspend-client |
| Space                | next-layout |
| !                    | break-pane |
| \"                   | split-window |
| \#                   | list-buffers |
| \$                   | command-prompt -I "#S" { rename-session "%%" } |
| \%                   | split-window -h |
| &                    | confirm-before -p "kill-window #W? (y/n)" kill-window |
| \'                   | command-prompt -T window-target -p index { select-window -t ":%%" } |
| (                    | switch-client -p |
| )                    | switch-client -n |
| ,                    | command-prompt -I "#W" { rename-window "%%" } |
| -                    | delete-buffer |
| .                    | command-prompt -T target { move-window -t "%%" } |
| /                    | command-prompt -k -p key { list-keys -1N "%%" } |
| 0                    | select-window -t :=0 |
| 1                    | select-window -t :=1 |
| 2                    | select-window -t :=2 |
| 3                    | select-window -t :=3 |
| 4                    | select-window -t :=4 |
| 5                    | select-window -t :=5 |
| 6                    | select-window -t :=6 |
| 7                    | select-window -t :=7 |
| 8                    | select-window -t :=8 |
| 9                    | select-window -t :=9 |
| :                    | command-prompt |
| \;                   | last-pane |
| =                    | choose-buffer -Z |
| ?                    | list-keys -N |
| C                    | customize-mode -Z |
| D                    | choose-client -Z |
| E                    | select-layout -E |
| I                    | run-shell /home/aljaz/.config/tmux/plugins/tpm/bindings/install_plugins |
| L                    | switch-client -l |
| M                    | select-pane -M |
| R                    | source-file /home/aljaz/.config/tmux/tmux.conf \; display-message "tmux.conf reloaded." |
| U                    | run-shell /home/aljaz/.config/tmux/plugins/tpm/bindings/update_plugins |
| Y                    | run-shell -b /home/aljaz/.config/tmux/plugins/tmux-yank/scripts/copy_pane_pwd.sh |
| a                    | last-window |
| c                    | new-window |
| d                    | detach-client |
| f                    | command-prompt { find-window -Z "%%" } |
| i                    | display-message |
| l                    | last-window |
| m                    | select-pane -m |
| n                    | next-window |
| o                    | select-pane -t :.+ |
| p                    | previous-window |
| q                    | display-panes |
| r                    | refresh-client |
| s                    | split-window -v -c "#{pane_current_path}" |
| t                    | clock-mode |
| v                    | split-window -h -c "#{pane_current_path}" |
| w                    | choose-tree -Zw |
| x                    | confirm-before -p "kill-pane #P? (y/n)" kill-pane |
| y                    | run-shell -b /home/aljaz/.config/tmux/plugins/tmux-yank/scripts/copy_line.sh |
| z                    | resize-pane -Z |
| \{                   | swap-pane -U |
| \}                   | swap-pane -D |
| \~                   | show-messages |
| BSpace               | previous-window |
| DC                   | refresh-client -c |
| PPage                | copy-mode -u |
| Up                   | select-pane -U |
| Down                 | select-pane -D |
| Left                 | select-pane -L |
| Right                | select-pane -R |
| đ                    | paste-buffer |
| š                    | copy-mode |
| M-1                  | select-layout even-horizontal |
| M-2                  | select-layout even-vertical |
| M-3                  | select-layout main-horizontal |
| M-4                  | select-layout main-vertical |
| M-5                  | select-layout tiled |
| M-c                  | attach-session -c "#{pane_current_path}" |
| M-n                  | next-window -a |
| M-o                  | rotate-window -D |
| M-p                  | previous-window -a |
| M-u                  | run-shell /home/aljaz/.config/tmux/plugins/tpm/bindings/clean_plugins |
| M-Up                 | resize-pane -U 5 |
| M-Down               | resize-pane -D 5 |
| M-Left               | resize-pane -L 5 |
| M-Right              | resize-pane -R 5 |
| C-Up                 | resize-pane -U |
| C-Down               | resize-pane -D |
| C-Left               | resize-pane -L |
| C-Right              | resize-pane -R |
| S-Up                 | refresh-client -U 10 |
| S-Down               | refresh-client -D 10 |
| S-Left               | refresh-client -L 10 |
| S-Right              | refresh-client -R 10 |
| Root ("Direct") keybinds | Action |
|---|---|
| M-H                  | resize-pane -L 5 |
| M-J                  | resize-pane -D 5 |
| M-K                  | resize-pane -U 5 |
| M-L                  | resize-pane -R 5 |
| M-h                  | select-pane -L |
| M-j                  | select-pane -D |
| M-k                  | select-pane -U |
| M-l                  | select-pane -R |
