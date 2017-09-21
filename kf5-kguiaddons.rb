require "formula"

class Kf5Kguiaddons < Formula
  url "http://download.kde.org/stable/frameworks/5.37/kguiaddons-5.37.0.tar.xz"
  sha256 "c56ef3b231b088ba6903e8319fc936ad438e3c6411b9f14d2c234c8738b5e68d"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kguiaddons.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "ab77aea5133cd0caf3cc94e48f56fffd8696388a27c96fe39e5f5a887056d483" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
