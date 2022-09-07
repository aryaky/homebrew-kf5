require "formula"

class Kf5Kimageformats < Formula
  url "http://download.kde.org/stable/frameworks/5.38/kimageformats-5.38.0.tar.xz"
  sha256 "97ca8eaa52f296e7fddde25abfe6c7707070b075e92e487da9edb3c719d4e860"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kimageformats.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"
  depends_on "openexr"
  depends_on "jasper"
#
#  bottle do
#    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
#    sha256 "8e5855ec050279a515aacf3e50e74f8dbd0995983f870a737fc092286008c3f4" => :sierra
#  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
