# .bashrc
# bashrc is for aliases, functions, and shell configuration intended for use in
# interactive shells.  However, in some circumstances, bash sources bashrc even
# in non-interactive shells (e.g., when using scp), so it is standard practice
# to check for interactivity at the top of .bashrc and return immediately if
# the shell is not interactive.  The following line does that; don't remove it!
[[ $- != *i* ]] && exit 1

# Load CentOS stuff and Facebook stuff (don't remove these lines).
source /etc/bashrc
source /usr/facebook/ops/rc/master.bashrc

# Keep oodles of command history (see https://fburl.com/bashhistory).
HISTFILESIZE=-1
HISTSIZE=1000000
shopt -s histappend

# Set up personal aliases, functions, etc.  See https://fburl.com/bash.
export PATH=$PATH:~/repos/osandov-linux/bin

export EDITOR=vim

function git-branch-name() {
	local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

	if [ -z "$branch" ]; then
		echo ""
		return
	fi

	if [ $? -eq 0 ]; then
		# Split the branch name by '/' and print only the part after the second '/'
		local parts=(${branch//\// })
		if [ ${#parts[@]} -gt 2 ]; then
			echo " (${parts[@]:2})"
		else
			echo " ($branch)"
		fi
	else
		echo ""
	fi
}

function slproml {
	export PS1='\[\033[1;34m\][hahn:\w\[\033[38;5;219m\]$(git-branch-name)\[\033[1;34m\]]\$\[\033[0m\] '
	PS2='> '
	PS4='+ '
}
slproml

# Kernel aliases
alias makekernel="./facebook/scripts/prepareconfig -a x86_64 -f default -p facebook/config > .config && \
	./facebook/scripts/bootconfig -a x86_64 -f default -p facebook/config > facebook/config/bootconfig && \
	make olddefconfig && \
	make -j$(nproc)"
alias runvm="vm.py run MyVM -k ~/local/linux"
alias hkml="~/local/repos/hackermail/hkml"
alias makek="make -j$(nproc) tar-pkg 2>&1 1>stdout.log | tee stderr.log; tail -n 1 stdout.log"

alias 80cols="echo ----x----x----x----x----x----x----x----x----x----x----x----x----x----x----x----x"
