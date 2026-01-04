cask "openports" do
  version "1.2.0"
  sha256 "e11981df7a90a70247bae28591d3b588ad6bcfcc66a69962dbe2f95e688f89b2"

  url "https://github.com/mwhesse/OpenPorts/releases/download/v#{version}/OpenPorts.zip"
  name "OpenPorts"
  desc "Menu bar app for monitoring and managing open TCP ports"
  homepage "https://github.com/mwhesse/OpenPorts"

  depends_on macos: ">= :ventura"

  app "OpenPorts.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/OpenPorts.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.mwhesse.OpenPorts.plist",
  ]
end
