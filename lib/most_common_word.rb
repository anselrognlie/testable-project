# @param {String} paragraph
# @param {String[]} banned
# @return {String}
def most_common_word(paragraph, banned)
    cleaned = clean_paragraph(paragraph)
    banned_table = make_frequency(banned)
    word_table = make_frequency(cleaned)
    filtered_words = remove_banned(word_table, banned_table)
    pair = filtered_words.max_by { |word, count| count }
    pair ? pair.first : nil
end

def clean_paragraph(paragraph)
    words = paragraph.gsub(/[^A-Za-z ]/, '').split(/ +/)
end

def make_frequency(word_list)
    table = Hash.new(0)
    word_list.each do |word|
        count = table[word]
        count += 1
        table[word] = count
    end
    table
end

def remove_banned(word_table, banned_table)
    new_words = {}
    word_table.each do |k, v|
        unless banned_table.key? k
            new_words[k] = v
        end
    end
    new_words
end