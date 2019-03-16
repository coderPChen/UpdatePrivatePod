
### 1. 背景
我们知道上传一个私有库到gitLab上大概有这几个环节：

 1. 更改podSpec增加版本号
 2. push最新代码到gitLab库上
 3. 打上gitTab并且同步到远程仓库上
 4. 通过pod 命令 验证模块能否编译成功
 5. 通过pod 命令 上传到私有库
 6. 更新本地仓库，让pod Search能够搜索到
 
得6步才能更新一个仓库到pod上，并且pod命令验证模块，又得根据模块的依赖关系输入不同命令。  这过程不仅仅显得繁琐，而且学习成本高，成功率低。这篇主要想通过FastLane很方便的上传远程仓库，即使你对这些命令不是很了解，也能通过FastLane轻松实现上传到私有库。



### 2. FastLane简介
Fastlane是一个ruby脚本集合，它可以按照我们指定的路线，在指定位置执行我们所要执行的操作。这里我们称这样的路线为「航道(lane)」，这样的操作称为「Action」

Action是Fastlane自动化流程中的最小执行单元，用来执行Fastlane脚本中的命令



### 3. 安装

*安装ruby

```
1. brew update
2. brew instaqll ruby
````

* 装fastlane

```
sudo gem install -n /usr/local/bin fastlane
```


* 所有action

```
fastlane actions
```


### 4. 运行

下载已经写好的ZPUpdatePod fastlane脚本，并且放在工程的 .podspesc 同级文件夹中。

* 执行下面命令
  
```
fastLane ZPUpdatePod tagNum:xxx  podspecName:xxxx privateRepoName:xxx
```

其中privateRepoName:xxx 可选， 不填，fastLane不会更新本地仓库。

以上方式还是有两处不方便

    1.得先CD 到对应的项目路径， 不能打开终端，就可以上传私有库

    2.并且填下对应的 ZPUpdatePod   podspecName  和  privateRepoName 三个变量名， 不容易记住 



可以通过linux系统  alias 命令来简化这个步骤

```
alias XXXX=’cd 项目目录 &&  fastLane ZPUpdatePod   podspecName:XXXX 
privateRepoName:XXXX
```


alias 仅作用于该次登陆的会话。若要永久使用别名，可在 /etc/profile 或自己的 ~/.bash_profile 中设定指令的别名

 1. 打开 ~/.bash_profile

 2. 添加 alias hp="http_proxy=http://localhost:8123"

 3. 更新 bash 配置，即 source ~/.bash_profile













