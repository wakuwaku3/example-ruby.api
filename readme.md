# example-ruby-api

## environment
- ubuntu 18.04
- git 2.17.1
- node 10.16.3
- docker 19.03.1

## usage 
### install
```sh
# install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn -y

# install ruby
sudo apt update
sudo apt install git gcc build-essential libreadline-dev zlib1g-dev libssl-dev libpq-dev -y

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
rbenv --version

git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv install $version
rbenv global $version

gem install bundler
bundle install
bundle exec rails webpacker:install
```

### local settings
```json
{
  // set `which bundle` result
  "solargraph.bundlerPath": "/home/${USER}/.rbenv/shims/bundle"
}
```

### db settings
```sh
# run db
bash .docker/database/run.sh

# create database for develop
bundle exec rake db:create
```

## commands
### run db
```
bash .docker/database/run.sh
```
### stop db
```
bash .docker/database/stop.sh
```
### run rails
```
bundle exec rails server -b 0.0.0.0
```
