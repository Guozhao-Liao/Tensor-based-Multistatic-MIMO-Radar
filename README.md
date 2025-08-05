# Tensor-based-Multistatic-MIMO-Radar  

This repository provides a demo for the experiments in our paper:  

**Target Localization with Coprime Multistatic MIMO Radar via Coupled Canonical Polyadic Decomposition Based on Joint EVD**  

**Reference:**  
[1] Guo-Zhao Liao, Xiao-Feng Gong, Wei Liu, and Hing Cheung So, "Target localization with a coprime multistatic MIMO radar via coupled canonical polyadic decomposition based on joint EVD," in *ICASSP 2025 - 2025 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP)*, 2025, pp. 1–5.  
[2] Guo-Zhao Liao, Xiao-Feng Gong, Wei Liu and Hing Cheung So, "Target Localization with a Coprime Multistatic MIMO Radar via Coupled Canonical Polyadic Decomposition Based on Joint Eigenvalue decomposition", *Signal Processing*. vol. 238, pp. 110099, 2026.

The tensor decomposition routines used in this project are implemented using Tensorlab 3.0 and Tensorlab Plus.
– Tensorlab 3.0: N. Vervliet, O. Debals, L. Sorber, M. Van Barel, and L. De Lathauwer, Tensorlab 3.0, available online, March 2016. https://www.tensorlab.net
– Tensorlab Plus: S. Hendrikx, M. Boussé, N. Vervliet, M. Vandecappelle, R. Kenis, and L. De Lathauwer, Tensorlab Plus, available online, version of December 2022. Downloaded from https://www.tensorlabplus.net

## Description  
This repository contains the MATLAB implementation of the proposed target localization method using **Coupled Canonical Polyadic Decomposition (C-CPD)** based on **Joint Eigenvalue Decomposition (J-EVD)** for multistatic MIMO radar with coprime planar arrays.  

## Requirements  
- MATLAB (R2021a or later recommended)
- Parallel Computing Toolbox (for parallel computing operations)  
- Tensorlab toolbox (for tensor decomposition operations)  
