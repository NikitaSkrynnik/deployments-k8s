# repo="deployments-k8s"
# owner="NikitaSkrynnik"

# cmdRepos="cmd-nsmgr
# cmd-nsmgr-proxy
# cmd-registry-memory
# cmd-registry-proxy-dns
# cmd-nse-vfio
# cmd-nse-remote-vlan
# cmd-nsc-init
# cmd-ipam-vl3
# cmd-map-ip-k8s
# cmd-admission-webhook-k8s
# cmd-cluster-info-k8s"


# for cmdRepo in $cmdRepos
# do
#   runs=$(gh api \
#   -H "Accept: application/vnd.github+json" \
#   -H "X-GitHub-Api-Version: 2022-11-28" \
#   /repos/$owner/$repo/actions/runs?branch=update/$owner/$cmdRepo)
  
#   lastRun=$(echo $runs | jq '[.workflow_runs | .[] | select(.name=="Pull Request on update/* Branch Push")][0]')
#   lastRunConclusion=$(echo $lastRun | jq -r '.conclusion')

#   if [ "$lastRunConclusion" != "success" ]; then
#     runID=$(echo $lastRun | jq -r '.id')
#     gh api \
#       --method POST \
#       -H "Accept: application/vnd.github+json" \
#       -H "X-GitHub-Api-Version: 2022-11-28" \
#       /repos/$owner/$repo/actions/runs/$runID/rerun
#   fi
# done



repos=$(gh api \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  /orgs/networkservicemesh/repos?type=sources | jq '.[].full_name' | grep "networkservicemesh/cmd-*.")

echo $repos > js.json