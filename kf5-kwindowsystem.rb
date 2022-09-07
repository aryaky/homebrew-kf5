require "formula"

class Kf5Kwindowsystem < Formula
  url "http://download.kde.org/stable/frameworks/5.38/kwindowsystem-5.38.0.tar.xz"
  sha256 "2c16eb635714ff122b9348c0cc880be60d08c817c98026029f78434d918db90b"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kwindowsystem.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"
#
#  bottle do
#    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
#    sha256 "9590089f8a53afa214143d62fc013ba0c15d64799e1ec5104cfc2bdc3c35f246" => :sierra
#  end
#
  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
