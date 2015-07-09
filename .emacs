;J.P. Morais

;Modes
;(add-to-list 'load-path "~/.emacs.d/android-mode")
;(require 'android-mode)
;(custom-set-variables '(android-mode-sdk-dir "~/opt/android"))
;(add-to-list 'load-path "~/auto-complete")

;;;;;;;;;;;;;;
;;;;;;;;;Layout
;;;;;;;;;;;;;;
(split-window-right)
(global-set-key (kbd "M-w") 'other-window)
(global-set-key (kbd "M-<f4>") 'save-buffers-kill-terminal)
(load-theme 'bliss t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode 1)
(set-face-background 'hl-line "gray13")
(set-face-foreground 'hl-line "DodgerBlue1")
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

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



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("cd8820add96900e892d3e91bedb95b5deceefd98ee352d18ddad4ab4a98c96bf" default))))
