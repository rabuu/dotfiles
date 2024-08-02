;;; init.el --- rabuu's Emacs configuration -*- lexical-binding: t -*-

;;; Commentary:
;; The init file of my Emacs configuration.
;; It automatically tangles the config.org file to a config.el and includes it.

;;; Code:

(load-file (expand-file-name "config.el" user-emacs-directory))

(provide 'init.el)
;;; init.el ends here
