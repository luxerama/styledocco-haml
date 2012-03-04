     _______ __         __        _____
    |     __|  |_.--.--|  |-----.|     \-----.----.----.-----.
    |__     |   _|  |  |  |  -__||  --  | _  |  __|  __|  _  |
    |_______|____|___  |__|_____||_____/_____|____|____|_____|
                 |_____|


About
=====

StyleDocco takes your stylesheets and generates style guide documents with the processed stylesheets applied to the documents.

`styledocco --name 'My Site' main.css` will generate `docs/main.html` with all the comments from the file (passed through GitHub flavored Markdown) in one column, and all the code in another column.

The CSS in `main.css` will be applied to the page. This means you can add sample HTML content in the comments of your CSS file, and have it rendered in the browser using that same CSS.

If your project includes a `README` file, it will be used as the base for an `index.html`.

StyleDocco will add `docs.css` with some default styles to your documentation, but you might want to modify it to make it fit with your project.

StyleDocco will automatically compile any SASS, SCSS, Less or Stylus code before it is applied to the page. Hidden files and SASS partials will be ignored.


Install
=======

StyleDocco requires [Node.js](http://nodejs.org).

`npm install -g styledocco`

or clone the [GitHub repository](https://github.com/jacobrask/styledocco).


Usage
=====

`styledocco [options] [INPUT]`

Options
-------

 * `--name`, `-n` Name of the project *(required)*
 * `--out`, `-o`  Output directory *(default: "docs")*
 * `--tmpl`       Directory for custom `index.jade` and `docs.jade` templates *(optional)*
 * `--overwrite`  Overwrite existing files (`docs.css`) in target directory.


Examples
========

This page was generated from the StyleDocco readme file, and the [docs](resources/docs.html) file is the the default StyleDocco CSS file.

An additional example was generated from a modified file from the [Twitter Bootstrap](examples/bootstrap/docs/index.html) project.


Acknowledgements
================

Thanks to:

 * [jashkenas](https://github.com/jashkenas/docco)
 * [mbrevoort](https://github.com/mbrevoort/docco-husky)


<a href="https://github.com/jacobrask/styledocco" id="styledocco-fork-me"><img style="position:fixed;top:0;right:0;border:0;" src="https://a248.e.akamai.net/assets.github.com/img/7afbc8b248c68eb468279e8c17986ad46549fb71/687474703a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f6461726b626c75655f3132313632312e706e67" alt="Fork me on GitHub"></a>
