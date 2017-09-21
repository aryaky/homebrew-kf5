require "formula"

class Kf5Ktexteditor < Formula
  url "http://download.kde.org/stable/frameworks/5.37/ktexteditor-5.37.0.tar.xz"
  sha256 "7ae65ca215a53dc4e35877069004c748d8a8b504aecbeaa3b916b8c96dd00478"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/ktexteditor.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"
  depends_on "chigraph/kf5/kf5-kparts"
  depends_on "chigraph/kf5/kf5-syntax-highlighting"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "9c23e4c0c6d1b368d14791b0158e0852608bcd87afd468f920fe52cc627b5d2e" => :sierra
  end

  def install
    # ln_sf Dir["#{HOMEBREW_PREFIX}/share/kservicetypes5"], "#{Etc.getpwuid.dir}/Library/Application Support/"
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end

  def caveats; <<-EOS.undent
    You need to take some manual steps in order to make this formula work:
      ln -sf "#{HOMEBREW_PREFIX}/share/kservicetypes5" "~/Library/Application Support/"
    EOS
  end
end
