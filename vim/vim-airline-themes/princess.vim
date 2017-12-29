" Normal mode                                    " guifg guibg ctermfg ctermbg
let s:N1 = [ '#bcbcbc' , '#875faf' , 250 , 97  ]
let s:N2 = [ '#d75fd7' , '#4e4e4e' , 170 , 239 ]
let s:N3 = [ '#c6c6c6' , '#3a3a3a' , 251 , 237 ]

" Insert mode
let s:I1 = [ '#5f0000' , '#b95ea8' , 52 , 205 ]
let s:I2 = [ '#d75fd7' , '#4e4e4e' , 170 , 239 ]
let s:I3 = [ '#c6c6c6' , '#3a3a3a' , 251 , 237 ]

" Visual mode
let s:V1 = [ '#cacfd2' , '#6e67b4' , 253 , 35  ]

" Replace mode
let s:RE = [ '#c6c6c6' , '#ce537a' , 251, 168 ]

let g:airline#themes#princess#palette = {}

let g:airline#themes#princess#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let g:airline#themes#princess#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#princess#palette.insert_replace = {
            \ 'airline_a': [ s:RE[0]   , s:I1[1]   , s:RE[1]   , s:I1[3]   , ''     ] }

let g:airline#themes#princess#palette.visual = {
            \ 'airline_a': [ s:V1[0]   , s:V1[1]   , s:V1[2]   , s:V1[3]   , ''     ] }

let g:airline#themes#princess#palette.replace = copy(g:airline#themes#princess#palette.normal)
let g:airline#themes#princess#palette.replace.airline_a = [ s:RE[0] , s:RE[1] , s:RE[2] , s:RE[3] , '' ]

let s:IA = [ s:N1[1] , s:N3[1] , s:N1[3] , s:N3[3] , '' ]
let g:airline#themes#princess#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
