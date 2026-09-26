# How to revert the local changes in GIT and Pull the orginal repo
 git fetch origin
 git reset --hard origin/main
 git reset --hard origin/main
 git clean -fd
 git status

 # How to login in Azure through MFA
 az login --tenant "38b0c329-edba-4107-9b22-50e7727b3042" --scope "https://management.core.windows.net//.default" --claims-challenge "eyJhY2Nlc3NfdG9rZW4iOnsiYWNycyI6eyJlc3NlbnRpYWwiOnRydWUsInZhbHVlcyI6WyJwMSJdfX19"

 # How to pull Git repo if sync is not highlighted 
 git branch  -  First check which branch you're on:
 git pull origin main - if your branch is master or main 