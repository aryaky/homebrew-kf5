require "formula"

class Kf5Kwallet < Formula
  url "http://download.kde.org/stable/frameworks/5.38/kwallet-5.38.0.tar.xz"
  sha256 "dc06fe8917cf5ea61251e42e9c7e9e5662eb223aace1bf8ee4becf6a896cdae3"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kwallet.git"

  depends_on "libgcrypt"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"
  depends_on "chigraph/kf5/kf5-knotifications"
#
#  bottle do
#    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
#    sha256 "3e15a7c8c730cf4efab7b461d68061ccd0258dac2182c32169693dc0f8a70bc9" => :sierra
#  end
#
  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
