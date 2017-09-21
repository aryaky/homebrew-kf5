require "formula"

class Kf5Kparts < Formula
  url "http://download.kde.org/stable/frameworks/5.36/kparts-5.36.0.tar.xz"
  sha256 "f3e75ac95b1e3c61054cd9140be4b917296f0a666df3487a589cfe055978055e"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kparts.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kio"

  depends_on "qt"

  bottle do
    root_url  "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "46154282b65c27578c8df9ec0ffefde3e279b5816abce45ee73575d5654470ff" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
