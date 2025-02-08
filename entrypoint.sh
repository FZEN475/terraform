#!/usr/bin/env ash

function init_ssh_access() {
  mkdir -p /root/.ssh/
  [ -f /root/.ssh/id_ed25519 ] || cp /run/secrets/id_ed25519 /root/.ssh/ && chmod 0600 /root/.ssh/id_ed25519
  ssh-keyscan esxi.home.lan >> /root/.ssh/known_hosts
  ssh-keyscan 192.168.2.1 >> /root/.ssh/known_hosts
  echo "
    Host 192.168.2.1
        HostName 192.168.2.1
        User root
        IdentityFile ~/.ssh/id_ed25519
        IdentitiesOnly yes
    " > ~/.ssh/config
}

function init_terraform() {
    cat /source/main.tf
    scp -O 192.168.2.1:/mnt/nas/secrets/variables.tf /source
    scp -O 192.168.2.1:/mnt/nas/secrets/terraform.tfstate /source
    terraform init -input=false
    terraform providers
}

function plan() {
  terraform plan
  terraform output -json | jq -r 'del(.[]|."sensitive") | del(.[]|."type") | walk(if type == "object" then with_entries( if .key == "value" then .key = "hosts" | .value = (.value | map({(.) : null} )  | add) else . end ) else . end) ' > /source/inventory.json
  scp -r /source/inventory.json 192.168.2.1:/mnt/nas/secrets/ >&/dev/null
}

function apply() {
  terraform apply -auto-approve
  terraform output -json | jq -r 'del(.[]|."sensitive") | del(.[]|."type") | walk(if type == "object" then with_entries( if .key == "value" then .key = "hosts" | .value = (.value | map({(.) : null} )  | add) else . end ) else . end) ' > /source/inventory.json
  scp -r /source/terraform.tfstate 192.168.2.1:/mnt/nas/secrets/ >&/dev/null
  scp -r /source/inventory.json 192.168.2.1:/mnt/nas/secrets/ >&/dev/null
}

init_ssh_access
init_terraform
if [[ "$1" == "apply" ]]
then
  apply
else
  plan
fi
cat /source/inventory.json

