;;; init.el --- rabuu's Emacs configuration -*- lexical-binding: t -*-

;;; Commentary:
;; The init file of my Emacs configuration.
;; The real config is in config.el (which is generated from config.org).
;; This file just includes it.

;;; Code:

(load-file (expand-file-name "config.el" user-emacs-directory))

(provide 'init.el)
;;; init.el ends here
