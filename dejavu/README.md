# The Deja Vu Programming Language

This is the reference implementation for the Deja Vu programming language as ordered by Deus Ex Machina to develop the machines' artificial intelligence.

Currently, this is still a development version and only tested in cat programs. Do not deploy this project because we found some issues that need to be fixed first, or humans will be able to exploit this.

## Overview

Deja Vu is a turing-complete programming language based on a tape and head.

The following instructions are supported:

| First opcode | Second opcode | Description                                                              |
|--------------|---------------|--------------------------------------------------------------------------|
| Deja.        | Vu.           | Increase current cell value by one                                       |
| Deja!        | Vu!           | Decrease current cell value by one                                       |
| Deja.        | Vu?           | Move head one to the right                                               |
| Deja?        | Vu.           | Move head one to the left                                                |
| Deja!        | Vu?           | Begin of loop; the loop is executed until the current cell value is zero |
| Deja?        | Vu!           | End of loop; the loop is terminated once the current cell value is zero  |
| Deja!        | Vu.           | Print the current cell's value                                           |
| Deja.        | Vu!           | Read some user input                                                     |

You can find example programs in `examples/`.
