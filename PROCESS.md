# PR Review Process
Follow this process before you open a PR against the dev branch, and the reviewer of the PR should also follow these steps to verify QA.
1. Test search functionality
2. Test filter funtionality
2. Test mobile header navigation
3. Test desktop header navigation
4. Test desktop homepage navigation
5. Run brc http://localhost:4567/ (whatever port you're using)

# Deploy Process
Follow this process to deploy the dev branch changes to the master branch (and therefore the public website).
1. Change to dev branch (git checkout dev)
2. Pull latest changes from remote dev branch into your local dev branch (git pull)
3. cd to the base folder of slate
4. ./deploy.sh
5. Make sure there were no errors during the deploy and only files you were expecting to change got changed
6. Verify changes were made at docs.bons.ai