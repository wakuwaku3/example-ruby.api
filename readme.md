# example-ruby-api

## environment
- ubuntu 18.04
- git 2.17.1

## install ruby
```sh
sudo apt update
sudo apt install git gcc build-essential libreadline-dev zlib1g-dev libssl-dev -y

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
rbenv --version

git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv install $version
rbenv global $version

gem install bundler
```

## Local Settings
```json
// replace ${USER}
{
  "solargraph.commandPath": "/home/${USER}/.rbenv/shims/solargraph"
}
```
