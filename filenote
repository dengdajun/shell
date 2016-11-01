#!/bin/bash
#文件描述符是与某个打开的文件或数据流相关联的整数。文件描述符 0 、 1 以及 2 是系统预留的。
 #j0 —— stdin (标准输入)
# 1 —— stdout (标准输出)
 #2 —— stderr (标准错误)
(1) 用下面的方法可以将输出文本重定向或保存到一个文件中:
$ echo "This is a sample text 1" > temp.txt
这种方法通过截断文件的方式,将输出文本存储到文件temp.txt中,也就是说在把
echo 命令的输出写入文件之前,temp.txt中的内容首先会被清空。
(2) 将文本追加到目标文件中,看下面的例子:
$ echo "This is sample text 2" >> temp.txt
(3) 查看文件内容:
$ cat temp.txt
This is sample text 1
This is sample text 2
(4) 来看看什么是标准错误以及如何对它重定向。当命令输出错误信息时, stderr 信息
就会被打印出来。考虑下面的例子:1.6 玩转文件描述符及重定向
15
$ ls +
ls: cannot access +: No such file or directory
1
这里, + 是一个非法参数,因此将返回错误信息。


成功和不成功的命令
当一个命令发生错误并退回时,它会返回一个非0的退出状态;
而当命令成功完成后,它会返回数字0。退出状态可以从特殊变量 $?
中获得(在命令执行之后立刻运行 echo $? ,就可以打印出退出状态)



下面的命令会将 stderr 文本打印到屏幕上,而不是文件中(而且因为并没有 stdout
的输出,所以out.txt没有内容):
$ ls + > out.txt
ls: cannot access +: No such file or directory
下面的命令中,我们将 stderr 重定向到out.txt:
2
3
4
$ ls + 2> out.txt #正常运行
你可以将 stderr 单独重定向到一个文件,将 stdout 重定向到另一个文件:
$ cmd 2>stderr.txt 1>stdout.txt
5
还可以利用下面这个更好的方法将 stderr 转换成 stdout ,使得 stderr 和 stdout
都被重定向到同一个文件中:
$ cmd 2>&1 output.txt
6
或者这样:
$ cmd &> output.txt

(5) 有时候,在输出中可能包含一些不必要的信息(比如调试信息)
。如果你不想让终端
中充斥着有关 stderr 的繁枝末节,那么你可以将 stderr 的输出重定向到 /dev/null,
保证一切都会被清除得干干净净。假设我们有3个文件,分别是a1、a2、a3。但是普
通用户对文件a1没有“读写执行”权限。如果需要打印文件名以a起始的所有文件
的内容,可以使用 cat 命令。设置一些测试文件:
7
8
$ echo a1 > a1
$ cp a1 a2 ; cp a2 a3;
$ chmod 000 a1 #清除所有权限
尽管可以使用通配符( a* )显示所有的文件内容,但是系统会显示一个出错信息,
因为对文件a1没有可读权限。
916
第 1 章
小试牛刀
$ cat a*
cat: a1: Permission denied
a1
a1
其中, cat : a1 : Permission denied 属于 stderr 。我们可以将 stderr 信息重定向
到一个文件中,而 stdout 仍然保持不变。考虑如下代码:
$ cat a* 2> err.txt # stderr被重定向到err.txt
a1
a1
$ cat err.txt
cat: a1: Permission denied
观察下面的代码:
$ cmd 2>/dev/null
当对如果对 stderr 或 stdout 进行重定向,被重定向的文本会传入文件。因为文本
已经被重定向到文件中,也就没剩下什么东西可以通过管道( | )传给接下来的命令,
而这些命令是通过 stdin 进行接收的。
(6) 但是有一个方法既可以将数据重定向到文件,还可以提供一份重定向数据的副本作
为后续命令的 stdin 。这一切都可以使用 tee 来实现。举个例子:要在终端中打印
stdout ,同时将它重定向到一个文件中,那么可以这样使用 tee :
command | tee FILE1 FILE2
在下面的代码中, tee 命令接收到来自 stdin 的数据。它将 stdout 的一份副本写入
文件out.txt,同时将另一份副本作为后续命令的 stdin 。命令 cat -n 将从 stdin 中接
收到的每一行数据前加上行号并写入 stdout :
$ cat a* | tee out.txt | cat -n
cat: a1: Permission denied
1a1
2a1
查看out.txt的内容:
$ cat out.txt
a1
a1
注意, cat: a1: Permission denied 并没有在文件内容中出现。这是因为这些
信息属于 stderr ,而 tee 只能从 stdin 中读取。


默认情况下, tee 命令会将文件覆盖,但它提供了一个 -a 选项,用于追加内容。例
如: $ cat a* | tee -a out.txt | cat –n 。
1
带有参数的命令可以写成: command FILE1 FILE2... 或者就简单的使用 command
FILE 。
(7) 我们可以使用 stdin 作为命令参数。只需要将 - 作为命令的文件名参数即可:
2
$ cmd1 | cmd2 | cmd -
例如:
$ echo who is this | tee -
who is this
who is this
3
也可以将 /dev/stdin作为输出文件名来代替 stdin 。
类似地,使用 /dev/stderr代表标准错误,/dev/stdout代表标准输出。这些特殊的设备
文件分别对应 stdin 、 stderr 和 stdout 。
