FROM epitechcontent/epitest-docker:latest
RUN echo -e "max_parallel_downloads=10\nfastestmirror=True" >> sudo cat /etc/dnf/dnf.conf
RUN apt update
RUN apt -y install zsh gpg wget
RUN mkdir -p /etc/apt/keyrings
RUN wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
RUN chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
RUN apt update
RUN apt install -y eza
RUN useradd -G root student
RUN mkdir -p /home/student/dev
WORKDIR /home/student
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN sh -c "echo 'alias ls=\"eza -lah\"' >> /root/.zshrc"
CMD ["zsh"]
