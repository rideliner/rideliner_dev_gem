# encoding: utf-8
# Copyright (c) 2016 Nathan Currier

require 'yard'

YARD::Templates::Engine.register_template_path(
  File.expand_path('../yard_template', File.dirname(__FILE__))
)
