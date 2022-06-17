# Phase I:
# Write a method #first_anagram? that will generate and store all the possible 
# anagrams of the first string. Check if the second string is one of these.


def first_anagram(string1, string2)
    $anagrams = []
    def helper(string, start)
        if start >= string.length 
            $anagrams << string.dup
        end 
        for i in start...string.length 
            string[i],string[start] = string[start],string[i]
            helper(string,start+1)
            string[start],string[i] = string[i],string[start]
        end 
    end 
    helper(string1,0)
    $anagrams.include?(string2)
end 

# p first_anagram("cat","foo")


def second_anagram(string1, string2)
    # return true if key.empty?

    # if string[0] == key[0]
    #     second_anagram(string[1..-1],key[1..-1])
    # else 
    #     second_anagram(string[1..-1],key)
    # end 

    # string1 = string1.split("")
    string2 = string2.split("")

    string1.chars.each do |char|
        if string2.include?(char)
            pos = string2.index(char)
            string2.delete_at(pos)
        end 
    end 
    string2.empty?
end 

# p second_anagram("cat", "cat")


def third_anagram(string1,string2)
    string1.chars.sort == string2.chars.sort
end 

# p third_anagram("cat", "tac")


def fourth_anagram(string1,string2)
hash = Hash.new(0)

string1.each_char do |ele1|
    hash[ele1] += 1 
end 
string2.each_char do |ele2|
    hash[ele2] -= 1
end 

hash.values.all? { |v| v == 0}
end 


def fourth_anagram(string1,string2)
helper(string1) == helper(string2)
end 


def helper(string)
    hash = Hash.new(0)
    string.each_char do |ele|
        hash[ele] += 1
    end 
    hash 
end 



p fourth_anagram("cat","tac")