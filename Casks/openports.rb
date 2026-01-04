cask "openports" do
  version "1.4.0"
  sha256 "65b4e03ec81fbaead6d5f407098bb2075b5f3ec84eac7522805c62b972666675"

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
