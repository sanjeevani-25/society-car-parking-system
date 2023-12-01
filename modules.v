`include "number_of_slots.v"
`include "slot_availability_entry.v"

module  add_passwords #(parameter N=`parking_slots)();

  integer fd,k,i;
  integer seed = 10;
  reg [$clog2(N):0] var [0:N];
  reg [$clog2(N):0] password ;

  initial begin
    
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
    $readmemb("./DB.txt", var);
    $display("\nFlat Number : Password");
    for (k=0; k<=N; k=k+1) begin
      $display("\t%0d \t\t: %b %d",k,var[k],var[k]);
    end
  end
endmodule


module pass_check #(parameter N=`parking_slots)();

  output reg [$clog2(N):0] var [0:N];
  output reg [$clog2(N):0] in [0:1];
  output  [$clog2(N):0] flat_number ,password;
  integer k;
  reg pwd_flag=0;
  wire avail_flag;
  integer out_file;

  assign flat_number = in[0];
  assign password = in[1];

  initial begin
    out_file = $fopen("./output.txt","a+");
    $readmemb("./DB.txt", var);
    $readmemb("./input.txt", in);
    $display("\nChecking Password...");
    $fwrite(out_file,"Checking Password...\n"); 

    for (k=0; k<=N; k=k+1) begin
      // $display("\t%0d \t\t: %b %b",k,var[k],password);
      if((flat_number==k) && (var[k]==password)) pwd_flag=1;
    end

    if(pwd_flag) begin
      $display("Password Verified");
      $fwrite(out_file,"Password Verified\n"); 
      end
    else begin
      $display("Wrong Password. Try Again.");
      $fwrite(out_file,"Wrong Password. Try Again.\n"); 
    end

    $fclose(out_file);
    // $display("flat = %0d password = %0d",flat_number ,password );
  end

  slot_availability_entry inst4(pwd_flag, flat_number);

endmodule