## Defines abbreviations
function setup
    for abbreviation in (abbr -1)
        abbr -e $abbreviation
    end
    abbr gg git graph
    abbr gs git status
end
