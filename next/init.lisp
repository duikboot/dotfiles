

(in-package :next-user)

(defvar *my-keymap* (make-keymap)
  "Keymap for `my-mode'.")


(defclass my-remote-interface (remote-interface)
  ((search-engines :initform
    '(("default"
       "https://duckduckgo.com/?q=~a"
       "https://duckduckgo.com/")
      ("yt"
       "https://www.youtube.com/results?search_query=~a"
       "https://www.youtube.com/")
      ("wiki"
       "https://en.wikipedia.org/w/index.php?search=~a"
       "https://en.wikipedia.org/")))))

(setf *remote-interface-class* 'my-remote-interface)


(define-mode my-mode ()
  "Dummy mode for the custom key bindings in `*my-keymap*'."
  ((keymap-schemes :initform (list :emacs *my-keymap*
                                   :vi-normal *my-keymap*))))


(defclass my-buffer (buffer)
  ((default-modes :initform
     (cons 'my-mode (get-default 'buffer 'default-modes)))))


(setf *buffer-class* 'my-buffer)

(add-to-default-list 'vi-normal-mode 'buffer 'default-modes)

(define-key :keymap *my-keymap* "+" #'zoom-in-page)
(define-key :keymap *my-keymap* "_" #'zoom-out-page)
