`include "number_of_slots.v"

module guest_parking_entry #(parameter N1 = `guest_slots)();
    integer fd,k;
    integer out_file;
    reg [$clog2(N1):0] avail_slot [0:1];
    // reg [3:0] avail_slot [0:1];

    initial begin
        out_file = $fopen("./output.txt","a+");
        $readmemb("./DB_guest.txt", avail_slot);

        if(avail_slot[0] >0) begin    
            // $display(avail_slot[0]);
            avail_slot[0] = (avail_slot[0]<<1) +(~avail_slot[0]);
            // $display(avail_slot[0]);
            fd=$fopen("./DB_guest.txt","w+");
            for (k=0; k<=1; k=k+1) begin
                $fwrite(fd,"%0b ",avail_slot[k]);
            end
            $fclose(fd);
            
            $display("Guest vehicle entered.");
            $fwrite(out_file,"Guest vehicle entered.\n");
        end
        else begin
            $display("Sorry! No guest slot available!");
            $fwrite(out_file,"Sorry! No guest slot available!\n");
        end

        $fclose(out_file);
        
    end

endmodule