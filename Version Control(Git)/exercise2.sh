ls missing-semester &> /dev/null
if [[ $? -ne 0 ]]; then
    git clone https://github.com/missing-semester/missing-semester.git
fi

cd missing-semester
git log --graph | head -n 30
git log --follow README.md | grep Author | head -n 1
git blame _config.yml | grep collections: | awk {'PRINT $0'} |\
xargs git show | tail -n +6

cd ..