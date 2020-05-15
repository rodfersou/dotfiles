if [ -d ~/.composer/vendor/bin ]
then
    export PATH="$HOME/.composer/vendor/bin:$PATH"
elif [ -d ~/.config/composer/vendor/bin ]
then
    export PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi
