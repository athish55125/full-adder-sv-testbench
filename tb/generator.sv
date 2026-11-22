class generator;
  transaction trans;
  mailbox #(transaction) gen2driv;
  int count;

  function new(mailbox #(transaction) gen2driv, int count);
    this.gen2driv = gen2driv;
    this.count    = count;
  endfunction

  task main();
    repeat(count) begin
      trans = new();
      if(!trans.randomize()) $fatal(1, "Randomization failed");
      trans.display("Generator");
      gen2driv.put(trans);
    end
  endtask
endclass
