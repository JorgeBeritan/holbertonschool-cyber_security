def prime(number)
    return false if number <= 1

    (2...number).each do |i|
        return false if number % i == 0
    end

    true
end