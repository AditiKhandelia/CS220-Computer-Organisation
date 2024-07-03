
`include "seven_bit_adder.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:08 01/24/2024 
// Design Name: 
// Module Name:    seven_bit_adder_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

module seven_bit_adder_top;

	reg PB1,PB2,PB3,PB4;
    reg [3:0] a;
    wire [6:0] sum;
    wire cout;

	// Instantiate the Unit Under Test (UUT)
	seven_bit_adder uut (
		.PB1(PB1),
        .PB2(PB2),
        .PB3(PB3),
        .PB4(PB4),
        .a(a),
        .sum(sum),
        .cout(cout),
	);

	initial begin
        a=0;
		PB1=1;
        PB2=0;
        PB3=0;
        PB4=0;
	end

    always begin
        #5;
        PB1=~PB1;
        #15;
        PB1=~PB1;
    end

    always begin
        #5;
        PB2=~PB2;
        #5;
        PB2=~PB2;
        #10;
    end

    always begin
        #10;
        PB3=~PB3;
        #5;
        PB3=~PB3;
        #5;
    end

    always begin
        #15;
        PB4=~PB4;
        #5;
        PB4=~PB4;
    end

    always begin
        for(integer i=1;i<16;i++) begin
            #5;
            a=i;
        end
    end

    always begin
        #21;
        $display("%b %b %b %b %d %d %d",PB1,PB2,PB3,PB4,a,sum,cout);
    end

    initial begin
        #500;
        $finish;
    end
      
endmodule