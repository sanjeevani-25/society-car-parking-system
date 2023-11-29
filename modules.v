`define parking_slots 10

module  add_passwords #(parameter N=`parking_slots)();

  integer fd,k,i;
  integer seed = 10;
  reg [$clog2(N):0] var [0:N];
  reg [$clog2(N):0] pwd;

initial begin
  
  fd=$fopen("./DB.txt","w");

  for (k=0; k<=N; k=k+1) begin 
    pwd=$urandom(seed) % 20;
    seed=$urandom;
    $fwrite(fd," %b",pwd); 
    // $fdisplay(fd,"%b",pwd); 
  end
  $display("Database updated");
  $fclose(fd);
end


endmodule

module display_Allpass #(parameter N=`parking_slots)();

  output reg [$clog2(N):0] var [0:N];
  integer k;

initial begin
  
  $readmemb("./DB.txt", var);
  $display("\nFlat Number : Password");
  for (k=0; k<=N; k=k+1) $display("\t%0d \t\t: %b %d",k,var[k],var[k]);
end

endmodule