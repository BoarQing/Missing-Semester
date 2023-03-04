mkdir tmp_repo
cd tmp_repo

git init
echo "a password" > password.txt
git add password.txt
git commit -m "add a password file"
echo "b password">> password.txt
git add password.txt
git commit -m "add a password"
echo "" > code.txt
git add code.txt
git commit -m "code"
#use force since it is not pushed yet
git filter-repo --invert-paths --path password.txt --force
echo password.txt > .gitignore
git add .gitignore
git commit -m "rmv password"
git log 

cd ..
