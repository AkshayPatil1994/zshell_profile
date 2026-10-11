# zsh reference setup

Install on a new machine (Kubuntu):

    sudo apt install zsh && chsh -s "$(which zsh)"
    cp zsh_ref/.zshrc ~/
    cp -r zsh_ref/.zsh ~/

Then open a new terminal. Edit ~/.zsh/zsh_alias and the PATH section in ~/.zshrc for the new machine.
History is written to ~/.zsh/zsh_history (not included).
