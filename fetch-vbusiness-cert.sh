#!/bin/bash

function _printPoweredBy()
{
    cat <<"EOF"

Powered By:

    kingcaubalejo
          ^__^      
          (00)-
         (oo) \\               
           u   \\             *
                \\           /
                 \\^^^^^^^^^B
                  ||---------\\  
                 - -         - - 

 >> Github: https://github.com/kingcaubalejo/

================================================================
EOF
}

# function __printPoweredBy()
# {
#     cat <<"EOF"

# Powered By:

#     kingcaubalejo
#           ^__^      
#           (00)-
#          (oo) \\               
#            u   \\             *
#                 \\           /
#                  \\^^^^^^^^^B
#                   ||---------\\  
#                  - -         - - 

#  >> Github: https://github.com/kingcaubalejo/

# ================================================================
# EOF
# }

function main() {
    # _printPoweredBy
BANNER=$(cat <<EOF
    powered by:
  _____ ______  ____     ___   ____  __  _  _       ____  ____  
 / ___/|      ||    \   /  _] /    ||  |/ ]| |     /    ||    \ 
(   \_ |      ||  D  ) /  [_ |  o  ||  ' / | |    |  o  ||  o  )
 \__  ||_|  |_||    / |    _]|     ||    \ | |___ |     ||     |
 /  \ |  |  |  |    \ |   [_ |  _  ||     \|     ||  _  ||  O  |
 \    |  |  |  |  .  \|     ||  |  ||  .  ||     ||  |  ||     |
  \___|  |__|  |__|\_||_____||__|__||__|\_||_____||__|__||_____| Solutions Inc.
                                                                                    
EOF
)


        echo "${BANNER}"

    cd /var/
    sudo mkdir ssl

    sudo chown www-data:www-data ssl
    sudo chmod 777 ssl

    cd ssl/
    sudo wget https://www.dropbox.com/sh/67i8fxun3w2colr/AABT3hrq9_c6Tcwxadq5yQBEa/vbusiness.crt
    sudo wget https://www.dropbox.com/sh/67i8fxun3w2colr/AAC2VTpc8Ma0k5bjhybaqcn5a/vbusiness.private.key

    echo "Date Finished: $(date +%F)"
}

main "$@"

