**Exceptions Cost in Delphi**

Measurement of the cost of **try..except** vs **error codes**, for a given error rate, using simple floating point division. 

**Error code** (avoidance) operations have high, uniform, performance.

**Exception** cost is significant, and increases with frequency of errors.

![image](https://user-images.githubusercontent.com/11953157/137374969-c9c4b0a8-149e-4187-a64a-5dc02c153674.png)

x-axis represents number of thrown errors in 10,000,000 floating point divisions.
