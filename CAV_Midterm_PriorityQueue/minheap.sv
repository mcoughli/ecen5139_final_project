// Simulatable model of the priority queue.

module testbench;
    localparam N = 6;
    localparam MSB = $clog2(N) - 1;

    localparam NOOP = 0, PUSH = 1, POP = 2;

    reg clock;
    reg [1:0] cmd;
    reg [MSB:0] in;

    wire [MSB:0] out;
    wire full, empty;

    always #5 clock = ~clock;

    pqueue #(.N(N), .MSB(MSB)) pq(clock, cmd, in, out, full, empty);

    task check;
        integer i;
        begin
            for (i = 0; i + 1 < pq.count;  i = i + 2) begin
                if (pq.queue[i] > pq.queue[i+1]) begin
                    $display("invariant violated: queue[%0d] > queue[%0d]",
                             i, i+1);
                    $finish;
                end
                if (i + 2 < pq.count) begin
                    if (pq.queue[i] > pq.queue[i+2]) begin
                        $display("invariant violated: queue[%0d] > queue[%0d]",
                                 i, i+2);
                        $finish;
                    end
                end
            end
        end
    endtask

    task inspect;
        integer i;
        begin
            $write("%5d: ", $time);
            case (cmd)
              NOOP: $write("NOOP ");
              PUSH: $write("PUSH ");
              POP:  $write("POP  ");
              default: $write("???? ");
            endcase
            $write("%0d, cnt = %0d, q =", in, pq.count);
            for (i = 0; i < pq.count; i = i + 1)
              $write(" %0d", pq.queue[i]);
            $display();
            check;
        end
    endtask
    
    initial #0 begin
        if (N < 2) begin
            $display("N (%0d) should be at least 2", N);
            $finish;
        end
        clock = 0;
        cmd = NOOP;
        in = 0;
        @ (negedge clock) inspect;
        in = 1;
        cmd = PUSH;
        @ (negedge clock) inspect;
        in = 2;
        @ (negedge clock) inspect;
        in = 3;
        @ (negedge clock) inspect;
        in = 1;
        @ (negedge clock) inspect;
        in = 2;
        @ (negedge clock) inspect;
        @ (negedge clock) inspect;
        @ (negedge clock) inspect;
        cmd = POP;
        @ (negedge clock) inspect;
        @ (negedge clock) inspect;
        cmd = PUSH;
        in = 2;
        @ (negedge clock) inspect;
        cmd = POP;
        @ (negedge clock) inspect;
        @ (negedge clock) inspect;
        cmd = NOOP;
        @ (negedge clock) inspect;
        cmd = POP;
        @ (negedge clock) inspect;
        @ (negedge clock) inspect;
        @ (negedge clock) inspect;
        cmd = PUSH;
        in = 1;
        @ (negedge clock) inspect;
        in = 0;
        @ (negedge clock) inspect;
        @ (negedge clock) inspect;
        in = 3;
        @ (negedge clock) inspect;
        cmd = POP;
        @ (negedge clock) inspect;
        @ (negedge clock) inspect;
        @ (negedge clock) inspect;
        @ (negedge clock) inspect;
        $finish;
    end

endmodule // testbench

module pqueue #(parameter N = 200, parameter MSB = $clog2(N)-1)
(
input clock, 
input [1:0] cmd, 
input [MSB:0] in, 
output [MSB:0] out,
output full, 
output empty
);
	parameter NOOP = 0, PUSH = 1, POP = 2;
	localparam C = $clog2(N+1) - 1;
	
	reg [MSB:0] queue [0:N];
	reg [C:0]   count;
	integer	j;
	integer	i;
	integer next;
	initial begin
        for (j = 0; j < N; j = j + 1)
		queue[j] = 0;
        count = 0;
	end

	assign full = count == N;
	assign empty = count == 0;
	assign out = queue[0];

	always @ (posedge clock) begin
		case(cmd)
			PUSH: if(full == 0) begin
				queue[0] <= 0;
				queue[count + 1] <= in;
				for(i = count + 1; i >= 1 ; i = i >> 1) begin
					if(queue[i] < queue[i >> 1]) begin //swap with parent
						queue[i] <= queue[i >> 1];
						queue[i >> 1] <= queue[i];
					end else begin
						break;
					end
				end
			POP: if(empty == 0) begin
				queue[0] <= queue[1];
				queue[1] <= queue[C+1];
				for(i=1; i <= count; i = next) begin
					if(i << 1 > count && i << 1 + 1 > count) begin //if the current position has no children
						break;
					end else if(i << 1 + 1 > count) begin //if there is no right child, check, but is also last iteration
						if(queue[i] > queue[i << 1]) begin
							queue[i] <= queue[i << 1];
							queue[i << 1] <= queue[i];
						end
						break;
					end else if(queue[i] > queue[i<<1]) || queue[i] > queue[i<<1 + 1]) begin //check if is greater than children, when there are 2 children
						if(queue[i<<1] <= queue[i<<1 + 1]) begin //swap with left child
							queue[i] <= queue[i<<2];
							queue[i<<2] <= queue[i];
							next = i << 1;
						end else begin //else swap with right child
							queue[i] <= queue[i<<2 + 1];
							queue[i<<2 + 1] <= queue[i];
							next = i << 1 + 1;
						end
					end else begin //?
						break;
					end
				end
			default: //don't need to do anything for NOOP or invalid command
				queue[0] <= 0;
		endcase
	end
	
	always @ (posedge clock) begin
		case(cmd)
			PUSH: if(full == 0)
				count <= count + 1;
			POP: if(empty == 0)
				count <= count - 1;
			default:;
		endcase
	end
endmodule

