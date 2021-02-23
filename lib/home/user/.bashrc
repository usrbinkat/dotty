# Git stage/commit/push function
# Example:
#  - cd ~/Git/projectName
#  - touch 1.txt
#  - gitup add text file
# Git stage/commit/push
gitup () {
  sudo chown -R $USER ~/.ssh
  sudo chown -R $USER ./

  git pull
  git_commit_msg="$@"
  git_remote=$(git remote)
  git_branch=$(git branch --show-current)
  git_remote_push="$(git remote get-url --push ${git_remote} | awk -F'[@]' '{print $2}')"

  cat <<EOF

  Commiting to:
    - branch:    ${git_branch}
    - remote:    ${git_remote_push}
    - message:   ${git_commit_msg}

EOF

  git stage -A
  git commit -m "${git_commit_msg}" --signoff
  git push
}
