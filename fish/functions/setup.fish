## Defines abbreviations
function setup
    for abbreviation in (abbr -l)
        abbr -e $abbreviation
    end
    abbr gc git checkout
    abbr gg git graph
    abbr gs git status
    abbr ga git commit --amend
    abbr gp git pull
    abbr vl vtex link --verbose --unsafe
    abbr vu vtex unlink
    abbr vwr vtex workspace reset
    abbr vls vtex ls
    abbr vils vtex infra ls
end
