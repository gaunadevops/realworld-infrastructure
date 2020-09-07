## Setting up GitHub Action

``` shell
az ad sp create-for-rbac --name "staging-realworld-pipeline" --role contributor \
                            --sdk-auth
```

Grab the JSON result and create a secret called AZURE_CREDENTIALS


