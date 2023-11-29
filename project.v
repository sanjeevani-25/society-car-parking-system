`define parking_slots 10

module  add_passwords #(parameter N=`parking_slots)();

  integer fd,k,i;
  integer seed = 3;
  reg [$clog2(N):0] var [0:N];
  reg [$clog2(N):0] pwd;

  fd=$fopen("./input.txt","w");

  for (k=0; k<=N; k=k+1) begin 
    pwd=$random(seed) % 20;
    seed=$random;
    $fwrite(fd," %b",pwd); 
    // $fdisplay(fd,"%b",pwd); 
    $display("Database updated");
  end

  $fclose(fd);

endmodule

module display_Allpass #(parameter N=`parking_slots)();

  output reg [$clog2(N):0] var [0:N];
  integer k;

  $readmemb("./input.txt", var);
  $display("\nFlat Number : Password");
  for (k=0; k<=N; k=k+1) $display("\t%0d \t\t: %b %d",k,var[k],var[k]);

endmodule