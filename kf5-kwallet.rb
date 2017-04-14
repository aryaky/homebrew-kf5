require "formula"

class Kf5Kwallet < Formula
  url "http://download.kde.org/stable/frameworks/5.32/kwallet-5.32.0.tar.xz"
  sha256 "aa97ed3255bb6ae49f663df41a6e07597cd2c7d8af1e6b455f2f4d468d254c5f"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kwallet.git'

  depends_on "libgcrypt"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "chigraph/kf5/kf5-knotifications"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "3e15a7c8c730cf4efab7b461d68061ccd0258dac2182c32169693dc0f8a70bc9" => :sierra
  end

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
