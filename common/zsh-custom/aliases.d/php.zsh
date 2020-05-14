if [ "$(uname -s)" = "Darwin" ]
then
    export PATH="$HOME/.composer/vendor/bin:$PATH"
fi
if [ "$(lsb_release -si)" = "Ubuntu" ]
then
    export PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi
