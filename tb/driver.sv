class driver;
  virtual intf vif;
  mailbox #(transaction) gen2driv;
  int count;

  function new(virtual intf vif, mailbox #(transaction) gen2driv, int count);
    this.vif      = vif;
    this.gen2driv = gen2driv;
    this.count    = count;
  endfunction

  task main;
    repeat(count) begin
      transaction trans;
      gen2driv.get(trans);
      vif.a   = trans.a;
      vif.b   = trans.b;
      vif.cin = trans.cin;
      #1;                    // let the combinational logic settle
      ->vif.driven;          // tell the monitor it can sample
      trans.sum  = vif.sum;
      trans.cout = vif.cout;
      trans.display("Driver");
      #9;                    // spacing between transactions
    end
  endtask
endclass
