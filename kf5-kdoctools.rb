require "formula"

class Kf5Kdoctools < Formula
  url "http://download.kde.org/stable/frameworks/5.38/kdoctools-5.38.0.tar.xz"
  sha256 "c95f7e604bd16c3ef97b3fc0320a5656ef1ea3b3c75b7d4d22348391423c7b39"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kdoctools.git"

  depends_on "cmake" => :build
  depends_on "perl" => :build
  depends_on "cpanminus" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-karchive"
  depends_on "qt"
  depends_on "docbook"
  depends_on "docbook-xsl"
  depends_on "gettext"

  def patches
    DATA
  end

#  bottle do
#    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
#    sha256 "f4295a034629356ad99f5aeddd966bf15141c0a2bf0376835507a1a7443048ce" => :sierra
#  end

  def install
    # system "cpanm", "URI"

    args = std_cmake_args

    args << "-DDocBookXML_CURRENTDTD_DIR:PATH=#{Formulary.factory("docbook").prefix}/docbook/xml/4.2"
    args << "-DDocBookXSL_DIR:PATH=#{Formulary.factory("docbook-xsl").prefix}/docbook-xsl"

    system "cmake", ".", *args
    system "make", "install"
    # ln_s Dir["#{share}/kf5"], "#{Etc.getpwuid.dir}/Library/Application Support/", :force => true
    prefix.install "install_manifest.txt"
  end

  def caveats; <<-EOS.undent
    Before install of this formula you need to run:
      cpanm URI

    You need to take some manual steps in order to make this formula work:
      ln -sf "#{share}/kf5" "~/Library/Application Support/"
    EOS
  end
end
