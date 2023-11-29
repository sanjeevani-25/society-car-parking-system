// import uvm_pkg::*;
`define parking_slots 10

module display_Allpass #(parameter N=`parking_slots)();
  output reg [$clog2(N):0] var [0:N];
  integer k;
  initial begin
    $readmemb("./input.txt", var);
    $display("\nFlat Number : Password\n");
    for (k=0; k<=N; k=k+1) $display("\t%0d \t\t: %b %d",k,var[k],var[k]);
  end
endmodule

// module add_passwords #(parameter N=`parking_slots) (var);
//   integer fd,k;
//   integer seed=1;
//   output reg [$clog2(N):0] var [0:N];
//     reg [$clog2(N):0] pwd;

// initial begin
// fd=$fopen("./input.txt","w");
//     for (k=0; k<=N; k=k+1) begin 
//       pwd=$random(seed)%20;
//       seed=$random;
//       $fwrite(fd," %b",pwd); 
//       $fdisplay(fd,"%b",pwd); 
//     end
// end
// endmodule


module  add_passwords #(parameter N=`parking_slots)();
  integer fd;
  integer seed=1;
  reg [$clog2(N):0] var [0:N];
  reg [$clog2(N):0] pwd;
  integer k,i,sc;

  initial begin  
    fd=$fopen("./input.txt","w");
    for (k=0; k<=N; k=k+1) begin 
      pwd=$random(seed)%20;
      seed=$random;
      $fwrite(fd," %b",pwd); 
      // $fdisplay(fd,"%b",pwd); 
    end
    $display("Database updated");
    // $readmemb("./input.txt", var);
    // $display("\nFlat Number : Password\n");
    // $display("\nFlat Number : Password %b\n",var[0]);
    // for (k=0; k<=N; k=k+1) begin 
    //   $display("\t%0d \t\t: %b %d",k,var[k],var[k]);
    // end
    $fclose(fd);
  end

endmodule