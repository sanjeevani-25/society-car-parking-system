`include "number_of_slots.v"
`include "reserved_parking_entry.v"

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
    #2;
    out_file = $fopen("./output.txt","a+");
    $readmemb("./DB.txt", var);
    $readmemb("./input.txt", in);

    if(flat_number>N+1 || flat_number==0) begin
      $display("Enter Valid Flat Number between 1-%0d",N+1);
      $fwrite(out_file,"Enter Valid Flat Number between 1-%0d",N+1);
    end


    else begin
      $display("\nChecking Password...");
      $fwrite(out_file,"Checking Password...\n"); 
        
      for (k=0; k<=N; k=k+1) begin
        // $display("\t%0d \t\t: %b %b",k,var[k],password);
        if((flat_number==k+1) && (var[k]==password)) pwd_flag=1;
      end

      if(pwd_flag) begin
        $display("Password Verified");
        $fwrite(out_file,"Password Verified\n"); 
        end
      else begin
        $display("Wrong Password. Try Again.");
        $fwrite(out_file,"Wrong Password. Try Again.\n"); 
      end
    end

    $fclose(out_file);
    // $display("flat = %0d password = %0d",flat_number ,password );
  end

  reserved_parking_entry inst4(pwd_flag, flat_number);

endmodule