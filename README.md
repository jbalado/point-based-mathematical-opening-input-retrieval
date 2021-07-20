# Point-based Mathematical Opening with Retrieval Input Data

Created by Jesús Balado Frías, Peter van Oosterom, Lucía Díaz-Vilariño and Henrique Lorenzo.

## Introduction

Morphological opening is a very useful technique for segmentation. In this work we have adapted morphological opening to point clouds, and we have improved the previous version by preserving the original points (and attributes) and not generating new data.

## Work

The designed method is described in the article ****Mathematical opening with input retrieval data****.

Before applying the code, reading the paper is highly recommended.

It is available in Open Access at this [link](Pendiente).


## Application
The code consists of two fundamental functions: erosion followed by dilation. The first fuction (erosion) require two input point clouds: 
* Point cloud input: composed of an NxA matrix, where N is the number of points and A the number of attributes, XYZ being the first three.
* Point cloud strutcturing element: composed of an Nx3 matrix, where N is the number of points. It is the auxiliary point cloud that acts as a structuring element.

The output is a segmented point cloud.


## Citation
Pendiente
