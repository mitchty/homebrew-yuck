#!/usr/bin/env ruby
#-*-mode: Ruby; coding: utf-8;-*-
require 'formula'

class Yuck < Formula
  homepage 'http://fresse.org/yuck'
  version '0.1.6'
  url "https://github.com/hroptatyr/yuck/releases/download/v#{version}/yuck-#{version}.tar.xz"
  sha1 'cbdcb6893c28a54f9789026d2d6c2f8cc0921270'
  depends_on 'xz'

  depends_on :automake
  depends_on :autoconf
  depends_on :libtool

  head do
    url 'https://github.com/hroptatyr/yuck.git', :branch => 'master'
  end

  def patches
  "https://gist.githubusercontent.com/mitchty/9997402/raw/b846b3efffabfe0ebff8908c7f0255ce7c73f528/yuck-osx.patch"
  end

  def install
    system "autoreconf -fi"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
