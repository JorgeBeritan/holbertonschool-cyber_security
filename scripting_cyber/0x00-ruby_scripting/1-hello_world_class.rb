class HelloWorld
    def initialize
        @message = "Hello, World!"
    end
    def print_hello
        puts "#{@message}"
    end
end

hello = HelloWorld.new
hello.print_hello