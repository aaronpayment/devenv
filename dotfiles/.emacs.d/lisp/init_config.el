;; force delete server
( server-force-delete )

;; remove the menu bar
(menu-bar-mode -1)

;; disable backup
(setq backup-inhibited t)

;; disable autosave
(setq auto-save-default nil)

(show-paren-mode 1)

;; Highlight the current line
;;(global-hl-line-mode 1)

;; Highlight mark region
(transient-mark-mode t)

;; extra key bindings
(global-set-key [ ( meta g ) ] 'goto-line)
(global-set-key (kbd "C-x <left>") 'windmove-left)          ; move to left windnow
(global-set-key (kbd "C-x <right>") 'windmove-right)        ; move to right window
(global-set-key (kbd "C-x <up>") 'windmove-up)              ; move to upper window
(global-set-key (kbd "C-x <down>") 'windmove-down)          ; move to down window
