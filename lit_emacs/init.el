;; add MELPA package server
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq package-list '(use-package))

;; if not yet installed, install package use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))


;; load org package and our emacs-config.org file
(require 'org)
(org-babel-load-file "~/.emacs.d/config.org") 



;; _____________________________________________________________________________
;;
;; Custom/tangled stuff (!Do not edit)
;; _____________________________________________________________________________
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
	 '(go-mode evil-org evil-surround evil-collection use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
