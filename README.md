# cellular-automata-bash
Simple demo of a 1D cellular automaton evolving according to Rule 90
Built in bash because why not


## Description of the theoretical concept

In the mathematical study of cellular automata, Rule 90 is an elementary cellular automaton based on the exclusive or function. It consists of a one-dimensional array of cells, each of which can hold either a 0 or a 1 value. In each time step all values are simultaneously replaced by the exclusive or of their two neighboring values.

When started from a single live cell, Rule 90 has a time-space diagram in the form of a Sierpiński triangle. The behavior of any other configuration can be explained as a superposition of copies of this pattern, combined using the exclusive or function. Any configuration with only finitely many nonzero cells becomes a replicator that eventually fills the array with copies of itself. When Rule 90 is started from a random initial configuration, its configuration remains random at each time step. Its time-space diagram forms many triangular "windows" of different sizes, patterns that form when a consecutive row of cells becomes simultaneously zero and then cells with value 1 gradually move into this row from both ends. 

From any initial configuration of Rule 90, one may form a mathematical forest, a directed acyclic graph in which every vertex has at most one outgoing edge, whose trees are the same as the trees in Miller's metaphor. The forest has a vertex for each pair (x,i) such that cell x is nonzero at time i. The vertices at time 0 have no outgoing edges; each one forms the root of a tree in the forest. For each vertex (x,i) with i nonzero, its outgoing edge goes to (x ± 1, i − 1), the unique nonzero neighbor of x in time step i − 1. Miller observed that these forests develop triangular "clearings", regions of the time-space diagram with no nonzero cells bounded by a flat bottom edge and diagonal sides. Such a clearing is formed when a consecutive sequence of cells becomes zero simultaneously in one time step, and then (in the tree metaphor) branches grow inwards, eventually re-covering the cells of the sequence.

The time-space diagram of Rule 90 is a plot in which the ith row records the configuration of the automaton at step i. When the initial state has a single nonzero cell, this diagram has the appearance of the Sierpiński triangle, a fractal formed by combining triangles into larger triangles. Rules 18, 22, 26, 82, 146, 154, 210 and 218 also generate Sierpinski triangles from a single cell, however not all of these are created completely identically. One way to explain this structure uses the fact that, in Rule 90, each cell is the exclusive or of its two neighbors. Because this is equivalent to modulo-2 addition, this generates the modulo-2 version of Pascal's triangle. The diagram has a 1 wherever Pascal's triangle has an odd number, and a 0 wherever Pascal's triangle has an even number. This is a discrete version of the Sierpiński triangle.

## Code explaination:

The initial state of the automaton is given by the `cell` array. Both it's size and content can be modified to suit a particular need.
The `tmp` array stores the results of the XOR calculations until the entire `cell` array has been parsed, as such, make sure both of them have the same size.
The number of steps this algorithm will perform is dictated by the `steps` variable, modify it to suit your needs.
