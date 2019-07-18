FROM alpine:edge
MAINTAINER tylerfowle
WORKDIR /mnt/workspace

# ENV DEBIAN_FRONTEND noninteractive
ENV CMAKE_EXTRA_FLAGS=-DENABLE_JEMALLOC=OFF
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

ENV WORKSPACE="/mnt/workspace" \
    NVIM_RC="/root/.config/nvim/init.vim" \
    NVIM_CONFIG="/root/.config/nvim" \
    NVIM_PCK="/root/.local/share/nvim/site/pack" \
    DOTFILES="/root/dotfiles/" \
    PLUGINS_COMMON=" \
    majutsushi/tagbar \
    nathanaelkane/vim-indent-guides \
    vim-airline/vim-airline \
    vim-airline/vim-airline-themes \
    airblade/vim-gitgutter \
    junegunn/vim-peekaboo \
    junegunn/limelight.vim \
    ctrlpvim/ctrlp.vim \
    ton/vim-bufsurf \
    junegunn/vim-easy-align \
    tpope/vim-repeat \
    tpope/vim-surround \
    tpope/vim-commentary \
    tpope/vim-fugitive \
    tpope/vim-ragtag \
    raimondi/delimitmate \
    bronson/vim-trailing-whitespace \
    google/vim-searchindex \
    markonm/traces.vim \
    triglav/vim-visual-increment \
    mileszs/ack.vim \
    brooth/far.vim \
    tylerfowle/turtle.vim \
    AndrewRadev/switch.vim \
    jbgutierrez/vim-partial \
    w0rp/ale \
    sbdchd/neoformat \
    godlygeek/tabular \
    scrooloose/nerdtree \
    Xuyuanp/nerdtree-git-plugin \
    ryanoasis/vim-devicons \
    tiagofumo/vim-nerdtree-syntax-highlight \
    mattn/emmet-vim \
    sirver/ultisnips \
    honza/vim-snippets \
    " \
    PLUGINS_FILETYPE=" \
    othree/html5.vim \
    othree/javascript-libraries-syntax.vim \
    pangloss/vim-javascript \
    kchmck/vim-coffee-script \
    JulesWang/css.vim \
    cakebaker/scss-syntax.vim \
    lumiliet/vim-twig \
    vim-ruby/vim-ruby \
    jwalton512/vim-blade \
    posva/vim-vue \
    plasticboy/vim-markdown \
    mzlogin/vim-markdown-toc \
    shime/vim-livedown \
    fatih/vim-go \
    " \
    PLUGINS_COLORS=" \
    morhetz/gruvbox \
    srcery-colors/srcery-vim \
    vim-airline/vim-airline \
    vim-airline/vim-airline-themes \
    "

# make directories
RUN mkdir -p \
    "${WORKSPACE}" \
    "${NVIM_PCK}/common/start"\
    "${NVIM_PCK}/filetype/start"\
    "${NVIM_PCK}/colors/opt" \
    "${NVIM_CONFIG}" \
    "${DOTFILES}"

# base
RUN apk add --update-cache \
    build-base \
    libc6-compat \
    linux-headers alpine-sdk cmake

# utilities
RUN apk add --update-cache \
    bash zsh less ncurses ctags \
    htop neofetch

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    ripgrep

# dev utils
RUN apk add --update-cache \
    git curl wget \
    man man-pages \
    openssh mosh

# lang
RUN apk add --update --no-cache \
    python \
    python-dev \
    py-pip \
    python3 \
    python3-dev \
    ruby \
    ruby-dev \
    ruby-rdoc \
    nodejs \
    nodejs-npm \
    neovim \
    neovim-lang \
    neovim-doc

RUN pip install --upgrade \
    pip \
    pynvim \
    && pip3 install --upgrade \
    pip \
    pynvim

RUN gem install \
    neovim

RUN npm install -g \
    neovim

# clone plugin repos
RUN for i in $PLUGINS_COMMON; do git -C "${NVIM_PCK}/common/start" clone --depth 1 https://github.com/"$i"; done
RUN for i in $PLUGINS_FILETYPE; do git -C "${NVIM_PCK}/filetype/start" clone --depth 1 https://github.com/"$i"; done
RUN for i in $PLUGINS_COLORS; do git -C "${NVIM_PCK}/colors/opt" clone --depth 1 https://github.com/"$i"; done

# install coc
RUN git -C "${NVIM_PCK}/common/start" clone --depth 1 https://github.com/neoclide/coc.nvim --single-branch --branch release

# Clean the cache
RUN rm -rf /var/cache/apk/*

RUN echo "Welcome to Deovim Container!" > /etc/motd

RUN chmod -R 777 /usr/local

RUN git clone https://github.com/tylerfowle/deovim.git && \
    mv deovim/vim/init.vim ${NVIM_CONFIG}/init.vim && \
    mv deovim/vim ${NVIM_CONFIG}

ENV COC_EXTENSIONS="coc-css \
    coc-dictionary \
    coc-eslint \
    coc-highlight \
    coc-html \
    coc-json \
    coc-lists \
    coc-snippets \
    coc-solargraph \
    coc-tag \
    coc-tsserver \
    coc-ultisnips \
    coc-vetur \
    coc-word"

RUN nvim -c "CocInstall -sync ${COC_EXTENSIONS}|q"

ENTRYPOINT ["nvim", "."]
