ls missing-semester &> /dev/null
if [[ $? -ne 0 ]]; then
    git clone https://github.com/missing-semester/missing-semester.git
fi

cd missing-semester

echo "chg"  >> _config.yml
git status
git stash
git status
git log --all --oneline | head
git stash pop
git status
git checkout _config.yml

cd ..