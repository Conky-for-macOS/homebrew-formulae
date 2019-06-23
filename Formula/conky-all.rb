# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class ConkyAll < Formula
  desc "Lightweight system monitor for X"
  homepage "https://github.com/Conky-for-macOS/conky-for-macOS"
  url "https://github.com/npyl/npyl.github.io/raw/master/Projects/conky/conky-1.11.1.tar.gz"
  sha256 "6d151f1dad509fb7a519ae43264f773c0008cd1d2255edf2f7be2a5e7e6ae004"

  depends_on "cmake"
  depends_on "freetype"
  depends_on "gettext"
  depends_on "lua"
  depends_on "curl"
  depends_on "imlib2"
  depends_on "pkg-config"
  depends_on "libircclient"
  depends_on "libmicrohttpd"
  depends_on "libical"
  depends_on "cairo"
  depends_on "cairo-xlib"
  depends_on "mysql"
  depends_on "librsvg"
  depends_on "pulseaudio"
  
  def install
      mkdir "build"
      cd "build"
      
      system "MACOSX_DEPLOYMENT_TARGET=10.10 cmake ..   \
              -DBUILD_WLAN=ON                       \
              -DBUILD_MYSQL=ON                      \
              -DBUILD_LUA_IMLIB2=ON                 \
              -DBUILD_LUA_RSVG=ON                   \
              -DBUILD_LUA_CAIRO=ON                  \
              -DBUILD_ICAL=ON                       \
              -DBUILD_IRC=ON                        \
              -DBUILD_HTTP=ON                       \
              -DBUILD_ICONV=ON                      \
              -DBUILD_RSS=ON                        \
              -DBUILD_IRC=ON                        \
              -DBUILD_PULSEAUDIO=ON                 \
              -DBUILD_CURL=ON                       \
              -DCMAKE_BUILD_TYPE=Release            \
              -DCMAKE_INSTALL_PREFIX=#{prefix}"
      
      system "make", "install"
  end

  test do
      system "conky", "-t", "'${exec echo \"test\" > test.txt && killall -9 conky}'"
      system "[", "-f", "text.txt", "]", "&&", "echo", "\"CONKY-ALL HAS BEEN INSTALLED! Have fun!\""
  end
end
