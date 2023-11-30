module avail_DB(input pwd_flag, output reg avail_flag);
    integer fd;
    reg temp;

    initial begin
        fd=$fopen("./availability_DB.txt","w+");
        temp=avail_flag;
    end
endmodule