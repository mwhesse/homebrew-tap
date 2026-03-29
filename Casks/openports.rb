cask "openports" do
  version "1.4.1"
  sha256 "15412246b280b16b0ba7e30e7012dafb8a87ab2b8787b83ee59ee713e4c4359a"

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
