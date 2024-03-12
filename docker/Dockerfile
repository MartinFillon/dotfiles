FROM epitechcontent/epitest-docker:latest
RUN echo -e "max_parallel_downloads=10\nfastestmirror=True" >> sudo cat /etc/dnf/dnf.conf
RUN dnf -y install zsh
RUN dnf -y install eza
RUN adduser -G wheel student
USER student
RUN mkdir -p /home/student/dev
WORKDIR /home/student
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
CMD ["zsh"]
