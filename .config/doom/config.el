(setq user-full-name    "Rasmus Buurman"
      user-mail-address "dev@rbuurman.de")

(setq-default
 delete-by-moving-to-trash t
 window-combination-resize t
 x-stretch-cursor t)

(setq
 undo-limit 80000000
 evil-want-fine-undo t
 auto-save-default t
 scroll-margin 2)

(global-subword-mode 1)

(setq
 ispell-personal-dictionary (expand-file-name "ispell-personal" doom-private-dir))

(after! ispell
  (setq
   ispell-program-name "hunspell"
   ispell-dictionary "en_US,de_DE")
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_US,de_DE"))

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(setq doom-gruvbox-dark-variant "hard")
(setq doom-theme 'doom-gruvbox)

(setq doom-font (font-spec :family "JetBrainsMono NF" :size 13)
      doom-big-font (font-spec :family "JetBrainsMono NF" :size 15)
      doom-variable-pitch-font (font-spec :family "Overpass")
      doom-unicode-font (font-spec :family "JuliaMono")
      doom-serif-font (font-spec :family "IBM Plex Mono" :size 13 :weight 'light))

(defvar required-fonts '("JetBrainsMono NF" "Overpass" "JuliaMono" "IBM Plex Mono"))

(defvar available-fonts
  (delete-dups (or (font-family-list)
                   (split-string (shell-command-to-string "fc-list : family")
                                 "[,\n]"))))

(defvar missing-fonts
  (delq nil (mapcar
             (lambda (font)
               (unless (delq nil (mapcar (lambda (f)
                                           (string-match-p (format "^%s$" font) f))
                                         available-fonts))
                 font))
             required-fonts)))

(if missing-fonts
    (pp-to-string
     `(unless noninteractive
        (add-hook! 'doom-init-ui-hook
          (run-at-time nil nil
                       (lambda ()
                         (message "%s missing the following fonts: %s"
                                  (propertize "Warning!" 'face '(bold warning))
                                  (mapconcat (lambda (font)
                                               (propertize font 'face 'font-lock-variable-name-face))
                                             ',missing-fonts
                                             ", "))
                         (sleep-for 0.5))))))
  ";; No missing fonts detected")

(setq +doom-dashboard-name "*Dashboard*")
(setq fancy-splash-image (expand-file-name "splash.svg" doom-private-dir))
(setq +doom-dashboard-functions '(doom-dashboard-widget-banner))

(setq display-line-numbers-type 'relative)

(after! company
  (setq
   company-idle-delay 0.5
   company-minimum-prefix-length 2
   company-show-numbers t)
  (add-hook 'evil-normal-state-entry-hook #'company-abort))

(set-company-backend!
  '(text-mode
    markdown-mode
    gfm-mode)
  '(:separate
    company-ispell
    company-files
    company-yasnippet))

(setq yas-triggers-in-field t)

(defun spawn-exwm (switch)
  (require 'exwm)
  (require 'exwm-config)
  (exwm-config-default))

(add-to-list 'command-switch-alist '("--exwm" . spawn-exwm))

(setq org-directory "~/org/")

(after! org
  (setq org-startup-with-latex-preview 1
        org-startup-with-inline-images 1
        org-hide-emphasis-markers 1
        line-spacing 3))

(use-package! org-modern
  :hook (org-mode . org-modern-mode))
(after! org (global-org-modern-mode))

(after! spell-fu
  (cl-pushnew 'org-modern-tag (alist-get 'org-mode +spell-excluded-faces-alist)))

(setq org-highlight-latex-and-related '(native script entities))
(after! org-src
  (add-to-list 'org-src-block-faces '("latex" (:inherit default :extend t))))

;(setq org-latex-preview-header
;      (concat
;       <<grab("latex-default-snippet-preamble")>>
;       "\n% Custom font\n\\usepackage{arev}\n\n"
;       <<grab("latex-maths-conveniences")>>))

(after! org
  (plist-put org-format-latex-options :background "Transparent")
  (plist-put org-format-latex-options :zoom 0.93))

(defun +org-refresh-latex-images-previews-h ()
  (dolist (buffer (doom-buffers-in-mode 'org-mode (buffer-list)))
    (with-current-buffer buffer
      (+org--toggle-inline-images-in-subtree (point-min) (point-max) 'refresh)
      (unless (eq org-latex-preview-default-process 'dvisvgm)
        (org-clear-latex-preview (point-min) (point-max))
        (org--latex-preview-region (point-min) (point-max))))))

(after! org
  (add-hook 'doom-load-theme-hook #'+org-refresh-latex-images-previews-h))

(use-package! org-fragtog
  :after org
  :hook (org-mode . org-fragtog-mode))

(use-package! org-appear
  :after org
  :hook (org-mode . org-appear-mode)
  :config
  (setq
   org-appear-autolinks nil
   org-appear-autoentities t
   org-appear-autosubmarkers t
   org-appear-autoemphasis t)
  (run-at-time nil nil #'org-appear--set-elements))

(use-package! org-roam
  :after org
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/braindump/")
  (org-roam-completion-everywhere)
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+hugo_base_dir: ~/braindump/hugo\n")
      :unnarrowed t)
     ("u" "unlisted" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)))
  :config
  (org-roam-setup))

;;(use-package! websocket
;;    :after org-roam)
;;
;;(use-package! org-roam-ui
;;    :after org-roam ;; or :after org
;;;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;;;         a hookable mode anymore, you're advised to pick something yourself
;;;;         if you don't care about startup time, use
;;    :hook (after-init . org-roam-ui-mode)
;;    :config
;;    (setq org-roam-ui-sync-theme t
;;          org-roam-ui-follow t
;;          org-roam-ui-update-on-save t
;;          org-roam-ui-open-on-start t))

(add-load-path! "/usr/share/emacs/site-lisp/mu4e")

(after! mu4e
  (setq sendmail-program (executable-find "msmtp")
	send-mail-function #'smtpmail-send-it
	message-sendmail-f-is-evil t
	message-sendmail-extra-arguments '("--read-envelope-from")
	message-send-mail-function #'message-send-mail-with-sendmail))

(set-email-account! "foo"
                    '((mu4e-sent-folder   . "/foo/Sent")
                      (mu4e-drafts-folder . "/foo/Drafts")
                      (mu4e-trash-folder  . "/foo/Trash")
                      (smtpmail-smtp-user . "foo@example.com")
                      (mu4e-compose-signature . ""))
                    t)

(setq mu4e-context-policy 'always-ask
      mu4e-compose-context-policy 'always-ask)

(setq rmh-elfeed-org-files (list (expand-file-name "elfeed.org" doom-private-dir)))
