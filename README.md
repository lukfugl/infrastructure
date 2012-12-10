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
 * janus (git)
 * XCode
 * homebrew
 * rbenv (brew)
 * ruby-build (brew)

Restore infrastructure
======================
run ~/.infrastructure/restore

iTerm
=====
import "Desert" color theme from ~/Library/Application Support/iTerm

select "Desert" color theme

LimeChat
========
select "mosey" theme

add Instructure (irc.instructure.com:8765, SSL)
