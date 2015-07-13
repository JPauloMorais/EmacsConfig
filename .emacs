;J.P. Morais

;Modes
;(add-to-list 'load-path "~/.emacs.d/android-mode")
;(custom-set-variables '(android-mode-sdk-dir "~/opt/android"))
;(add-to-list 'load-path "~/auto-complete")

;;;;;;;;;;;;;;
;;;;;;;;;Layout
;;;;;;;;;;;;;;
(set-default 'truncate-lines nil)
(delete-other-windows)
(split-window-right)
(global-set-key (kbd "M-w") 'other-window)
(global-set-key (kbd "M-<f4>") 'save-buffers-kill-terminal)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode 1)
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))


;;;;;;;;;;;;;;
;;;;;;;;;Tema
;;;;;;;;;;;;;;
(set-face-background 'hl-line "#333333")
(add-to-list 'default-frame-alist '(foreground-color . "#ffffff"))
(add-to-list 'default-frame-alist '(background-color . "#0a0a0a"))
(set-face-foreground 'font-lock-type-face "#0000ff")
(set-face-foreground 'font-lock-variable-name-face "#63b8ff")
(set-face-foreground 'font-lock-string-face "#7cfc00")
(set-face-foreground 'font-lock-comment-face "#bebebe")

;;;;;;;;;;;;;;
;;;;;;;;;Edicao
;;;;;;;;;;;;;;
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-c") 'kill-ring-save)
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-DEL") 'backward-kill-sentence)
(global-set-key (kbd "S-<delete>") 'kill-whole-line)
(defun jp-copy-line ()
      (interactive)
      (let ((beg (line-beginning-position 1))
            (end (line-beginning-position 2)))
        (if (eq last-command 'quick-copy-line)
            (kill-append (buffer-substring beg end) (< end beg))
          (kill-new (buffer-substring beg end))))
      (beginning-of-line 1))
(global-set-key (kbd "C-S-c") 'jp-copy-line)
(defun jp-dup-line-down ()
  (interactive)
  (jp-copy-line)
  (next-line)
  (yank)
  (previous-line))
(global-set-key (kbd "M-<down>") 'jp-dup-line-down)
(defun jp-dup-line-up ()
  (interactive)
  (jp-copy-line)
  (previous-line)
  (yank))
(global-set-key (kbd "M-<up>") 'jp-dup-line-up)

;;;;;;;;;;;;;;
;;;;;;;;;;Saves
;;;;;;;;;;;;;;
(global-set-key (kbd "M-s") 'save-some-buffers)
(defun full-auto-save ()
  (interactive)
  (save-excursion
    (dolist (buf (buffer-list))
      (set-buffer buf)
      (if (and (buffer-file-name) (buffer-modified-p))
	  (basic-save-buffer)))))
(add-hook 'auto-save-hook 'full-auto-save)
(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

;;;;;;;;;;;;;;
;;;;;;;Arquivos
;;;;;;;;;;;;;;
(global-set-key (kbd "M-f") 'find-file)
(setq make-backup-files nil)
