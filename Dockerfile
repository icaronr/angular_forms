FROM ruby:2.6-alpine
# Install dependencies:
# - build-base: To ensure certain gems can be compiled
# - nodejs: Compile assets
# - postgresql-dev postgresql-client: Communicate with postgres through the postgres gem
# - libxslt-dev libxml2-dev: Nokogiri native dependencies
# - imagemagick: for image processing
RUN apk --update add build-base nodejs tzdata postgresql-dev postgresql-client libxslt-dev libxml2-dev imagemagick
# Seta nosso path
ENV INSTALL_PATH /onebitforms
# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH
# Seta o nosso path como o diretório principal
WORKDIR $INSTALL_PATH
# Copia o nosso Gemfile para dentro do container
COPY Gemfile ./
# Seta o path para as Gems
ENV BUNDLE_PATH /box
# Copia nosso código para dentro do container
COPY . .