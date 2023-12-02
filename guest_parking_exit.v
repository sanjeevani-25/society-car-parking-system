`include "number_of_slots.v"

module guest_parking_exit #(parameter N1 = `guest_slots)();
    integer fd,k;
    integer out_file;
    reg [$clog2(N1):0] avail_slot [0:1];
    // reg [$clog2(20):0] avail_slot [0:1];
    // reg [4:0] avail_slot [0:1];

    initial begin
        out_file = $fopen("./output.txt","a+");
        $readmemb("./DB_guest.txt", avail_slot);

        if(avail_slot[0] < N1) begin
            
            // $display(avail_slot[0]);
            avail_slot[0] = (avail_slot[0]+1);
            // $display(avail_slot[0]);

            fd=$fopen("./DB_guest.txt","w+");
            for (k=0; k<=1; k=k+1) begin
                $fwrite(fd,"%0b ",avail_slot[k]);
            end
            $fclose(fd);
            
            $display("Guest vehicle exited.");
            $fwrite(out_file,"Guest vehicle exited.\n");
        end
        else begin
            $display("INVALID. All slots available.");
            $fwrite(out_file,"INVALID. All slots available.\n");        
        end
        $fclose(out_file);
        
    end

endmodule