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
  git_branch=$(git branch --column | awk '{print $2}' | head -n 1)
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
