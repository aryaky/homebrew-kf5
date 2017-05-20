require "formula"

class Kf5Kcompletion < Formula
  url "http://download.kde.org/stable/frameworks/5.34/kcompletion-5.34.0.tar.xz"
  sha256 "9cddd50362b2f20273e4514b0c963182e65362964a82bec73270dab0ca6c1ba2"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kcompletion.git'

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kconfig"
  depends_on "chigraph/kf5/kf5-kwidgetsaddons"
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "3ec74c421c407f1e53771d89d3e59f2d935ed9672395b8df85295dcde9be79e3" => :sierra
  end

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
