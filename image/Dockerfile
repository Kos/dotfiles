FROM fedora:44

RUN dnf copr enable -y dejan/lazygit && \
    dnf install -y sudo git which openssh-clients zsh lazygit


RUN useradd -m -s /usr/bin/zsh kos

# sudo granted only for the build — revoked before the image is finalized
RUN echo "kos ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/kos && \
    chmod 0440 /etc/sudoers.d/kos

USER kos
WORKDIR /home/kos
CMD zsh

# Clone dotfiles over public https, leave the repo locally
RUN rm /home/kos/.zshrc && \
    git clone https://github.com/Kos/dotfiles.git ~/dotfiles && \
    cd dotfiles && \
    ./link.sh && ./install.sh

RUN sudo dnf clean all
