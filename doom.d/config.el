;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "mrprofessor"
      user-mail-address "kar.rudra008@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "OperatorMono Nerd Font" :size 18))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-one-light)
;; (setq doom-theme 'doom-vibrant)
;; (load-theme 'wombat t)
;; (load-theme 'srcery t)
;; (load-theme 'poet t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; EVIL tweaks
(setq evil-vsplit-window-right t)
(setq evil-split-window-below t)

;; Disable evil mode
;; https://github.com/hlissner/doom-emacs/blob/develop/modules/editor/evil/README.org#restoring-old-substitution-behavior-on-ss
(after! evil-snipe (evil-snipe-mode -1))

;; Disabling cursor movement when exiting insert mode
(setq evil-move-cursor-back nil)

;; GO LANG tweaks
(setq gofmt-before-save t)

;; Disable auto params creation
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

;; Default projectile search path
(setq projectile-discover-projects-in-search-path '("~/dev" "~/rocket"))

;; Open in split

;; (after! ivy
;;   (ivy-set-actions
;;    'ivy-switch-buffer
;;    '(("-" evil-split-buffer "split buffer")))
;;   (ivy-set-actions
;;    'counsel-find-file
;;    '(("-" evil-window-split "split horizontally")
;;      ("|" evil-window-vsplit "split vertically"))))
;;
;; (after! ivy
;;   (ivy-set-actions
;;    'ivy-switch-buffer
;;    '(("-" evil-window-split "split horizontally")
;;      ("|" evil-window-vsplit "split vertically")))
;;   (ivy-set-actions
;;    'counsel-find-file
;;    '(("-" evil-window-split "split horizontally")
;;      ("|" evil-window-vsplit "split vertically"))))

(setq ivy-read-action-function #'ivy-hydra-read-action)

;; ORG configs
(defun make-glitch-link (glitch_project_name)
  (browse-url (concat "https://glitch.com/~" glitch_project_name)))

(after! org
  (org-add-link-type "glitch" #'make-glitch-link)

                                        ; Hide emphasis markers
  (setq org-hide-emphasis-markers t)


                                        ; Asterisks and dashes for bullet lists are fine, but having an actual circular bullet, is just nice:
  (font-lock-add-keywords 'org-mode
                          '(("^ +\\([-*]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

  (setq org-agenda-skip-scheduled-if-done t
        org-priority-faces '((65 :foreground "#e45649")
                             (66 :foreground "#da8548")
                             (67 :foreground "#0098dd")))

  )
;; (let* ((variable-tuple (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
;;                              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
;;                              ((x-list-fonts "Verdana")         '(:font "Verdana"))
;;                              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
;;                              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
;;        (base-font-color     (face-foreground 'default nil 'default))
;;        (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

;;   (custom-theme-set-faces 'user
;;                           `(org-level-8 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-7 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-6 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-5 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
;;                           `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
;;                           `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
;;                           `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
;;                           `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))))

;; Org fancy priorities
(use-package! org-fancy-priorities
  :hook (org-mode . org-fancy-priorities-mode)
  :config (setq org-fancy-priorities-list '("⚡" "⬆" "☕")))

;; Org-roam
(after! org-roam
  (setq org-roam-directory "~/org-roam")
  (add-hook 'after-init-hook 'org-roam-mode)
  )

;; Poet theme specific
;; (add-hook 'text-mode-hook
;;            (lambda ()
;;              (variable-pitch-mode 1)))

;; (add-to-list
;;   'default-frame-alist'(ns-transparent-titlebar . t))
;; (add-to-list
;;   'default-frame-alist'(ns-appearance . light))

;; Orgcss
(setq org-html-htmlize-output-type 'css)
