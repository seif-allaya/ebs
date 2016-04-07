# ebs
ebs is a Simple cli tool that generates directories and files folowwing a specific naming convention

## Installation
ebs is written in Ruby. It do require only the use of colorize to make the output a bit easier.

This tool was devlopped using ruby version 2.2.4.
##Usage
This tool takes the customer name and the engagment name and generates the required directories and files folowwing the agreed naming convention.

ruby ebs.rb -i templates/sample.json -o templates/ouput.csv 
```
Usage: ruby ebs.rb [options]
    -c, --client                     Input the client name
    -P, --pentest                    Input the pentest name
    -v, --verbose                    Run verbosely
```

## About ebs
Maintaining a standard naming can be fastiduious in particular in a context of doing the work again and again.
This tool make it as easy as saying hello ;)

## Known issues
Nothing reported yet
