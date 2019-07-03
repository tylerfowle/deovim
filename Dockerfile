FROM alpine:latest AS BUILDER

RUN apk add --virtual build-deps --update \
        autoconf \
        automake \
        cmake \
        coreutils \
        mosquitto \
        ncurses ncurses-dev ncurses-libs ncurses-terminfo \
        gcc \
        g++ \
        libtool \
        libuv \
        linux-headers \
        lua5.3-dev \
        m4 \
        unzip \
        make


RUN apk add --update \
        curl \
        git \
        python \
        py-pip \
        python-dev \
        python3-dev \
        python3 &&\
        python3 -m ensurepip && \
        rm -r /usr/lib/python*/ensurepip && \
        pip3 install --upgrade pip setuptools && \
        rm -r /root/.cache

ENV CMAKE_EXTRA_FLAGS=-DENABLE_JEMALLOC=OFF
WORKDIR /tmp

RUN git clone https://github.com/neovim/libtermkey.git && \
  cd libtermkey && \
  make && \
  make install && \
  cd ../ && rm -rf libtermkey

RUN git clone https://github.com/neovim/libvterm.git && \
  cd libvterm && \
  make && \
  make install && \
  cd ../ && rm -rf libvterm

RUN git clone https://github.com/neovim/unibilium.git && \
  cd unibilium && \
  make && \
  make install && \
  cd ../ && rm -rf unibilium

RUN curl -L https://github.com/neovim/neovim/archive/nightly.tar.gz | tar xz && \
  cd neovim-nightly && \
  make && \
  make install && \
  cd ../ && rm -rf neovim-nightly













FROM alpine:latest
MAINTAINER tylerfowle
WORKDIR /mnt/workspace

COPY --from=BUILDER /home/nvim-linux64/bin/nvim /usr/local/bin/deovim

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

RUN apk add --update --no-cache \
    build-base \
    bash \
    curl \
    git \
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

COPY vim/init.vim ${NVIM_CONFIG}/init.vim
COPY vim ${NVIM_CONFIG}

ENTRYPOINT ["sh"]
