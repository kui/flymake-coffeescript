# flymake-coffeescript.el

A flymake configuration for CoffeeScript

## Install

In your shell,

```sh
$ cd <your_emacs_load_path>
$ wget https://github.com/kui/flymake-coffeescript/raw/master/flymake-coffeescript.el
$ emacs ~/.emacs
```

In your `.emacs`,

```el
(when (and (require 'flymake nil t)
		   (require 'flymake-coffeescript nil t)
		   (executable-find flymake-coffeescript-command))
  (add-hook 'coffee-mode-hook 'flymake-coffeescript-load))
```

`coffee-mode-hook` is a major-mode hook of [coffee-mode](https://github.com/defunkt/coffee-mode).

