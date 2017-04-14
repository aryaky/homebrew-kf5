require "formula"

class Kf5Kdoctools < Formula
  url "http://download.kde.org/stable/frameworks/5.32/kdoctools-5.32.0.tar.xz"
  sha256 "494bcefdb8464d6292c2bebecf3e8ac1644617717e6c6672d3801b1ecf7bff44"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kdoctools.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "haraldf/kf5/kf5-karchive"
  depends_on "qt5"
  depends_on "docbook"
  depends_on "docbook-xsl"
  depends_on "gettext"

  def patches
    DATA
  end

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "f4295a034629356ad99f5aeddd966bf15141c0a2bf0376835507a1a7443048ce" => :sierra
  end

  def install
    args = std_cmake_args

    args << "-DDocBookXML_CURRENTDTD_DIR:PATH=#{Formulary.factory('docbook').prefix}/docbook/xml/4.2"
    args << "-DDocBookXSL_DIR:PATH=#{Formulary.factory('docbook-xsl').prefix}/docbook-xsl"

    system "cmake", ".", *args
    system "make", "install"
    ln_s Dir["#{share}/kf5"], "#{Etc.getpwuid.dir}/Library/Application Support/", :force => true
    prefix.install "install_manifest.txt"
  end
  def caveats; <<-EOS.undent
    A symlink "#{ENV['HOME']}/Library/Application Support/kf5" was created
    So that "kf5/kdoctools/customization" can be found when building other kf5 modules.

    This symlink can be removed when this formula is uninstalled.
    EOS
  end
end

__END__
diff --git a/cmake/FindDocBookXML4.cmake b/cmake/FindDocBookXML4.cmake
index f56483b..8b1eb01 100644
--- a/cmake/FindDocBookXML4.cmake
+++ b/cmake/FindDocBookXML4.cmake
@@ -55,6 +55,7 @@ function (locate_version version found_dir)
         ${CMAKE_INSTALL_DATAROOTDIR}/xml/docbook/xml-dtd-${version}
         ${CMAKE_INSTALL_DATAROOTDIR}/sgml/docbook/xml-dtd-${version}
         ${CMAKE_INSTALL_DATAROOTDIR}/xml/docbook/${version}
+        opt/docbook/docbook/xml/${version}
     )
 
     find_path (searched_dir docbookx.dtd
