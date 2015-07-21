# 004/14

004 started for me with the fact that when typing prose instead of code, something like 750words.com was much more comfortable than (say) Emacs, because the left margin meant I wasn’t typing right at the edge of the window.

The less-work-involved answer to that, of course, is to find the correct incantation to introduce margins to Emacs.  The one I tried initially did some heavy-duty formatting across the whole file and at one point seized up altogether.  What I discovered over the weekend:

```elisp
(setq-default left-margin-width 10 right-margin-width 8)
(set-window-buffer nil (current-buffer))
```

worked fine, and now the pages of type have a nice margin to one side. Occasionally there are interactions, and we (e.g.) lose the margins when we explicitly set TeX-mode for input, so let’s also have a function to bring back the margins later if we lose them:

```elisp
(defun my/margins ()
  "set default margins 10 / 8"
  (interactive)
  (setq-default left-margin-width 10 right-margin-width 8)
  (set-window-buffer nil (current-buffer))
)
```

And we can have arbitrary levels of indent within an org-mode file and it’s still perfectly fine.  It doesn’t export – org-mode’s export-to-html loses some of that definition, so an adaptation of 004 to export a *.org file to html might have merit.  Though that might more properly belong in an elisp 21-day-challenge project instead of a ruby one.  It is also the case my Emacs isn’t yet properly italicizing text marked up for /italics/, so further configuration tweaking is called for.
