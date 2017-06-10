;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (yasnippet))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'package)

(require 'cl)
(add-to-list 'load-path
              "~/.emacs.d/elpa/yasnippet-0.11.0")
(require 'yasnippet)
(yas-global-mode 1)

(defun insert-from-file (filename)
      (let ((buf (current-buffer)))
        (save-excursion
           (goto-char (point-min))
             (when (search-forward "//includes")
                   (with-temp-buffer
                      (insert-file-contents filename)
                      (goto-char (point-min))
                      (search-forward "//includes_start")
                      (line-beginning-position)
                      (setq p1 (point))
                      (search-forward "//includes_finish")
                      (forward-line 0)
                      (setq p2 (point))
                      (append-to-buffer buf p1 p2)
                    )
             )
             (when (search-forward "//content")
                   (with-temp-buffer
                      (insert-file-contents filename)
                      (goto-char (point-min))
                      (search-forward "//content_start")
                      (line-beginning-position)
                      (setq p3 (point))
                      (search-forward "//content_finish")
                      (forward-line 0)
                      (setq p4 (point))
                      (append-to-buffer buf p3 p4)
                    )
             )
             
        )
       )
     )
  