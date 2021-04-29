module sine_shifter(
    input clk ,
    input wire [15:0] shift, //shift in degrees
    input wire [15:0] sineShifterInput ,
    //output reg [15:0] sineShifterOutput
    output reg [31:0] sineShifterOutput //answer
    );
    
parameter SIZE = 1024;    
parameter AmplitudeIncrease = 2;

integer i = 0; //answer
integer j = 0; //answer


reg [31:0] shiftBack [SIZE:0]; //answer

sine_gen baseSineGen2(
        .clk (clk),
        .sineOutput (sineShifterInput)
    );
    
    
    
    
    
  //At every positive edge of the clock, output a sine wave sample.
    always@(posedge clk) begin
        //sineShifterOutput = AmplitudeIncrease*sineShifterInput;
        shiftBack[i] = AmplitudeIncrease*sineShifterInput;
        
        i = i+ 1;
        if(i == shift) //can't divide
            i = 0;
            j = 1;
          
         if(j == 1)
               sineShifterOutput =  shiftBack[i];
    end


endmodule