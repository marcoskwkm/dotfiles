## Defines abbreviations
function setup
    for abbreviation in (abbr -l)
        abbr -e $abbreviation
    end
    abbr gg git graph
    abbr gs git status
    abbr prod vtex config set env prod
    abbr staging vtex config set env staging
    abbr vl vtex link --verbose --unsafe
    abbr vls vtex ls
    abbr vwr vtex workspace reset
    abbr vu vtex unlink    
end
