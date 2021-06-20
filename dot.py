import polkadot


AUTOLOAD_DIR = '.vim/autoload'
VIM_TMP_DIR = '.vim/tmp'
NEOVIM_CONFIG_DIR = '.config/nvim'
NEOVIM_CONFIG_AUTOLOAD_DIR = '.config/nvim/autoload'

DOTFILES = [
    polkadot.mkdir('git'),
    polkadot.gitclone('git/oh-my-zsh', 'https://github.com/robbyrussell/oh-my-zsh.git'),
    polkadot.gitclone(
        'git/oh-my-zsh/custom/plugins/zsh-dircolors-solarized',
        'https://github.com/joel-porquet/zsh-dircolors-solarized',
        git_kwargs = {
            'recursive': True,
        }
    ),
    polkadot.mkdir(AUTOLOAD_DIR),
    polkadot.mkdir(VIM_TMP_DIR),
    polkadot.mkdir(NEOVIM_CONFIG_DIR),
    polkadot.mkdir(NEOVIM_CONFIG_AUTOLOAD_DIR),
    polkadot.copy('*', 'dotfiles/*'),
    polkadot.download(NEOVIM_CONFIG_AUTOLOAD_DIR + '/plug.vim', 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'),
    polkadot.gitclone('.pyenv', 'https://github.com/pyenv/pyenv.git'),
    polkadot.gitclone('.pyenv/plugins/pyenv-virtualenv', 'https://github.com/pyenv/pyenv-virtualenv.git')
]

plugins = [
    ('NeoSolarized', 'https://github.com/overcache/NeoSolarized.git'),
    ('tcomment_vim', 'https://github.com/tomtom/tcomment_vim.git'),
    ('tlib_vim', 'https://github.com/tomtom/tlib_vim.git'),
    ('vim-addon-mw-utils', 'https://github.com/MarcWeber/vim-addon-mw-utils.git'),
    ('vim-airline', 'https://github.com/bling/vim-airline'),
    ('vim-colors-solarized', 'https://github.com/altercation/vim-colors-solarized.git'),
    ('vim-fireplace', 'https://github.com/tpope/vim-fireplace.git'),
    ('vim-gitgutter', 'https://github.com/airblade/vim-gitgutter.git'),
    ('vim-javascript', 'https://github.com/pangloss/vim-javascript.git'),
    ('vim-jinja2-syntax', 'https://github.com/Glench/Vim-Jinja2-Syntax.git'),
    ('vim-json', 'https://github.com/elzr/vim-json.git'),
    ('vim-jsx', 'https://github.com/mxw/vim-jsx.git'),
    ('vim-less', 'https://github.com/groenewege/vim-less'),
    ('vim-terraform', 'https://github.com/hashivim/vim-terraform.git'),
]

for name, repository in plugins:
    DOTFILES.append(polkadot.gitclone('%s/%s' % (NEOVIM_CONFIG_DIR, name), repository))
