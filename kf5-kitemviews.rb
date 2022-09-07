require "formula"

class Kf5Kitemviews < Formula
  url "http://download.kde.org/stable/frameworks/5.38/kitemviews-5.38.0.tar.xz"
  sha256 "46df0b2a0fe436cac2e1984d9038ac894ac86d9650db5328fa7069a13f46b151"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kitemviews.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"
#
#  bottle do
#    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
#    sha256 "8e1af808f05da4de639fa945576e57f688ca336b8bce8510d63554bde296d4c4" => :sierra
#  end
#
  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
