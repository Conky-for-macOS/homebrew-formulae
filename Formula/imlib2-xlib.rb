class Imlib2Xlib < Formula
  desc "Image loading and rendering library"
  homepage "https://sourceforge.net/projects/enlightenment/"
  url "https://downloads.sourceforge.net/project/enlightenment/imlib2-src/1.5.1/imlib2-1.5.1.tar.bz2"
  sha256 "fa4e57452b8843f4a70f70fd435c746ae2ace813250f8c65f977db5d7914baae"

  depends_on "pkg-config" => :build
  depends_on "freetype"
  depends_on "giflib"
  depends_on "jpeg"
  depends_on "libpng"
  depends_on "libtiff"
  depends_on :x11

  keg_only "An imlib2 installation may already be present."

  def install
    args = %W[
      --with-x
      --disable-dependency-tracking
      --prefix=#{prefix}
      --enable-amd64=no
      --without-id3
    ]

    system "./configure", *args
    system "make", "install"
  end

  test do
    system "#{bin}/imlib2_conv", test_fixtures("test.png"), "imlib2_test.png"
  end
end
