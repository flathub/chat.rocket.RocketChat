# RocketChat flatpak

This repository contains the build manifest and instructions to build and run [RocketChat Desktop](https://github.com/RocketChat/Rocket.Chat.Electron) client.

### Build instructions

1. Clone this repository
2. Ensure you have [flatpak-builder](https://docs.flatpak.org/en/latest/flatpak-builder.html) installed
2. Inside the cloned folder, run:

        flatpak-builder build chat.rocket.RocketChat.yaml --install --force-clean --user --install-deps-from=flathub

3. Run the app:

        flatpak --user run chat.rocket.RocketChat
