git checkout main
git branch -D  update/networkservicemesh/pr
git push fork --delete  update/networkservicemesh/pr
git checkout -b  update/networkservicemesh/pr
echo "change" > change
git add .
git commit -sm change
git push -u fork update/networkservicemesh/pr
open -a "Google Chrome" https://github.com/NikitaSkrynnik/deployments-k8s/pull/new/update/networkservicemesh/pr