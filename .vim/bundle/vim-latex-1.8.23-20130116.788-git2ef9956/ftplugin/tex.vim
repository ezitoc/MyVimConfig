let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex --synctex=1 -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'okular'
let g:Tex_MultipleCompileFormats_pdf = '2,2'

"Corrección autográfica
setlocal spell
setlocal spelllang=es
setlocal spellfile=/home/ezequiel/.vim/dict.add

setlocal tw=80
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2

":let g:Tex_Env_figure = "\\begin{figure}[htbp]\<CR>\\centering\<CR>\\includegraphics[width=<++>]{<+figure+>}\<CR>\\caption{<+caption+>}\<CR>\\label{fig:<+label+>}\<CR>\\end{figure}"

set winaltkeys=no

call IMAP('SFG',"\\begin{figure}[htbp]\<CR>\\centering\<CR>\\subfloat[<+caption+>]{\<CR>\\label{fig:<+label+>}\<CR>\\scalebox{<+scale-factor+>}{\\input{fig/<+archivo+>}}\<CR>}\<CR>\\hspace{<+width+>}<++>\<CR>\\caption{<+caption of entire figure+>}\<CR>\\label{fig:<+label+>}\<CR>\\end{figure}<++>",'tex')
call IMAP('FRA',"\\begin{frame}\<CR>\\frametitle{<+title+>}\<CR>\\framesubtitle{<+subtitle+>}\<CR>\<++>\<CR>\\end{frame}<++>",'tex')

"call IMAP('NOM', '\laputaquelopario{<++>}<++>', 'tex')

"function AddItem()
  "if searchpair('\\begin{figure}', '', '\\end{figure}', '')
    ""return "\\item "
"return IMAP_PutTextWithMovement( 
        "\ "\\subfloat[<+caption+>]{\<CR>\\label{fig:<+label+>}\<CR>\\scalebox{<+scale-factor+>}{\\input{fig/<+archivo+>}}\<CR>}\<CR>\\hspace{<+width+>}\<CR>"
        "\ )
  "else
    "return ""
  "endif
"endfunction

"inoremap <expr><buffer> <C-F2> "\r".AddItem()

imap <buffer> <C-i> <Plug>Tex_InsertItemOnThisLine

"function CR()
    "if searchpair('\\begin{figure}', '', '\\end{figure}', '')
        "return "\r\\subfloat[<+caption+>]{\<CR>\\label{fig:<+label+>}\<CR>\\scalebox{<+scale-factor+>}{\\input{fig/<+archivo+>}}\<CR>}\<CR>\\hspace{<+width+>}\<++>"
    "elseif searchpair('\\begin{itemize}', '', '\\end{itemize}', '')
        "return "\r\\item "
    "endif
    "return "\r"
"endfunction

"inoremap <expr><buffer> <CR> CR()


imap <C-a> <Plug>Tex_MathBF
imap <C-c> <Plug>Tex_MathCal
imap <C-l> <Plug>Tex_LeftRight
