# Git stage/commit/push function to ease devel
# Example:
#  - cd ~/Git/projectName
#  - touch 1.txt
#  - gitup add text file
gitup () {
  git_branch=$(git branch | sed 's/* //g')
  git_commit_msg="$@"
  git_remote_push=$(git remote -v | awk '/push/{print $1, $2}')

  cat <<EOF

  Commiting to:
    - remote:    ${git_remote_push}
    - branch:    ${git_branch}
    - message:   ${git_commit_msg}

EOF

  git stage -A
  git commit -m "${git_commit_msg}"
  git push origin ${git_branch}
}
