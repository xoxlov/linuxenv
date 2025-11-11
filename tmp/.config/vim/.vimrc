set mouse=a " включить мышь во всех режима
" (n - обычный режим;v - визуальный режим (режим выделения); i - режим вставки; c - режим командой строки)

" Кодировка текста
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,cp866

set number " нумерация строк
set relativenumber " относительная нумерация строк

set expandtab " замена табов на пробелы
set smarttab " при нажатии таба в начале строки добавляет количество пробелов равное shiftwidth
set tabstop=3 " количество пробелов в одном табе
set shiftwidth=3
set softtabstop=3 " количество пробелов в табе при удалении
set autoindent
autocmd FileType python setlocal tabstop=5 shiftwidth=4 " Python использует 4 пробела для отступов

set foldcolumn=2 " отступ между левой частью окна
syntax on
colorscheme desert

" set noshowmode " Если мешает отображение режима в поле для команд

set clipboard=unnamedplus " Включаем использование системного буфера
set timeoutlen=501 " Задержка в мс для сочетаний клавиш

set hlsearch " подсвечивать результаты поиска

set whichwrap+=h,l,<,>,[,] " Когда достигаем границ строки, то перемещаемся на предыдующую/следующую

" Отображение скрытых символов
set list
set listchars=tab:»·,trail:·,nbsp:␣,extends:>,precedes:<

" Ширина строки и красная линия
set textwidth=121
set cc=+2

" Настройки автодополнения
set completeopt=menu,menuone,noselect

" Разделение экрана
set splitbelow " разбивать вниз
set splitright " разбивать вправо

" Задержка CursorHold
set updatetime=101

" Настройки поведения
" Отключаем visual bell
set noerrorbells
set novisualbell
set t_vb=

set hidden " Игнорировать 'No write since last change' (буфер не сохранен)
set nobackup noundofile noswapfile " Отключить создание бекапов, своп-файлов и файлов отмены

set autoread "  Включаем автоматическое обновление буфера

autocmd FocusGained,BufEnter * checktime " Обновляем буфер при изменении файла внешними инструментами

"###############################################################################
"# vim-plug operationing
"###############################################################################
" Устанавливаем переменные окружения, если они не заданы
if empty($VIMHOME)
  let $VIMHOME = expand('~/.vim')
endif

if empty($MYVIMRC)
  let $MYVIMRC = expand('%:p')
endif

" Проверяем, есть ли уже путь в runtimepath
if index(split(&runtimepath, ','), expand('$VIMHOME')) == 0
  " Если пути нет, добавляем его
  set runtimepath+=$VIMHOME
endif

" Проверяем, установлен ли vim-plug, и устанавливаем его при необходимости
" filereadable не умеет работать с путями, начинающимися с '~', поэтому
" используется странная конструкция empty(glob('...'))
if empty(glob($VIMHOME . '/autoload/plug.vim')) && !filereadable('/usr/share/vim/vimfiles/autoload/plug.vim')
  silent !curl -fLo $VIMHOME/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Автоматически ставим отсутствующие плагины
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | source $MYVIMRC
  \| endif

" Инициализируем vim-plug
call plug#begin('$VIMHOME/plugged')

" Добавляем плагины
Plug 'tpope/vim-sensible'  " Настройки по умолчанию для Vim

" Тут добавляем свои плагины

" Завершаем инициализацию vim-plug
call plug#end()

" А тут пользовательские настройки и настройки плагинов

""###############################################################################
"" # Сочетания клавиш:
""###############################################################################
"" Переход в нормальный режим
"inoremap <C-s> <Esc>
"vnoremap <C-s> <ESC>
"
"" Копирование в системный буфер
"vnoremap <C-c> "+y
"
"" Выделение всего текста
"nnoremap <C-a> ggVG
"inoremap <C-a> <Esc>ggVG
"
"" Использование h, j, k, l для перемещения с зажатым Ctrl в режиме редактирования
"inoremap <C-h> <Left>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-l> <Right>
"
"" Переместиться в начало строки
"inoremap <C1> <Home>
"" Переместиться в конец строки
"inoremap <C-$> <End>
"" Переместиться к первому непробельному символу
"inoremap <C-^> <Home>
"
"" Клавиши leader и альтернативная основной
"let g:mapleader = "\<Space>"
"let g:maplocalleader = ','
"
"" Очистить результаты поиска
"nnoremap <leader>h :noh<CR>
"
"" Переключение между вкладками
"nnoremap <leader>t :tabnext<CR>
"nnoremap <leader>T :tabprevious<CR>
"
"" Список вкладок
"nnoremap <leader>tl :tabs<CR>
"
"nnoremap <leader>tn :tabnew<CR>
"nnoremap <leader>tc :tabclose<CR>
"nnoremap <leader>to :tabonly<CR>
"nnoremap <leader>tm :tabmove<CR>
"
"" Редактировать файл в новой вкладке
"nnoremap <leader>te :tabedit |
"
"" Выбор вкладки
"nnoremap <leader>2 1gt
"nnoremap <leader>3 2gt
"nnoremap <leader>4 3gt
"nnoremap <leader>5 4gt
"nnoremap <leader>6 5gt
"nnoremap <leader>7 6gt
"nnoremap <leader>8 7gt
"nnoremap <leader>9 8gt
"nnoremap <leader>10 9gt
"nnoremap <leader>1 :tablast<CR>
"
"" Разбиение окон
"nnoremap <leader>s :split<CR>
"nnoremap <leader>v :vsplit<CR>
"
"" Выбор окна
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
"
"" Сделать окна одного размера
"nnoremap <leader>= <C-w>=
"
"" Переключения между буферами
"nnoremap <leader>b :bnext<CR>
"nnoremap <leader>B :bprevious<CR>
"nnoremap <leader>l :ls<CR>
"nnoremap <leader>d :bd<CR>
"
"" Скрыть/раскрыть блок кода
"nnoremap <leader>z za
"
"" Добавление и удаление отступов
"nnoremap > >>
"nnoremap < <<
"vnoremap < <gv
"vnoremap > >gv
"
"" Сохранение и закрытие
"nnoremap <leader>w :w<CR>
"nnoremap <leader>q :q<CR>
"
"" Сохранить файл с sudo
"" https://stackoverflow.com/questions/2600784/how-does-the-vim-write-with-sudo-trick-work
"cmap w!! w !sudo tee > /dev/null %
"
"" Редактирование конфига
"nnoremap <leader>ev :tabedit $MYVIMRC<CR>
"
"" Применить конфиг
"nnoremap <leader>sv :so $MYVIMRC<CR>

