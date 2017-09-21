require "formula"

class Kf5Kconfig < Formula
  url "http://download.kde.org/stable/frameworks/5.36/kconfig-5.36.0.tar.xz"
  sha256 "b31e3a8595fa8dc14aa0b1828633c712205097a6e3d14650ae813d4d7833d654"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kconfig.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"

  def patches
    DATA
  end

  bottle do
    root_url "http://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "07f4730913cb7606a5b2e6171b1ac704dbddafa7af7f39c510af4e9b8b30e41d" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"

    mkdir_p "#{HOMEBREW_PREFIX}/lib/kde5/libexec"
    ln_sf "#{lib}/kde5/libexec/kconf_update", "#{HOMEBREW_PREFIX}/lib/kde5/libexec/"
    ln_sf "#{lib}/kde5/libexec/kconfig_compiler_kf5", "#{HOMEBREW_PREFIX}/lib/kde5/libexec/"
  end
end

__END__
diff --git a/src/kconfig_compiler/CMakeLists.txt b/src/kconfig_compiler/CMakeLists.txt
index 368a4d8..004a649 100644
--- a/src/kconfig_compiler/CMakeLists.txt
+++ b/src/kconfig_compiler/CMakeLists.txt
@@ -20,4 +20,6 @@ find_package(Qt5Xml ${REQUIRED_QT_VERSION} REQUIRED NO_MODULE)
 
 target_link_libraries(kconfig_compiler Qt5::Xml)
 
+ecm_mark_nongui_executable(kconfig_compiler)
+
 install(TARGETS kconfig_compiler EXPORT KF5ConfigCompilerTargets DESTINATION ${KDE_INSTALL_LIBEXECDIR_KF5})
