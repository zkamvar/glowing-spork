set -euo pipefail

should_i_push=${1:-false}
echo "Should I push? ${should_i_push}"

if [ "${should_i_push}" -eq true ]; then
  git config --local user.email "actions@github.com"
  git config --local user.name "GitHub Actions"
  printf "\n" >> README.md
  git log >> README.md
  git add .
  git commit -m "update README with log"
  git push
fi
