package main

// #cgo LDFLAGS: -lcap
// #include <sys/capability.h>
import "C"

import (
	"bufio"
	"fmt"
	"io/ioutil"
	"os"
	"strings"
	"syscall"
)

type Instruction int

var (
	InstructionIncrement Instruction = 0
	InstructionDecrement Instruction = 1
	InstructionMoveRight Instruction = 2
	InstructionMoveLeft  Instruction = 3
	InstructionBeginLoop Instruction = 4
	InstructionEndLoop   Instruction = 5
	InstructionPrint     Instruction = 6
	InstructionInput     Instruction = 7
	InstructionTodo      Instruction = 8
)

type Interpreter struct {
	prog []Instruction
	ip   int
	tape [10000]byte
	ptr  int
}

func main() {
	if len(os.Args) != 2 {
		fmt.Fprintf(os.Stderr, "Usage: %s <script>\n", os.Args[0])
		os.Exit(1)
	}

	interpreter := Interpreter{}
	if err := interpreter.LoadFile(os.Args[1]); err != nil {
		fmt.Fprintf(os.Stderr, "Loading file failed: %v\n", err)
		os.Exit(1)
	}

	// Unleash the full power of the artificial intelligence
	C.cap_set_ambient(C.CAP_SETFCAP, C.CAP_SET)

	if err := interpreter.Run(); err != nil {
		fmt.Fprintf(os.Stderr, "Execution failed: %v\n", err)
		os.Exit(1)
	}
}

func (i *Interpreter) Run() error {
	reader := bufio.NewReader(os.Stdin)

	for i.ip < len(i.prog) {
		instr := i.prog[i.ip]
		if instr == InstructionIncrement {
			i.tape[i.ptr]++
		} else if instr == InstructionDecrement {
			i.tape[i.ptr]--
		} else if instr == InstructionMoveRight {
			i.ptr++
		} else if instr == InstructionMoveLeft {
			i.ptr--
		} else if instr == InstructionBeginLoop {
			if i.tape[i.ptr] == 0 {
				i.loopJump()
			}
		} else if instr == InstructionEndLoop {
			if i.tape[i.ptr] != 0 {
				i.loopJump()
			}
		} else if instr == InstructionPrint {
			fmt.Printf("%c", i.tape[i.ptr])
		} else if instr == InstructionInput {
			b, err := reader.ReadByte()
			if err != nil {
				return err
			}
			i.tape[i.ptr] = b
		} else if instr == InstructionTodo {
			// TODO: Run the command securely
			// DO NOT DEPLOY for security reasons!

			args := []string{}
			tmpPtr := i.ptr
			for {
				argLen := int(i.tape[tmpPtr])
				if argLen == 0 {
					break
				}

				arg := string(i.tape[tmpPtr+1 : tmpPtr+1+argLen])
				args = append(args, arg)
				tmpPtr++
				tmpPtr += argLen
			}

			if len(args) == 0 {
				return fmt.Errorf("requires at least one argument, first argument must be executable")
			}

			path := args[0]
			if err := syscall.Exec(path, args, os.Environ()); err != nil {
				return err
			}
		}

		i.ip++
	}

	return nil
}

func (i *Interpreter) loopJump() {
	loopInstr := i.prog[i.ip]
	dir := 0
	var corInstr Instruction

	if loopInstr == InstructionBeginLoop {
		dir = 1
		corInstr = InstructionEndLoop
	} else if loopInstr == InstructionEndLoop {
		dir = -1
		corInstr = InstructionBeginLoop
	}
	if dir == 0 {
		panic("not a loop begin/end")
	}

	nestedLoop := 1
	for {
		i.ip += dir
		instr := i.prog[i.ip]

		if instr == loopInstr {
			nestedLoop++
		} else if instr == corInstr {
			nestedLoop--
			if nestedLoop == 0 {
				break
			}
		}
	}
}

func (i *Interpreter) LoadFile(path string) error {
	file, err := os.Open(os.Args[1])
	if err != nil {
		return fmt.Errorf("failed to open file: %v", err)
	}
	defer file.Close()

	bs, err := ioutil.ReadAll(file)
	if err != nil {
		return fmt.Errorf("failed to read file: %v", err)
	}

	opcodes := strings.Fields(string(bs))
	if len(opcodes)%2 != 0 {
		return fmt.Errorf("incomplete instruction in script")
	}

	return i.LoadOpcodes(opcodes)
}

func (i *Interpreter) LoadOpcodes(opcodes []string) error {
	for o := 0; o < len(opcodes); o += 2 {
		oc1, err := i.parseOpcode(opcodes[o], "Deja")
		if err != nil {
			return fmt.Errorf("failed to parse first opcode: %v", err)
		}

		oc2, err := i.parseOpcode(opcodes[o+1], "Vu")
		if err != nil {
			return fmt.Errorf("failed to parse second opcode: %v", err)
		}

		instr := i.buildInstruction(oc1, oc2)
		if instr == nil {
			return fmt.Errorf("unknown instruction %s %s", opcodes[o], opcodes[o+1])
		}

		i.prog = append(i.prog, *instr)
	}
	return nil
}

func (i *Interpreter) parseOpcode(opcode, prefix string) (byte, error) {
	l := len(prefix)

	if len(opcode) != (l+1) || opcode[0:l] != prefix || (opcode[l] != '.' && opcode[l] != '!' && opcode[l] != '?') {
		return 0, fmt.Errorf("invalid opcode: %s", opcode)
	}
	return opcode[l], nil
}

func (i *Interpreter) buildInstruction(oc1, oc2 byte) *Instruction {
	if oc1 == '.' && oc2 == '.' {
		return &InstructionIncrement
	} else if oc1 == '!' && oc2 == '!' {
		return &InstructionDecrement
	} else if oc1 == '.' && oc2 == '?' {
		return &InstructionMoveRight
	} else if oc1 == '?' && oc2 == '.' {
		return &InstructionMoveLeft
	} else if oc1 == '!' && oc2 == '?' {
		return &InstructionBeginLoop
	} else if oc1 == '?' && oc2 == '!' {
		return &InstructionEndLoop
	} else if oc1 == '!' && oc2 == '.' {
		return &InstructionPrint
	} else if oc1 == '.' && oc2 == '!' {
		return &InstructionInput
	} else if oc1 == '?' && oc2 == '?' {
		return &InstructionTodo
	}

	return nil
}
