Vim theme for Zed
=================

The Vim theme adapts the default Zed theme with syntax colouring inspired by
the gvim defaults.

*Vim is old-school! Black turns off the pixel completely and white is not an
alarmingly subtle shade of gray.*

The differences between tree-sitter and the vim syntax highlighter mean the
code cannot look exactly the same but it's certainly enough to make gvim users
much more comfortable.

Since they cannot be exact anyway this theme does also take a few liberties.
In particular some of the most exotic (but still potentially useful)
tree-sitter styles that would appear black in gvim are mapped instead to
bright black. The difference between black and bright black is pretty subtle
on most monitors so this almost subconcious nudge doesn't stop the output
feeling like vim (to my eyes at least, your opinion may differ).

Three themes are currently provided:

* _Vim Light_ is the recommended theme for most users. The widgets and Zed
  look and feel is based on the Zed default theme. Only the editor and
  terminal panes will look different.
* _Vim Adwaita Light_ is a better cosmetic fit for modern GNOME desktops.
* _Vim Debug Light_ is a good choice for people who want to improve this
  theme!

Regarding _Vim Debug Light_, currently there are tree-sitter categories where
the Vim theme for Zed does not override the parent theme. That's because I
haven't yet edited files that use these features. _Vim Debug Light_ sets these
all to dull yellow and makes them bold. If you see anything yellow and bold
using this theme please submit a bug report to the Issue Tracker.

Credits
-------

The Vim themes for Zed are derived from the following existing templates. The
Vim themes override the terminal and syntax highlight colours but the rest of
the colour scheme comes from the parent themes (see `src/build.py` for more
details):

* _Vim Light_ is derived from _One Light_ by Zed Industries
* _Vim Adwaita Light_ is derived from _Adwaita Pastel Light_ by _Benjamin
  Davies_
* _Vim Debug Light_ is derived from _One Light_ by Zed Industries

License
-------

This program is free software: you can redistribute it and/or modify it
under the terms of the [GNU General Public License](LICENSE.md) as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.
