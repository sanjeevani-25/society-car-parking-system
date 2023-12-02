`include "modules.v"

module main;
    add_passwords inst1();
    display_Allpass inst2();
    pass_check inst3();
    // initial begin
    //     $dumpfile("main.vcd");
    //     $dumpvars(0,main);
    // end
endmodule
