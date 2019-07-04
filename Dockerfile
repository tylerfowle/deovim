FROM alpine:edge AS BUILDER
MAINTAINER Krispin Schulz <krispinone@gmail.com>
ENV CMAKE_EXTRA_FLAGS=-DENABLE_JEMALLOC=OFF
ENV USER=root
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --update-cache --virtual build-deps --no-cache \
    linux-headers alpine-sdk build-base cmake \
    curl \
    autoconf \
    automake \
    g++ \
    libc6-dev \
    libtool \
    libuv \
    lua5.3-dev \
    m4 \
    make \
    unzip \
    libtermkey-dev \
    lua-sec

RUN apk add --update-cache \
    git \
    libvterm \
    libtermkey \
    unibilium

RUN git clone https://github.com/neovim/neovim.git nvim && \
    cd nvim && \
    make && \
    make install && \
    cd .. && \
    rm -rf nvim && \
    apk del build-deps





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
    bash zsh less ncurses \
    htop neofetch

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

# RUN ssh-keygen -A
# EXPOSE 22

RUN chmod -R 777 /usr/local

COPY vim/init.vim ${NVIM_CONFIG}/init.vim
COPY vim ${NVIM_CONFIG}

ENTRYPOINT ["sh"]
