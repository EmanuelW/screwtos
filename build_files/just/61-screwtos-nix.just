configure-nix:
    sudo -v || exit 1
    sudo usermod -aG nixbld $USER

un-configure-nix:
    sudo -v || exit 1
    sudo usermod -rG nixbld $USER
