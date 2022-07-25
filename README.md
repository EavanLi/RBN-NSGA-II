# RBN-NSGA-II
The implementation of **RBN-NSGA-II: Radical Basis Network Simulation for Noisy Multi-objective Optimization Considering Evolution Control**.

## Highlights
1. **De-Noising the RBN Model**: Although the RBN model has been widely studied, this study is the first time that is has been applied to noisy MOPs. In this paper, inspired by the universal approximation theorem, we describe the effectiveness of the RBN in estimating noise-free fitness values.

2. **Improving Existing MOEAs on Noisy Problems**: We design an automated RBN update strategy to embed existing MOEAs. Experimental results show that the proposed algorithm markedly improves the optimization speed while maintaining good search ability, which is valuable in practical noisy optimization scenarios.

## Usage of GRNN
The official example of GRNN is shown in [here](https://ww2.mathworks.cn/help/releases/R2020b/deeplearning/ug/grnn-function-approximation.html?lang=en).


## Data Preparation
Put the Pareto front in ./truePF. It should look like:
```
${RBN-NSGA-II_ROOT}
 -- truePF
     ZDT1.txt
     ZDT2.txt
     ...
```

## Run RBN-NSGA-II on your computer
Run the RBN_NSGAII.m and input the relevant parameters on the console of matlab.
