require "formula"

class Kf5Sonnet < Formula
  url "http://download.kde.org/stable/frameworks/5.38/sonnet-5.38.0.tar.xz"
  sha256 "aa73bb8a599f7b2ed14c043726ffe2d6399f1fd9a3daa51f12685aae11baa58c"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/sonnet.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "3a760e8fa8190336e728c836e33ddbc54909b24b9631397eec66fbddee0e4902" => :sierra
  end

  # TODO: figure out how to properly fix https://github.com/haraldF/homebrew-kf5/issues/72
  conflicts_with "hunspell"

  patch :DATA

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end

__END__
diff --git a/CMakeLists.txt b/CMakeLists.txt
index b176805..e9d21c3 100644
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -16,6 +16,8 @@ include(KDEInstallDirs)
 include(KDEFrameworkCompilerSettings NO_POLICY_SCOPE)
 include(KDECMakeSettings)
 
+kde_enable_exceptions()
+
 set(REQUIRED_QT_VERSION 5.6.0)
 find_package(Qt5 ${REQUIRED_QT_VERSION} CONFIG REQUIRED Widgets)
 
