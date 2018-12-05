# examples-bb8

### D Evangelista

This code does a low budget simulation of BB-8 from Star Wars. The dynamics / physics are contained in a BB8 object; rendering is accomplished with a separate BB8Graphic object. This code is meant to illustrate (1) use of classes; (2) separating the physics and graphics; (3) use of homogeneous transforms; (4) equations of motion and Jacobian for a simple two wheel robot; and (5) how to use textures mapped onto a mesh for 3D graphics. 

## Obtaining the code with `git`
```bash
git clone https://github.com/es200-evanglista/examples-bb8
git pull
```

Place the code in your working Matlab directory and run `BB8Sim.m` to try the demo

## Contributors
D Evangelista

## Acknowledgements
MIDN 3/c J Stewart got interested in making a sphere with a texture and found the initial sphere example... at her suggestion I added the rest. Asst Prof M Kutzer also suggested introducing hgtransform for its future utility for WRCE midshipmen (e.g. in robotics, mobile robots, etc electives down the line). 

