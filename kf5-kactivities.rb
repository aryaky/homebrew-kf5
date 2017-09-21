require "formula"

class Kf5Kactivities < Formula
  url "http://download.kde.org/stable/frameworks/5.36/kactivities-5.36.0.tar.xz"
  sha256 "47eb6967336d4d985b079e5b5b44afc51d66e7ed3a85cea923e295e10a952340"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kactivities.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "chigraph/kf5/kf5-kconfig"
  depends_on "chigraph/kf5/kf5-kdeclarative"
  depends_on "chigraph/kf5/kf5-kdbusaddons"
  depends_on "chigraph/kf5/kf5-ki18n"
  depends_on "chigraph/kf5/kf5-kcmutils"
  depends_on "boost"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "c64f4cdc5949ae8ae0fc819c0d1a8459df455039aebb96d82c32e85a86a16f20" => :sierra
  end

  def install
    args = std_cmake_args

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end
end
