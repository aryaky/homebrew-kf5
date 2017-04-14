require "formula"

class Kf5Kcoreaddons < Formula
  url "http://download.kde.org/stable/frameworks/5.32/kcoreaddons-5.32.0.tar.xz"
  sha256 "5dcf838a9507981990addd081da94df7e3c36ecde4f29dbbe73745c9f9fe3dd8"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kcoreaddons.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "shared-mime-info"

  bottle do
    root_url "http://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "6e3d881a5ad677658a79466b069e466fadb6a6b77218580c8be3a53f738136dd" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
