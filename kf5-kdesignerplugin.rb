require "formula"

class Kf5Kdesignerplugin < Formula
  url "http://download.kde.org/stable/frameworks/5.38/kdesignerplugin-5.38.0.tar.xz"
  sha256 "c6038ac44f05083e6d1e7e2d8b950b31d493f1bf587f4b89984fefae5f973b66"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kdesignerplugin.git"

  depends_on "cmake" => :build
  depends_on "gettext" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kcoreaddons"
  depends_on "chigraph/kf5/kf5-kdoctools" => :build
  #  depends_on "chigraph/kf5/kf5-kdewebkit"
  depends_on "chigraph/kf5/kf5-kplotting"
  depends_on "qt"

#  bottle do
#    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
#    sha256 "d212b7c9e6d674c600674f30d9afff5cc4d0b582f0238b24ec53c8aca0909007" => :sierra
#  end

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
