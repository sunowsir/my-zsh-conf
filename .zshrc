source ~/.zsh/antigen.zsh

# 加载oh-my-zsh库
antigen use oh-my-zsh

# git 辅助插件
antigen bundle git

# keroku 命令补全插件
# antigen bundle heroku

# pip 命令补全插件
antigen bundle pip

# 不知为何物
# antigen bundle lein

# 未知命令提示插件
antigen bundle command-not-found

# 快速解压缩插件 
antigen bundle extract

# 快速使用搜索引擎调用默认浏览器搜索
antigen bundle web-search

# 语法高亮功能
antigen bundle zsh-users/zsh-syntax-highlighting

# 代码提示功能
antigen bundle zsh-users/zsh-autosuggestions

# 自动补全功能
antigen bundle zsh-users/zsh-completions


# 加载主题
antigen theme robbyrussell

# 保存更改
antigen apply


#
###############################################
#

alias ll='ls -al --color=auto'
alias cls='clear'

export EDITOR=vim
setopt HIST_IGNORE_DUPS
setopt no_nomatch

#
###############################################
#

