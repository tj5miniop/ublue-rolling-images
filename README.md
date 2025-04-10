# Ublue Rolling Images

# To do 

- massive update incoming for all non-nvidia images. Add extra packages, build custom kernel?

- disable ssh. SSH is highly beneficial and leaving it on is a big security issue.

- Bazzite - integrate protondb as a web app and include a DLSS swapper script. 


## This project would not be possible without Universal Blue. 
Seriously, all this repo does is build a daily, updated, image of a few of the Universal Blue projects.

#### Currently - 

### Bazzite (The Steam Deck/AMD HTPC edition) 
### Aurora (A tweaked fedora Kinoite designed to be as reliable as a chromebook) (NVIDIA) - based on the hwe vairant, which includes the Bazzite Kernel as well as NVIDIA GPU drivers already preconfigured. this custom variant of Aurora will contain optimisations from CachyOS and Bazzite while still aiming to be as lean as possible

### BLUEFIN - AMD GPU VARIANT OF THE AURORA IMAGES -  based on the hwe vairant, which includes the Bazzite Kernel. this custom variant of Bluefin will contain optimisations from CachyOS and Bazzite while still aiming to be as lean as possible


# NOTES 

- The nvidia image can only be used on GPUs that use the Turing architecture or later (1600 series GPUs and above) due to their reliance on the open variant of the Open Kernel Modules from NVIDIA.


- These images are tweaked (mostly) to my liking. in this repo, tweaks are kept minimal and simple to ensure nothing game-breaking will occur.

- TJ5-OS's repo has been removed as all I really did was use a script on there to install flatpaks. Image building is much quicker on here so I may as well use this repo instead. 



# Credits

- Universal Blue (https://universal-blue.org/) - for creating such an amazing project.
  - Bazzite Kernel - by default, the latest bazzite kernel is included for the best performance

- CachyOS - Creating an optimised arch linux based distro and open sourcing the optimisations used.

# Contributing 
#### - make sure to read the notes (above) and take them into account.
- Fork this repo to add your own changes.
#### - (Reccomended if you are making a big change, small changes should be ok) If you want to build/test your fork, you will have to sign the images with cosign. This can be done (with cosign installed, just use your distro's package manager or something like brew) by running;

```bash
cosign generate-key-pair
```
(make sure to not enter a password while prompted)

- Open a pull request, hopefully your change (if suitable) will be accepted.
