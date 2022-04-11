# Antsibull Docs Github Action

This is a very simple GitHub Action to generate Ansible Collection documentation.

As show in the GitHub Workflow code below, this can be combined with a GitHub Action to deploy GitHub Pages.
## Example Usage
```
---
name: Build Documentation and Deploy to Github Pages
on:
  push:
    branches:
      - master

jobs:
  hello_world_job:
    runs-on: ubuntu-latest
    name: Build and Deploy Documentation
    steps:
      - name: Cleaning Repository
        uses: AutoModality/action-clean@v1
        
      - name: Get Actions user id
        id: get_uid
        run: |
          actions_user_id=`id -u $USER`
          echo $actions_user_id
          echo ::set-output name=uid::$actions_user_id
      
      - name: Correct Ownership in GITHUB_WORKSPACE directory
        uses: peter-murray/reset-workspace-ownership-action@v1
        with:
          user_id: ${{ steps.get_uid.outputs.uid }}

      - name: Checkout
        uses: actions/checkout@v2

      - name: Generate documentation
        uses: kmj251/antsibull-docs-action@v1.2

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GHES_DSS_PAT_TOKEN }}
          publish_dir: ./docs
          keep_files: false

      - name: Cleaning up actions_github_pages directory that are older than 5 minutes.
        run: |
          find /home/gitactions/ -name "actions_github_pages*" -maxdepth 1 -type d -mmin +5 -exec rm -rf {} \;
```

### Disclaimer
This is a side project and may not have time to add enhancements, but I will do my best to fix any bugs that are encountered.