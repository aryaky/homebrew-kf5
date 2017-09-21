class Kdevplatform < Formula
  desc "KDevelop Platform"
  homepage "http://kdevelop.org"
  url "https://download.kde.org/stable/kdevelop/5.1.1/src/kdevplatform-5.1.1.tar.xz"
  sha256 "3159440512b1373c1a4b35f401ba1f81217de9578372b45137af141eeda6e726"

  head "git://anongit.kde.org/kdevplatform.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"
  depends_on "boost"

  depends_on "chigraph/kf5/grantlee5"

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
  depends_on "chigraph/kf5/kf5-kcmutils"
  depends_on "chigraph/kf5/kf5-knotifyconfig"
  depends_on "chigraph/kf5/kf5-threadweaver"
  depends_on "chigraph/kf5/kf5-kdeclarative"
  depends_on "chigraph/kf5/libkomparediff2"

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
