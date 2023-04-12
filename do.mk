SHELL = bash
MAKEFLAGS += --silent
DO_cyan=\033[36m
DO_yellow=\033[93m
DO_white=\033[0m
##########################################################
define DO
   echo "\033[1;33mTEXT\033[00m"; figlet -W -f straight  ${1}s; echo "$$DO_white"
	 $(foreach d,$(DO_repos), printf "$(DO_cyan):: $1 $d$(DO_white)\n"; cd $d; $(MAKE) $1;)
endef

##########################################################
help: ## show help
	@printf "\n$(DO_what)\n$(DO_copyright)\n"
	@printf '\nmake [$(DO_yellow)what$(DO_white)]\n'
	@grep -E --no-filename '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS=":.*?## "};{printf "$(DO_cyan)%10s$(DO_white) : %s\n",$$1,$$2}'
	@printf "$(DO_cyan) $$DO_fish $(DO_white)\n"

license: ## print license
	@echo "$$DO_license"

pull: ## get updates from cloud
	git pull --quiet

put: ## save local changes to cloud
	- git add --all *
	- git commit -am saving --quiet
	- git push --quiet -u --no-progress
	- git status --short   #brief

pulls: ## pull from cloud for this (and related) repos
	$(call DO,pull)

puts: ## push to cloud for this (and related) repos
	$(call DO,put)

ed: ## edit a file (e.g. make ed lib.lua)
	vim -u ../config/vimrc $(word 2, $(MAKECMDGOALS))

py: ## run some python  (e.g. make py lib)
	python3 -B $(word 2, $(MAKECMDGOALS))

~/tmp/%.pdf: %.py  ## .py ==> .pdf
	mkdir -p ~/tmp
	echo "pdf-ing $@ ... "
	a2ps                 \
		-bR                 \
		--chars-per-line 100  \
		--file-align=fill      \
		--line-numbers=1        \
		--borders=no             \
		--pro=color               \
		--left-title=""            \
		--columns  3                 \
		-M letter                     \
		--footer=""                    \
		--right-footer=""               \
	  -o	 $@.ps $<
	ps2pdf $@.ps $@; rm $@.ps
	open $@


##########################################################
define DO_fish
  
          O  o
     _\_   o
  \\\\/  o\ .
  //\___=
     ''
endef
export DO_fish
define DO_license

$(DO_what)
$(DO_copyright)

Redistribution and use in source and binary forms, with or
without modification, are permitted provided that the
following conditions are met:

1. Redistributions of source code must retain the above
   copyright notice, this list of conditions and the following
   disclaimer.

2. Redistributions in binary form must reproduce the above
   copyright notice, this list of conditions and the following
   disclaimer in the documentation and/or other materials
   provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
CONTRIBUTORS “AS IS” AND ANY EXPRESS OR IMPLIED WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
endef
export DO_license

