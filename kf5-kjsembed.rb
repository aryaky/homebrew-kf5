require "formula"

class Kf5Kjsembed < Formula
  url "http://download.kde.org/stable/frameworks/5.37/portingAids/kjsembed-5.37.0.tar.xz"
  sha256 "202f8377abbdf4ad564ca0b11e74eaa6001a5863406254562b6405f755995c70"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/attica.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kdoctools" => :build
  depends_on "chigraph/kf5/kf5-ki18n"
  depends_on "chigraph/kf5/kf5-kjs"
  depends_on "qt"

  def install
    args = std_cmake_args
    args << "-DCMAKE_PREFIX_PATH=/usr/local/opt/gettext"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
