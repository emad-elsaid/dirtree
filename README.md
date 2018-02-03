# Dirtree

[![Gem Version](https://badge.fury.io/rb/dirtree.svg)](https://badge.fury.io/rb/dirtree)

Dirtree visualizes an list of file paths into a tree graph, printed as HTML page, it can be useful in visualizing a whole project you're working on to start cleanup or organizing your code or spotting large directories or unneeded files.

## Tree template
![http://i.imgur.com/cGhx0lG.png](http://i.imgur.com/cGhx0lG.png)

## Flame Graph template
![https://i.imgur.com/eSTlQNE.png](https://i.imgur.com/eSTlQNE.png)

## Circles template
![http://i.imgur.com/WvfOgCp.png](http://i.imgur.com/WvfOgCp.png)

## Treemap template
![https://i.imgur.com/quO67Ky.png](https://i.imgur.com/quO67Ky.png)

## Installation


    $ gem install dirtree

## Usage

    Usage: dirtree [options]... [file]...
        -v, --version                    Print version
        -h, --help                       Show this help text
        -l, --local-dependencies         Use saved JavaScript libraries instead of downloading them
        -o, --output=File.html           Specify a path to write output, if not specified output will be printed to STDOUT
        -t, --template=TemplateName      Specify the template name, available templates ["circles", "tree", "flame"]


## Examples

**Visualize current directory recursively**

```
$ dirtree -o output.html **/* *
```

  make sure you have `globstar` on
```
$ shopt -s globstar
```

**Visualize files from git ls**

```
$ git ls-files | dirtree -o output.html
```

**Dirtree prints to standard output if no --output option specified so you can redirect it**

```
$ git ls-files | dirtree > output.html
```

**visualize only files that include specific word**

```
$ git ls-files | grep keyword | dirtree > output.html
```

**works with find**

visualize all files that ends with `rb`

```
$ find ~ -name *rb | dirtree > output.html
```

**With ag:silver searcher**

```
$ ag -l | dirtree -o output.html
```

## Conjunctions

* [lsgh](https://www.github.com/emad-elsaid/lsgh) Draw a tree for a github user/org and open pull requests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/emad-elsaid/dirtree.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
