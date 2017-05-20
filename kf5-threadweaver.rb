require "formula"

class Kf5Threadweaver < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/threadweaver-5.34.0.tar.xz"
  sha256 "197e40ae14bc7d25fb89e232d12c1c01b76b792f98ace81d93c1e18104bdd4bf"

  head "git://anongit.kde.org/threadweaver.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
