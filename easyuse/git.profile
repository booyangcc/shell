function git_develop_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in dev devel develop development; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return 0
    fi
  done

  echo develop
  return 1
}

function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default,stable,master}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return 0
    fi
  done

  # If no main branch was found, fall back to master but return error
  echo master
  return 1
}

function git_current_branch() {
  local ref
  ref=$(__git_prompt_git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

alias g='git'
alias ga='git add'
alias gaa='git add --all'

alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'

alias gc='git checkout'
alias gcr='git checkout --recurse-submodules'
alias gcb='git checkout -b'
alias gcB='git checkout -B'
alias gcd='git checkout $(git_develop_branch)'
alias gcm='git checkout $(git_main_branch)'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gd='git diff'

alias gct='git commit'
alias gctm='git commit -m'
alias gctam='git commit --am'

alias glo='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
alias glog='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'

# 合并分支
alias gm='git merge'
alias gma='git merge --abort'
alias gms="git merge --squash"

alias gpl='git pull'
alias gplr='git pull --rebase'
alias gplra='git pull --rebase --autostash'

alias gplrom='git pull --rebase origin master'
alias gplo='git pull origin "$(git_current_branch)"'

alias gp='git push'
alias gpf='git push -f'
alias gpod='git push origin --delete'
alias gpuo='git push --set-upstream origin $(git_current_branch)' 


# 重新基准化分支
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbs='git rebase --skip'
alias grbd='git rebase $(git_develop_branch)'
alias grbm='git rebase $(git_main_branch)'
alias grbom='git rebase origin/$(git_main_branch)'

alias grsh='git reset --hard'
alias grss='git reset --soft'
alias grsoh='git reset origin/$(git_current_branch) --hard'

alias grs='git restore'
alias grts='git restore --source'
alias grst='git restore --staged'

alias gsh='git stash'
alias gshall='git stash --all'
alias gsha='git stash apply'
alias gshc='git stash clear'
alias gshd='git stash drop'
alias gshl='git stash list'
alias gshp='git stash pop'

alias gs='git status'
alias gss='git status --short'