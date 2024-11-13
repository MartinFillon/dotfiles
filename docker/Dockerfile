FROM epitechcontent/epitest-docker:latest
RUN echo -e "max_parallel_downloads=10\nfastestmirror=True" >> sudo cat /etc/dnf/dnf.conf
RUN apt -y install zsh
RUN useradd -G root student
RUN mkdir -p /home/student/dev
WORKDIR /home/student
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
CMD ["zsh"]
