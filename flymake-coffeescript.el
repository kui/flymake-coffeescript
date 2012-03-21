;; -*- coding:utf-8-unix; mode:emacs-lisp; -*-
;;
;; A flymake configure for CoffeeScript and Cakefile
;;
;; ## Sample
;; ```
;; ;; need [coffee-mode](https://github.com/defunkt/coffee-mode)
;; (when (and (require 'flymake nil t)
;;	      (require 'flymake-coffeescript nil t)
;;	      (executable-find flymake-coffeescript-command))
;;   (add-hook 'coffee-mode-hook 'flymake-coffeescript-load))
;; ```

(defvar flymake-coffeescript-command 
  "coffee"
  "coffeescript command")

(defvar flymake-cake-command 
  "cake"
  "cake command")

(defvar flymake-coffeescript-err-line-patterns
  '(("^\\([^[:space:]]*Error: In \\(.+?\\), .+? on line \\([0-9]+\\).*\\)$"
     2 3 nil 1)
    ("^\\([^[:space:]]*Error: .+? on line \\([0-9]+\\).*\\)$"
     nil 2 nil 1)
    ("^\\([^[:space:]]*Error: .+?\\)$"
     nil nil nil 1)
    ))

(defvar flymake-coffeescript-allowed-file-name-masks
  '(("\\.coffee\\'" flymake-coffeescript-init)
    ("Cakefile" flymake-cakefile-init)
    ))

(defun flymake-coffeescript-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name))))
    (list flymake-coffeescript-command (list "-p" local-file))))

(defun flymake-cakefile-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name))))
    (list flymake-cake-command (list ))))

(defun flymake-coffeescript-load ()
  (interactive)
  (set (make-local-variable 'flymake-allowed-file-name-masks) 
       flymake-coffeescript-allowed-file-name-masks)
  (set (make-local-variable 'flymake-err-line-patterns)
       flymake-coffeescript-err-line-patterns)
  (flymake-mode t))

(provide 'flymake-coffeescript)
