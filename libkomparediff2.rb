require "formula"

class Libkomparediff2 < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/applications/16.12.3/src/libkomparediff2-16.12.3.tar.xz"
  sha256 "31d14264f37522b2d5472874642cab73fe71ca8e077a6f0dd69de3138469a2c2"

  head "git://anongit.kde.org/libkomparediff2.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kcoreaddons"
  depends_on "chigraph/kf5/kf5-kcodecs"
  depends_on "chigraph/kf5/kf5-kconfig"
  depends_on "chigraph/kf5/kf5-kxmlgui"
  depends_on "chigraph/kf5/kf5-kio"
  depends_on "chigraph/kf5/kf5-ki18n"

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
