#!/usr/bin/ruby

class CaesarCipher
    def initialize(shift)
        @shift = shift % 26
    end

    def encrypt(message)
        cipher(message, @shift)
    end

    def decrypt(message)
        cipher(message, -@shift)
    end
    
    private

    def cipher(message, shift)
        result = ""

        message.each_char do |char|
            if char.match(/[a-zA-Z]/)
                is_uppercase = char.match(/[A-Z]/)
                base = is_uppercase ? 65 : 97

                char_offset = char.ord - base
                shifted_offset = char_offset + shift
                wrapped_offset = (shifted_offset % 26 + 26) % 26
                result += (base + wrapped_offset).chr
            else
                result += char
            end
        end
        result
    end
end