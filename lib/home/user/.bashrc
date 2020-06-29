# Git stage/commit/push function
# Example:
#  - cd ~/Git/projectName
#  - touch 1.txt
#  - gitup add text file
# Git stage/commit/push
gitup () {
  git_commit_msg="$@"
  git_branch=$(git branch --show-current --column)
  git_remote_push="$(git remote get-url --push --all origin)"

  cat <<EOF

  Commiting to:
    - branch:    ${git_branch}
    - message:   ${git_commit_msg}
    - remote:    ${git_remote_push}
    
EOF

  git stage -A
  git commit -m "${git_commit_msg}"
  git push origin ${git_branch}
}
