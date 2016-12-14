#Useful bash scripts

Scripts which can be placed in folder which is sourced (for example ~/bin).

### List of scripts:

* colortail.sh
* lock.sh
* screen-off.sh

### Scripts' usage
<hr>
<b>1. colortail</b>

Prints tail command with colored output. 
Defalt colors are:
* DEBUG - blue
* INFO - default
* WARN - yellow
* ERROR - red

example usage of command:
```
$ colortail.sh -f -n 100 server.log
```
All arguments are passed to `tail` command

<hr>
<b>2. lock</b>

Locks the screen. Keyboard shortcut can be added to invoke that script.

<hr>
<b>3. screen-off </b>

Turns screen off. In my laptop, after locking,
the screen turns to black but is still highlighted.
That screept prevents such a situation.