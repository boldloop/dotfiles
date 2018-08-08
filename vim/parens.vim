function! Count( word )
    redir => cnt
        silent exe '%s/' . a:word . '//gn'
    redir END
    let res = strpart(cnt, 0, stridx(cnt, " "))
    return res
endfunction

function! MatchParens()
    let parens = str2nr(Count("(")) - str2nr(Count(")"))
    echom Count("(")
    echom Count(")")
    echom Count("(") - Count(")")
    echom parens
    let brackets = Count('\[') - Count('\]')
    let curlies = Count("{") - Count("}")
    if parens > 0
        echom string(parens) . " open parens unmatched"
    elseif parens < 0
        echom string((0 - parens)) . " close parens unmatched"
    endif
    if brackets > 0
        echom string(brackets) . " open brackets unmatched"
    elseif brackets < 0
        echom string((0 - brackets)) . " close brackets unmatched"
    endif
    if curlies > 0
        echom string(curlies) . " open curlies unmatched"
    elseif curlies < 0
        echom string((0 - curlies)) . " close curlies unmatched"
    endif
    if parens == 0 && brackets == 0 && curlies == 0
        echom "parens, brackets, and curlies matched"
    endif
endfunction
