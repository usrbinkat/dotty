# Git stage/commit/push function to ease devel
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
  git commit -m 'moving to podman cloudctl+containerone deployment strategy'
  git push origin master
}
