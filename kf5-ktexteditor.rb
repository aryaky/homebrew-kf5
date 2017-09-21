require "formula"

class Kf5Ktexteditor < Formula
  url "http://download.kde.org/stable/frameworks/5.36/ktexteditor-5.36.0.tar.xz"
  sha256 "f9a0109aff18175ef528186e099d0881b977dde7435c433c5541df44b5a18609"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/ktexteditor.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "chigraph/kf5/kf5-kparts"
  depends_on "chigraph/kf5/kf5-syntax-highlighting"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "9c23e4c0c6d1b368d14791b0158e0852608bcd87afd468f920fe52cc627b5d2e" => :sierra
  end

  def install
    ln_sf Dir["#{HOMEBREW_PREFIX}/share/kservicetypes5"], "#{Etc.getpwuid.dir}/Library/Application Support/"
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
