🚀 AmbxstNixDots

A "plain" starter configuration for running Ambxst on NixOS. This config sets up Hyprland, Ambxst, and the necessary dependencies to get you started immediately.
⚠️ Prerequisites

    A clean install of NixOS.

    Git installed (nix-env -iA nixos.git).

🛠️ Installation Guide
1. Download & Prepare

Download this repository or clone it into your home directory:
code Bash

    
cd ~
git clone https://github.com/YOUR_USERNAME/AmbxstNixDots.git
cd AmbxstNixDots

  

2. Generate Hardware Configuration

Critical Step: You must use the hardware configuration generated for your specific computer. Do not use the one included in this repo, or your system may not boot.
code Bash

    
# Delete the sample hardware config
rm hardware-configuration.nix

# Copy your system's actual hardware config
cp /etc/nixos/hardware-configuration.nix .

  

3. Customize Your User

Before installing, open flake.nix (or configuration.nix) and check the username settings.

    Update users.users.tbear to your actual username.

    Update home.username in home.nix if applicable.

    Note: If a password hash is set, you may need to set initialPassword = "password" to log in for the first time.

4. Install

Run the rebuild command. We use the --impure flag to ensure all third-party flakes (like Ambxst) evaluate correctly.
code Bash

    
# Add files to git index so Flakes can see them
git add .

# Build and Switch
sudo nixos-rebuild switch --flake .#ambxst --impure

  

5. Reboot & Enjoy

    Reboot your system: reboot

    At the login screen (Greeter), look at the bottom left or top right gear icon.

    Select Hyprland (Ambxst runs on top of Hyprland).

    Log in!

❓ Troubleshooting

"Experimental features" error?
If this is your first time using Flakes, enable them temporarily to run the install:
code Bash

    
NIX_CONFIG="experimental-features = nix-command flakes" sudo nixos-rebuild switch --flake .#ambxst --impure

  

Wallpapers not showing?
If you see red blobs or missing wallpapers, ensure your user has a ~/Pictures/Wallpapers folder, or update the path in ~/nixdots/config/Ambxst/wallpapers.json.
📂 Structure

    flake.nix: Entry point.

    configuration.nix: System-level settings (Audio, Networking, Drivers).

    home.nix: User-level dotfiles (Ambxst, Hyprland, Apps).
