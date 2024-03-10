### solarized dircolors for Linux:

    wget https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark -O ~/.dircolors

    # add to bash config file
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
