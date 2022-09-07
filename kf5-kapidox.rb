require "formula"

class Kf5Kapidox < Formula
  url "http://download.kde.org/stable/frameworks/5.38/kapidox-5.38.0.tar.xz"
  sha256 "e6c8de70bd2d8fd55c8dd4f01dfb526fe3230c5094aeed5fedda360c693993c8"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kapidox.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"

#  bottle do
#    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
#    cellar :any_skip_relocation
#    sha256 "0588c7b4d3eb5005a1a4d20378e07dc73afd33f01b3d56da6adbfb719d24238c" => :sierra
#  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
