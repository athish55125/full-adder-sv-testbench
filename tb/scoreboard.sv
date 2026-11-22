class scoreboard;
  mailbox #(transaction) mon2scb;
  int count;
  int pass_cnt, fail_cnt;

  function new(mailbox #(transaction) mon2scb, int count);
    this.mon2scb = mon2scb;
    this.count   = count;
  endfunction

  task main;
    transaction trans;
    bit [1:0] expected;
    repeat(count) begin
      mon2scb.get(trans);
      expected = trans.a + trans.b + trans.cin;   // {cout, sum}
      if(expected[0] === trans.sum && expected[1] === trans.cout) begin
        $display("Result is as Expected");
        pass_cnt++;
      end else begin
        $error("Wrong Result: expected sum=%0d cout=%0d", expected[0], expected[1]);
        fail_cnt++;
      end
      trans.display("Scoreboard");
    end
    $display("SCOREBOARD SUMMARY: %0d passed, %0d failed", pass_cnt, fail_cnt);
  endtask
endclass
