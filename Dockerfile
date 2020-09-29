FROM debian
RUN apt-get update  
RUN apt-get -y upgrade  
RUN apt-get install -yq apt-utils dialog 
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -yq build-essential software-properties-common  
RUN apt-get update  

# Python
RUN apt-get -y install python3
RUN apt-get -y install python3-pip
RUN apt-get install -yq python3-tk
RUN pip3 install --upgrade pip

WORKDIR /root/
COPY ./requirements.txt .
RUN pip3 install -r requirements.txt

# LATEX ENVIRONMENT
RUN apt-get install -y ranger
# Inkscap figures
RUN pip3 install inkscape-figures 
# Ultisnippets
RUN pip3 install unidecode 
RUN pip3 install Xlib
RUN apt install -y rxvt-unicode
RUN apt-get install -y xclip

# PDF viewer
RUN apt-get install -y zathura
# Compiler, maybe switch to pdf latex?
#RUN apt install latexmk 


RUN apt-get update \
    && apt-get install -y \
    texlive-full \
    && echo "\nmain_memory = 12000000" >> /etc/texmf/texmf.d/00debian.cnf \
    && echo "\nextra_mem_bot = 12000000" >> /etc/texmf/texmf.d/00debian.cnf \
    && echo "\nfont_mem_size = 12000000" >> /etc/texmf/texmf.d/00debian.cnf \
    && echo "\npool_size = 12000000" >> /etc/texmf/texmf.d/00debian.cnf \
    && echo "\nbuf_size = 12000000" >> /etc/texmf/texmf.d/00debian.cnf \
    && update-texmf \
    && texhash \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


#RUN apt-get install texlive-base 
#texlive-latex-base \
#texlive-latex-extra \
#texlive-latex-recommended 
# for vimtex-zathura interface
RUN apt-get update 
RUN apt-get install libxdo3 xdotool

RUN apt-get install -y inkscape
# Rofi for micro window management
RUN apt-get install -y rofi

# Vim 
RUN apt-get install -y vim
COPY . /root/tools/
RUN . /root/tools/install_vimrc.sh
RUN vim -E -s +PlugInstall +visual +qall; echo $?









