# ECE 317 Final Project — Robotic Block Sorter

A FANUC LR Mate 200iD robotic arm that uses image processing to identify and sort colored blocks into stacks by color.

---

## Team
- David Bartolim
- Micah Granadino
- Drew Zakbar

## Overview

Nine blocks (3 red, 3 yellow, 3 green) are randomly placed in mixed stacks of three. The robot identifies each block's color using its onboard camera and sorts them into separate, color-matched stacks — fully autonomously.

---

## Demo
[![Demo](https://www.youtube.com/shorts/5aZUeXfgOFo.jpg)]https://www.youtube.com/shorts/5aZUeXfgOFo)

---

## How It Works

The robot uses image processing to detect the color of the top block in each stack. Based on the result, it picks the block and places it in the correct sorted stack. This process repeats until all blocks are sorted.

Key programming features used:
- **Image Processing** — Grayscale camera-based color detection with tuned exposure, contrast, and tolerance settings to differentiate colors without a color camera
- **Position Registers (PR) & Offsets** — For precise pick and place positioning across stacked blocks
- **Subprograms** — Modular routines for pick, place, and sort logic
- **Branching Logic** — Conditional program flow based on detected color
- **Wait Commands** — Timed delays to ensure safe and accurate movement

---

## Challenges & Solutions

**Color Differentiation**
- Used a grayscale camera, requiring tuned exposure and contrast settings to distinguish colors without direct color data
- Adjusted color tolerance thresholds for reliable recognition under lab lighting

**Movement Precision**
- Resolved low Z-point placement issues
- Navigated singularity constraints in step-mode programming

**Register Management**
- Carefully tracked and avoided conflicts with overwritten data registers

---

## Future Improvements

- Support for more blocks and additional colors
- More stacking configurations
- Alternative sorting strategies
- Improved block alignment precision

---

## Tools & Equipment

- FANUC LR Mate 200iD/4S Robotic Arm
- FANUC TP (Teach Pendant) Programming
- Onboard vision/image processing system
