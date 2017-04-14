require "formula"

class Kf5Kparts < Formula
  url "http://download.kde.org/stable/frameworks/5.32/kparts-5.32.0.tar.xz"
  sha256 "45e73162459a2f4464fd0e1aeeea34ca03c3e7dbd315eedbb2010cbe5b053d43"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kparts.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "haraldf/kf5/kf5-kio"

  depends_on "qt5"

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
