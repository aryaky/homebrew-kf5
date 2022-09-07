require "formula"

class Kf5BreezeIcons < Formula
  url "http://download.kde.org/stable/frameworks/5.38/breeze-icons-5.38.0.tar.xz"
  sha256 "89291dd396bd0f42e9b90eb92f46895fa461ebc2b420a58c663e0c4898894e25"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/breeze-icons.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"

#  bottle do
#    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
#    sha256 "486ec2f7d8926e98e78d79d4ce1e81805fb9920ecd15b2a9a4c390a1c3a15656" => :sierra
#  end

  def install
    args = std_cmake_args
    args << "-DBINARY_ICONS_RESOURCE=TRUE"
    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
    # ln_sf Dir["#{HOMEBREW_PREFIX}/share/icons"], "#{Etc.getpwuid.dir}/Library/Application Support/"
  end

  def caveats; <<-EOS.undent
    You need to take some manual steps in order to make this formula work:
      ln -sf "#{HOMEBREW_PREFIX}/share/icons" "~/Library/Application Support/"
    EOS
  end
end
