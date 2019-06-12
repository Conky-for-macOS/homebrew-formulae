require 'formula'

class Libircclient < Formula
  homepage 'http://www.ulduzsoft.com/linux/libircclient/'
  url 'https://github.com/Conky-for-macOS/libircclient/archive/v1.10.1.tar.gz'
  sha256 'b4b7eac7b40f8e9aede3af8b035730b3436c0b8536b7613a72e57de0bb8d653e'

  depends_on 'pkg-config' => :build
  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build

  def install
    system "./configure --prefix=#{prefix} --enable-shared"
    system "make", "-j4"
    system "make", "install"
  end
end
