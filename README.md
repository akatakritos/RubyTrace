# RubyTracer

Hopefully fairly idiomatic ray tracer in ruby.

## Examples

_Note: the demo script outputs BMP images, but I post processed them 
into PNG to keep the sizes down. See the `Rakefile`_

``` bash
$ ruby console_test.rb --color FF0000 red.bmp
```
![Red Sphere](/examples/red.png?raw=true)

``` bash
$ ruby console_test.rb --color 00FF00 green.bpm
```
![Green Sphere](/examples/green.png?raw=true)

``` bash
$ ruby console_test.rb --color 0000FF --radius 50 smallblue.bmp
```
![Small Blue Sphere](/examples/smallblue.png?raw=true)

