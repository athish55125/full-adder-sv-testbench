class monitor;
  virtual intf vif;
  mailbox #(transaction) mon2scb;
  int count;

  function new(virtual intf vif, mailbox #(transaction) mon2scb, int count);
    this.vif     = vif;
    this.mon2scb = mon2scb;
    this.count   = count;
  endfunction

  task main;
    repeat(count) begin
      transaction trans;
      @(vif.driven);
      trans = new();
      trans.a    = vif.a;
      trans.b    = vif.b;
      trans.cin  = vif.cin;
      trans.sum  = vif.sum;
      trans.cout = vif.cout;
      mon2scb.put(trans);
      trans.display("Monitor");
    end
  endtask
endclass
