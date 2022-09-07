require "formula"

class Kf5Kservice < Formula
  url "http://download.kde.org/stable/frameworks/5.38/kservice-5.38.0.tar.xz"
  sha256 "2d31c96d8fad235aa2bfc96258ac03d7ec064184fe6a54856f9d7407fbae4a7d"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kservice.git"

  depends_on "cmake" => :build
  # The bison 2.3 in Mac OS X is too old to build. Use homebrew's instead
  depends_on "bison" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"
  depends_on "chigraph/kf5/kf5-kcrash"
  depends_on "chigraph/kf5/kf5-kdoctools" => :build
  depends_on "chigraph/kf5/kf5-kdbusaddons"
  depends_on "chigraph/kf5/kf5-kconfig"
  depends_on "chigraph/kf5/kf5-ki18n"
#
#  bottle do
#    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
#    sha256 "d6a4b7a39fc8d1acf173f1321fe9043cd5aeb3da0edd40fa5e6c8544f5316e94" => :sierra
#  end
#
  def install
    args = std_cmake_args

    system "cmake", ".", "-DBUILD_TESTING=OFF", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
