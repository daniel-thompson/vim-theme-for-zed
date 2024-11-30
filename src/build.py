#!/usr/bin/env python3

import json

class JSONWithCommentsDecoder(json.JSONDecoder):
    """Auxillary decoder that strips comments from JSON"""
    def __init__(self, **kw):
        super().__init__(**kw)

    def decode(self, s):
        # TODO: Add support for trailing comments
        s = '\n'.join(l for l in s.split('\n') if not l.lstrip(' ').startswith('//'))
        return super().decode(s)

def merge(d1, d2):
    """Deep-merge d1 into d2

    This operation is cross between a dictionary merge and a deep-copy.
    Starting with d1 we merge in all keys from d2 with one exception.
    If the same key exists in both d1 and d2, *and* both contain a
    dicitonary then we do a (recursive) deep merge instead of a copy.
    """
    for (k, v) in d2.items():
        if k in d1 and isinstance(d1[k], dict) and isinstance(v, dict):
            merge(d1[k], v)
        else:
            d1[k] = v

    return d1

def extract_themes_from(fname):
    with open("themes/" + fname) as f:
        theme = json.load(f, cls=JSONWithCommentsDecoder)
    for t in theme["themes"]:
        fname = t["name"].lower().replace(" ", "-") + ".json"
        with open(fname, "w") as f:
            json.dump(t, f, indent=2)
    return theme

def main():
    extract_themes_from("adwaita.json")
    theme = extract_themes_from("one.json")

    theme["name"] = "Vim"
    theme["author"] = "Daniel Thompson, Benjamin Davies and Zed Industries"
    theme["themes"] = []

    for template, overlay in (
        ( "one-light", "vim-light" ),
        ( "adwaita-pastel-light", "vim-adwaita-light" ),
        ( "one-light", "vim-debug-light" ),
    ):
        with open(template + ".json") as f:
            template = json.load(f)
        with open(overlay + ".jsonc") as f:
            overlay = json.load(f, cls=JSONWithCommentsDecoder)
        merge(template, overlay)
        theme["themes"].append(template)

    with open("../themes/vim.json", "w") as f:
        json.dump(theme, f, indent=2)

main()
