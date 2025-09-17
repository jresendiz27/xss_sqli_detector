set -e

echo "Installing common dependencies"
sudo apt install build-essential git curl openssl unzip

if [[ ! command -v aws ]]; then
  echo "Installing AWS CLI"
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  rm awscliv2.zip
else
  echo "AWS cli is installed"
fi
