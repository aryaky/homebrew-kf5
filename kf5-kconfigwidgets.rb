require "formula"

class Kf5Kconfigwidgets < Formula
  url "http://download.kde.org/stable/frameworks/5.38/kconfigwidgets-5.38.0.tar.xz"
  sha256 "1d70a761eefe60e6f7beb3517ed64edbb6266cfe85bbb65603c9764e524b6170"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kconfigwidgets.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kdoctools" => :build
  depends_on "qt"
  depends_on "chigraph/kf5/kf5-kauth"
  depends_on "chigraph/kf5/kf5-kcoreaddons"
  depends_on "chigraph/kf5/kf5-kcodecs"
  depends_on "chigraph/kf5/kf5-kconfig"
  depends_on "chigraph/kf5/kf5-kguiaddons"
  depends_on "chigraph/kf5/kf5-kwidgetsaddons"
  depends_on "chigraph/kf5/kf5-ki18n"

#  bottle do
#    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
#    sha256 "08d481343d8b2a71ccfba78dcfc806ce8624f87e7ad63805310157473ccf52e4" => :sierra
#  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
