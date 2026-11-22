// Full adder built from two half adders and an OR gate
`include "half_adder.sv"
module full_adder(sum,cout,a,b,cin);
  input a,b,cin;
  output sum,cout;
  wire s1,c1,c2;
  half_adder ha1(.s(s1),  .c(c1), .a(a),  .b(b));
  half_adder ha2(.s(sum), .c(c2), .a(s1), .b(cin));
  or o1(cout,c1,c2);
endmodule
