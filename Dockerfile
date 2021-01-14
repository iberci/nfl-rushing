FROM ruby
ENV INSTALL_PATH /opt/app
ENV XDG_CONFIG_HOME=/config
 
RUN apt-get update -qq
RUN apt-get install -y curl neovim npm sqlite3

RUN gem install rails bundler
WORKDIR /app  

RUN mkdir /app               
COPY . .                     

RUN npm install npm@latest -g
RUN npm install yarn -g      

COPY ./init.vim /config/nvim/
