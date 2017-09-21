require "formula"

class Kf5Kunitconversion < Formula
  url "http://download.kde.org/stable/frameworks/5.36/kunitconversion-5.36.0.tar.xz"
  sha256 "b0b285f610d402f78a671cd538f50b20d7c6ea7d7b6f583bcdd4c411e0b042f5"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kunitconversion.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "gettext" => :build
  depends_on "chigraph/kf5/kf5-ki18n"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "35a3d6501e188bcb38d7fae6658c65e194a4293634eff8f6c8963cca5e6a55b2" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
