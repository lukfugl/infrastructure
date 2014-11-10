the Desert.itermcolors comes from
https://github.com/mbadolato/iTerm2-Color-Schemes

SSH
===
run ssh-keygen

provide ~/.ssh/id_rsa.pub to ops

provide ~/.ssh/id_rsa.pub to GitHub

provide ~/.ssh/id_rsa.pub to Gerrit

Install
=======

 * iTerm2
 * MacVim
 * Adium
 * XCode
 * Adobe Source Code Pro (font, http://sourceforge.net/projects/sourcecodepro.adobe/files/)

Setup
=====

 * **janus**

   ```sh
   git clone https://github.com/carlhuda/janus.git $HOME/.vim
   cd $HOME/.vim && rake
   ```

 * **homebrew**

   NOTE: May already be present in base install.

   ```sh
   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   sudo chown -R <user> /usr/local
   ```

 * **rbenv, ruby-build, libxmlsec1, node**

   ```sh
   brew install rbenv ruby-build libxmlsec1 node
   ```

 * **redis**

   ```sh
   brew install redis
   ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
   launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
   ```

 * **cassandra** (with python for pip)

   Brew can't seem to keep a consistently good version of cassandra formulated. And now they're removed `brew version`. So just do whatever you need to to get cassandra installed. :p For now I'm using https://gist.github.com/ncloward/4cd208ee0dbdf78fb1ee. Then:

   ```sh
   pip install cql
   ln -sfv /usr/local/opt/cassandra/*.plist ~/Library/LaunchAgents
   launchctl load ~/Library/LaunchAgents/homebrew.mxcl.cassandra.plist
   ```

 * **postgresql**

   ```sh
   brew install postgresql
   ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
   launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
   ```

 * **infrastructure**

   ```sh
   git clone git@github.com:lukfugl/infrastructure.git $HOME/.infrastructure
   $HOME/.infrastructure/restore
   ```

 * **rails, bundler**

   The preceding infrastructure restore should have sourced the restored
   .bashrc, but in case it didn't make sure rbenv is active when
   installing these gems:

   ```sh
   gem install rails bundler
   rbenv rehash
   ```

iTerm
=====
import "Desert" color theme from ~/Library/Application Support/iTerm

select "Desert" color theme
