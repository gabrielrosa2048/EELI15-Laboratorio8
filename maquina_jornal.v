module maquina_jornal(clk, rst, inicio, c, u, jl, jn, dt, ljl, ljn, td, ruc, rdc, rr, ea);
	input clk, rst, inicio, u, c, jl, jn, dt;
	output reg ljl, ljn, td;
	output reg [3:0]ea;
	output reg [3:0]ruc; 
	output reg [3:0]rdc;
	output reg 	[3:0]rr;
	
	parameter e1=4'b0000;
	parameter e2=4'b0001;
	parameter e3=4'b0010;
	parameter e4=4'b0011;
	parameter e5=4'b0100;
	parameter e6=4'b0101;
	parameter e7=4'b0110;
	parameter e8=4'b0111;
	parameter e9=4'b1000;
	parameter e10=4'b1001;
	parameter e11=4'b1010;
	
	always @(posedge clk or negedge rst)
	begin
		if(!rst)
			ea <=e1;
		else
			case(ea)
			e1:
				begin
					if(inicio==1'b1)
						ea<=e2;
					else
						ea<=e1;
				end
					
			e2: 	
				begin
					if(c==1'b1)
						ea<=e3;
					else if(u==1'b1)
						ea<=e4;
					else
						ea<=e2;
				end
			e3:
				begin
					if(dt==1'b1)
						ea<=e9;
					else
						if(c==1'b1)
							ea<=e4;
						else if(u==1'b1)
							ea<=e5;
						else
							ea<=e3;
				end
			e4:
				begin
					if(dt==1'b1)
						ea<=e9;
					else
						if(c==1'b1)
							ea<=e5;
						else if(u==1'b1)
							ea<=e6;
						else if(jl==1'b1)
							ea<=e8;
						else
							ea<=e4;
				end
			e5:
				begin
					if(dt==1'b1)
						ea<=e9;
					else
						if(c==1'b1)
							ea<=e6;
						else if(jl==1'b1)
							ea<=e10;
						else
							ea<=e5;
				end
			e6:
				begin
					if(dt==1'b1)
						ea<=e9;
					else
						if(jn==1'b1)
							ea<=e7;
						else if(jl==1'b1)
							ea<=e11;
				end
			e7:
				begin
					ea<=e1;
				end
			e8:
				begin
					ea<=e1;
				end
			e9:
				begin
					ea<=e1;
				end
			e10:
				begin
					ea<=e3;
				end
			e11:
				begin
					ea<=e4;
				end
			default
				ea<=e1;
			endcase
	end
	
	always @(ea)
	begin
		case(ea)
		e1:
			begin
				ljl=1'b0;
				ljn=1'b0;
				td=1'b0;
				ruc=4'b0000;
				rdc=4'b0000;
				rr=4'b0000;
			end
		e2:
			begin
				ljl=1'b0;
				ljn=1'b0;
				td=1'b0;
				ruc=4'b0000;
				rdc=4'b0000;
				rr=4'b0000;
			end
		e3:
			begin
				ljl=1'b0;
				ljn=1'b0;
				td=1'b0;
				ruc=4'b0000;
				rdc=4'b0101;
				rr=4'b0000;
			end
		e4:
			begin
				ljl=1'b0;
				ljn=1'b0;
				td=1'b0;
				ruc=4'b0000;
				rdc=4'b0000;
				rr=4'b0001;
			end
		e5:
			begin
				ljl=1'b0;
				ljn=1'b0;
				td=1'b0;
				ruc=4'b0000;
				rdc=4'b0101;
				rr=4'b0001;
			end
		e6:
			begin
				ljl=1'b0;
				ljn=1'b0;
				td=1'b0;
				ruc=4'b0000;
				rdc=4'b0000;
				rr=4'b0010;
			end
		e7:
			begin
				ljl=1'b0;
				ljn=1'b1;
				td=1'b0;
				ruc=4'b0000;
				rdc=4'b0000;
				rr=4'b0000;
			end
		e8:
			begin
				ljl=1'b0;
				ljn=1'b1;
				td=1'b0;
				ruc=4'b0000;
				rdc=4'b0000;
				rr=4'b0000;
			end
		e9:
			begin
				ljl=1'b0;
				ljn=1'b0;
				td=1'b1;
				ruc=4'b0000;
				rdc=4'b0000;
				rr=4'b0000;
			end
		e10:
			begin
				ljl=1'b1;
				ljn=1'b0;
				td=1'b0;
				ruc=4'b0000;
				rdc=4'b0101;
				rr=4'b0000;
			end
		e11:
			begin
				ljl=1'b1;
				ljn=1'b0;
				td=1'b0;
				ruc=4'b0000;
				rdc=4'b0000;
				rr=4'b0001;
			end
		endcase
	end


endmodule
