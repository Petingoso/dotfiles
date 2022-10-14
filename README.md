# Dotfiles an stuff
These are my configs for Artix
I can't use chezmoi so this is a mess.
I've been messing with wayland so it has both Hyprland on Wayland and DWM on X11.

*DWM*:
- dwm with dmenu

- sxhkshfd or whatever for hotkey

- some theme switcher 

- cool neovim configuration

- terminal is kitty and integrated with the theme switcher
 
 **check the app integrated .local/bin/dwm_keybindings, for the keybinds**

*Hyprland*:
- cool rofi config (very poggers)

- waybar with dynamic colors

- hyprland personal config with themes (check before using)

- same nvim and terminal

 **the theme swicher is themeswitcher_wl and the keys hyp_bindings**
 
 ## Dependencies
 This is not an intensive list but here's a reference
 
 Wayland: `wayland, Hyprland-waybar-git, swaync, swaybg, waybar, libinput-gestures-setup, grim, slur, swappy, wk-copy, rofi-lbonn-wayland, gammmastep, gtklock`
  
  X11: `xorg(duh!), xorg-xinit, xss-lock, picom, lua status, the custom dwm, dmenu and slock, flameshot, deadd-notification-center, feh`
  
  Misc for both (many complementary): `Dbus, kitty, keepassxc, pcloud, nvim, mate-polkit, pulseaudio, light, ranger`
  
  That should be about it.

## I think it looks really cool but most of it is stolen so credits to

- https://github.com/junnunkarim/dotfiles-linux for most of the dwm and related configurations

- ~~https://gitlab.com/brokenbyte/dotfiles/-/tree/master for the some of the nvim configs~~ jokes on you it's now basically all mine now

- ~~https://github.com/lauroro/hyprland-dotfiles (old config)~~ https://github.com/justleoo/dotfiles for most of the waybar config

- https://github.com/adi1090x/rofi for amazing rofi themes

Well not like anyone's gonna read this except but me but that's all folks

## Screenshots

### Wayland:
![20221014191411_1](https://user-images.githubusercontent.com/92183955/195913699-d8e06192-288a-423a-83b1-2a63fb5d930d.png)

![20221014191512_1](https://user-images.githubusercontent.com/92183955/195913773-eff5fe68-1fd2-4fb9-8899-f2870033926d.png)

![20221014191618_1](https://user-images.githubusercontent.com/92183955/195913926-922374ad-3c3c-4ab4-8dd7-44de0782e3ce.png)



### X11:
![2022-08-18_12-56](https://user-images.githubusercontent.com/92183955/185389216-4fdc74f6-b4e1-463f-a299-7716e612b230.png)
![2022-08-18_12-57](https://user-images.githubusercontent.com/92183955/185389228-f4b053ab-861c-4f78-b558-bce366b62daf.png)
![2022-08-18_12-55](https://user-images.githubusercontent.com/92183955/185389204-a72462f9-e141-4c66-b5f3-e8383b0e66cf.png)



