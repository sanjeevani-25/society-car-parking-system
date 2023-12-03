`include "number_of_slots.v"
// `include "modules.v"

module main;
    add_passwords inst1();
    display_Allpass inst2();
    // pass_check inst3();
    // initial begin
    //     $dumpfile("main.vcd");
    //     $dumpvars(0,main);
    // end
endmodule


module add_passwords #(parameter N=`parking_slots)();

  integer fd,k,i;
  integer seed = 10;
  reg [$clog2(N):0] password ;

  initial begin
    // $dumpfile("add_passwords.vcd");
    // $dumpvars(0,add_passwords);
    fd=$fopen("./DB.txt","w");

    for (k=0; k<=N; k=k+1) begin 
      password =$urandom(seed) % 20;
      seed=$urandom;
      $fwrite(fd," %b",password); 
      // $fdisplay(fd,"%b",password); 
    end
    $display("Database updated");
    $fclose(fd);

  end
endmodule


module display_Allpass #(parameter N=`parking_slots)();

  output reg [$clog2(N):0] var [0:N];
  integer k;

  initial begin
    #1;
    // $dumpfile("display_Allpass.vcd");
    // $dumpvars(0,display_Allpass);
    $readmemb("./DB.txt", var);
    $display("\nFlat Number : Password");
    for (k=0; k<=N; k=k+1) begin
      $display("\t%0d \t\t: %b %d",k+1,var[k],var[k]);
    end
  end
endmodule
