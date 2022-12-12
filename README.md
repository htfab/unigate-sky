# Universal gates, self-documenting version

This project is an enhanced version of [unigate-gf](https://github.com/htfab/unigate-gf).

In <i>normal</i> mode, it contains four independent universal logic gates:

- <i>U</i><sub>21</sub> on input pins 5-8 and output pin 32
- <i>U</i><sub>31</sub> on input pins 9-14 and output pin 33
- <i>U</i><sub>41</sub> on input pins 15-24 and output pin 34
- <i>U</i><sub>22</sub> on input pins 25-30 and output pins 35-36

where <i>U<sub>ij</sub></i> can be suitably wired to power, ground and inputs such that
it implements any particular Boolean function on <i>i</i> inputs and <i>j</i> outputs.

There is an additional mux that selects one of the outputs of the above <i>U</i><sub>22</sub>
based on input pin 31 and outputs it on pin 37. This allows us to transform <i>U</i><sub>22</sub>
into another instance of <i>U</i><sub>31</sub>.

In <i>reference</i> mode, it uses a lookup table to tell us how to wire the universal gates to
achieve a specific Boolean function.

- setting input pins 5-6 and 31 and clearing input pins 7-8 activates reference mode
  (this particular combination is never needed in normal mode)
- use input pins 9-10 to select one of <i>U</i><sub>21</sub>,
  <i>U</i><sub>31</sub>, <i>U</i><sub>41</sub>, <i>U</i><sub>22</sub>
- use input pins 11-26 to specify the truth table of the Boolean function
- use input pins 27-30 to specify the input pin number to be wired
- signal on output pin 32 means the selected pin should be wired to ground
- signal on output pin 33 means the selected pin should be wired to power
- signal on output pins 34-37 mean the selected pin should be wired to
  the inputs 1-4 of the Boolean function respectively

