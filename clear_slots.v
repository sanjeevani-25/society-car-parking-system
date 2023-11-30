// `define parking_slots 10
`include "number_of_slots.v"

module clear_parking_slots #(parameter N=`parking_slots)();
    integer fd,k;
    initial begin 
        fd=$fopen("./slot_avail_DB.txt","w+");
        for (k=0; k<=N; k=k+1) begin
            $fwrite(fd," %0b",0);
        end
        $fclose(fd);
    end
endmodule