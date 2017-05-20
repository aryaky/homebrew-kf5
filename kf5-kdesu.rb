require "formula"

class Kf5Kdesu < Formula
  url "http://download.kde.org/stable/frameworks/5.34/kdesu-5.34.0.tar.xz"
  sha256 "2d0632e80011fc19ff611d73c6e996211146b66743d9f5e67c5423374d03bd12"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kdesu.git'

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kpty"
  depends_on "qt5"
  depends_on "gettext" => :build

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
