class Kf5Kate < Formula
  desc "Advanced KDE Text Editor"
  homepage "http://kate-editor.org"
  url "http://download.kde.org/stable/applications/16.12.1/src/kate-16.12.1.tar.xz"
  sha256 "984a82005897b553eab0525715b626f7467bc1d664b29ac7944860cd1d7012dc"

  head "git://anongit.kde.org/kate.git"

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  depends_on "haraldf/kf5/kf5-kactivities"
  depends_on "haraldf/kf5/kf5-kconfig"
  depends_on "haraldf/kf5/kf5-kdoctools"
  depends_on "haraldf/kf5/kf5-kguiaddons"
  depends_on "haraldf/kf5/kf5-ki18n"
  depends_on "haraldf/kf5/kf5-kiconthemes"
  depends_on "haraldf/kf5/kf5-kinit"
  depends_on "haraldf/kf5/kf5-kjobwidgets"
  depends_on "haraldf/kf5/kf5-kio"
  depends_on "haraldf/kf5/kf5-kparts"
  depends_on "haraldf/kf5/kf5-ktexteditor"
  depends_on "haraldf/kf5/kf5-kwindowsystem"
  depends_on "haraldf/kf5/kf5-kxmlgui"
  depends_on "haraldf/kf5/kf5-kitemmodels"
  depends_on "haraldf/kf5/kf5-knewstuff"
  depends_on "haraldf/kf5/kf5-kwallet"
  depends_on "haraldf/kf5/kf5-breeze-icons"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "669a66219f59267adf3540df5666e678d6e1ae1cac1adbfdefa6ec47e40c6159" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"

    mkdir "#{Etc.getpwuid.dir}/Library/Application Support/kate"

    system "ln", "-sf", "#{HOMEBREW_PREFIX}/share/icons/breeze/breeze-icons.rcc", "#{Etc.getpwuid.dir}/Library/Application Support/kate/icontheme.rcc"
  end

  test do
    assert `/Applications/KDE/kate.app/Contents/MacOS/kate --help | grep -- --help` =~ /--help/
  end
end
