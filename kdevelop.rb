class Kdevelop < Formula
  desc "Integrated Development Environment for KDE"
  homepage "http://kdevelop.org"
  # url ""
  # sha256 ""

  head "git://anongit.kde.org/kdevelop.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "llvm"

  depends_on "chigraph/kf5/kdevplatform"
  depends_on "chigraph/kf5/kdevelop-pg-qt"

  depends_on "chigraph/kf5/kf5-karchive"
  depends_on "chigraph/kf5/kf5-kconfig"
  depends_on "chigraph/kf5/kf5-kguiaddons"
  depends_on "chigraph/kf5/kf5-ki18n"
  depends_on "chigraph/kf5/kf5-kiconthemes"
  depends_on "chigraph/kf5/kf5-kinit"
  depends_on "chigraph/kf5/kf5-kio"
  depends_on "chigraph/kf5/kf5-kitemmodels"
  depends_on "chigraph/kf5/kf5-kitemviews"
  depends_on "chigraph/kf5/kf5-kjobwidgets"
  depends_on "chigraph/kf5/kf5-knewstuff"
  depends_on "chigraph/kf5/kf5-kparts"
  depends_on "chigraph/kf5/kf5-kservice"
  depends_on "chigraph/kf5/kf5-ktexteditor"
  depends_on "chigraph/kf5/kf5-kwallet"
  depends_on "chigraph/kf5/kf5-kwidgetsaddons"
  depends_on "chigraph/kf5/kf5-kwindowsystem"
  depends_on "chigraph/kf5/kf5-kxmlgui"
  depends_on "chigraph/kf5/kf5-sonnet"
  depends_on "chigraph/kf5/kf5-breeze-icons"

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"

    mkdir "#{Etc.getpwuid.dir}/Library/Application Support/kdevelop"
    system "ln", "-sf", "#{HOMEBREW_PREFIX}/share/icons/breeze/breeze-icons.rcc", "#{Etc.getpwuid.dir}/Library/Application Support/kdevelop/icontheme.rcc"
  end
end
