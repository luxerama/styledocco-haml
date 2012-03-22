
```
 _______ __         __        _____                       __   __             __  
|     __|  |_.--.--|  |-----.|     \-----.----.----.-----|  |_|  |-----.--.--|  |  
|__     |   _|  |  |  |  -__||  --  | _  |  __|  __|  _  |   _   |  _  |     |  |
|_______|____|___  |__|_____||_____/_____|____|____|_____|__| |__|__|__|_|-|_|__|
             |_____|
```

This is a fork of styledocco extended to meet my development needs. As well as all the goodness created by [Jacob Rask](http://github.com/jacobrask/) this fork also includes:

* Takes haml templates instead of HTML
* Acccepts fixtures in the form of a JSON string. This allows you to input haml as if it were in your project
* Paperboy server to serve up the docs

Please note that this is a quick and dirty hack of [StyleDocco](https://github.com/jacobrask/styledocco/). Code is of a poor quality and tests have yet to be written. If you want to use this then I advise you to fork it and make it work for you specific project.

Taken from styledocco:

> StyleDocco generates documentation and style guide documents from your stylesheets.
> 
> Stylesheet comments will be parsed through [Markdown](http://en.wikipedia.org/wiki/Markdown) and displayed in a generated HTML document. You can write code examples inside [> GitHub Markdown](http://github.github.com/github-flavored-markdown/) code fences (<code>```</code>) or prefixed with 4 spaces in your comments, and StyleDocco both renders the > HTML and shows the code example.
> 
> The document is automatically split into new sections when it encounters a level 1 or 2 heading. Read more about the heading syntax in the [Markdown guide](http://daringfireball.> net/projects/markdown/syntax). Only comments at the beginning of new lines are included, so to exclude something from the style guide, put some whitespace before the comment.
> 
> If your project includes a `README` file, it will be used as the base for an `index.html`. StyleDocco will also add some default styles to your documentation, but they are easy > to modify to make it fit with your project.
> 
> StyleDocco will automatically compile any SASS, SCSS, Less or Stylus code before it is applied to the page.


## Usage

'node run.js [options] [INPUT]'

Yup, this ain't as pretty but it fits my Rake needs.

### Options

 * `--name`, `-n` Name of the project *(required)*
 * `--out`, `-o`  Output directory *(default: "docs")*
 * `--tmpl`       Directory for custom `docs.jade` and `docs.css` *(optional)*
 * `--overwrite`  Overwrite existing files (`docs.css`) in target directory. *(default: false)*
 * `--pass`       Pass arguments through to CSS preprocessor *(optional)* (ex: `--pass="--include-path=../less/include"`)
 * `--nocss`      Hide CSS code pane. *(default: false)*
 * `--server`, `-s` Run node server to display docs *(default: false)*
 * `--port`         Port to run paperboy *(default: 3000)*




## Examples

    /*
        <button class="btn primary">Primary</button>

    Provides extra visual weight and identifies the primary action in a set of buttons. */
    .btn.primary {
        background: blue;
        color: white;
    }

Would display the description, a button as well as the example HTML code. The CSS will be included in the `style` element of the document.

See the `examples` folder for more in-depth examples.


## Acknowledgements

I have added **very little** to this project, it is merely a hacked version of [StyleDocco](https://github.com/jacobrask/styledocco/). All credit goes to [Jacob Rask](http://github.com/jacobrask/).

A lot of the heavy lifting in StyleDocco is done by the excellent [Marked](https://github.com/chjj/marked) module by Christopher Jeffrey. The original [Docco](https://github.com/jashkenas/docco) by Jeremy Ashkenas and [Docco Husky](https://github.com/mbrevoort/docco-husky) by Mike Brevoort were also of great help to this project. StyleDocco was also inspired by [Knyle Style Sheets](https://github.com/kneath/kss), a similar project written in Ruby.
