# dotfile

## Install all

`sudo apt-get install build-essential`

`make all`


## Import / Export atom package

### Export
`apm list --installed --bare > atom-packages.list`

### Import
`apm install --packages-file atom-packages.list`
