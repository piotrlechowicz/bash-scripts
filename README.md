Useful Linux scripts
===

- - -

How to install & use
---

To use them from any place in terminal put them in folder added to `$PATH` variable.

<details>
  <summary>How to add folder to `$PATH` variable</summary><br>

  Create folder in your home directory, e.g. `bin`.

  ```
  $ mkdir ~/bin
  ```

  Add that folder to $PATH variable in your `.bash_profile` file.

  ```
  $ echo "export PATH=$HOME/bin:$PATH" >> ~/.bash_profile
  ```

  Source `.bash_profile` file in your `.bash_rc` file if it is not yet sourced.

  ```
  $ echo "source $HOME/.bash_profile" >> ~/.bashrc
  ```

</details>

List of scripts:
---
* colortail
* lock
* screen-off
* extract-recursively
* create-csv-from-bib
* jserver
* notify-to-file
* bibtex-absolute-to-relative.sh

Detailed list of scripts
---
<details>
<summary>Table with short description</summary>

Name | Description
--|--
colortail | prints tail command with colored output
lock      | Locks the screen (and turns monitor highlight off)
screen-off | Turns monitor highlight off
extract-recursively | recursively extracts packed files in corresponding folders
create-csv-from-bib | creates csv file from corresponding bibtex file
jserver | allows to start/stop/restart jboss servers
notify-to-file | monitors gnome notifications and saves them to file

</details>

Scripts detailed description
---

<details>
  <summary>colortail</summary><br>

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

</details>

<details>
  <summary>lock</summary><br>

Locks the screen. Keyboard shortcut can be added to invoke that script.

</details>

<details>
  <summary>screen-off</summary><br>

Turns screen off. E.g. in my laptop, after locking,
the screen turns to black but it is still highlighted.
That script prevents from such situation.
</details>

<details>
  <summary>extract-recursively</summary><br>

  Recursively extracts packed folders in zip, rar or 7z format and puts them in corresponding folder. It is useful when there is a lot of packed files in tree-like folder structure and you have to extract each one of them into folder where they are placed.

  This command requires following packages:
  * unzip
  * unar
  * 7z

</details>

<details>
  <summary>create-csv-from-bib</summary><br>

  Parses bibtex file with bibliography into csv file. It can be useful to import bibliography into MS Excel, libreoffice calc, etc.

  **Script is not finished and tested, it is just downloaded from some place and it has to be improved**
</details>

<details>
    <summary>jserver</summary><br>

  Manages different wildfly/jboss servers from command line. Usage:
  ```
  $ jserver <server_name> <command> [[server_type] server_dir]
  ```

  where `command` is one of:
  * start
  * stop
  * restart
  * log

  Server path is build in the following way:
  ```
  server_path="<server_dir>/<server_name>/<server_type>"
  ```
  and then the commands are invoked on the `bin` folder.
</details>
<details>
  <summary>notify-to-file</summary><br>

  Stores gnome desktop environment notifications in file `~/.notification-logs`.

  To run that script after logging into gnome environment you can place it in `.gnomerc` file in your home directory. This file is automatically sourced when you logged into gnome session.

  ```
  /path/to/script/notify-to-file &
  ```

  Another option is to put it into cron tab.

  To edit the cron tab type:
  ```
  $ crontab -e
  ```
  Add following line:
  ```
  @reboot /path/to/script/notify-to-file
  ```
</details>

<details>
  <summary>bibtex-absolute-to-relative.sh</summary><br>

  Sanitizes bibtex file from absolute paths to relative ones. It is useful
when docear or jabref reference manager is used.

In bibtex file you add following line:
  ```
  @comment{jabref-meta: fileDirectory:&lt;path&gt;;}
  ```

  where `path` can reflect either relative or absolute path to pdf repository.

  In such case `file` annotation in bibtex can use relative path only. The aim of 
this script is to replace absolute paths created by assigning pdfs to references in docear,
and replace them with relative ones. It allows for easier migration between computers.
</details>
