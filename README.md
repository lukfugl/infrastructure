the LimeChat/limescripts directory is basically a fork of
https://github.com/rpflorence/limescripts. It's imported wholesale,
however, rather than as a submodule, since the configuration
(lib/main.coffee, new .coffee modules in lib/) has to happen right
inside the repo.

the mosey-limechat-theme submodule points to
https://github.com/phaedryx/mosey-limechat-theme

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
 * LimeChat
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
   ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
   sudo chown -R <user> /usr/local
   ```

 * **rbenv, ruby-build, libxmlsec1, node**

   In most recent system setup,
   I had to revert to 0.14 recipe of p11-kit (dependency for libxmlsec1)
   and I had to specify a mirror for libxmlsec1 itself
   (http://xmlsoft.org/sources/xmlsec/releases/xmlsec1-1.2.18.tar.gz).

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

   Needs to be in the 1.1.x series. In the most recent
   system setup, 1.1.8 was the newest 1.1.x recipe, but the selected
   mirror didn't have the tarballs for 1.1.8 anymore; it had 1.1.10
   instead. I used the 1.1.10 tarball (url:
   http://www.apache.org/dyn/closer.cgi?path=/cassandra/1.1.10/apache-cassandra-1.1.10-bin.tar.gz,
   sha: 594a78399e0e382b61fbfc761a4e2345327a892f) with the 1.1.8 recipe
   and it seems to be working.

   ```sh
   brew versions cassandra | grep -e '1\.1\.\d' | head -n 1
   cd /usr/local && git checkout <commitish> /usr/local/Library/Formula/cassandra.rb
   brew install cassandra python
   pip install cql
   ln -sfv /usr/local/opt/cassandra/*.plist ~/Library/LaunchAgents
   launchctl load ~/Library/LaunchAgents/homebrew.mxcl.cassandra.plist
   ```

 * **postgresql**

   ```sh
   brew install postgresql
   initdb /usr/local/var/postgres -E utf8
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

LimeChat
========
select "mosey" theme

add Instructure (irc.instructure.com:8765, SSL)
