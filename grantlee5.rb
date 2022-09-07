require "formula"

class Grantlee5 < Formula
  homepage "http://grantlee.org/"
  url "https://github.com/steveire/grantlee/archive/v5.0.0.tar.gz"
  version "5.0.0"
  sha256 "0fbb796b1fe1bf8de1793f58748f83d0902991e9bad6f19fb3cc2f3cc808d7c5"
  head "https://github.com/steveire/grantlee.git"

  depends_on "cmake" => :build
  depends_on "qt"
#
#  bottle do
#    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
#    sha256 "f6b7b7cd27ca92f9ed7f9054c958e547ad2320e468892fa0f7c93a1197d89b7a" => :sierra
#  end
#
  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
