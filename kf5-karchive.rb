require "formula"

class Kf5Karchive < Formula
  url "http://download.kde.org/stable/frameworks/5.32/karchive-5.32.0.tar.xz"
  sha256 "a402dfbf03495be372704d126aae29d973fecdebf73ddcbcaa35016631bcfbb7"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/karchive.git'

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  bottle do
    root_url "http://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "ab256271f55e21430512e07965046b17d852c88a8886d5177c067c08629a7393" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
