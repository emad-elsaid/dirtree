# Dirtree

[![Gem Version](https://badge.fury.io/rb/dirtree.svg)](https://badge.fury.io/rb/dirtree)

Dirtree visualizes an list of file paths into a tree graph, printed as HTML page, it can be useful in visualizing a whole project you're working on to start cleanup or organizing your code or spotting large directories or unneeded files.

## Tree template
![http://i.imgur.com/cGhx0lG.png](http://i.imgur.com/cGhx0lG.png)

## Circles template
![http://i.imgur.com/WvfOgCp.png](http://i.imgur.com/WvfOgCp.png)

## Installation


    $ gem install dirtree

## Usage

    Usage: dirtree [options]... [file]...
        -v, --version                    Print version
        -h, --help                       Show this help text
        -o, --output=File.html           Specify a path to write output, if not specified output will be printed to STDOUT


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

* [lsgh](https://www.github.com/blazeeboy/lsgh) Draw a tree for a github user/org and open pull requests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/blazeeboy/dirtree.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
