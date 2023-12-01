`include "number_of_slots.v"

module slot_availability_exit #(parameter N=`parking_slots)();

    // reg [N:0] in [0:1];
    reg [N:0] flat_number [0:1];
    reg avail_arr [0:N];
    integer fd,k;
    integer out_file;

    // assign flat_number=in[0];

    initial begin
        #2;
        out_file = $fopen("./output.txt","a+");
        $readmemb("./input.txt", flat_number);
        $readmemb("./slot_avail_DB.txt", avail_arr);

        if(avail_arr[flat_number[0]]==1) begin
            avail_arr[flat_number[0]]=0;
            $display("Vehicle from %d flat parking lot exited.",flat_number[0]);
            $fwrite(out_file,"Vehicle from %d flat parking lot exited.\n",flat_number[0]); 

            fd=$fopen("./slot_avail_DB.txt","w+");
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
endmodule