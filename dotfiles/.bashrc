# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH=$HOME/bin:$PATH
export HTTP_PROXY=http://proxy2.cgn.canon.co.jp:10080
export HTTPS_PROXY=$HTTP_PROXY
export http_proxy=$HTTP_PROXY
export https_proxy=$HTTP_PROXY
export no_proxy=127.0.0.1,localhost
alias ls='ls -F'
# alias ldaptritium='ldapsearch -x -W -H ldap://ldap3.cpdc.canon.co.jp/ -D uid=akashi,ou=People,dc=tritium,dc=net -b dc=tritium,dc=net'
alias ldapcanon='ldapsearch -x -W -H ldap://ldap.global.canon.co.jp/ -D uid=aaa030986,o=aaa,ou=People,o=Canon -b o=AAA,ou=People,o=Canon'
alias ldaptritium='ldapsearch -h ldap3.cpdc.canon.co.jp -D uid=akashi,ou=People,dc=tritium,dc=net -w blancpai -b dc=tritium,dc=net'
