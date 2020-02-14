# dotfiles

## Do all in one line
It will end with the ssh-keygen

```
sudo apt install git-core make && git clone https://github.com/AnatoleLucet/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && make all
```

---

Before all, clone this repo.

## Install deps
```
make install
```

## Import every dotfiles
```
make c/i/all
```

## Import dotfiles by its soft name
```
# syntax
make c/i/<soft_name>

# example
make c/i/zsh
```

## Export dotfiles by its soft name
```
# syntax
make c/e/<soft_name>

# example
make c/e/zsh
```
