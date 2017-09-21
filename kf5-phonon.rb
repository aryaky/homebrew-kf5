require "formula"

class Kf5Phonon < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/phonon/4.9.1/phonon-4.9.1.tar.xz"
  sha256 "67bee986f85ca8b575186c8ba58a85886cb3b1c3567c86a118d56129f221e69c"

  head "git://anongit.kde.org/phonon.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "4e5ba75696bb50f36c11850a9c3be6833fa6646317919c895a86a0287ff9e698" => :sierra
  end

  def install
    args = std_cmake_args
    args << "-DPHONON_BUILD_PHONON4QT5=ON"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
