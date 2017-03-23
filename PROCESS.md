**WARNING**: Never touch the `master` branch, this for the deploy script only. Treat the `dev` branch as a psuedo-master branch.

Before you get started: install broken-link-checker via npm with: `npm install broken-link-checker -g`

# Open PR / PR Review Process
Follow this process before you open a PR against the dev branch, and the reviewer of the PR should also follow these steps to verify QA.
1. Merge origin/dev into local WIP branch
2. Test search functionality by pressing enter on mobile/desktop
3. Test search functionality by clicking search icon on mobile/desktop
4. Test filter funtionality
5. Test mobile header navigation
6. Test desktop header navigation
7. Test desktop homepage navigation
8. Run blc http://localhost:4567/ -ro (runs broken-link-checker on whatever port you're using)

# Deploy Process
Follow this process to deploy the dev branch changes to the master branch (and therefore the public website).
1. Change to dev branch (git checkout dev)
2. Pull latest changes from remote dev branch into your local dev branch (git pull)
3. cd to the base folder of slate
4. ./deploy.sh
5. Make sure there were no errors during the deploy and only files you were expecting to change got changed
6. Verify changes were made at docs.bons.ai