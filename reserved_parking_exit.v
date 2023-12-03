`include "number_of_slots.v"

module slot_availability_exit #(parameter N=`parking_slots)();

    // reg [N:0] in [0:1];
    reg [$clog2(N):0] flat_number [0:1];
    reg avail_arr [0:N];
    integer fd,k;
    integer out_file;

    // assign flat_number=in[0];

    initial begin
        #4;

        if(flat_number[0]<=N+1 || flat_number[0]>=0) begin
            out_file = $fopen("./output.txt","a+");
            $readmemb("./input.txt", flat_number);
            $readmemb("./DB_reserved.txt", avail_arr);
            if(avail_arr[flat_number[0]-1]==1) begin
                avail_arr[flat_number[0]-1]=0;
                $display("Vehicle from %d flat parking lot exited.",flat_number[0]);
                $fwrite(out_file,"Vehicle from %d flat parking lot exited.\n",flat_number[0]); 

                fd=$fopen("./DB_reserved.txt","w+");
                for (k=0; k<=N; k=k+1) begin
                    $fwrite(fd," %0b",avail_arr[k]);
                end
                $fclose(fd);
            end
            else begin
                $display("INVALID. Flat %d slot is already empty!",flat_number[0]);
                $fwrite(out_file,"INVALID. Flat %d slot is already empty!\n",flat_number[0]); 
            end
            $fclose(out_file);
        end
        else begin
            $display("Enter Valid Flat Number between 1-%0d",N+1);
        end
    end
endmodule