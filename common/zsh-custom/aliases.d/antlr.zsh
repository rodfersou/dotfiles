if [ -f ~/.asdf/plugins/java/set-java-home.sh ]
then
  source ~/.asdf/plugins/java/set-java-home.sh
elif [ -f ~/.asdf/plugins/java/set-java-home.zsh ]
then
  source ~/.asdf/plugins/java/set-java-home.zsh
fi

export CLASSPATH=".:$HOME/.lib/antlr-4.8-complete.jar:$CLASSPATH"
alias antlr4="java -jar $HOME/.lib/antlr-4.8-complete.jar"
alias grun='java org.antlr.v4.gui.TestRig'
