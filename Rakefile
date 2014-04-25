def example(name, options)
  sh "ruby console_test.rb #{options} examples/#{name}.bmp"
  sh("convert examples/#{name}.bmp examples/#{name}.png") {|ok,res| }
  rm "examples/#{name}.bmp"
end

desc "Creates example files"
task :examples do
  mkdir_p "examples"
  example("red", "--color FF0000")
  example("green", "--color 00FF00")
  example("smallblue", "--color 0000FF --radius 50")

end
