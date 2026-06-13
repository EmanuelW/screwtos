configure-nix:
    #!/bin/bash

    sudo -v || exit 1

    if ! getent group nixbld > /dev/null 2>&1; then
        sudo groupadd -r nixbld > /dev/null 2>&1 || true
    fi

    sudo usermod -aG nixbld $USER

un-configure-nix:
    #!/bin/bash
    
    sudo -v || exit 1
    sudo usermod -rG nixbld $USER
    
    if ! getent group nixbld > /dev/null 2>&1; then
        sudo groupdel nixbld > /dev/null 2>&1 || true
    fi
