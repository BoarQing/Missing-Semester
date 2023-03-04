ls missing-semester &> /dev/null
if [[ $? -ne 0 ]]; then
    git clone https://github.com/missing-semester/missing-semester.git
fi

ls ~/.gitconfig &> /dev/null
if [[ $? -ne 0 ]]; then
    touch ~/.gitconfig
fi
cp ~/.gitconfig ~/.gitconfig.backup
echo "[alias]" > ~/.gitconfig
echo "    graph = log --all --graph --decorate --oneline" >> ~/.gitconfig

cd missing-semester
git graph | head
cd ..

mv ~/.gitconfig.backup ~/.gitconfig

