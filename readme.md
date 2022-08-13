默认在 /etc/rc.d/ssh.sh 中加载了 ssh (如果不需要，可以用 `#` 注释掉)

也可以在运行的 docker 的机器上运行 `./zsh.sh` 进入容器

编辑 `/etc/rc.local`

然后 `exit` 退出容器 `./restart.sh` 即可

推荐使用 [mosh](https://mosh.org) 远程连接，速度更快

先参考 `./docker-compose.yml` 中的端口范围配置防火墙 (60000-60010 是 udp)

```
- "60000:80"
- "60001:22"
- "60000-60009:60000-60009/udp"
- "60002-60009:60002-60009"
```

然后， mosh 连接需要通过 docker 的 ssh 端口交互握手信息，可以如下指定 ssh 端口

`mosh r5 -ssh="ssh -p 60001" -p 60000:60009`

服务器端不用手动运行 `mosh-server`，`mosh` 会通过 `ssh` 连上服务器去启动 `mosh-server`

如果用的是 `iuser-ubuntu-en` 然后登录的终端又是其他语言的，需要在服务器上生成一下语言文件，比如生成简体中文的语言文件方法如下：

`localedef -v -c -i zh_CN -f UTF-8 zh_CN.UTF-8`

mosh 要支持真彩色需要客户端使用 github 最新版的源代码 ( mac 可以这样 )

```
brew install --HEAD mosh
```

可以放置 `idev` 到 `~/.bin` 并在 `.bash_alias` 中添加 `./bin` 到 `PATH` ( `export PATH=$PATH:$HOME/.bin` )

然后输入 `idev` 就可以连上服务器的 `tmux` ，输入 `idev zsh` 就可以连上服务器的 `zsh`

> ./idev
