# Starting from a minimalist image
FROM ruby:2.7

# Install bash (must be installed for alpine builds)
# RUN apk update && apk add bash

# Reference for help contact me
LABEL maintainer="chris@adadev.org"

# Create a directory for the app
RUN mkdir /app

# Set the working directory for RUN, ADD and COPY
WORKDIR /app

# Add entire student fork (overwrites previously added Gemfile & Tests)
ARG SUBMISSION_SUBFOLDER
ADD $SUBMISSION_SUBFOLDER /app

# Optional - Copy Gemfile over and install Gems
# COPY ./Gemfile .

RUN gem install bundler
RUN bundle install

# Copy over bash runner
ADD test.sh .
# Copy over Rakefile
ADD Rakefile .
# Copy over tests
ADD ./test .

RUN chmod +x test.sh