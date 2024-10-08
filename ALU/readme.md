#Arithmetic Logic Unit in System Verilog
An implementation of an ALU ready for an FPGI board developed as a part of the lab in the course IL1332 at Kungliga Tekniska Högskolan in Stockholm by:
- Fredrik
- Marty Katarzyna Gludkowska
- Risha Haq

## Implemented functionality
ALU performs four types of functions: [Arithmetic operations](), [logic operations](), [comparison](), and [shifting/rotating operations]().
Inputs: unsigned 8-bit X and Y. 
Output: unsigned 16-bit Z. 
Control signals: 2-bit S and M.

### The functions are defined by the following table:
  - S     M      Function        Function Category
  - 00    00     ADD             Arithmetic
        01     SUB
        10     MULTIPLY
        11     UNUSED
- 01      00     ROTATE RIGHT    Shift/Rotate
        01     ROTATE LEFT
        10     SHIFT RIGHT
        11     SHIFT LEFT
- 10      00     GREATER THAN    Compare
        01     LESS THAN
        10     EQUAL
        11     NOT EQUAL
- 11      00     AND            Logic
        01     OR
        10     NOT
        11     XOR

## Testbench Requirements:
1. Create a testbench to verify the functionality of the ALU.
2. The testbench should validate all possible ALU functions.
3. Use randomized inputs to test your design thoroughly.
Hint: Refer to page 116 of Lecture 7 for additional guidance.
C. (Bonus) Implement the ALU on FPGA.
You can implement a 4-bit version of the ALU on an FPGA as a bonus task. Connect the
two 4-bit inputs, X and Y, to the FPGA board's switches (SW), where each bit of X and
Y corresponds to an individual switch. The 2-bit control signals, S and M, should also be
connected to switches (SW) to allow manual selection of the ALU's operations. The 8-bit
output of the ALU should be connected to LEDs on the board, with each LED
representing one bit of the binary output. Additionally, the binary values of the inputs, X
and Y, should also be displayed using LEDs.
