class TherionStudio < Formula
  desc "Qt desktop editor for Therion cave-survey projects"
  homepage "https://github.com/ladislavb/therion-studio"
  url "https://github.com/ladislavb/therion-studio/archive/refs/tags/v2026.5.1.tar.gz"
  sha256 "94e1ec4267351a471bd6d371ce4b967d6c569124753a96f81bbece6ea95d7f25"
  license "GPL-3.0-or-later"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "qt"
  depends_on macos: :sequoia

  def install
    qt_prefix = Formula["qt"].opt_prefix

    system "cmake", "-S", ".", "-B", "build",
           "-G", "Ninja",
           "-DCMAKE_BUILD_TYPE=Release",
           "-DCMAKE_PREFIX_PATH=#{qt_prefix}",
           *std_cmake_args
    system "cmake", "--build", "build", "--target", "TherionStudio"
    system "cmake", "--install", "build"

    (bin/"therion-studio").write <<~SH
      #!/bin/sh
      exec "#{opt_prefix}/TherionStudio.app/Contents/MacOS/TherionStudio" "$@"
    SH
    chmod 0755, bin/"therion-studio"
  end

  def caveats
    <<~EOS
      Therion Studio.app was installed to:
        #{opt_prefix}/TherionStudio.app

      To expose it in Finder/Launchpad-style workflows, create a symlink:
        ln -sfn "#{opt_prefix}/TherionStudio.app" "/Applications/Therion Studio.app"

      The external Therion command-line executable is not bundled.
      Install it separately if needed:
        brew install therion
    EOS
  end

  test do
    assert_path_exists prefix/"TherionStudio.app/Contents/MacOS/TherionStudio"
    bundle_id = shell_output("/usr/libexec/PlistBuddy -c 'Print :CFBundleIdentifier' #{prefix}/TherionStudio.app/Contents/Info.plist").strip
    assert_equal "com.lblazek.therionstudio", bundle_id
  end
end
