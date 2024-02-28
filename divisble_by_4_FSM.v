module harshit_des(
  input clk,
  input rst,
  input in,
  output reg det
);

  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  parameter S3 = 2'b11;
  reg [1:0] present_state, next_state;
  always @(posedge clk, posedge rst) begin
    if (rst) begin
      present_state <= S0;
    end else begin
      present_state <= next_state;
    end
  end

  always @(present_state, in) begin
    case (present_state)
      S0: begin
        if (in) begin
          next_state = S1;
        end else begin
          next_state = S0;
        end
        det <= 0;
      end
      S1: begin
        if (in) begin
          next_state = S2;
        end else begin
          next_state = S0;
        end
        det <= 0;
      end
      S2: begin
        if (in) begin
          next_state = S3;
        end else begin
          next_state = S1;
        end
        det <= 0;
      end
      S3: begin
        if (in) begin
          next_state = S0;
        end else begin
          next_state = S2;
        end
        det <= 1; 
      end
      default: begin
        next_state = S0;
        det <= 0;
      end
    endcase
  end

endmodule
