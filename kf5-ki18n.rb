require "formula"

class Kf5Ki18n < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/ki18n-5.34.0.tar.xz"
  sha256 "c767457c419055f3a6f5bfe0e2de140461c91f6451a5d3a385e6d6007cad9b3e"

  head "git://anongit.kde.org/ki18n.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "gettext" => :build
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "25c2397cb13e0ea657ceb8d57e070813a4d0f3d11558b442d9a30c1f997a3c74" => :sierra
  end

  def install
    args = std_cmake_args

    args << "-DCMAKE_SHARED_LINKER_FLAGS=-lintl" # cmake thinks libintl is part of libc
    args << "-DCMAKE_EXE_LINKER_FLAGS=-lintl"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
