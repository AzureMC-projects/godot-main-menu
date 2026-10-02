# Godot Main Menu Import Guide

This repository contains a creepy horror-game main menu built for Godot.

## What is included

- `main_menu.tscn` — the main menu scene.
- `main_menu.gd` — menu behavior, loading screen, Options navigation, and Quit.
- `options.tscn` — functional options screen.
- `options.gd` — volume/fullscreen settings and Back/Escape navigation.
- `main_menu_background.jpg` — the supplied Home Alone artwork used by the menu.
- `node_3d.tscn` — example destination scene used by the Play button.
- `creepy_background.svg` — fallback artwork/resource from the original menu setup.
- `project.godot` — example project configuration.

## Importing into an existing Godot project

You do **not** need to replace your existing project.

### 1. Copy the menu files

Copy these files/folders into your existing Godot project's `res://` folder:

```
main_menu.tscn
main_menu.gd
options.tscn
options.gd
main_menu_background.jpg
```

You can also copy `creepy_background.svg` if you want to keep the fallback resource.

### 2. Check the Play scene path

Open `main_menu.gd`.

The Play button loads:

```
res://node_3d.tscn
```

If your actual game scene has a different path, change the `GAME_SCENE` constant near the top of the script:

```gdscript
const GAME_SCENE := "res://your_folder/your_scene.tscn"
```

For example:

```gdscript
const GAME_SCENE := "res://levels/node_3d.tscn"
```

Make sure the path exactly matches the scene in your project.

### 3. Set the main menu as your starting scene

In Godot:

1. Open your project.
2. Open `main_menu.tscn`.
3. Run the project.
4. If Godot asks which scene should run first, choose `main_menu.tscn`.

You can also set it manually in **Project > Project Settings > Application > Run > Main Scene**.

### 4. If you already have an existing main menu

You can use `main_menu.tscn` as the replacement menu, or copy its controls/scripts into your existing menu.

If you replace the old menu, make sure the new scene is set as the project's Main Scene.

## Using the supplied image

`main_menu_background.jpg` is already referenced by `main_menu.tscn`.

The image is stretched to fill the window while preserving its aspect ratio. The menu adds a dark overlay so the buttons remain readable.

If you replace the image with another one:

1. Put the new image in the project.
2. Open `main_menu.tscn`.
3. Select the **Background** TextureRect.
4. Change its **Texture** to the new image.

## Options menu

The Options button opens `options.tscn`.

The included options currently provide:

- Master volume slider.
- Fullscreen toggle.
- Back button.
- Escape key to return to the main menu.

The volume setting uses Godot's `Master` audio bus. If your project does not have a `Master` bus, add one in the Audio panel or adjust `options.gd` to use your project's bus name.

## Controls

- **Mouse** — select buttons and controls.
- **Enter / Space** — activate the focused button.
- **Escape** — return from Options to the main menu.

## Important when importing

The menu scripts use paths beginning with `res://`, so they should work after being copied into another Godot project as long as the referenced files exist.

If your existing project already has files with the same names, either rename the imported files or merge the relevant code manually.

If your project uses a different Godot version, open the scenes once in the editor and let Godot upgrade the scene format if prompted.

## Recommended folder layout

You can keep everything at the project root:

```
res://
  main_menu.tscn
  main_menu.gd
  main_menu_background.jpg
  options.tscn
  options.gd
  node_3d.tscn
```

Or organize it into a folder:

```
res://
  ui/
    main_menu.tscn
    main_menu.gd
    options.tscn
    options.gd
    main_menu_background.jpg
  levels/
    node_3d.tscn
```

If you use the second layout, update the scene paths in the scripts accordingly.

## Quick import checklist

- [ ] Copy the menu files into your project.
- [ ] Make sure `main_menu_background.jpg` is present.
- [ ] Set the correct `GAME_SCENE` path in `main_menu.gd`.
- [ ] Confirm `options.tscn` is beside the path used by `main_menu.gd`.
- [ ] Set `main_menu.tscn` as the project's Main Scene.
- [ ] Run the project and test Play, Options, Back, and Quit.
