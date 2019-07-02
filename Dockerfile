FROM alpine:latest
MAINTAINER tylerfowle
WORKDIR /mnt/workspace

ENV WORKSPACE="/mnt/workspace" \
    NVIM_RC="/root/.config/nvim/init.vim" \
    NVIM_CONFIG="/root/.config/nvim" \
    NVIM_PCK="/root/.local/share/nvim/site/pack"

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

RUN mkdir -p "${NVIM_PCK}/common/start" "${NVIM_PCK}/filetype/start" "${NVIM_PCK}/colors/opt"

    # && git -C "${NVIM_PCK}/common/start" clone --depth 1 https://github.com/tpope/vim-commentary \
    # && git -C "${NVIM_PCK}/common/start" clone --depth 1 https://github.com/tpope/vim-surround \
    # && git -C "${NVIM_PCK}/common/start" clone --depth 1 https://github.com/SirVer/ultisnips


ENV PLUGINS="\
    morhetz/gruvbox \
    srcery-colors/srcery-vim \
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
    vim-scripts/TaskList.vim \
    jbgutierrez/vim-partial \
    neoclide/coc.nvim \
    w0rp/ale \
    sbdchd/neoformat \
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
    godlygeek/tabular \
    plasticboy/vim-markdown \
    mzlogin/vim-markdown-toc \
    shime/vim-livedown \
    fatih/vim-go \
    scrooloose/nerdtree \
    Xuyuanp/nerdtree-git-plugin \
    ryanoasis/vim-devicons \
    tiagofumo/vim-nerdtree-syntax-highlight \
    mattn/emmet-vim \
    sirver/ultisnips \
    honza/vim-snippets \
    "

RUN for i in $PLUGINS; do git -C "${NVIM_PCK}/common/start" clone --depth 1 https://github.com/"$i"; done

RUN mkdir -p \
    /root/.config/nvim/ \
    && echo "set shiftwidth=4" > $NVIM_RC

ENTRYPOINT ["sh"]
