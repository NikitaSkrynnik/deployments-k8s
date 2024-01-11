repo="deployments-k8s"
owner="networkservicemesh"

pulls=$(gh api \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  /repos/$owner/$repo/pulls?head=networkservicemesh:update/$owner/cmd-nse-vlan-vpp)

echo $pulls > pulls
latest_pr=$(echo $pulls | jq '.[0]')
pr_number=$(echo $latest_pr | jq '.number')


gh api \
  --method PUT \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  /repos/$owner/$repo/pulls/$pr_number/merge