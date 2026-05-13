# ============================================================
# CONFIGURE THESE
# ============================================================
$RG                  = "rg-github-runner"
$VM_NAME             = "vm-github-runner-lz-ai"
$VM_SKU              = "Standard_DC1s_v3"
$LOCATION            = "eastus"
$MI_NAME             =  Read-Host "Enter Managed Identity name"
$GITHUB_ORG          = "Gabegi"
$GITHUB_REPO         = "azure-ai-landing-zone-foundry-terraform-caf-waf-aaz"
$GITHUB_ENV          = "prod"
$GITHUB_RUNNER_TOKEN = Read-Host "Enter GitHub runner token"

# ============================================================
# 1. Create VM
# ============================================================
az vm create `
  --resource-group $RG `
  --name $VM_NAME `
  --image Ubuntu2204 `
  --size $VM_SKU `
  --location $LOCATION `
  --admin-username azureuser `
  --generate-ssh-keys `
  --public-ip-address ""

# ============================================================
# 2. Create UAMI and attach to VM
# ============================================================
az identity create -g $RG -n $MI_NAME -l $LOCATION

$MI_ID     = az identity show -g $RG -n $MI_NAME --query id -o tsv
$CLIENT_ID = az identity show -g $RG -n $MI_NAME --query clientId -o tsv
$TENANT_ID = az account show --query tenantId -o tsv
$SUB_ID    = az account show --query id -o tsv

az vm identity assign `
  --resource-group $RG `
  --name $VM_NAME `
  --identities $MI_ID

# ============================================================
# 3. Add federated credential
# ============================================================
az identity federated-credential create `
  --name "github-$GITHUB_ENV" `
  --identity-name $MI_NAME `
  --resource-group $RG `
  --issuer "https://token.actions.githubusercontent.com" `
  --subject "repo:${GITHUB_ORG}/${GITHUB_REPO}:environment:${GITHUB_ENV}" `
  --audiences "api://AzureADTokenExchange"

# ============================================================
# 4. Install and start GitHub Actions runner on VM
# ============================================================
az vm run-command invoke `
  -g $RG -n $VM_NAME `
  --command-id RunShellScript `
  --scripts "systemctl stop unattended-upgrades && apt-get update -y && apt-get install -y unzip curl wget git jq && mkdir -p /home/azureuser/actions-runner && cd /home/azureuser/actions-runner && curl -o runner.tar.gz -L https://github.com/actions/runner/releases/download/v2.317.0/actions-runner-linux-x64-2.317.0.tar.gz && tar xzf runner.tar.gz && RUNNER_ALLOW_RUNASROOT=1 ./config.sh --url https://github.com/$GITHUB_ORG/$GITHUB_REPO --token $GITHUB_RUNNER_TOKEN --name $VM_NAME --unattended && sudo ./svc.sh install && sudo ./svc.sh start"

# ============================================================
# 5. Print values to add to GitHub Environment manually
# ============================================================
Write-Host ""
Write-Host "Add these to GitHub -> Settings -> Environments -> $GITHUB_ENV -> Variables:"
Write-Host "AZURE_CLIENT_ID       = $CLIENT_ID"
Write-Host "AZURE_TENANT_ID       = $TENANT_ID"
Write-Host "AZURE_SUBSCRIPTION_ID = $SUB_ID"
