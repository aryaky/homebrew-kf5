require "formula"

class Kf5Kmediaplayer < Formula
  url "http://download.kde.org/stable/frameworks/5.38/portingAids/kmediaplayer-5.38.0.tar.xz"
  sha256 "669c07be42c2412212a183ca86e7500e11a49f4a52cc26221aee8583247a62e1"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/attica.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kparts"
  depends_on "qt"
#
#  bottle do
#    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
#    sha256 "87707ba91f7fc9c224ae1eb5347c3c67010384708bce7b337345c5b31f9dda36" => :sierra
#  end
#
  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
