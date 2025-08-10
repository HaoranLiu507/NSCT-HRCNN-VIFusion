# NSCT-HRCNN: Infrared–Visible Image Fusion

NSCT-HRCNN fuses infrared (IR) and visible (VI) images into a single image with sharp details and natural colors. It combines the Non-Subsampled Contourlet Transform (NSCT) with a Hierarchical Random-Coupled Neural Network (HRCNN) and optionally uses a lightweight Genetic Algorithm (GA) to tune parameters. This preserves the speed of traditional methods while avoiding heavy deep-model training.

![](README.png)

If you use this repository, please consider citing:

Haoran Liu, Yiran Chen, Peng Li, Mingzhe Liu*. "Infrared and Visible Image Fusion based on NSCT and Hierarchical Random-Coupled Neural Network." (In preparation).

## Requirements

- MATLAB (tested on R2024b; R2020b+ should work)
- Image Processing Toolbox (for `psnr`, `entropy`, `imshow`)
- Parallel Computing Toolbox (optional, used by `demo.m` for `parfor` acceleration)

## Repository Setup

1. Clone or download this repository.
2. Extract `Fusion.zip` into the repository root so that a folder `Fusion/` is created. This folder must contain `fusion_main.m` and its subfolders (e.g., `Tool_function/`, `function/`, `enhancement_fun/`).
3. In MATLAB, add the repository to the path:

   ```matlab
   addpath(genpath(pwd));
   ```

## Quick Start

### Fuse a single image pair

```matlab
% Read your visible and infrared images (ensure they are registered/aligned)
vi = imread('path/to/visible.jpg');
ir = imread('path/to/infrared.jpg');

% Run fusion: visualization=1 (show figures), flag=0 (use default params)
fused = run_RCNN(vi, ir, 1, 0);

imshow(fused);
imwrite(fused, 'fused_image.png');
```

Parameters of `run_RCNN(imgVI, imgIR, visualization, flag)`:

- `visualization` (0/1): show input and fused images.
- `flag` (0/1): use GA to tune parameters when 1; use defaults when 0.

Returns: fused image (`uint8`).

### Batch demo

The provided `demo.m` fuses a predefined list of image pairs in parallel and saves outputs.

Steps:
- Place your images under `image/VI/` and `image/IR/` and follow the naming pattern used by the demo:
  - Visible: `image/VI/<name>.jpg`
  - Infrared: `image/IR/<name>2.jpg`
  This naming pattern exactly matches the code: VI: `image/VI/<name>.jpg`, IR: `image/IR/<name>2.jpg`.
- Open `demo.m` and edit the `img` list (the `name` field) to match your files.
- Optional: adjust the number of workers depending on your machine:

  ```matlab
  c = parcluster('local');
  c.NumWorkers = 8; % e.g., set to a reasonable value for your CPU
  saveProfile(c);
  ```

- Set switches at the top of `demo.m`:
  - `GA_switch = 1` enables GA tuning (slower, potentially better quality).
  - `visualization = 0/1` toggles figures.

Note: When using `parfor`, keep `visualization = 0`. If you want figures, switch the loops in `demo.m` from `parfor` to `for`.

Run the script. It will also save `result_img.mat` and an example `fusion.png`.

## GA tuning (optional)

When `flag = 1`, `run_RCNN` calls `Genetic-Algorithm/GA_Main.m` to optimize 5 dynamic parameters. Default GA hyperparameters are small for speed:

- population size = 5
- iterations = 5

You can change them in `GA_Main.m` (`NUMPOP`, `ITERATION`, etc.). GA uses randomness; for reproducibility, set a seed at the start of your session:

```matlab
rng(0);
```

## Project Structure

- `run_RCNN.m`: Main entry point for fusing one image pair.
- `Fusion/`: Core fusion implementation (created by unzipping `Fusion.zip`).
- `Genetic-Algorithm/`: GA components (`GA_Main.m`, selection/crossover/mutation, fitness).
- `demo.m`: Parallel batch fusion using predefined file names.
- `README.png`: Illustration used in this README.

## Results and Data

Open-source fusion results are available on Zenodo:

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.14921832.svg)](https://doi.org/10.5281/zenodo.14921832)

## Troubleshooting

- Undefined function `fusion_main`: ensure `Fusion.zip` is extracted to `Fusion/` and that you ran `addpath(genpath(pwd))`.
- `psnr` or `entropy` not found: install the Image Processing Toolbox.
- Parallel errors (`parcluster`, `parfor`): install the Parallel Computing Toolbox, reduce `NumWorkers`, or convert `parfor` to `for` for a serial run.
- Poor fusion/alignment artifacts: ensure VI/IR images are geometrically registered before fusion.
- Non-Windows systems: `demo.m` uses Windows-style `addpath("image\...")`. Replace with cross-platform paths using `filesep` or `fullfile`.

## License

MIT License. See `LICENSE` for details.

## Citation

If you find this work useful, please cite the manuscript above. A BibTeX entry will be provided upon publication.
