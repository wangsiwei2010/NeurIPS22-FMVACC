# NeurIPS22-FMVACC
(NeurIPS22) Align then Fusion: Generalized Large-scale Multi-view Clustering with Anchor Matching Correspondences

# Multi-view anchor graph clustering
For seeking efficiency for graph methods, anchor-based (landmark/prototype) method has become a popular choice. For multi-view setting, anchors should be seriously considered with alignment issue then multi-view fusion can be correctly done.

# Simulated datasets
## Dataset Preparation：
datasets/synthetic_data. You can also generate your own multi-view data to see Anchor-unaligned Problem (Dimension 2)

## Generate anchors: 
You can choose sampling/$k$-means, or the learned anchors by our paper.


## AUP problems:
If the anchors are generated independently on each view, then cross-view anchor alignment is needed. Sometimes, the anchors may be exactly aligned with nice initializations. 

# Real multi-view datasets
## Run
run ours_aligned/run.m

