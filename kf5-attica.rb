require "formula"

class Kf5Attica < Formula
  url "http://download.kde.org/stable/frameworks/5.38/attica-5.38.0.tar.xz"
  sha256 "26f124e686d4a1ff005798958d63ddccd0bc23a763ea0578c4d2337a1a6b558b"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/attica.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"

#  bottle do
#    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
#    sha256 "4f23c1758225bfddff0c7ef4b86384155250a974fe2e623d6c122f619cef6a31" => :sierra
#  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
