# Install a new version of bash on Macos

By default, Macos runs zsh nowadays. I like bash more, but the version of bash apple ships by default is hopelessly outdated. We can fix this by following the following steps:

1. Install [homebrew](https://brew.sh/)
2. Run `brew install bash`
3. Run `which -a bash` and copy the location of the homebrew bash
4. Open your terminal of choice (I _love_ [iterm2](https://iterm2.com/)), and go to settings `Cmd + ,`
5. Where it says "default shell", change "login shell" to "custom command"
6. Paste the location of the homebrew bash version in there

Now every time the terminal opens, it will start the new bash version.
As an added bonus, you can also change the default shell to bash by typing `chsh -s /path/to/homebrew/bash`. But I find I rarely need this, and I'd like to have access to apple's default shell in apple's default terminal.

Note that, by default, you will get some kind of deprecation warning about macOS using `zsh` by default. You can disable this by adding `BASH_SILENCE_DEPRECATION_WARNING=1` to your `.bash_profile` or `.bashrc`.


