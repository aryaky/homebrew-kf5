require "formula"

class Kf5Kio < Formula
  url "http://download.kde.org/stable/frameworks/5.37/kio-5.37.0.tar.xz"
  sha256 "49448ebcfe182805f8f9cd40c1e2c8e686578cc2e7fa3688204d5ca4e182ac5b"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kio.git"

  option "without-kiowidgets", "Builds only KIO core"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"
  depends_on "chigraph/kf5/kf5-karchive"
  depends_on "chigraph/kf5/kf5-kbookmarks" unless build.without? "kiowidgets"
  depends_on "chigraph/kf5/kf5-kjobwidgets" unless build.without? "kiowidgets"
  depends_on "chigraph/kf5/kf5-kwallet" unless build.without? "kiowidgets"
  depends_on "chigraph/kf5/kf5-solid"
  depends_on "chigraph/kf5/kf5-kservice"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "13334cf6bd9c7eafa7a5d72fa7770445b005a2ce1ffa9e03c7ae94d829d2810e" => :sierra
  end

  def install
    args = std_cmake_args
    args << "-DKIOCORE_ONLY=ON" if build.without? "kiowidgets"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
