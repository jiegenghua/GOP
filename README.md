## What does this solver do?
The objective of this solver is to solve an optimal control problem with/without a terminal state using a model-free method. The problem is formulated as a minimization problem. The code in the src folder includes a GUI and two functions, i.e.,

$\min_{u(t)} \int_{t_0}^{t_f}L(x(t),u(t))dt$

s.t., $\dot x(t)=f(x(t),u(t))$.
## Requirement
- MATLAB 2020b
- MATLAB app designer
## How to use this solver?
1. Write the system dynamics and cost function in the corresponding *sysdynamic.m* and *cost.m* file. Please don't change the name of these two functions.
2. Open the solver_GUI.mlpp.
3. Fill in the parameters such as initial time, initial state, terminal time and terminal state, etc.
4. Click the run button

## The meaning of different parameters.
### Left panel:
- **Initial time:** $t_0$.
- **Initial state:** $x_0$.
- **Terminal time:** $t_f$.
- **Initial state:** $x_f$. If the terminal state is not fixed, leave it empty.
- **Basis:** There are three options for the basis function, Chebyshev, Legendre, and Fourier.
- **#u:** the dimension of the control input.
- **umax:** the maximum value of the control input. If there is no boundary, set it to inf.
- **umin:** the minimum value of the control input. If there is no boundary, set it to -inf.
- **rho:** the penalty coefficient if the problem has a fixed terminal state. If you want to get more close to the terminal state, increase this value.
- **#Iteration:** the number of iterations to run this algorithm.
- **#basis:** the number of basis functions used.
- **Tolerance:** It is used to control the convergence of algorithm. The smaller this value, the longer the time it may take to converge.
- **alpha:** the step size for parameters update. The range goes from 0.001 to 0.1. The default value is 0.001. You may need to
tune this parameter to make the algorithm converge.

### Right panel: the output of the algorithm after convergence.
- **Three figures:** controller with respect to time, states with respect to time, optimal cost with respect to the iteration number
- **convergence:** output the progress of the running algorithm, which iteration it is running now
- **J:** the optimal cost after convergence.

## Notes
- The system dynamics and cost are put in two separate external functions discretized using first-order Euler's method:  $x_{t+1}=x_{t}+f(x_t,u_t)dt$ where $dt$ is the step size.
- You may need to tune the parameters **alpha** to make the algorithm converge.
- The dimension of the system's state and control input should be consistent.

