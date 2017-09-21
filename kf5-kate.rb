class Kf5Kate < Formula
  desc "Advanced KDE Text Editor"
  homepage "http://kate-editor.org"
  url "https://download.kde.org/stable/applications/17.08.0/src/kate-17.08.0.tar.xz"
  sha256 "34eee6c384e2c2776c7d0ab65e7217e730cdbdecb82578c9dc90380cb82affd2"

  head "git://anongit.kde.org/kate.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"

  depends_on "chigraph/kf5/kf5-kactivities"
  depends_on "chigraph/kf5/kf5-kconfig"
  depends_on "chigraph/kf5/kf5-kdoctools"
  depends_on "chigraph/kf5/kf5-kguiaddons"
  depends_on "chigraph/kf5/kf5-ki18n"
  depends_on "chigraph/kf5/kf5-kiconthemes"
  depends_on "chigraph/kf5/kf5-kinit"
  depends_on "chigraph/kf5/kf5-kjobwidgets"
  depends_on "chigraph/kf5/kf5-kio"
  depends_on "chigraph/kf5/kf5-kparts"
  depends_on "chigraph/kf5/kf5-ktexteditor"
  depends_on "chigraph/kf5/kf5-kwindowsystem"
  depends_on "chigraph/kf5/kf5-kxmlgui"
  depends_on "chigraph/kf5/kf5-kitemmodels"
  depends_on "chigraph/kf5/kf5-knewstuff"
  depends_on "chigraph/kf5/kf5-kwallet"
  depends_on "chigraph/kf5/kf5-breeze-icons"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "669a66219f59267adf3540df5666e678d6e1ae1cac1adbfdefa6ec47e40c6159" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"

    # mkdir_p "#{Etc.getpwuid.dir}/Library/Application Support/kate"

    # system "ln", "-sf", "#{HOMEBREW_PREFIX}/share/icons/breeze/breeze-icons.rcc", "#{Etc.getpwuid.dir}/Library/Application Support/kate/icontheme.rcc"
  end

  def caveats; <<-EOS.undent
    You need to take some manual steps in order to make this formula work:
      mkdir -p "~/Library/Application Support/kate"
      ln -sf "#{HOMEBREW_PREFIX}/share/icons/breeze/breeze-icons.rcc" "~/Library/Application Support/kate/icontheme.rcc"
    EOS
  end

  test do
    assert `/Applications/KDE/kate.app/Contents/MacOS/kate --help | grep -- --help` =~ /--help/
  end
end
