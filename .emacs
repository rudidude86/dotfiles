; add my lib path
(add-to-list 'load-path "~/.emacs.d/lib/")

(require 'whitespace)

;(require 'blank-mode)

;(setq whitespace-modes (cons 'php-mode whitespace-modes))
;(setq whitespace-style '(trailing tabs newline tab-mark newline-mark))

; Enable line numbers
(global-linum-mode t)
(setq linum-format "%4d \u2502")


; Highlight lines longer than 80 characters
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; Disable backup files and auto-saving

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

; disable menu bar (the 'File Edit Options...' text at the top)
(menu-bar-mode 0)
; disable the tool bar (the little toolbars icons in graphical mode)
(tool-bar-mode 0)

(setq-default indent-tabs-mode nil)
;(setq indent-line-function 'insert-tab)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq c-default-style "linux")

; Set default indentation for html to 4 spaces
(add-hook 'html-mode-hook
  (lambda()
    (setq sgml-basic-offset 4)
    (setq indent-tabs-mode t)))

;; Wrapper to split-window-vertically that loads next-in-line buffer into the other window
(defun split-window-vertically-load-other-buffer () (interactive)
  (split-window-vertically)
  (other-window 1)
  (switch-to-other-buffer)
  (other-window -1)
  )
(defun split-window-horizontally-load-other-buffer () (interactive)
  (split-window-horizontally)
  (other-window 1)
  (switch-to-other-buffer)
  (other-window -1)
  )

;; switches to next-in-line buffer
(defun switch-to-other-buffer () (interactive)
  (switch-to-buffer (other-buffer)))

(defun scroll-up-1-line () (interactive)
  (scroll-up 1))

(defun scroll-down-1-line () (interactive)
  (scroll-down 1))

(defun move-down-and-scroll-up-1-line () (interactive)
  (next-line)
  (scroll-up 1)
)

(defun move-up-and-scroll-down-1-line () (interactive)
  (previous-line)
  (scroll-down 1)
)










; this stuff is from http://prajwalaa.wordpress.com/2009/03/19/using-emacs-to-edit-php-files/
(require 'php-mode)

(defun clean-php-mode ()
(interactive)
(php-mode)
(setq c-basic-offset 4)
(setq indent-tabs-mode nil)
(setq fill-column 120)
(c-set-offset 'case-label '+)
(c-set-offset 'arglist-close 'c-lineup-arglist-operators))
(c-set-offset 'arglist-intro '+) ; for FAPI arrays and DBTNG
(c-set-offset 'arglist-cont-nonempty 'c-lineup-math) ; for DBTNG fields and values

;;; run php lint when the F5 key is pressed
;;; php lint
;(defun phplint-thisfile ()
;(interactive)
;(compile (format "php -l %s" (buffer-file-name))))
;(add-hook 'php-mode-hook
;'(lambda ()
;(local-set-key [f5] 'phplint-thisfile)))
;;; end of php lint


; mouse scrolling (works on XEmacs as well)
(autoload 'mwheel-install "mwheel" "Enable wheely mouse")
(mwheel-install)

(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-x2" 'split-window-vertically-load-other-buffer)
(global-set-key "\C-x3" 'split-window-horizontally-load-other-buffer)

;(define-key global-map [(f5)] 'compile)
(global-set-key "\M-[A" 'scroll-up-1-line)
(global-set-key "\M-[B" 'scroll-down-1-line)

(global-set-key "\C-[[6~" 'next-window)
(global-set-key "\C-[[5~" 'previous-window)

;(global-set-key "[B" 'scroll-up-1-line)
;(global-set-key "[A" 'scroll-down-1-line)

;; Color highlighting stuff
(defvar xemacs-p
  (string-match "XEmacs" emacs-version))

(if (not xemacs-p)
    (progn
      (global-font-lock-mode t)
       ; If using global-font-lock-mode, make control-L update colors
      (global-set-key "\C-l"
                      (function (lambda (arg) (interactive "P")
                                  (font-lock-fontify-block 100)
                                  (recenter arg))))))

(setq auto-mode-alist (append '(("\\.h$" . c++-mode)) auto-mode-alist))

;(autoload 'js-mode "javascript-mode" "JavaScript mode" t)
;(setq auto-mode-alist (append '(("\\.js$" . javascript-mode))
;                                 auto-mode-alist))
;
;(autoload 'python-mode "python-mode" "Python mode" t)
;(setq auto-mode-alist (append '(("\\.py$" . python-mode))
;                                 auto-mode-alist));

;(require 'js)


;; Taken from http://www.enigmacurry.com/2011/07/01/php-code-compliance-in-emacs

;(require 'php-mode)
;(require 'flymake)

;; Pear coding standards : http://pear.php.net/manual/en/standards.indenting.php
;(defun pear/php-mode-init ()
;  "Set some buffer-local variables."
;  (setq case-fold-search t)
;  (setq indent-tabs-mode nil)
;  (setq fill-column 78)
;  (setq c-basic-offset 4)
;  (c-set-offset 'arglist-cont 0)
;  (c-set-offset 'arglist-intro '+)
;  (c-set-offset 'case-label 2)
;  (c-set-offset 'arglist-close 0))
;(add-hook 'php-mode-hook 'pear/php-mode-init)


;(defun my-php-hook-function ()
;  (set (make-local-variable 'compile-command) (format "php_lint %s" (buffer-file-name))))
;(add-hook 'php-mode-hook 'my-php-hook-function)


;(defun flymake-php-init ()
;  "Use php and phpcs to check the syntax and code compliance of the current file."
;  (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
;     (local (file-relative-name temp (file-name-directory buffer-file-name))))
;    (list "php_lint" (list local))))
;

;;This is the error format for : php -f somefile.php -l 
;(add-to-list 'flymake-err-line-patterns
;  '("\(Parse\|Fatal\) error: +\(.?\) in \(.?\) on line \([0-9]+\)$" 3 4 nil 2))
;
;
;(add-to-list 'flymake-allowed-file-name-masks '("\.php$" flymake-php-init))
;(add-hook 'php-mode-hook (lambda () (flymake-mode 1)))


(put 'downcase-region 'disabled nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(whitespace-line ((t (:background "white" :foreground "black" :overline "red" :underline "red"))))
 '(whitespace-tab ((((class color) (background light)) (:background "red" :foreground "black")))))
