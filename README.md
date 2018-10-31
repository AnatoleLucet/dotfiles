# dotfile

## Install all
`sudo apt-get install git-core`

clone this repo

`sudo apt install make`

`make all`


## Setup ssh key

`make ssh`

it will return you your ssh key

## Import / Export atom package

### Export
`apm list --installed --bare > atom/atom-packages.list`

### Import
`apm install --packages-file atom/atom-packages.list`
