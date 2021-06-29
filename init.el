;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

;; add path 
(add-to-list 'load-path "~/.emacs.d/elisp")

;;; color theme
;; (add-to-list 'load-path "/opt/local/share/emacs/site-lisp/color-theme-6.6.0")
;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (color-theme-hober)))

;;; Choose Color theme Panda
(load-theme 'panda t)

;;; Assign newline-and-indent to C-m
(global-set-key (kbd "C-m") 'newline-and-indent)

;;; Assign Del to C-h
(keyboard-translate ?\C-h ?\C-?)

;;; Assign help to C-x ?
(define-key global-map (kbd "C-x ?") 'help-command)

;;; Assign other-window to C-t
(define-key global-map (kbd "C-t") 'other-window)


;; Enable mouse support
;; (source: https://stackoverflow.com/questions/5710334/how-can-i-get-mouse-selection-to-work-in-emacs-and-iterm2-on-mac)
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
			      (interactive)
			      (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
			      (interactive)
			      (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
  )


;; MELPA setting from https://melpa.org/#/getting-started
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


;; rainbow-delimiters in most programming mode
;; source: https://github.com/Fanael/rainbow-delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; entable auto save for remote files
(setq ange-ftp-make-backup-files 1)


;; enable python mode
;; (autoload 'python-mode "python-mode" "Python Mode." t)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; Configure auto-install.el
;; (when (require 'auto-install nil t)
;;   ;; where is the install directory
;;   (setq auto-install-directory "~/.emacs.d/elisp/")
;;   ;; obtain the list of elisp on EmacsWiki
;;   (auto-install-update-emacswiki-package-name t)
;;   ;;
;;   (auto-install-compatibility-setup))


;;; P122-129 候補選択型インタフェース──Anything
;; (auto-install-batch "anything")
;; (when (require 'anything nil t)
;;   (setq
;;    ;; 候補を表示するまでの時間。デフォルトは0.5
;;    anything-idle-delay 0.3
;;    ;; タイプして再描写するまでの時間。デフォルトは0.1
;;    anything-input-idle-delay 0.2
;;    ;; 候補の最大表示数。デフォルトは50
;;    anything-candidate-number-limit 100
;;    ;; 候補が多いときに体感速度を早くする
;;    anything-quick-update t
;;    ;; 候補選択ショートカットをアルファベットに
;;    anything-enable-shortcuts 'alphabet)

;;   (when (require 'anything-config nil t)
;;     ;; root権限でアクションを実行するときのコマンド
;;     ;; デフォルトは"su"
;;     (setq anything-su-or-sudo "sudo"))

;;   (require 'anything-match-plugin nil t)

;;   (when (and (executable-find "cmigemo")
;;              (require 'migemo nil t))
;;     (require 'anything-migemo nil t))

;;   (when (require 'anything-complete nil t)
;;     ;; lispシンボルの補完候補の再検索時間
;;     (anything-lisp-complete-symbol-set-timer 150))

;;   (require 'anything-show-completion nil t)

;;   (when (require 'auto-install nil t)
;;     (require 'anything-auto-install nil t))

;;   (when (require 'descbinds-anything nil t)
;;     ;; describe-bindingsをAnythingに置き換える
;;     (descbinds-anything-install)))

;; ▼要拡張機能インストール▼
;;; P127-128 過去の履歴からペースト──anything-show-kill-ring
;; M-yにanything-show-kill-ringを割り当てる
;;;(define-key global-map (kbd "M-y") 'anything-show-kill-ring)

;; ▼要拡張機能インストール▼
;;; P128-129 moccurを利用する──anything-c-moccur
;;(when (require 'anything-c-moccur nil t)
;;(setq
;; anything-c-moccur用 `anything-idle-delay'
;;   anything-c-moccur-anything-idle-delay 0.1
   ;; バッファの情報をハイライトする
;;   anything-c-moccur-higligt-info-line-flag t
   ;; 現在選択中の候補の位置をほかのwindowに表示する
;;   anything-c-moccur-enable-auto-look-flag t
   ;; 起動時にポイントの位置の単語を初期パターンにする
;;   anything-c-moccur-enable-initial-pattern t)
  ;; C-M-oにanything-c-moccur-occur-by-moccurを割り当てる
;;  (global-set-key (kbd "C-M-o") 'anything-c-moccur-occur-by-moccur))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2382f28b5c665b4a95de4822019b10a2d28bb05a2e5a2ef65e10780c9475d9a1" default))
 '(package-selected-packages '(julia-mode matlab-mode panda-theme rainbow-delimiters)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
