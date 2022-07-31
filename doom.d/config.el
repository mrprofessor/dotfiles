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
;; (setq doom-font (font-spec :family "Cascadia code PL" :size 18))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-gruvbox)
(setq doom-theme 'doom-old-hope)
;; (load-theme 'srcery t)
;; (load-theme 'poet t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;(setq org-directory "~/org/")

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
  (setq org-hide-emphasis-markers t)    ; Asterisks and dashes for bullet lists are fine, but having an actual circular bullet, is just nice:
  (font-lock-add-keywords 'org-mode
                          '(("^ +\\([-*]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; (require 'org-bullets)
  ;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

  (setq org-agenda-skip-scheduled-if-done t
        org-priority-faces '((65 :foreground "#e45649")
                             (66 :foreground "#da8548")
                             (67 :foreground "#0098dd")))

  )

;; Org fancy priorities
(use-package! org-fancy-priorities
  :hook (org-mode . org-fancy-priorities-mode)
  :config (setq org-fancy-priorities-list '("⚡" "⬆" "☕")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Roam = Start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-roam-directory "~/dev/notes/org-roam")
(after! org-roam
  (map! :leader
        :prefix "n"
        :desc "org-roam" "l" #'org-roam
        :desc "org-roam-insert" "i" #'org-roam-insert
        :desc "org-roam-switch-to-buffer" "b" #'org-roam-switch-to-buffer
        :desc "org-roam-find-file" "f" #'org-roam-find-file
        :desc "org-roam-show-graph" "g" #'org-roam-show-graph
        :desc "org-roam-insert" "i" #'org-roam-insert
        :desc "org-roam-capture" "c" #'org-roam-capture))

(after! org-roam
  (setq org-roam-ref-capture-templates
        '(("r" "ref" plain (function org-roam-capture--get-point)
           "%?"
           :file-name "websites/${slug}"
           :head "#+TITLE: ${title}
    #+ROAM_KEY: ${ref}
    - source :: ${ref}"
           :unnarrowed t))))

;; Refactor to doom style
(use-package org-journal
  :bind
  ("C-c n j" . org-journal-new-entry)
  :custom
  (org-journal-dir "~/dev/notes/org-roam/")
  (org-journal-date-prefix "#+TITLE: ")
  (org-journal-file-format "%Y-%m-%d.org")
  (org-journal-date-format "%A, %d %B %Y"))
(setq org-journal-enable-agenda-integration t)

;; Refactor to doom style
(use-package deft
  :after org
  :bind
  ("C-c n d" . deft)
  :custom
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory "~/dev/notes/org-roam/"))

;; Graphviz + org-roam
(setq org-roam-graph-executable "/usr/local/bin/dot")

;; Org-roam-export
;; (defun my/org-roam--backlinks-list-with-content (file)
;;   (with-temp-buffer
;;     (if-let* ((backlinks (org-roam--get-backlinks file))
;;               (grouped-backlinks (--group-by (nth 0 it) backlinks)))
;;         (progn
;;           (insert (format "\n\n* %d Backlinks\n"
;;                           (length backlinks)))
;;           (dolist (group grouped-backlinks)
;;             (let ((file-from (car group))
;;                   (bls (cdr group)))
;;               (insert (format "** [[file:%s][%s]]\n"
;;                               file-from
;;                               (org-roam--get-title-or-slug file-from)))
;;               (dolist (backlink bls)
;;                 (pcase-let ((`(,file-from _ ,props) backlink))
;;                   (insert (s-trim (s-replace "\n" " " (plist-get props :content))))
;;                   (insert "\n\n")))))))
;;     (buffer-string)))

;; (defun my/org-export-preprocessor (backend)
;;   (let ((links (my/org-roam--backlinks-list-with-content (buffer-file-name))))
;;     (unless (string= links "")
;;       (save-excursion
;;         (goto-char (point-max))
;;         (insert (concat "\n* Backlinks\n") links)))))

;; (add-hook 'org-export-before-processing-hook 'my/org-export-preprocessor)

;(use-package org-roam-server
  ;:ensure t
  ;:config
  ;(setq org-roam-server-host "127.0.0.1"
        ;org-roam-server-port 2345
        ;org-roam-server-export-inline-images t
        ;org-roam-server-authenticate nil
        ;org-roam-server-network-label-truncate t
        ;org-roam-server-network-label-truncate-length 60
        ;org-roam-server-network-label-wrap-length 20))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Roam = END
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Orgcss
(setq org-html-htmlize-output-type 'css)

;; Italics
(add-hook! 'doom-load-theme-hook (custom-set-faces! '(font-lock-comment-face :slant italic)))


;; Escape special characters in org mode
;(defadvice! org-md-plain-text-unicode-a (orig-fn text info)
  ;"Locally rebind `org-html-special-string-regexps'"
  ;:around #'org-md-plain-text
  ;(let ((org-html-special-string-regexps
         ;'(("\\\\-" . "-")
           ;("---\\([^-]\\|$\\)" . "—\\1")
           ;("--\\([^-]\\|$\\)" . "–\\1")
           ;("\\.\\.\\." . "…")
           ;("->" . "→")
           ;("<-" . "←"))))
    ;(funcall orig-fn text (plist-put info :with-smart-quotes nil))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Whitespace mode = BEGIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (global-whitespace-mode)
;; (setq whitespace-style '(face tabs tab-mark trailing))
;; (custom-set-faces
;;  '(whitespace-tab ((t (:foreground "#636363")))))

;; (setq whitespace-display-mappings
;;   '((tab-mark 9 [124 9] [92 9])))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Whitespace mode = END
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Beacon mode = BEGIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (beacon-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Beacon mode = END
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq url-user-agent "User-Agent: Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7\n")

;; (url-user-agent)
