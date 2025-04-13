# Ublue Rolling Images

# To do 

- Bazzite - Add ProtonDB and AreWeAntiCheatYet? Shortcuts
  
- Add Extra 'ujust' scripts

- 'Main Images' - Build base images?

## This project would not be possible without Universal Blue. 
Seriously, all this repo does is build a daily, updated, image of a few of the Universal Blue projects, as well as preinstalling some apps and adding some features/optimisations.

#### Currently building- 

 - Bazzite (The Steam Deck/AMD HTPC edition) 

 - Aurora (A tweaked fedora Kinoite designed to be as reliable as a chromebook) (NVIDIA) - based on the hwe vairant, which includes the Bazzite Kernel as well as NVIDIA GPU drivers already preconfigured. this custom variant of Aurora will contain optimisations from CachyOS and Bazzite while still aiming to be as lean as possible. 
 
 - BLUEFIN - AMD GPU VARIANT OF THE AURORA IMAGES -  based on the hwe vairant, which includes the Bazzite Kernel. this custom variant of Bluefin will contain optimisations from CachyOS and Bazzite while still aiming to be as lean as possible

### Desktop Gaming Images - Coming Soon

Hyperion (Coming Soon) - A desktop image based on Aurora (with the Bazzite Kernel), built with gaming in mind. More details to come at a later date once I have time to develop this idea further




# NOTES 

- The nvidia image can only be used on GPUs that use the Turing architecture or later (1600 series GPUs and above) due to their reliance on the open variant of the Open Kernel Modules from NVIDIA.


- These images are tweaked (mostly) to my liking. in this repo, tweaks are kept minimal and simple to ensure nothing game-breaking will occur.


- To maintain compatibility, fedora 42 WILL NOT be pushed on it's release day. There will be a period of time (probably a couple weeks) where Fedora 41 images will stil be built, which will allow the fedora devs to iron out bugs and fix some errors. This is more of a stability feature. BAZZITE IMAGES WILL NOT BE AFFECTED, AS I'LL FOLLOW THE RELEASE CYCLE OF THEIR IMAGES.  

# Credits

- Universal Blue (https://universal-blue.org/) - for creating such an amazing project.
  - Bazzite Kernel - by default, the latest bazzite kernel is included for the best performance

- CachyOS - Creating an optimised arch linux based distro and open sourcing the optimisations used.

# Contributing 
#### - make sure to read the notes (above) and take them into account.
- Fork this repo to add your own changes.
#### - (Reccomended if you are making a big change, small changes should be ok) If you want to build/test your fork, you will have to sign the images with cosign. This can be done (with cosign installed, just use your distro's package manager or something like brew/nix will also provide) by running;

```bash
cosign generate-key-pair
```
(make sure to not enter a password while prompted)

- Open a pull request, hopefully your change (if suitable) will be accepted.
