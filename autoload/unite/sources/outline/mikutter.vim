function! unite#sources#outline#mikutter#outline_info()
    return s:outline_info
endfunction

let s:Util = unite#sources#outline#import('Util')

let s:super = unite#sources#outline#get_outline_info('ruby', 1, 1)
let s:outline_info = deepcopy(s:super)
call extend(s:outline_info, {
            \ 'super': s:super,
            \
            \ 'mikutter_heading_keywords': [
            \   'on_\=\w\+', 'filter_\w\+', 'hook_\w\+',
            \ ],
            \ })

function! s:outline_info.initialize()
    let self.mikutter_heading = '^\s*\(' . join(self.mikutter_heading_keywords, '\|') . '\)\>'
    let self.heading_keywords += self.mikutter_heading_keywords
    call call(self.super.initialize, [], self)
endfunction
