# dotfile

## Install all

`sudo apt install make`

`make all`


## Import / Export atom package

### Export
`apm list --installed --bare > atom-packages.list`

### Import
`apm install --packages-file atom-packages.list`
