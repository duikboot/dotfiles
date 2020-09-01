; (describe *browser*)
; (mapcar #'url (buffer-list))

(in-package :nyxt)

(defvar *my-keymap* (make-keymap "my-map"))

(load-system :vlime)

(when (load-system :vlime)
  (define-command start-vlime ()
    "start vlime"
    (echo "Swank server started at port ~a" 4000)
    (vlime:main :port 4000 :backend :vlime-usocket)))


(define-key *my-keymap*
  "l" 'switch-buffer-next
  "h" 'switch-buffer-previous)

(define-mode my-mode ()
  "Dummy mode for the custom key bindings in `*my-keymap*'."
  ((keymap-scheme :initform (keymap:make-scheme
                             scheme:vi-normal *my-keymap*
                             scheme:vi-insert *my-keymap*))))

(define-configuration buffer
  ((default-modes (append '(vi-normal-mode vi-insert-mode) %slot-default))))
