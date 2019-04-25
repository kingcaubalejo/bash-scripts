#!/bin/bash

function _printPoweredBy()
{
    cat <<"EOF"

Powered By:

    kUy4J0b3rT
          ^__^      
          (00)-
         (oo) \\               
           u   \\             *
                \\           /
                 \\^^^^^^^^^B
                  ||---------\\  
                 - -         - - 

 >> Github: https://github.com/kUy4J0b3rT/

================================================================
EOF
}

function main()
{
    _printPoweredBy

    echo -n "Change the user global in your github locally (y/n)? "
    read answer

    if [ "$answer" != "${answer#[Yy]}" ] ;then
        echo Yes
    else
        echo No
    fi

    exit 0
}

main "$@"