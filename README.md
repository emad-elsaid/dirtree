# Dirtree

Dirtree visualizes an list of file paths into a tree graph, printed as HTML page, it can be useful in visualizing a whole project you're working on to start cleanup or organizing your code or spotting large directories or unneeded files.

## Installation


    $ gem install dirtree

## Usage

    Usage: dirtree [options]... [file]...
        -v, --version                    Print version
        -h, --help                       Show this help text
        -o, --output=File.html           Specify a path to write output, if not specified output will be printed to STDOUT


### Visualize current directory recursively

    $ dirtree -o output.html **/* *

### Visualize files from git ls

    $ git ls-files | dirtree -o output.html

### Dirtree prints to standard output if no --output option specified so you can redirect it

    $ git ls-files | dirtree > output.html

### visualize only files that include specific word

    $ git ls-files | grep keyword | dirtree > output.html

### works with find

visulaize all files that ends with `rb`

    $ find ~ -name *rb | dirtree > output.html


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/blazeeboy/dirtree.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
