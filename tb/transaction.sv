class transaction;
  // Stimulus
  rand bit a;
  rand bit b;
  rand bit cin;
  // Observed outputs
  bit sum;
  bit cout;

  function void display(string name);
    $display("-------------------------");
    $display(" %s ", name);
    $display("-------------------------");
    $display("a = %0d, b = %0d, cin = %0d", a, b, cin);
    $display("sum = %0d, cout = %0d", sum, cout);
    $display("-------------------------");
  endfunction
endclass
