# my-zsh-conf
My ZSH configuration

## antigen 
> * antigen 是zsh插件管理工具
> * 以下命令可以直接写到~/.zshrc中。
> * 为了方便，仓库直接保存了一份antigen

1. `antigen use xxx` : 加载antigen所支持的zsh框架，例如oh-my-zsh。
2. `antigen bundle xxx` : 安装或加载xxx插件。
    1. 如果要使用oh-my-zsh内置插件，只需要在后面加上插件名称即可，例如安装或加载extract插件，需要：`antigen bundle extract`。
    2. 如果要使用github上的zsh插件，需要在后面加上该项目github用户名和项目名称（即省略了https://github.com/），例如安装或加载zsh-completions插件，需要`antigen bundle zsh-users/zsh-completions`。
    3. 安装其他平台的则需要在后面加上完整的URL。
3. `antigen theme xxx` 安装或加载xxx主题。
4. `antigen theme apply` 保存更改。
5. `antigen update`更新插件、库、主题。
6. `antigen list [--simple|--short|--long]` 可选择三种方式展示已安装的插件。
7. `antigen cleanup` 清理掉所有已安装但未加载的插件 。
8. `antigen help`帮助信息。

