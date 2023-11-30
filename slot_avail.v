module slot_availability_entry #(parameter N=`parking_slots)(
input pwd_flag,
input [$clog2(N):0] flat_number
);
    integer fd,k;
    reg avail_arr [0:N];
    reg avail_flag;

    initial begin
        $readmemb("./slot_avail_DB.txt", avail_arr);
        #10;
        if(pwd_flag)begin       
            // already occupied 
            if(avail_arr[flat_number]==1) avail_flag=0;
            // slot empty --> change value in DB to occupied(1)
            else begin
                avail_flag=1;
                avail_arr[flat_number]=1;
            end
        end

        fd=$fopen("./slot_avail_DB.txt","w+");
        for (k=0; k<=N; k=k+1) begin
            $fwrite(fd," %0b",avail_arr[k]);
        end
        $fclose(fd);

        if(avail_flag) $display("Vehicle can enter");

        else if(!avail_flag) $display("Slot occupied. Vehicle cannot enter.");

        else $display("Vehicle cannot enter.");

    end

endmodule



