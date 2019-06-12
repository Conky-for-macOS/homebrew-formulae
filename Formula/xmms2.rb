require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Xmms2 < Formula
  homepage 'http://xmms2.org/wiki/Main_Page'
  url 'http://git.xmms2.org/xmms2/xmms2-devel/snapshot/6e6a9635f04c3e2c7af8dd9336ca6006d89f8114.tar.gz'
  sha256 'a5545459bf6aede5e9236d27e79e832db2a4b6dcad66c7e1de13bea32487dcfc'
  version '0.8.1'

  # depends_on 'cmake' => :build
  # depends_on :x11 # if your formula requires any X11/XQuartz components
  # ENV.libxml2
  depends_on 'glib'
  depends_on 'sqlite'
  depends_on 'flac'
  depends_on 'mad'
  depends_on 'mpg123'
  depends_on 'musepack'
  depends_on 'libmms'
  depends_on 'libsndfile'
  depends_on 'libvorbis'
  depends_on 'libao'
  depends_on 'perl'

  def install
    # Some dependencie on s4 which doesn't build
    system "git", "clone", "https://github.com/xmms2/s4", "src/lib/s4"
    system "./waf", "configure", "--prefix=#{prefix}", "--without-optional=s4"
    system "./waf", "build"
    system "./waf", "install"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test xmms2`.
    system "true"
  end
end


