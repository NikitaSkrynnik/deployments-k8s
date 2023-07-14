branches=$(git branch -r --list "fork/update/*")

for branch in $branches
do
    prTitle="Update from $branch"
    prBody=$(git log $branch -1 --pretty='format:%B'| sed '/^$/d;$d' | sed 's/#/# /g')
    echo $prBody
 
    gh repo set-default https://github.com/NikitaSkrynnik/deployments-k8s
    gh pr create -B "main" -H "$branch" --title "$prTitle" --body "$prBody" ;
done

# gh pr create -B "main" -H "$ref" --title "$prTitle" --body "$prBody" ;