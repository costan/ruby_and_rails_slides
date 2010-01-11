require 'csv'

# Downloaded from freebase.
languages = CSV.read 'code/languages.csv'
language_names = languages.map { |row| row.first }.select { |name| name } 
count = language_names.length
histogram = language_names.group_by { |name| name[0, 1] }.
                           map { |name, langs| [name, langs.length] }
# Language initials ordered by frequency.
by_frequency = histogram.sort_by { |name, freq| freq }
# Language initials ordered alphabetically.
by_name = histogram.sort_by { |name, freq| name }
