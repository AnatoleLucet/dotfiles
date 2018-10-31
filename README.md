# dotfile

## Install all
`apt-get install git-core`

clone this repo

`sudo apt install make`

`make all`


## Import / Export atom package

### Export
`apm list --installed --bare > atom-packages.list`

### Import
`apm install --packages-file atom-packages.list`
