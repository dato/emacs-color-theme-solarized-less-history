### A smaller repo for _emacs-color-theme-solarized_

Greg Pfeil’s repository at [sellout/emacs-color-theme-solarized][1] is
very big, 24 MB only for a few elisp files. This is because it was
forked from the [upstream Solarized theme repository][2], which is
itself very big. At some point, Greg removed all non-Emacs files from
his repo, but since they are in past commits, they are downloaded each
time the repository is cloned. (Very annoying when playing with el-get.)

This fork is a cleaned-up, smaller version of Greg’s repository: only
the history for the Emacs files is included, rather the whole history of
_solarized_. The scripts I used to rewrite its history are above. I
haven’t contacted Greg about replacing his repo with mine because I
haven’t decided yet whether it’s a good idea. Gains are high for every
new download (particularly on slow connections), but every contributor
with pending patches would have to rebase carefully. Existing el-get
users are unaffected (a merge is performed).

By the way: I don’t expect I’ll be updating this fork often, so beware.

  [1]: https://github.com/sellout/emacs-color-theme-solarized
  [2]: https://github.com/altercation/solarized
