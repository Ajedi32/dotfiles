#
# <username>@<pc> ~/path/to/git/repository (branch)
# $
export PS1='\n\[\e]0;\w\a\]\[\e[32m\]\u@\h \[\e[33m\]\w$(__git_ps1 " (%s)")\[\e[0m\]\n\$ '
