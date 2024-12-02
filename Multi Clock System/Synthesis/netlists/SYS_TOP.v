/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Tue Sep 19 01:18:03 2023
/////////////////////////////////////////////////////////////


module RST_SYNC_NUM_STAGES2_0 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\sync_reg[0] )
         );
endmodule


module RST_SYNC_NUM_STAGES2_1 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\sync_reg[0] )
         );
endmodule


module DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 ( CLK, RST, unsync_bus, bus_enable, 
        sync_bus, enable_pulse_d );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, bus_enable;
  output enable_pulse_d;
  wire   enable_flop, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] sync_reg;

  DFFRQX2M enable_flop_reg ( .D(sync_reg[1]), .CK(CLK), .RN(RST), .Q(
        enable_flop) );
  DFFRQX2M \sync_reg_reg[1]  ( .D(sync_reg[0]), .CK(CLK), .RN(RST), .Q(
        sync_reg[1]) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n9), .CK(CLK), .RN(RST), .Q(sync_bus[7]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(CLK), .RN(RST), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n8), .CK(CLK), .RN(RST), .Q(sync_bus[6]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(CLK), .RN(RST), .Q(sync_bus[4]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n5), .CK(CLK), .RN(RST), .Q(sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(CLK), .RN(RST), .Q(sync_bus[1]) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n4), .CK(CLK), .RN(RST), .Q(sync_bus[2]) );
  DFFRQX2M enable_pulse_d_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(enable_pulse_d) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(bus_enable), .CK(CLK), .RN(RST), .Q(
        sync_reg[0]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(enable_flop), .B(sync_reg[1]), .Y(n1) );
  AO22X1M U5 ( .A0(unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9) );
endmodule


module fifo_mem_D_SIZE8_F_DEPTH8_P_SIZE4 ( w_clk, w_rstn, w_full, w_inc, 
        w_addr, r_addr, w_data, r_data );
  input [2:0] w_addr;
  input [2:0] r_addr;
  input [7:0] w_data;
  output [7:0] r_data;
  input w_clk, w_rstn, w_full, w_inc;
  wire   N9, N10, N11, \FIFO_MEM[7][7] , \FIFO_MEM[7][6] , \FIFO_MEM[7][5] ,
         \FIFO_MEM[7][4] , \FIFO_MEM[7][3] , \FIFO_MEM[7][2] ,
         \FIFO_MEM[7][1] , \FIFO_MEM[7][0] , \FIFO_MEM[6][7] ,
         \FIFO_MEM[6][6] , \FIFO_MEM[6][5] , \FIFO_MEM[6][4] ,
         \FIFO_MEM[6][3] , \FIFO_MEM[6][2] , \FIFO_MEM[6][1] ,
         \FIFO_MEM[6][0] , \FIFO_MEM[5][7] , \FIFO_MEM[5][6] ,
         \FIFO_MEM[5][5] , \FIFO_MEM[5][4] , \FIFO_MEM[5][3] ,
         \FIFO_MEM[5][2] , \FIFO_MEM[5][1] , \FIFO_MEM[5][0] ,
         \FIFO_MEM[4][7] , \FIFO_MEM[4][6] , \FIFO_MEM[4][5] ,
         \FIFO_MEM[4][4] , \FIFO_MEM[4][3] , \FIFO_MEM[4][2] ,
         \FIFO_MEM[4][1] , \FIFO_MEM[4][0] , \FIFO_MEM[3][7] ,
         \FIFO_MEM[3][6] , \FIFO_MEM[3][5] , \FIFO_MEM[3][4] ,
         \FIFO_MEM[3][3] , \FIFO_MEM[3][2] , \FIFO_MEM[3][1] ,
         \FIFO_MEM[3][0] , \FIFO_MEM[2][7] , \FIFO_MEM[2][6] ,
         \FIFO_MEM[2][5] , \FIFO_MEM[2][4] , \FIFO_MEM[2][3] ,
         \FIFO_MEM[2][2] , \FIFO_MEM[2][1] , \FIFO_MEM[2][0] ,
         \FIFO_MEM[1][7] , \FIFO_MEM[1][6] , \FIFO_MEM[1][5] ,
         \FIFO_MEM[1][4] , \FIFO_MEM[1][3] , \FIFO_MEM[1][2] ,
         \FIFO_MEM[1][1] , \FIFO_MEM[1][0] , \FIFO_MEM[0][7] ,
         \FIFO_MEM[0][6] , \FIFO_MEM[0][5] , \FIFO_MEM[0][4] ,
         \FIFO_MEM[0][3] , \FIFO_MEM[0][2] , \FIFO_MEM[0][1] ,
         \FIFO_MEM[0][0] , n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114;
  assign N9 = r_addr[0];
  assign N10 = r_addr[1];
  assign N11 = r_addr[2];

  DFFRQX2M \FIFO_MEM_reg[5][7]  ( .D(n69), .CK(w_clk), .RN(n101), .Q(
        \FIFO_MEM[5][7] ) );
  DFFRQX2M \FIFO_MEM_reg[5][6]  ( .D(n68), .CK(w_clk), .RN(n101), .Q(
        \FIFO_MEM[5][6] ) );
  DFFRQX2M \FIFO_MEM_reg[5][5]  ( .D(n67), .CK(w_clk), .RN(n101), .Q(
        \FIFO_MEM[5][5] ) );
  DFFRQX2M \FIFO_MEM_reg[5][4]  ( .D(n66), .CK(w_clk), .RN(n101), .Q(
        \FIFO_MEM[5][4] ) );
  DFFRQX2M \FIFO_MEM_reg[5][3]  ( .D(n65), .CK(w_clk), .RN(n101), .Q(
        \FIFO_MEM[5][3] ) );
  DFFRQX2M \FIFO_MEM_reg[5][2]  ( .D(n64), .CK(w_clk), .RN(n101), .Q(
        \FIFO_MEM[5][2] ) );
  DFFRQX2M \FIFO_MEM_reg[5][1]  ( .D(n63), .CK(w_clk), .RN(n101), .Q(
        \FIFO_MEM[5][1] ) );
  DFFRQX2M \FIFO_MEM_reg[5][0]  ( .D(n62), .CK(w_clk), .RN(n101), .Q(
        \FIFO_MEM[5][0] ) );
  DFFRQX2M \FIFO_MEM_reg[1][7]  ( .D(n37), .CK(w_clk), .RN(n103), .Q(
        \FIFO_MEM[1][7] ) );
  DFFRQX2M \FIFO_MEM_reg[1][6]  ( .D(n36), .CK(w_clk), .RN(n103), .Q(
        \FIFO_MEM[1][6] ) );
  DFFRQX2M \FIFO_MEM_reg[1][5]  ( .D(n35), .CK(w_clk), .RN(n103), .Q(
        \FIFO_MEM[1][5] ) );
  DFFRQX2M \FIFO_MEM_reg[1][4]  ( .D(n34), .CK(w_clk), .RN(n103), .Q(
        \FIFO_MEM[1][4] ) );
  DFFRQX2M \FIFO_MEM_reg[1][3]  ( .D(n33), .CK(w_clk), .RN(n104), .Q(
        \FIFO_MEM[1][3] ) );
  DFFRQX2M \FIFO_MEM_reg[1][2]  ( .D(n32), .CK(w_clk), .RN(n104), .Q(
        \FIFO_MEM[1][2] ) );
  DFFRQX2M \FIFO_MEM_reg[1][1]  ( .D(n31), .CK(w_clk), .RN(n104), .Q(
        \FIFO_MEM[1][1] ) );
  DFFRQX2M \FIFO_MEM_reg[1][0]  ( .D(n30), .CK(w_clk), .RN(n104), .Q(
        \FIFO_MEM[1][0] ) );
  DFFRQX2M \FIFO_MEM_reg[7][7]  ( .D(n85), .CK(w_clk), .RN(n100), .Q(
        \FIFO_MEM[7][7] ) );
  DFFRQX2M \FIFO_MEM_reg[7][6]  ( .D(n84), .CK(w_clk), .RN(n100), .Q(
        \FIFO_MEM[7][6] ) );
  DFFRQX2M \FIFO_MEM_reg[7][5]  ( .D(n83), .CK(w_clk), .RN(n100), .Q(
        \FIFO_MEM[7][5] ) );
  DFFRQX2M \FIFO_MEM_reg[7][4]  ( .D(n82), .CK(w_clk), .RN(n100), .Q(
        \FIFO_MEM[7][4] ) );
  DFFRQX2M \FIFO_MEM_reg[7][3]  ( .D(n81), .CK(w_clk), .RN(n100), .Q(
        \FIFO_MEM[7][3] ) );
  DFFRQX2M \FIFO_MEM_reg[7][2]  ( .D(n80), .CK(w_clk), .RN(n100), .Q(
        \FIFO_MEM[7][2] ) );
  DFFRQX2M \FIFO_MEM_reg[7][1]  ( .D(n79), .CK(w_clk), .RN(n100), .Q(
        \FIFO_MEM[7][1] ) );
  DFFRQX2M \FIFO_MEM_reg[7][0]  ( .D(n78), .CK(w_clk), .RN(n100), .Q(
        \FIFO_MEM[7][0] ) );
  DFFRQX2M \FIFO_MEM_reg[3][7]  ( .D(n53), .CK(w_clk), .RN(n102), .Q(
        \FIFO_MEM[3][7] ) );
  DFFRQX2M \FIFO_MEM_reg[3][6]  ( .D(n52), .CK(w_clk), .RN(n102), .Q(
        \FIFO_MEM[3][6] ) );
  DFFRQX2M \FIFO_MEM_reg[3][5]  ( .D(n51), .CK(w_clk), .RN(n102), .Q(
        \FIFO_MEM[3][5] ) );
  DFFRQX2M \FIFO_MEM_reg[3][4]  ( .D(n50), .CK(w_clk), .RN(n102), .Q(
        \FIFO_MEM[3][4] ) );
  DFFRQX2M \FIFO_MEM_reg[3][3]  ( .D(n49), .CK(w_clk), .RN(n102), .Q(
        \FIFO_MEM[3][3] ) );
  DFFRQX2M \FIFO_MEM_reg[3][2]  ( .D(n48), .CK(w_clk), .RN(n102), .Q(
        \FIFO_MEM[3][2] ) );
  DFFRQX2M \FIFO_MEM_reg[3][1]  ( .D(n47), .CK(w_clk), .RN(n102), .Q(
        \FIFO_MEM[3][1] ) );
  DFFRQX2M \FIFO_MEM_reg[3][0]  ( .D(n46), .CK(w_clk), .RN(n103), .Q(
        \FIFO_MEM[3][0] ) );
  DFFRQX2M \FIFO_MEM_reg[6][7]  ( .D(n77), .CK(w_clk), .RN(n100), .Q(
        \FIFO_MEM[6][7] ) );
  DFFRQX2M \FIFO_MEM_reg[6][6]  ( .D(n76), .CK(w_clk), .RN(n100), .Q(
        \FIFO_MEM[6][6] ) );
  DFFRQX2M \FIFO_MEM_reg[6][5]  ( .D(n75), .CK(w_clk), .RN(n100), .Q(
        \FIFO_MEM[6][5] ) );
  DFFRQX2M \FIFO_MEM_reg[6][4]  ( .D(n74), .CK(w_clk), .RN(n100), .Q(
        \FIFO_MEM[6][4] ) );
  DFFRQX2M \FIFO_MEM_reg[6][3]  ( .D(n73), .CK(w_clk), .RN(n100), .Q(
        \FIFO_MEM[6][3] ) );
  DFFRQX2M \FIFO_MEM_reg[6][2]  ( .D(n72), .CK(w_clk), .RN(n101), .Q(
        \FIFO_MEM[6][2] ) );
  DFFRQX2M \FIFO_MEM_reg[6][1]  ( .D(n71), .CK(w_clk), .RN(n101), .Q(
        \FIFO_MEM[6][1] ) );
  DFFRQX2M \FIFO_MEM_reg[6][0]  ( .D(n70), .CK(w_clk), .RN(n101), .Q(
        \FIFO_MEM[6][0] ) );
  DFFRQX2M \FIFO_MEM_reg[2][7]  ( .D(n45), .CK(w_clk), .RN(n103), .Q(
        \FIFO_MEM[2][7] ) );
  DFFRQX2M \FIFO_MEM_reg[2][6]  ( .D(n44), .CK(w_clk), .RN(n103), .Q(
        \FIFO_MEM[2][6] ) );
  DFFRQX2M \FIFO_MEM_reg[2][5]  ( .D(n43), .CK(w_clk), .RN(n103), .Q(
        \FIFO_MEM[2][5] ) );
  DFFRQX2M \FIFO_MEM_reg[2][4]  ( .D(n42), .CK(w_clk), .RN(n103), .Q(
        \FIFO_MEM[2][4] ) );
  DFFRQX2M \FIFO_MEM_reg[2][3]  ( .D(n41), .CK(w_clk), .RN(n103), .Q(
        \FIFO_MEM[2][3] ) );
  DFFRQX2M \FIFO_MEM_reg[2][2]  ( .D(n40), .CK(w_clk), .RN(n103), .Q(
        \FIFO_MEM[2][2] ) );
  DFFRQX2M \FIFO_MEM_reg[2][1]  ( .D(n39), .CK(w_clk), .RN(n103), .Q(
        \FIFO_MEM[2][1] ) );
  DFFRQX2M \FIFO_MEM_reg[2][0]  ( .D(n38), .CK(w_clk), .RN(n103), .Q(
        \FIFO_MEM[2][0] ) );
  DFFRQX2M \FIFO_MEM_reg[4][7]  ( .D(n61), .CK(w_clk), .RN(n101), .Q(
        \FIFO_MEM[4][7] ) );
  DFFRQX2M \FIFO_MEM_reg[4][6]  ( .D(n60), .CK(w_clk), .RN(n101), .Q(
        \FIFO_MEM[4][6] ) );
  DFFRQX2M \FIFO_MEM_reg[4][5]  ( .D(n59), .CK(w_clk), .RN(n102), .Q(
        \FIFO_MEM[4][5] ) );
  DFFRQX2M \FIFO_MEM_reg[4][4]  ( .D(n58), .CK(w_clk), .RN(n102), .Q(
        \FIFO_MEM[4][4] ) );
  DFFRQX2M \FIFO_MEM_reg[4][3]  ( .D(n57), .CK(w_clk), .RN(n102), .Q(
        \FIFO_MEM[4][3] ) );
  DFFRQX2M \FIFO_MEM_reg[4][2]  ( .D(n56), .CK(w_clk), .RN(n102), .Q(
        \FIFO_MEM[4][2] ) );
  DFFRQX2M \FIFO_MEM_reg[4][1]  ( .D(n55), .CK(w_clk), .RN(n102), .Q(
        \FIFO_MEM[4][1] ) );
  DFFRQX2M \FIFO_MEM_reg[4][0]  ( .D(n54), .CK(w_clk), .RN(n102), .Q(
        \FIFO_MEM[4][0] ) );
  DFFRQX2M \FIFO_MEM_reg[0][7]  ( .D(n29), .CK(w_clk), .RN(n104), .Q(
        \FIFO_MEM[0][7] ) );
  DFFRQX2M \FIFO_MEM_reg[0][6]  ( .D(n28), .CK(w_clk), .RN(n104), .Q(
        \FIFO_MEM[0][6] ) );
  DFFRQX2M \FIFO_MEM_reg[0][5]  ( .D(n27), .CK(w_clk), .RN(n104), .Q(
        \FIFO_MEM[0][5] ) );
  DFFRQX2M \FIFO_MEM_reg[0][4]  ( .D(n26), .CK(w_clk), .RN(n104), .Q(
        \FIFO_MEM[0][4] ) );
  DFFRQX2M \FIFO_MEM_reg[0][3]  ( .D(n25), .CK(w_clk), .RN(n104), .Q(
        \FIFO_MEM[0][3] ) );
  DFFRQX2M \FIFO_MEM_reg[0][2]  ( .D(n24), .CK(w_clk), .RN(n104), .Q(
        \FIFO_MEM[0][2] ) );
  DFFRQX2M \FIFO_MEM_reg[0][1]  ( .D(n23), .CK(w_clk), .RN(n104), .Q(
        \FIFO_MEM[0][1] ) );
  DFFRQX2M \FIFO_MEM_reg[0][0]  ( .D(n22), .CK(w_clk), .RN(n104), .Q(
        \FIFO_MEM[0][0] ) );
  BUFX2M U2 ( .A(n20), .Y(n95) );
  BUFX2M U3 ( .A(n21), .Y(n94) );
  BUFX2M U4 ( .A(n14), .Y(n97) );
  BUFX2M U5 ( .A(n19), .Y(n96) );
  BUFX2M U6 ( .A(n98), .Y(n102) );
  BUFX2M U7 ( .A(n98), .Y(n101) );
  BUFX2M U8 ( .A(n98), .Y(n100) );
  BUFX2M U9 ( .A(n99), .Y(n103) );
  BUFX2M U10 ( .A(n99), .Y(n104) );
  NOR2BX2M U11 ( .AN(w_inc), .B(w_full), .Y(n16) );
  BUFX2M U12 ( .A(w_rstn), .Y(n98) );
  BUFX2M U13 ( .A(w_rstn), .Y(n99) );
  NAND3X2M U14 ( .A(n113), .B(n114), .C(n18), .Y(n17) );
  NAND3X2M U15 ( .A(n113), .B(n114), .C(n12), .Y(n11) );
  NAND3X2M U16 ( .A(w_addr[0]), .B(n12), .C(w_addr[1]), .Y(n15) );
  NAND3X2M U17 ( .A(n12), .B(n114), .C(w_addr[0]), .Y(n13) );
  NOR2BX2M U18 ( .AN(n16), .B(w_addr[2]), .Y(n12) );
  OAI2BB2X1M U19 ( .B0(n11), .B1(n105), .A0N(\FIFO_MEM[0][0] ), .A1N(n11), .Y(
        n22) );
  OAI2BB2X1M U20 ( .B0(n11), .B1(n106), .A0N(\FIFO_MEM[0][1] ), .A1N(n11), .Y(
        n23) );
  OAI2BB2X1M U21 ( .B0(n11), .B1(n107), .A0N(\FIFO_MEM[0][2] ), .A1N(n11), .Y(
        n24) );
  OAI2BB2X1M U22 ( .B0(n11), .B1(n108), .A0N(\FIFO_MEM[0][3] ), .A1N(n11), .Y(
        n25) );
  OAI2BB2X1M U23 ( .B0(n11), .B1(n109), .A0N(\FIFO_MEM[0][4] ), .A1N(n11), .Y(
        n26) );
  OAI2BB2X1M U24 ( .B0(n11), .B1(n110), .A0N(\FIFO_MEM[0][5] ), .A1N(n11), .Y(
        n27) );
  OAI2BB2X1M U25 ( .B0(n11), .B1(n111), .A0N(\FIFO_MEM[0][6] ), .A1N(n11), .Y(
        n28) );
  OAI2BB2X1M U26 ( .B0(n11), .B1(n112), .A0N(\FIFO_MEM[0][7] ), .A1N(n11), .Y(
        n29) );
  OAI2BB2X1M U27 ( .B0(n105), .B1(n15), .A0N(\FIFO_MEM[3][0] ), .A1N(n15), .Y(
        n46) );
  OAI2BB2X1M U28 ( .B0(n106), .B1(n15), .A0N(\FIFO_MEM[3][1] ), .A1N(n15), .Y(
        n47) );
  OAI2BB2X1M U29 ( .B0(n107), .B1(n15), .A0N(\FIFO_MEM[3][2] ), .A1N(n15), .Y(
        n48) );
  OAI2BB2X1M U30 ( .B0(n108), .B1(n15), .A0N(\FIFO_MEM[3][3] ), .A1N(n15), .Y(
        n49) );
  OAI2BB2X1M U31 ( .B0(n109), .B1(n15), .A0N(\FIFO_MEM[3][4] ), .A1N(n15), .Y(
        n50) );
  OAI2BB2X1M U32 ( .B0(n110), .B1(n15), .A0N(\FIFO_MEM[3][5] ), .A1N(n15), .Y(
        n51) );
  OAI2BB2X1M U33 ( .B0(n111), .B1(n15), .A0N(\FIFO_MEM[3][6] ), .A1N(n15), .Y(
        n52) );
  OAI2BB2X1M U34 ( .B0(n112), .B1(n15), .A0N(\FIFO_MEM[3][7] ), .A1N(n15), .Y(
        n53) );
  OAI2BB2X1M U35 ( .B0(n105), .B1(n13), .A0N(\FIFO_MEM[1][0] ), .A1N(n13), .Y(
        n30) );
  OAI2BB2X1M U36 ( .B0(n106), .B1(n13), .A0N(\FIFO_MEM[1][1] ), .A1N(n13), .Y(
        n31) );
  OAI2BB2X1M U37 ( .B0(n107), .B1(n13), .A0N(\FIFO_MEM[1][2] ), .A1N(n13), .Y(
        n32) );
  OAI2BB2X1M U38 ( .B0(n108), .B1(n13), .A0N(\FIFO_MEM[1][3] ), .A1N(n13), .Y(
        n33) );
  OAI2BB2X1M U39 ( .B0(n109), .B1(n13), .A0N(\FIFO_MEM[1][4] ), .A1N(n13), .Y(
        n34) );
  OAI2BB2X1M U40 ( .B0(n110), .B1(n13), .A0N(\FIFO_MEM[1][5] ), .A1N(n13), .Y(
        n35) );
  OAI2BB2X1M U41 ( .B0(n111), .B1(n13), .A0N(\FIFO_MEM[1][6] ), .A1N(n13), .Y(
        n36) );
  OAI2BB2X1M U42 ( .B0(n112), .B1(n13), .A0N(\FIFO_MEM[1][7] ), .A1N(n13), .Y(
        n37) );
  OAI2BB2X1M U43 ( .B0(n105), .B1(n17), .A0N(\FIFO_MEM[4][0] ), .A1N(n17), .Y(
        n54) );
  OAI2BB2X1M U44 ( .B0(n106), .B1(n17), .A0N(\FIFO_MEM[4][1] ), .A1N(n17), .Y(
        n55) );
  OAI2BB2X1M U45 ( .B0(n107), .B1(n17), .A0N(\FIFO_MEM[4][2] ), .A1N(n17), .Y(
        n56) );
  OAI2BB2X1M U46 ( .B0(n108), .B1(n17), .A0N(\FIFO_MEM[4][3] ), .A1N(n17), .Y(
        n57) );
  OAI2BB2X1M U47 ( .B0(n109), .B1(n17), .A0N(\FIFO_MEM[4][4] ), .A1N(n17), .Y(
        n58) );
  OAI2BB2X1M U48 ( .B0(n110), .B1(n17), .A0N(\FIFO_MEM[4][5] ), .A1N(n17), .Y(
        n59) );
  OAI2BB2X1M U49 ( .B0(n111), .B1(n17), .A0N(\FIFO_MEM[4][6] ), .A1N(n17), .Y(
        n60) );
  OAI2BB2X1M U50 ( .B0(n112), .B1(n17), .A0N(\FIFO_MEM[4][7] ), .A1N(n17), .Y(
        n61) );
  INVX2M U51 ( .A(w_data[0]), .Y(n105) );
  INVX2M U52 ( .A(w_data[1]), .Y(n106) );
  INVX2M U53 ( .A(w_data[2]), .Y(n107) );
  INVX2M U54 ( .A(w_data[3]), .Y(n108) );
  INVX2M U55 ( .A(w_data[4]), .Y(n109) );
  INVX2M U56 ( .A(w_data[5]), .Y(n110) );
  INVX2M U57 ( .A(w_data[6]), .Y(n111) );
  INVX2M U58 ( .A(w_data[7]), .Y(n112) );
  OAI2BB2X1M U59 ( .B0(n105), .B1(n97), .A0N(\FIFO_MEM[2][0] ), .A1N(n97), .Y(
        n38) );
  OAI2BB2X1M U60 ( .B0(n106), .B1(n97), .A0N(\FIFO_MEM[2][1] ), .A1N(n97), .Y(
        n39) );
  OAI2BB2X1M U61 ( .B0(n107), .B1(n97), .A0N(\FIFO_MEM[2][2] ), .A1N(n97), .Y(
        n40) );
  OAI2BB2X1M U62 ( .B0(n108), .B1(n97), .A0N(\FIFO_MEM[2][3] ), .A1N(n97), .Y(
        n41) );
  OAI2BB2X1M U63 ( .B0(n109), .B1(n97), .A0N(\FIFO_MEM[2][4] ), .A1N(n97), .Y(
        n42) );
  OAI2BB2X1M U64 ( .B0(n110), .B1(n97), .A0N(\FIFO_MEM[2][5] ), .A1N(n97), .Y(
        n43) );
  OAI2BB2X1M U65 ( .B0(n111), .B1(n97), .A0N(\FIFO_MEM[2][6] ), .A1N(n97), .Y(
        n44) );
  OAI2BB2X1M U66 ( .B0(n112), .B1(n97), .A0N(\FIFO_MEM[2][7] ), .A1N(n97), .Y(
        n45) );
  OAI2BB2X1M U67 ( .B0(n105), .B1(n96), .A0N(\FIFO_MEM[5][0] ), .A1N(n96), .Y(
        n62) );
  OAI2BB2X1M U68 ( .B0(n106), .B1(n96), .A0N(\FIFO_MEM[5][1] ), .A1N(n96), .Y(
        n63) );
  OAI2BB2X1M U69 ( .B0(n107), .B1(n96), .A0N(\FIFO_MEM[5][2] ), .A1N(n96), .Y(
        n64) );
  OAI2BB2X1M U70 ( .B0(n108), .B1(n96), .A0N(\FIFO_MEM[5][3] ), .A1N(n96), .Y(
        n65) );
  OAI2BB2X1M U71 ( .B0(n109), .B1(n96), .A0N(\FIFO_MEM[5][4] ), .A1N(n96), .Y(
        n66) );
  OAI2BB2X1M U72 ( .B0(n110), .B1(n96), .A0N(\FIFO_MEM[5][5] ), .A1N(n96), .Y(
        n67) );
  OAI2BB2X1M U73 ( .B0(n111), .B1(n96), .A0N(\FIFO_MEM[5][6] ), .A1N(n96), .Y(
        n68) );
  OAI2BB2X1M U74 ( .B0(n112), .B1(n96), .A0N(\FIFO_MEM[5][7] ), .A1N(n96), .Y(
        n69) );
  OAI2BB2X1M U75 ( .B0(n105), .B1(n95), .A0N(\FIFO_MEM[6][0] ), .A1N(n95), .Y(
        n70) );
  OAI2BB2X1M U76 ( .B0(n106), .B1(n95), .A0N(\FIFO_MEM[6][1] ), .A1N(n95), .Y(
        n71) );
  OAI2BB2X1M U77 ( .B0(n107), .B1(n95), .A0N(\FIFO_MEM[6][2] ), .A1N(n95), .Y(
        n72) );
  OAI2BB2X1M U78 ( .B0(n108), .B1(n95), .A0N(\FIFO_MEM[6][3] ), .A1N(n95), .Y(
        n73) );
  OAI2BB2X1M U79 ( .B0(n109), .B1(n95), .A0N(\FIFO_MEM[6][4] ), .A1N(n95), .Y(
        n74) );
  OAI2BB2X1M U80 ( .B0(n110), .B1(n95), .A0N(\FIFO_MEM[6][5] ), .A1N(n95), .Y(
        n75) );
  OAI2BB2X1M U81 ( .B0(n111), .B1(n95), .A0N(\FIFO_MEM[6][6] ), .A1N(n95), .Y(
        n76) );
  OAI2BB2X1M U82 ( .B0(n112), .B1(n95), .A0N(\FIFO_MEM[6][7] ), .A1N(n95), .Y(
        n77) );
  OAI2BB2X1M U83 ( .B0(n105), .B1(n94), .A0N(\FIFO_MEM[7][0] ), .A1N(n94), .Y(
        n78) );
  OAI2BB2X1M U84 ( .B0(n106), .B1(n94), .A0N(\FIFO_MEM[7][1] ), .A1N(n94), .Y(
        n79) );
  OAI2BB2X1M U85 ( .B0(n107), .B1(n94), .A0N(\FIFO_MEM[7][2] ), .A1N(n94), .Y(
        n80) );
  OAI2BB2X1M U86 ( .B0(n108), .B1(n94), .A0N(\FIFO_MEM[7][3] ), .A1N(n94), .Y(
        n81) );
  OAI2BB2X1M U87 ( .B0(n109), .B1(n94), .A0N(\FIFO_MEM[7][4] ), .A1N(n94), .Y(
        n82) );
  OAI2BB2X1M U88 ( .B0(n110), .B1(n94), .A0N(\FIFO_MEM[7][5] ), .A1N(n94), .Y(
        n83) );
  OAI2BB2X1M U89 ( .B0(n111), .B1(n94), .A0N(\FIFO_MEM[7][6] ), .A1N(n94), .Y(
        n84) );
  OAI2BB2X1M U90 ( .B0(n112), .B1(n94), .A0N(\FIFO_MEM[7][7] ), .A1N(n94), .Y(
        n85) );
  AND2X2M U91 ( .A(w_addr[2]), .B(n16), .Y(n18) );
  NAND3X2M U92 ( .A(n12), .B(n113), .C(w_addr[1]), .Y(n14) );
  NAND3X2M U93 ( .A(w_addr[0]), .B(n114), .C(n18), .Y(n19) );
  NAND3X2M U94 ( .A(w_addr[1]), .B(n113), .C(n18), .Y(n20) );
  NAND3X2M U95 ( .A(w_addr[1]), .B(w_addr[0]), .C(n18), .Y(n21) );
  INVX2M U96 ( .A(w_addr[1]), .Y(n114) );
  INVX2M U97 ( .A(w_addr[0]), .Y(n113) );
  MX2X2M U98 ( .A(n2), .B(n1), .S0(N11), .Y(r_data[0]) );
  MX4X1M U99 ( .A(\FIFO_MEM[4][0] ), .B(\FIFO_MEM[5][0] ), .C(\FIFO_MEM[6][0] ), .D(\FIFO_MEM[7][0] ), .S0(n92), .S1(N10), .Y(n1) );
  MX4X1M U100 ( .A(\FIFO_MEM[0][0] ), .B(\FIFO_MEM[1][0] ), .C(
        \FIFO_MEM[2][0] ), .D(\FIFO_MEM[3][0] ), .S0(n93), .S1(N10), .Y(n2) );
  MX2X2M U101 ( .A(n4), .B(n3), .S0(N11), .Y(r_data[1]) );
  MX4X1M U102 ( .A(\FIFO_MEM[4][1] ), .B(\FIFO_MEM[5][1] ), .C(
        \FIFO_MEM[6][1] ), .D(\FIFO_MEM[7][1] ), .S0(n92), .S1(N10), .Y(n3) );
  MX4X1M U103 ( .A(\FIFO_MEM[0][1] ), .B(\FIFO_MEM[1][1] ), .C(
        \FIFO_MEM[2][1] ), .D(\FIFO_MEM[3][1] ), .S0(n93), .S1(N10), .Y(n4) );
  MX2X2M U104 ( .A(n6), .B(n5), .S0(N11), .Y(r_data[2]) );
  MX4X1M U105 ( .A(\FIFO_MEM[4][2] ), .B(\FIFO_MEM[5][2] ), .C(
        \FIFO_MEM[6][2] ), .D(\FIFO_MEM[7][2] ), .S0(n92), .S1(N10), .Y(n5) );
  MX4X1M U106 ( .A(\FIFO_MEM[0][2] ), .B(\FIFO_MEM[1][2] ), .C(
        \FIFO_MEM[2][2] ), .D(\FIFO_MEM[3][2] ), .S0(n93), .S1(N10), .Y(n6) );
  MX2X2M U107 ( .A(n8), .B(n7), .S0(N11), .Y(r_data[3]) );
  MX4X1M U108 ( .A(\FIFO_MEM[4][3] ), .B(\FIFO_MEM[5][3] ), .C(
        \FIFO_MEM[6][3] ), .D(\FIFO_MEM[7][3] ), .S0(n92), .S1(N10), .Y(n7) );
  MX4X1M U109 ( .A(\FIFO_MEM[0][3] ), .B(\FIFO_MEM[1][3] ), .C(
        \FIFO_MEM[2][3] ), .D(\FIFO_MEM[3][3] ), .S0(n93), .S1(N10), .Y(n8) );
  MX2X2M U110 ( .A(n10), .B(n9), .S0(N11), .Y(r_data[4]) );
  MX4X1M U111 ( .A(\FIFO_MEM[4][4] ), .B(\FIFO_MEM[5][4] ), .C(
        \FIFO_MEM[6][4] ), .D(\FIFO_MEM[7][4] ), .S0(n92), .S1(N10), .Y(n9) );
  MX4X1M U112 ( .A(\FIFO_MEM[0][4] ), .B(\FIFO_MEM[1][4] ), .C(
        \FIFO_MEM[2][4] ), .D(\FIFO_MEM[3][4] ), .S0(n93), .S1(N10), .Y(n10)
         );
  MX2X2M U113 ( .A(n87), .B(n86), .S0(N11), .Y(r_data[5]) );
  MX4X1M U114 ( .A(\FIFO_MEM[4][5] ), .B(\FIFO_MEM[5][5] ), .C(
        \FIFO_MEM[6][5] ), .D(\FIFO_MEM[7][5] ), .S0(n92), .S1(N10), .Y(n86)
         );
  MX4X1M U115 ( .A(\FIFO_MEM[0][5] ), .B(\FIFO_MEM[1][5] ), .C(
        \FIFO_MEM[2][5] ), .D(\FIFO_MEM[3][5] ), .S0(n93), .S1(N10), .Y(n87)
         );
  MX2X2M U116 ( .A(n89), .B(n88), .S0(N11), .Y(r_data[6]) );
  MX4X1M U117 ( .A(\FIFO_MEM[4][6] ), .B(\FIFO_MEM[5][6] ), .C(
        \FIFO_MEM[6][6] ), .D(\FIFO_MEM[7][6] ), .S0(n92), .S1(N10), .Y(n88)
         );
  MX4X1M U118 ( .A(\FIFO_MEM[0][6] ), .B(\FIFO_MEM[1][6] ), .C(
        \FIFO_MEM[2][6] ), .D(\FIFO_MEM[3][6] ), .S0(n93), .S1(N10), .Y(n89)
         );
  MX2X2M U119 ( .A(n91), .B(n90), .S0(N11), .Y(r_data[7]) );
  MX4X1M U120 ( .A(\FIFO_MEM[4][7] ), .B(\FIFO_MEM[5][7] ), .C(
        \FIFO_MEM[6][7] ), .D(\FIFO_MEM[7][7] ), .S0(n92), .S1(N10), .Y(n90)
         );
  MX4X1M U121 ( .A(\FIFO_MEM[0][7] ), .B(\FIFO_MEM[1][7] ), .C(
        \FIFO_MEM[2][7] ), .D(\FIFO_MEM[3][7] ), .S0(n93), .S1(N10), .Y(n91)
         );
  BUFX2M U122 ( .A(N9), .Y(n93) );
  BUFX2M U123 ( .A(N9), .Y(n92) );
endmodule


module fifo_rd_P_SIZE4 ( r_clk, r_rstn, r_inc, sync_wr_ptr, rd_addr, empty, 
        gray_rd_ptr );
  input [3:0] sync_wr_ptr;
  output [2:0] rd_addr;
  output [3:0] gray_rd_ptr;
  input r_clk, r_rstn, r_inc;
  output empty;
  wire   N89, N90, N91, N92, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n1, n2, n3, n4;

  DFFRQX2M \rd_ptr_reg[3]  ( .D(n17), .CK(r_clk), .RN(r_rstn), .Q(N92) );
  DFFRQX2M \rd_ptr_reg[2]  ( .D(n18), .CK(r_clk), .RN(r_rstn), .Q(rd_addr[2])
         );
  DFFRQX2M \gray_rd_ptr_reg[0]  ( .D(N89), .CK(r_clk), .RN(r_rstn), .Q(
        gray_rd_ptr[0]) );
  DFFRQX2M \gray_rd_ptr_reg[3]  ( .D(N92), .CK(r_clk), .RN(r_rstn), .Q(
        gray_rd_ptr[3]) );
  DFFRQX2M \gray_rd_ptr_reg[2]  ( .D(N91), .CK(r_clk), .RN(r_rstn), .Q(
        gray_rd_ptr[2]) );
  DFFRQX2M \gray_rd_ptr_reg[1]  ( .D(N90), .CK(r_clk), .RN(r_rstn), .Q(
        gray_rd_ptr[1]) );
  DFFRQX2M \rd_ptr_reg[0]  ( .D(n20), .CK(r_clk), .RN(r_rstn), .Q(rd_addr[0])
         );
  DFFRQX2M \rd_ptr_reg[1]  ( .D(n19), .CK(r_clk), .RN(r_rstn), .Q(rd_addr[1])
         );
  NOR2X2M U3 ( .A(n2), .B(n11), .Y(n10) );
  INVX2M U4 ( .A(n12), .Y(empty) );
  XNOR2X2M U5 ( .A(sync_wr_ptr[1]), .B(gray_rd_ptr[1]), .Y(n13) );
  NAND4X2M U6 ( .A(n13), .B(n14), .C(n15), .D(n16), .Y(n12) );
  XNOR2X2M U7 ( .A(sync_wr_ptr[3]), .B(gray_rd_ptr[3]), .Y(n15) );
  XNOR2X2M U8 ( .A(sync_wr_ptr[2]), .B(gray_rd_ptr[2]), .Y(n16) );
  XNOR2X2M U9 ( .A(sync_wr_ptr[0]), .B(gray_rd_ptr[0]), .Y(n14) );
  NAND2X2M U10 ( .A(rd_addr[1]), .B(n10), .Y(n9) );
  NAND2X2M U11 ( .A(r_inc), .B(n12), .Y(n11) );
  OAI211X2M U12 ( .A0(n1), .A1(n4), .B0(n7), .C0(n8), .Y(n17) );
  NAND3X2M U13 ( .A(n1), .B(n4), .C(rd_addr[2]), .Y(n7) );
  INVX2M U14 ( .A(N92), .Y(n4) );
  INVX2M U15 ( .A(n9), .Y(n1) );
  XNOR2X2M U16 ( .A(n3), .B(rd_addr[1]), .Y(N90) );
  XNOR2X2M U17 ( .A(rd_addr[2]), .B(n9), .Y(n18) );
  XNOR2X2M U18 ( .A(rd_addr[1]), .B(n2), .Y(N89) );
  XNOR2X2M U19 ( .A(rd_addr[0]), .B(n11), .Y(n20) );
  OAI21X2M U20 ( .A0(N92), .A1(n3), .B0(n8), .Y(N91) );
  INVX2M U21 ( .A(rd_addr[2]), .Y(n3) );
  NAND2X2M U22 ( .A(N92), .B(n3), .Y(n8) );
  INVX2M U23 ( .A(rd_addr[0]), .Y(n2) );
  CLKXOR2X2M U24 ( .A(rd_addr[1]), .B(n10), .Y(n19) );
endmodule


module BIT_SYNC_NUM_STAGES2_BUS_WIDTH4_0 ( CLK, RST, ASYNC, SYNC );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST;
  wire   \sync_reg[3][0] , \sync_reg[2][0] , \sync_reg[1][0] ,
         \sync_reg[0][0] ;

  DFFRQX2M \sync_reg_reg[3][1]  ( .D(\sync_reg[3][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[3]) );
  DFFRQX2M \sync_reg_reg[2][1]  ( .D(\sync_reg[2][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[2]) );
  DFFRQX2M \sync_reg_reg[1][1]  ( .D(\sync_reg[1][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[1]) );
  DFFRQX2M \sync_reg_reg[0][1]  ( .D(\sync_reg[0][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[0]) );
  DFFRQX2M \sync_reg_reg[3][0]  ( .D(ASYNC[3]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[3][0] ) );
  DFFRQX2M \sync_reg_reg[2][0]  ( .D(ASYNC[2]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[2][0] ) );
  DFFRQX2M \sync_reg_reg[1][0]  ( .D(ASYNC[1]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[1][0] ) );
  DFFRQX2M \sync_reg_reg[0][0]  ( .D(ASYNC[0]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[0][0] ) );
endmodule


module fifo_wr_P_SIZE4 ( w_clk, w_rstn, w_inc, sync_rd_ptr, w_addr, gray_w_ptr, 
        full );
  input [3:0] sync_rd_ptr;
  output [2:0] w_addr;
  output [3:0] gray_w_ptr;
  input w_clk, w_rstn, w_inc;
  output full;
  wire   N89, N90, N91, N92, n3, n4, n5, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n1;

  DFFRQX2M \w_ptr_reg[3]  ( .D(n13), .CK(w_clk), .RN(w_rstn), .Q(N92) );
  DFFRQX2M \w_ptr_reg[2]  ( .D(n14), .CK(w_clk), .RN(w_rstn), .Q(w_addr[2]) );
  DFFRQX2M \w_ptr_reg[0]  ( .D(n16), .CK(w_clk), .RN(w_rstn), .Q(w_addr[0]) );
  DFFRQX2M \gray_w_ptr_reg[0]  ( .D(N89), .CK(w_clk), .RN(w_rstn), .Q(
        gray_w_ptr[0]) );
  DFFRQX2M \gray_w_ptr_reg[1]  ( .D(N90), .CK(w_clk), .RN(w_rstn), .Q(
        gray_w_ptr[1]) );
  DFFRQX2M \gray_w_ptr_reg[3]  ( .D(N92), .CK(w_clk), .RN(w_rstn), .Q(
        gray_w_ptr[3]) );
  DFFRQX2M \gray_w_ptr_reg[2]  ( .D(N91), .CK(w_clk), .RN(w_rstn), .Q(
        gray_w_ptr[2]) );
  DFFRQX2M \w_ptr_reg[1]  ( .D(n15), .CK(w_clk), .RN(w_rstn), .Q(w_addr[1]) );
  NOR2X2M U3 ( .A(n1), .B(n7), .Y(n5) );
  NAND2X2M U4 ( .A(w_inc), .B(n8), .Y(n7) );
  INVX2M U5 ( .A(n8), .Y(full) );
  XNOR2X2M U6 ( .A(w_addr[2]), .B(n4), .Y(n14) );
  XNOR2X2M U7 ( .A(N92), .B(n3), .Y(n13) );
  NAND2BX2M U8 ( .AN(n4), .B(w_addr[2]), .Y(n3) );
  NAND4X2M U9 ( .A(n9), .B(n10), .C(n11), .D(n12), .Y(n8) );
  XNOR2X2M U10 ( .A(sync_rd_ptr[0]), .B(gray_w_ptr[0]), .Y(n9) );
  XNOR2X2M U11 ( .A(sync_rd_ptr[1]), .B(gray_w_ptr[1]), .Y(n10) );
  CLKXOR2X2M U12 ( .A(sync_rd_ptr[2]), .B(gray_w_ptr[2]), .Y(n11) );
  NAND2X2M U13 ( .A(w_addr[1]), .B(n5), .Y(n4) );
  CLKXOR2X2M U14 ( .A(sync_rd_ptr[3]), .B(gray_w_ptr[3]), .Y(n12) );
  CLKXOR2X2M U15 ( .A(w_addr[1]), .B(n5), .Y(n15) );
  XNOR2X2M U16 ( .A(w_addr[0]), .B(n7), .Y(n16) );
  XNOR2X2M U17 ( .A(w_addr[1]), .B(n1), .Y(N89) );
  INVX2M U18 ( .A(w_addr[0]), .Y(n1) );
  CLKXOR2X2M U19 ( .A(w_addr[2]), .B(w_addr[1]), .Y(N90) );
  CLKXOR2X2M U20 ( .A(w_addr[2]), .B(N92), .Y(N91) );
endmodule


module BIT_SYNC_NUM_STAGES2_BUS_WIDTH4_1 ( CLK, RST, ASYNC, SYNC );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST;
  wire   \sync_reg[3][0] , \sync_reg[2][0] , \sync_reg[1][0] ,
         \sync_reg[0][0] ;

  DFFRQX2M \sync_reg_reg[1][1]  ( .D(\sync_reg[1][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[1]) );
  DFFRQX2M \sync_reg_reg[0][1]  ( .D(\sync_reg[0][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[0]) );
  DFFRQX2M \sync_reg_reg[3][1]  ( .D(\sync_reg[3][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[3]) );
  DFFRQX2M \sync_reg_reg[2][1]  ( .D(\sync_reg[2][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[2]) );
  DFFRQX2M \sync_reg_reg[3][0]  ( .D(ASYNC[3]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[3][0] ) );
  DFFRQX2M \sync_reg_reg[2][0]  ( .D(ASYNC[2]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[2][0] ) );
  DFFRQX2M \sync_reg_reg[1][0]  ( .D(ASYNC[1]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[1][0] ) );
  DFFRQX2M \sync_reg_reg[0][0]  ( .D(ASYNC[0]), .CK(CLK), .RN(RST), .Q(
        \sync_reg[0][0] ) );
endmodule


module Async_fifo_D_SIZE8_F_DEPTH8_P_SIZE4 ( i_w_clk, i_w_rstn, i_w_inc, 
        i_r_clk, i_r_rstn, i_r_inc, i_w_data, o_r_data, o_full, o_empty );
  input [7:0] i_w_data;
  output [7:0] o_r_data;
  input i_w_clk, i_w_rstn, i_w_inc, i_r_clk, i_r_rstn, i_r_inc;
  output o_full, o_empty;
  wire   n1, n2;
  wire   [2:0] w_addr;
  wire   [2:0] r_addr;
  wire   [3:0] w2r_ptr;
  wire   [3:0] gray_rd_ptr;
  wire   [3:0] gray_w_ptr;
  wire   [3:0] r2w_ptr;

  fifo_mem_D_SIZE8_F_DEPTH8_P_SIZE4 u_fifo_mem ( .w_clk(i_w_clk), .w_rstn(n1), 
        .w_full(o_full), .w_inc(i_w_inc), .w_addr(w_addr), .r_addr(r_addr), 
        .w_data(i_w_data), .r_data(o_r_data) );
  fifo_rd_P_SIZE4 u_fifo_rd ( .r_clk(i_r_clk), .r_rstn(i_r_rstn), .r_inc(
        i_r_inc), .sync_wr_ptr(w2r_ptr), .rd_addr(r_addr), .empty(o_empty), 
        .gray_rd_ptr(gray_rd_ptr) );
  BIT_SYNC_NUM_STAGES2_BUS_WIDTH4_0 u_w2r_sync ( .CLK(i_r_clk), .RST(i_r_rstn), 
        .ASYNC(gray_w_ptr), .SYNC(w2r_ptr) );
  fifo_wr_P_SIZE4 u_fifo_wr ( .w_clk(i_w_clk), .w_rstn(n1), .w_inc(i_w_inc), 
        .sync_rd_ptr(r2w_ptr), .w_addr(w_addr), .gray_w_ptr(gray_w_ptr), 
        .full(o_full) );
  BIT_SYNC_NUM_STAGES2_BUS_WIDTH4_1 u_r2w_sync ( .CLK(i_w_clk), .RST(n1), 
        .ASYNC(gray_rd_ptr), .SYNC(r2w_ptr) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(i_w_rstn), .Y(n2) );
endmodule


module PULSE_GEN ( clk, rst, lvl_sig, pulse_sig );
  input clk, rst, lvl_sig;
  output pulse_sig;
  wire   pls_flop, rcv_flop;

  DFFRQX2M rcv_flop_reg ( .D(lvl_sig), .CK(clk), .RN(rst), .Q(rcv_flop) );
  DFFRQX2M pls_flop_reg ( .D(rcv_flop), .CK(clk), .RN(rst), .Q(pls_flop) );
  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
endmodule


module ClkDiv_0_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_0 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;

  ClkDiv_0_DW01_inc_0 add_49 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFRQX2M div_clk_reg ( .D(n18), .CK(i_ref_clk), .RN(i_rst), .Q(div_clk) );
  DFFSQX2M odd_edge_tog_reg ( .D(n17), .CK(i_ref_clk), .SN(i_rst), .Q(
        odd_edge_tog) );
  DFFRQX2M \count_reg[5]  ( .D(n20), .CK(i_ref_clk), .RN(i_rst), .Q(count[5])
         );
  DFFRQX2M \count_reg[4]  ( .D(n21), .CK(i_ref_clk), .RN(i_rst), .Q(count[4])
         );
  DFFRQX2M \count_reg[3]  ( .D(n22), .CK(i_ref_clk), .RN(i_rst), .Q(count[3])
         );
  DFFRQX2M \count_reg[6]  ( .D(n19), .CK(i_ref_clk), .RN(i_rst), .Q(count[6])
         );
  DFFRQX2M \count_reg[0]  ( .D(n25), .CK(i_ref_clk), .RN(i_rst), .Q(count[0])
         );
  DFFRQX2M \count_reg[2]  ( .D(n23), .CK(i_ref_clk), .RN(i_rst), .Q(count[2])
         );
  DFFRQX2M \count_reg[1]  ( .D(n24), .CK(i_ref_clk), .RN(i_rst), .Q(count[1])
         );
  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  OR2X2M U4 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n1) );
  NAND2BX2M U5 ( .AN(n41), .B(i_clk_en), .Y(n7) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n6) );
  CLKINVX1M U7 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(
        edge_flip_half[1]) );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(
        edge_flip_half[2]) );
  NOR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(i_div_ratio[4]), .B0(n3), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(edge_flip_half[4]) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(edge_flip_half[5]) );
  NOR2X1M U16 ( .A(i_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(i_div_ratio[7]), .B(n5), .Y(edge_flip_half[6]) );
  AO22X1M U18 ( .A0(n7), .A1(count[0]), .B0(N16), .B1(n8), .Y(n25) );
  AO22X1M U19 ( .A0(n7), .A1(count[1]), .B0(N17), .B1(n8), .Y(n24) );
  AO22X1M U20 ( .A0(n7), .A1(count[2]), .B0(N18), .B1(n8), .Y(n23) );
  AO22X1M U21 ( .A0(n7), .A1(count[3]), .B0(N19), .B1(n8), .Y(n22) );
  AO22X1M U22 ( .A0(n7), .A1(count[4]), .B0(N20), .B1(n8), .Y(n21) );
  AO22X1M U23 ( .A0(n7), .A1(count[5]), .B0(N21), .B1(n8), .Y(n20) );
  AO22X1M U24 ( .A0(n7), .A1(count[6]), .B0(N22), .B1(n8), .Y(n19) );
  AND3X1M U25 ( .A(n9), .B(n10), .C(N2), .Y(n8) );
  CLKXOR2X2M U26 ( .A(div_clk), .B(n11), .Y(n18) );
  AOI21X1M U27 ( .A0(n10), .A1(n9), .B0(n7), .Y(n11) );
  OR2X1M U28 ( .A(n12), .B(i_div_ratio[0]), .Y(n9) );
  XNOR2X1M U29 ( .A(odd_edge_tog), .B(n13), .Y(n17) );
  OR2X1M U30 ( .A(n10), .B(n7), .Y(n13) );
  CLKNAND2X2M U31 ( .A(n14), .B(i_div_ratio[0]), .Y(n10) );
  MXI2X1M U32 ( .A(n15), .B(n12), .S0(odd_edge_tog), .Y(n14) );
  NAND4X1M U33 ( .A(n16), .B(n26), .C(n27), .D(n28), .Y(n12) );
  NOR4X1M U34 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n28) );
  CLKXOR2X2M U35 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n32) );
  CLKXOR2X2M U36 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n31) );
  CLKXOR2X2M U37 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n30) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n29) );
  XNOR2X1M U39 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n27) );
  XNOR2X1M U40 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n26) );
  XNOR2X1M U41 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n16) );
  NAND4X1M U42 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n15) );
  NOR4X1M U43 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n36) );
  CLKXOR2X2M U44 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n40) );
  CLKXOR2X2M U45 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n39) );
  CLKXOR2X2M U46 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n38) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n37) );
  XNOR2X1M U48 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n35) );
  XNOR2X1M U49 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n34) );
  XNOR2X1M U50 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n33) );
  CLKINVX1M U51 ( .A(n7), .Y(N2) );
  NOR4BX1M U52 ( .AN(n42), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n41) );
  NOR4X1M U53 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n42) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[7]) );
  NAND4BX1M U11 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n14), .Y(n6) );
  NAND4BX1M U12 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n14), .Y(n7) );
  NOR3X2M U13 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NOR3X2M U14 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  NOR4X1M U15 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U16 ( .A(n17), .B(n16), .C(IN[2]), .Y(n5) );
  OAI211X2M U17 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(OUT[0]) );
  NAND2X2M U18 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U19 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  INVX2M U20 ( .A(IN[0]), .Y(n17) );
  INVX2M U21 ( .A(IN[1]), .Y(n16) );
  INVX2M U22 ( .A(IN[2]), .Y(n15) );
  INVX2M U23 ( .A(IN[5]), .Y(n14) );
endmodule


module ClkDiv_1_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_1 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;

  ClkDiv_1_DW01_inc_0 add_49 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFRQX2M div_clk_reg ( .D(n50), .CK(i_ref_clk), .RN(i_rst), .Q(div_clk) );
  DFFSQX2M odd_edge_tog_reg ( .D(n51), .CK(i_ref_clk), .SN(i_rst), .Q(
        odd_edge_tog) );
  DFFRQX2M \count_reg[5]  ( .D(n48), .CK(i_ref_clk), .RN(i_rst), .Q(count[5])
         );
  DFFRQX2M \count_reg[4]  ( .D(n47), .CK(i_ref_clk), .RN(i_rst), .Q(count[4])
         );
  DFFRQX2M \count_reg[3]  ( .D(n46), .CK(i_ref_clk), .RN(i_rst), .Q(count[3])
         );
  DFFRQX2M \count_reg[6]  ( .D(n49), .CK(i_ref_clk), .RN(i_rst), .Q(count[6])
         );
  DFFRQX2M \count_reg[0]  ( .D(n43), .CK(i_ref_clk), .RN(i_rst), .Q(count[0])
         );
  DFFRQX2M \count_reg[2]  ( .D(n45), .CK(i_ref_clk), .RN(i_rst), .Q(count[2])
         );
  DFFRQX2M \count_reg[1]  ( .D(n44), .CK(i_ref_clk), .RN(i_rst), .Q(count[1])
         );
  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  OR2X2M U4 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n1) );
  NAND2BX2M U5 ( .AN(n41), .B(i_clk_en), .Y(n7) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n6) );
  CLKINVX1M U7 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(
        edge_flip_half[1]) );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(
        edge_flip_half[2]) );
  NOR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(i_div_ratio[4]), .B0(n3), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(edge_flip_half[4]) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(edge_flip_half[5]) );
  NOR2X1M U16 ( .A(i_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(i_div_ratio[7]), .B(n5), .Y(edge_flip_half[6]) );
  AO22X1M U18 ( .A0(n7), .A1(count[0]), .B0(N16), .B1(n8), .Y(n43) );
  AO22X1M U19 ( .A0(n7), .A1(count[1]), .B0(N17), .B1(n8), .Y(n44) );
  AO22X1M U20 ( .A0(n7), .A1(count[2]), .B0(N18), .B1(n8), .Y(n45) );
  AO22X1M U21 ( .A0(n7), .A1(count[3]), .B0(N19), .B1(n8), .Y(n46) );
  AO22X1M U22 ( .A0(n7), .A1(count[4]), .B0(N20), .B1(n8), .Y(n47) );
  AO22X1M U23 ( .A0(n7), .A1(count[5]), .B0(N21), .B1(n8), .Y(n48) );
  AO22X1M U24 ( .A0(n7), .A1(count[6]), .B0(N22), .B1(n8), .Y(n49) );
  AND3X1M U25 ( .A(n9), .B(n10), .C(N2), .Y(n8) );
  CLKXOR2X2M U26 ( .A(div_clk), .B(n11), .Y(n50) );
  AOI21X1M U27 ( .A0(n10), .A1(n9), .B0(n7), .Y(n11) );
  OR2X1M U28 ( .A(n12), .B(i_div_ratio[0]), .Y(n9) );
  XNOR2X1M U29 ( .A(odd_edge_tog), .B(n13), .Y(n51) );
  OR2X1M U30 ( .A(n10), .B(n7), .Y(n13) );
  CLKNAND2X2M U31 ( .A(n14), .B(i_div_ratio[0]), .Y(n10) );
  MXI2X1M U32 ( .A(n15), .B(n12), .S0(odd_edge_tog), .Y(n14) );
  NAND4X1M U33 ( .A(n16), .B(n26), .C(n27), .D(n28), .Y(n12) );
  NOR4X1M U34 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n28) );
  CLKXOR2X2M U35 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n32) );
  CLKXOR2X2M U36 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n31) );
  CLKXOR2X2M U37 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n30) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n29) );
  XNOR2X1M U39 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n27) );
  XNOR2X1M U40 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n26) );
  XNOR2X1M U41 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n16) );
  NAND4X1M U42 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n15) );
  NOR4X1M U43 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n36) );
  CLKXOR2X2M U44 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n40) );
  CLKXOR2X2M U45 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n39) );
  CLKXOR2X2M U46 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n38) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n37) );
  XNOR2X1M U48 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n35) );
  XNOR2X1M U49 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n34) );
  XNOR2X1M U50 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n33) );
  CLKINVX1M U51 ( .A(n7), .Y(N2) );
  NOR4BX1M U52 ( .AN(n42), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n41) );
  NOR4X1M U53 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n42) );
endmodule


module uart_tx_fsm ( CLK, RST, Data_Valid, ser_done, parity_enable, Ser_enable, 
        mux_sel, busy );
  output [1:0] mux_sel;
  input CLK, RST, Data_Valid, ser_done, parity_enable;
  output Ser_enable, busy;
  wire   busy_c, n4, n5, n6, n7, n8, n9, n1, n2, n3;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX2M busy_reg ( .D(busy_c), .CK(CLK), .RN(RST), .Q(busy) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  INVX2M U3 ( .A(n9), .Y(n1) );
  OAI2B2X1M U4 ( .A1N(current_state[2]), .A0(n8), .B0(current_state[2]), .B1(
        n9), .Y(mux_sel[0]) );
  NOR3X2M U5 ( .A(n5), .B(ser_done), .C(current_state[2]), .Y(Ser_enable) );
  OAI21X2M U6 ( .A0(current_state[1]), .A1(n2), .B0(n8), .Y(n9) );
  OAI21X2M U7 ( .A0(current_state[2]), .A1(current_state[0]), .B0(n8), .Y(
        mux_sel[1]) );
  NAND2X2M U8 ( .A(current_state[1]), .B(n2), .Y(n8) );
  NAND2X2M U9 ( .A(n1), .B(current_state[0]), .Y(n5) );
  INVX2M U10 ( .A(current_state[0]), .Y(n2) );
  NOR3X2M U11 ( .A(n3), .B(current_state[2]), .C(n4), .Y(next_state[2]) );
  AOI2B1X1M U12 ( .A1N(parity_enable), .A0(ser_done), .B0(n2), .Y(n4) );
  OAI21X2M U13 ( .A0(current_state[2]), .A1(n2), .B0(n8), .Y(busy_c) );
  AOI21X2M U14 ( .A0(n1), .A1(n5), .B0(current_state[2]), .Y(next_state[1]) );
  AOI21X2M U15 ( .A0(n6), .A1(n7), .B0(current_state[2]), .Y(next_state[0]) );
  NAND2BX2M U16 ( .AN(ser_done), .B(current_state[0]), .Y(n6) );
  OAI21X2M U17 ( .A0(Data_Valid), .A1(current_state[0]), .B0(n3), .Y(n7) );
  INVX2M U18 ( .A(current_state[1]), .Y(n3) );
endmodule


module Serializer_WIDTH8 ( CLK, RST, DATA, Enable, Busy, Data_Valid, ser_out, 
        ser_done );
  input [7:0] DATA;
  input CLK, RST, Enable, Busy, Data_Valid;
  output ser_out, ser_done;
  wire   N23, N24, N25, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n1, n2, n3, n25;
  wire   [7:1] DATA_V;
  wire   [2:0] ser_count;

  DFFRQX2M \DATA_V_reg[0]  ( .D(n17), .CK(CLK), .RN(RST), .Q(ser_out) );
  DFFRQX2M \DATA_V_reg[6]  ( .D(n19), .CK(CLK), .RN(RST), .Q(DATA_V[6]) );
  DFFRQX2M \DATA_V_reg[5]  ( .D(n20), .CK(CLK), .RN(RST), .Q(DATA_V[5]) );
  DFFRQX2M \DATA_V_reg[4]  ( .D(n21), .CK(CLK), .RN(RST), .Q(DATA_V[4]) );
  DFFRQX2M \DATA_V_reg[3]  ( .D(n22), .CK(CLK), .RN(RST), .Q(DATA_V[3]) );
  DFFRQX2M \DATA_V_reg[2]  ( .D(n23), .CK(CLK), .RN(RST), .Q(DATA_V[2]) );
  DFFRQX2M \DATA_V_reg[1]  ( .D(n24), .CK(CLK), .RN(RST), .Q(DATA_V[1]) );
  DFFRQX2M \DATA_V_reg[7]  ( .D(n18), .CK(CLK), .RN(RST), .Q(DATA_V[7]) );
  DFFRQX2M \ser_count_reg[2]  ( .D(N25), .CK(CLK), .RN(RST), .Q(ser_count[2])
         );
  DFFRQX2M \ser_count_reg[1]  ( .D(N24), .CK(CLK), .RN(RST), .Q(ser_count[1])
         );
  DFFRQX2M \ser_count_reg[0]  ( .D(N23), .CK(CLK), .RN(RST), .Q(ser_count[0])
         );
  NOR2X2M U3 ( .A(n2), .B(n1), .Y(n6) );
  NOR2X2M U4 ( .A(n1), .B(n6), .Y(n4) );
  INVX2M U5 ( .A(Enable), .Y(n2) );
  OAI32X1M U6 ( .A0(n14), .A1(n3), .A2(n2), .B0(n15), .B1(n25), .Y(N25) );
  NAND2X2M U7 ( .A(ser_count[0]), .B(n25), .Y(n14) );
  AOI21X2M U8 ( .A0(Enable), .A1(n3), .B0(N23), .Y(n15) );
  INVX2M U9 ( .A(ser_count[2]), .Y(n25) );
  AND3X2M U10 ( .A(ser_count[0]), .B(ser_count[2]), .C(ser_count[1]), .Y(
        ser_done) );
  NOR2X2M U11 ( .A(n2), .B(ser_count[0]), .Y(N23) );
  BUFX2M U12 ( .A(n7), .Y(n1) );
  NOR2BX2M U13 ( .AN(Data_Valid), .B(Busy), .Y(n7) );
  NOR2X2M U14 ( .A(n16), .B(n2), .Y(N24) );
  CLKXOR2X2M U15 ( .A(ser_count[0]), .B(n3), .Y(n16) );
  OAI2BB1X2M U16 ( .A0N(ser_out), .A1N(n4), .B0(n5), .Y(n17) );
  AOI22X1M U17 ( .A0(DATA_V[1]), .A1(n6), .B0(DATA[0]), .B1(n1), .Y(n5) );
  OAI2BB1X2M U18 ( .A0N(DATA_V[1]), .A1N(n4), .B0(n13), .Y(n24) );
  AOI22X1M U19 ( .A0(DATA_V[2]), .A1(n6), .B0(DATA[1]), .B1(n1), .Y(n13) );
  OAI2BB1X2M U20 ( .A0N(n4), .A1N(DATA_V[2]), .B0(n12), .Y(n23) );
  AOI22X1M U21 ( .A0(DATA_V[3]), .A1(n6), .B0(DATA[2]), .B1(n1), .Y(n12) );
  OAI2BB1X2M U22 ( .A0N(n4), .A1N(DATA_V[3]), .B0(n11), .Y(n22) );
  AOI22X1M U23 ( .A0(DATA_V[4]), .A1(n6), .B0(DATA[3]), .B1(n1), .Y(n11) );
  OAI2BB1X2M U24 ( .A0N(n4), .A1N(DATA_V[4]), .B0(n10), .Y(n21) );
  AOI22X1M U25 ( .A0(DATA_V[5]), .A1(n6), .B0(DATA[4]), .B1(n1), .Y(n10) );
  OAI2BB1X2M U26 ( .A0N(n4), .A1N(DATA_V[5]), .B0(n9), .Y(n20) );
  AOI22X1M U27 ( .A0(DATA_V[6]), .A1(n6), .B0(DATA[5]), .B1(n1), .Y(n9) );
  OAI2BB1X2M U28 ( .A0N(n4), .A1N(DATA_V[6]), .B0(n8), .Y(n19) );
  AOI22X1M U29 ( .A0(DATA_V[7]), .A1(n6), .B0(DATA[6]), .B1(n1), .Y(n8) );
  AO22X1M U30 ( .A0(n4), .A1(DATA_V[7]), .B0(DATA[7]), .B1(n1), .Y(n18) );
  INVX2M U31 ( .A(ser_count[1]), .Y(n3) );
endmodule


module mux ( CLK, RST, IN_0, IN_1, IN_2, IN_3, SEL, OUT );
  input [1:0] SEL;
  input CLK, RST, IN_0, IN_1, IN_2, IN_3;
  output OUT;
  wire   mux_out, n2, n3, n1;

  DFFRHQX8M OUT_reg ( .D(mux_out), .CK(CLK), .RN(RST), .Q(OUT) );
  INVX2M U3 ( .A(SEL[0]), .Y(n1) );
  OAI2B2X1M U4 ( .A1N(SEL[1]), .A0(n2), .B0(SEL[1]), .B1(n3), .Y(mux_out) );
  AOI22X1M U5 ( .A0(IN_0), .A1(n1), .B0(SEL[0]), .B1(IN_1), .Y(n3) );
  AOI22X1M U6 ( .A0(IN_2), .A1(n1), .B0(IN_3), .B1(SEL[0]), .Y(n2) );
endmodule


module parity_calc_WIDTH8 ( CLK, RST, parity_enable, parity_type, Busy, DATA, 
        Data_Valid, parity );
  input [7:0] DATA;
  input CLK, RST, parity_enable, parity_type, Busy, Data_Valid;
  output parity;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n2
;
  wire   [7:0] DATA_V;

  DFFRQX2M \DATA_V_reg[1]  ( .D(n10), .CK(CLK), .RN(RST), .Q(DATA_V[1]) );
  DFFRQX2M \DATA_V_reg[0]  ( .D(n9), .CK(CLK), .RN(RST), .Q(DATA_V[0]) );
  DFFRQX2M \DATA_V_reg[2]  ( .D(n11), .CK(CLK), .RN(RST), .Q(DATA_V[2]) );
  DFFRQX2M parity_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(parity) );
  DFFRQX2M \DATA_V_reg[3]  ( .D(n12), .CK(CLK), .RN(RST), .Q(DATA_V[3]) );
  DFFRQX2M \DATA_V_reg[5]  ( .D(n14), .CK(CLK), .RN(RST), .Q(DATA_V[5]) );
  DFFRQX2M \DATA_V_reg[4]  ( .D(n13), .CK(CLK), .RN(RST), .Q(DATA_V[4]) );
  DFFRQX2M \DATA_V_reg[6]  ( .D(n15), .CK(CLK), .RN(RST), .Q(DATA_V[6]) );
  DFFRQX2M \DATA_V_reg[7]  ( .D(n16), .CK(CLK), .RN(RST), .Q(DATA_V[7]) );
  NOR2BX2M U2 ( .AN(Data_Valid), .B(Busy), .Y(n7) );
  OAI2BB2X1M U3 ( .B0(n1), .B1(n2), .A0N(parity), .A1N(n2), .Y(n8) );
  INVX2M U4 ( .A(parity_enable), .Y(n2) );
  XOR3XLM U5 ( .A(n3), .B(parity_type), .C(n4), .Y(n1) );
  XOR3XLM U6 ( .A(DATA_V[1]), .B(DATA_V[0]), .C(n5), .Y(n4) );
  XOR3XLM U7 ( .A(DATA_V[5]), .B(DATA_V[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U8 ( .A(DATA_V[7]), .B(DATA_V[6]), .Y(n6) );
  AO2B2X2M U9 ( .B0(DATA[0]), .B1(n7), .A0(DATA_V[0]), .A1N(n7), .Y(n9) );
  AO2B2X2M U10 ( .B0(DATA[1]), .B1(n7), .A0(DATA_V[1]), .A1N(n7), .Y(n10) );
  AO2B2X2M U11 ( .B0(DATA[2]), .B1(n7), .A0(DATA_V[2]), .A1N(n7), .Y(n11) );
  AO2B2X2M U12 ( .B0(DATA[3]), .B1(n7), .A0(DATA_V[3]), .A1N(n7), .Y(n12) );
  AO2B2X2M U13 ( .B0(DATA[4]), .B1(n7), .A0(DATA_V[4]), .A1N(n7), .Y(n13) );
  AO2B2X2M U14 ( .B0(DATA[5]), .B1(n7), .A0(DATA_V[5]), .A1N(n7), .Y(n14) );
  AO2B2X2M U15 ( .B0(DATA[6]), .B1(n7), .A0(DATA_V[6]), .A1N(n7), .Y(n15) );
  AO2B2X2M U16 ( .B0(DATA[7]), .B1(n7), .A0(DATA_V[7]), .A1N(n7), .Y(n16) );
  XNOR2X2M U17 ( .A(DATA_V[2]), .B(DATA_V[3]), .Y(n5) );
endmodule


module UART_TX_DATA_WIDTH8 ( CLK, RST, P_DATA, Data_Valid, parity_enable, 
        parity_type, TX_OUT, busy );
  input [7:0] P_DATA;
  input CLK, RST, Data_Valid, parity_enable, parity_type;
  output TX_OUT, busy;
  wire   seriz_done, seriz_en, ser_data, parity, n1, n2;
  wire   [1:0] mux_sel;

  uart_tx_fsm U0_fsm ( .CLK(CLK), .RST(n1), .Data_Valid(Data_Valid), 
        .ser_done(seriz_done), .parity_enable(parity_enable), .Ser_enable(
        seriz_en), .mux_sel(mux_sel), .busy(busy) );
  Serializer_WIDTH8 U0_Serializer ( .CLK(CLK), .RST(n1), .DATA(P_DATA), 
        .Enable(seriz_en), .Busy(busy), .Data_Valid(Data_Valid), .ser_out(
        ser_data), .ser_done(seriz_done) );
  mux U0_mux ( .CLK(CLK), .RST(n1), .IN_0(1'b0), .IN_1(ser_data), .IN_2(parity), .IN_3(1'b1), .SEL(mux_sel), .OUT(TX_OUT) );
  parity_calc_WIDTH8 U0_parity_calc ( .CLK(CLK), .RST(n1), .parity_enable(
        parity_enable), .parity_type(parity_type), .Busy(busy), .DATA(P_DATA), 
        .Data_Valid(Data_Valid), .parity(parity) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(RST), .Y(n2) );
endmodule


module uart_rx_fsm_DATA_WIDTH8 ( CLK, RST, S_DATA, Prescale, parity_enable, 
        bit_count, edge_count, par_err, stp_err, strt_glitch, strt_chk_en, 
        edge_bit_en, deser_en, par_chk_en, stp_chk_en, dat_samp_en, data_valid
 );
  input [5:0] Prescale;
  input [3:0] bit_count;
  input [5:0] edge_count;
  input CLK, RST, S_DATA, parity_enable, par_err, stp_err, strt_glitch;
  output strt_chk_en, edge_bit_en, deser_en, par_chk_en, stp_chk_en,
         dat_samp_en, data_valid;
  wire   \sub_40/carry[5] , \sub_40/carry[4] , \sub_40/carry[3] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47;
  wire   [5:0] check_edge;
  wire   [5:0] error_check_edge;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign error_check_edge[0] = Prescale[0];

  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  XNOR2X2M U3 ( .A(Prescale[1]), .B(edge_count[1]), .Y(n34) );
  OR2X2M U4 ( .A(Prescale[1]), .B(error_check_edge[0]), .Y(n1) );
  INVX2M U5 ( .A(Prescale[3]), .Y(n5) );
  XNOR2X1M U6 ( .A(Prescale[5]), .B(\sub_40/carry[5] ), .Y(error_check_edge[5]) );
  OR2X1M U7 ( .A(Prescale[4]), .B(\sub_40/carry[4] ), .Y(\sub_40/carry[5] ) );
  XNOR2X1M U8 ( .A(\sub_40/carry[4] ), .B(Prescale[4]), .Y(error_check_edge[4]) );
  OR2X1M U9 ( .A(Prescale[3]), .B(\sub_40/carry[3] ), .Y(\sub_40/carry[4] ) );
  XNOR2X1M U10 ( .A(\sub_40/carry[3] ), .B(Prescale[3]), .Y(
        error_check_edge[3]) );
  OR2X1M U11 ( .A(Prescale[2]), .B(Prescale[1]), .Y(\sub_40/carry[3] ) );
  XNOR2X1M U12 ( .A(Prescale[1]), .B(Prescale[2]), .Y(error_check_edge[2]) );
  CLKINVX1M U13 ( .A(error_check_edge[0]), .Y(check_edge[0]) );
  OAI2BB1X1M U14 ( .A0N(error_check_edge[0]), .A1N(Prescale[1]), .B0(n1), .Y(
        check_edge[1]) );
  NOR2X1M U15 ( .A(n1), .B(Prescale[2]), .Y(n2) );
  AO21XLM U16 ( .A0(n1), .A1(Prescale[2]), .B0(n2), .Y(check_edge[2]) );
  CLKNAND2X2M U17 ( .A(n2), .B(n5), .Y(n3) );
  OAI21X1M U18 ( .A0(n2), .A1(n5), .B0(n3), .Y(check_edge[3]) );
  XNOR2X1M U19 ( .A(Prescale[4]), .B(n3), .Y(check_edge[4]) );
  NOR2X1M U20 ( .A(Prescale[4]), .B(n3), .Y(n4) );
  CLKXOR2X2M U21 ( .A(Prescale[5]), .B(n4), .Y(check_edge[5]) );
  NOR2X1M U22 ( .A(current_state[1]), .B(n6), .Y(strt_chk_en) );
  NOR2X1M U23 ( .A(current_state[2]), .B(n7), .Y(par_chk_en) );
  OAI31X1M U24 ( .A0(n8), .A1(parity_enable), .A2(n9), .B0(n10), .Y(
        next_state[2]) );
  AOI31X1M U25 ( .A0(n11), .A1(n12), .A2(n13), .B0(stp_chk_en), .Y(n10) );
  NOR2X1M U26 ( .A(n14), .B(n15), .Y(n13) );
  CLKINVX1M U27 ( .A(bit_count[3]), .Y(n15) );
  CLKINVX1M U28 ( .A(n7), .Y(n12) );
  OAI21X1M U29 ( .A0(current_state[2]), .A1(n16), .B0(n7), .Y(next_state[1])
         );
  AOI31X1M U30 ( .A0(current_state[0]), .A1(n11), .A2(n17), .B0(
        current_state[1]), .Y(n16) );
  NOR3X1M U31 ( .A(bit_count[0]), .B(strt_glitch), .C(bit_count[3]), .Y(n17)
         );
  OAI221X1M U32 ( .A0(S_DATA), .A1(n18), .B0(n19), .B1(n8), .C0(n20), .Y(
        next_state[0]) );
  AOI31X1M U33 ( .A0(n21), .A1(n22), .A2(n23), .B0(n24), .Y(n20) );
  NOR4X1M U34 ( .A(n25), .B(n26), .C(n27), .D(n28), .Y(n24) );
  CLKXOR2X2M U35 ( .A(error_check_edge[5]), .B(edge_count[5]), .Y(n28) );
  CLKXOR2X2M U36 ( .A(error_check_edge[4]), .B(edge_count[4]), .Y(n27) );
  NAND3BX1M U37 ( .AN(bit_count[2]), .B(bit_count[3]), .C(stp_chk_en), .Y(n26)
         );
  NOR2X1M U38 ( .A(n22), .B(n7), .Y(stp_chk_en) );
  NAND4X1M U39 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n25) );
  XNOR2X1M U40 ( .A(edge_count[2]), .B(error_check_edge[2]), .Y(n32) );
  NOR2X1M U41 ( .A(n33), .B(n34), .Y(n31) );
  CLKXOR2X2M U42 ( .A(error_check_edge[0]), .B(edge_count[0]), .Y(n33) );
  XNOR2X1M U43 ( .A(edge_count[3]), .B(error_check_edge[3]), .Y(n30) );
  MXI2X1M U44 ( .A(n35), .B(n36), .S0(parity_enable), .Y(n29) );
  CLKNAND2X2M U45 ( .A(bit_count[1]), .B(n14), .Y(n36) );
  OR2X1M U46 ( .A(bit_count[1]), .B(n14), .Y(n35) );
  MXI2X1M U47 ( .A(S_DATA), .B(n37), .S0(current_state[0]), .Y(n23) );
  NOR4BX1M U48 ( .AN(strt_glitch), .B(bit_count[3]), .C(bit_count[0]), .D(n38), 
        .Y(n37) );
  CLKINVX1M U49 ( .A(n9), .Y(n19) );
  NAND3X1M U50 ( .A(n11), .B(n14), .C(bit_count[3]), .Y(n9) );
  CLKINVX1M U51 ( .A(bit_count[0]), .Y(n14) );
  CLKINVX1M U52 ( .A(n38), .Y(n11) );
  CLKNAND2X2M U53 ( .A(n39), .B(n40), .Y(n38) );
  NOR4X1M U54 ( .A(bit_count[2]), .B(bit_count[1]), .C(n41), .D(n42), .Y(n40)
         );
  CLKXOR2X2M U55 ( .A(edge_count[0]), .B(check_edge[0]), .Y(n42) );
  CLKXOR2X2M U56 ( .A(edge_count[4]), .B(check_edge[4]), .Y(n41) );
  NOR4X1M U57 ( .A(n43), .B(n44), .C(n45), .D(n46), .Y(n39) );
  CLKXOR2X2M U58 ( .A(edge_count[3]), .B(check_edge[3]), .Y(n46) );
  CLKXOR2X2M U59 ( .A(edge_count[2]), .B(check_edge[2]), .Y(n45) );
  CLKXOR2X2M U60 ( .A(edge_count[5]), .B(check_edge[5]), .Y(n44) );
  CLKXOR2X2M U61 ( .A(edge_count[1]), .B(check_edge[1]), .Y(n43) );
  CLKNAND2X2M U62 ( .A(n6), .B(n7), .Y(edge_bit_en) );
  CLKNAND2X2M U63 ( .A(current_state[1]), .B(n47), .Y(n7) );
  CLKINVX1M U64 ( .A(n8), .Y(deser_en) );
  NAND3X1M U65 ( .A(current_state[1]), .B(n22), .C(current_state[0]), .Y(n8)
         );
  CLKINVX1M U66 ( .A(current_state[2]), .Y(n22) );
  NOR3X1M U67 ( .A(n18), .B(stp_err), .C(par_err), .Y(data_valid) );
  NAND3X1M U68 ( .A(current_state[2]), .B(current_state[1]), .C(
        current_state[0]), .Y(n18) );
  CLKNAND2X2M U69 ( .A(n21), .B(n6), .Y(dat_samp_en) );
  AO21XLM U70 ( .A0(n47), .A1(S_DATA), .B0(current_state[2]), .Y(n6) );
  CLKINVX1M U71 ( .A(current_state[0]), .Y(n47) );
  CLKINVX1M U72 ( .A(current_state[1]), .Y(n21) );
endmodule


module edge_bit_counter ( CLK, RST, Enable, Prescale, bit_count, edge_count );
  input [5:0] Prescale;
  output [3:0] bit_count;
  output [5:0] edge_count;
  input CLK, RST, Enable;
  wire   N8, N9, N10, N11, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28,
         N29, N30, N31, n4, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, \add_31/carry[5] , \add_31/carry[4] , \add_31/carry[3] ,
         \add_31/carry[2] , n1, n2, n3, n5, n6, n7, n8, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33;

  DFFRX1M \bit_count_reg[3]  ( .D(n17), .CK(CLK), .RN(RST), .Q(bit_count[3]), 
        .QN(n4) );
  DFFRQX2M \bit_count_reg[2]  ( .D(n18), .CK(CLK), .RN(RST), .Q(bit_count[2])
         );
  DFFRQX2M \bit_count_reg[1]  ( .D(n19), .CK(CLK), .RN(RST), .Q(bit_count[1])
         );
  DFFRQX2M \bit_count_reg[0]  ( .D(n20), .CK(CLK), .RN(RST), .Q(bit_count[0])
         );
  DFFRQX2M \edge_count_reg[5]  ( .D(N24), .CK(CLK), .RN(RST), .Q(edge_count[5]) );
  DFFRQX2M \edge_count_reg[0]  ( .D(N19), .CK(CLK), .RN(RST), .Q(edge_count[0]) );
  DFFRQX2M \edge_count_reg[4]  ( .D(N23), .CK(CLK), .RN(RST), .Q(edge_count[4]) );
  DFFRQX2M \edge_count_reg[3]  ( .D(N22), .CK(CLK), .RN(RST), .Q(edge_count[3]) );
  DFFRQX2M \edge_count_reg[2]  ( .D(N21), .CK(CLK), .RN(RST), .Q(edge_count[2]) );
  DFFRQX2M \edge_count_reg[1]  ( .D(N20), .CK(CLK), .RN(RST), .Q(edge_count[1]) );
  INVX2M U3 ( .A(n13), .Y(n29) );
  INVX2M U4 ( .A(Enable), .Y(n33) );
  NOR2X2M U5 ( .A(n33), .B(N31), .Y(n13) );
  AOI21X2M U6 ( .A0(n30), .A1(Enable), .B0(n13), .Y(n16) );
  NOR2BX2M U7 ( .AN(N8), .B(n29), .Y(N20) );
  NOR2BX2M U8 ( .AN(N9), .B(n29), .Y(N21) );
  NOR2BX2M U9 ( .AN(N10), .B(n29), .Y(N22) );
  NOR2BX2M U10 ( .AN(N11), .B(n29), .Y(N23) );
  OAI32X1M U11 ( .A0(n14), .A1(bit_count[2]), .A2(n31), .B0(n15), .B1(n32), 
        .Y(n18) );
  AOI21BX2M U12 ( .A0(Enable), .A1(n31), .B0N(n16), .Y(n15) );
  NAND3X2M U13 ( .A(bit_count[0]), .B(n29), .C(Enable), .Y(n14) );
  OAI32X1M U14 ( .A0(n33), .A1(bit_count[0]), .A2(n13), .B0(n30), .B1(n29), 
        .Y(n20) );
  OAI32X1M U15 ( .A0(n9), .A1(n10), .A2(n33), .B0(n11), .B1(n4), .Y(n17) );
  NAND3X2M U16 ( .A(N31), .B(n4), .C(bit_count[2]), .Y(n9) );
  NOR2X2M U17 ( .A(n12), .B(n13), .Y(n11) );
  AOI2BB1X2M U18 ( .A0N(n10), .A1N(n32), .B0(n33), .Y(n12) );
  OAI22X1M U19 ( .A0(n16), .A1(n31), .B0(bit_count[1]), .B1(n14), .Y(n19) );
  NOR2X2M U20 ( .A(n1), .B(n29), .Y(N24) );
  XNOR2X2M U21 ( .A(\add_31/carry[5] ), .B(edge_count[5]), .Y(n1) );
  NOR2X2M U22 ( .A(edge_count[0]), .B(n29), .Y(N19) );
  NAND2X2M U23 ( .A(bit_count[1]), .B(bit_count[0]), .Y(n10) );
  ADDHX1M U24 ( .A(edge_count[1]), .B(edge_count[0]), .CO(\add_31/carry[2] ), 
        .S(N8) );
  ADDHX1M U25 ( .A(edge_count[2]), .B(\add_31/carry[2] ), .CO(
        \add_31/carry[3] ), .S(N9) );
  ADDHX1M U26 ( .A(edge_count[3]), .B(\add_31/carry[3] ), .CO(
        \add_31/carry[4] ), .S(N10) );
  ADDHX1M U27 ( .A(edge_count[4]), .B(\add_31/carry[4] ), .CO(
        \add_31/carry[5] ), .S(N11) );
  INVX2M U28 ( .A(bit_count[0]), .Y(n30) );
  INVX2M U29 ( .A(bit_count[1]), .Y(n31) );
  INVX2M U30 ( .A(bit_count[2]), .Y(n32) );
  OR2X2M U31 ( .A(Prescale[1]), .B(Prescale[0]), .Y(n2) );
  INVX2M U32 ( .A(Prescale[3]), .Y(n7) );
  CLKINVX1M U33 ( .A(Prescale[0]), .Y(N25) );
  OAI2BB1X1M U34 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n2), .Y(N26) );
  NOR2X1M U35 ( .A(n2), .B(Prescale[2]), .Y(n3) );
  AO21XLM U36 ( .A0(n2), .A1(Prescale[2]), .B0(n3), .Y(N27) );
  CLKNAND2X2M U37 ( .A(n3), .B(n7), .Y(n5) );
  OAI21X1M U38 ( .A0(n3), .A1(n7), .B0(n5), .Y(N28) );
  XNOR2X1M U39 ( .A(Prescale[4]), .B(n5), .Y(N29) );
  NOR2X1M U40 ( .A(Prescale[4]), .B(n5), .Y(n6) );
  CLKXOR2X2M U41 ( .A(Prescale[5]), .B(n6), .Y(N30) );
  NOR2BX1M U42 ( .AN(edge_count[0]), .B(N25), .Y(n8) );
  OAI2B2X1M U43 ( .A1N(N26), .A0(n8), .B0(edge_count[1]), .B1(n8), .Y(n24) );
  NOR2BX1M U44 ( .AN(N25), .B(edge_count[0]), .Y(n21) );
  OAI2B2X1M U45 ( .A1N(edge_count[1]), .A0(n21), .B0(N26), .B1(n21), .Y(n23)
         );
  XNOR2X1M U46 ( .A(N30), .B(edge_count[5]), .Y(n22) );
  NAND3X1M U47 ( .A(n24), .B(n23), .C(n22), .Y(n28) );
  CLKXOR2X2M U48 ( .A(N29), .B(edge_count[4]), .Y(n27) );
  CLKXOR2X2M U49 ( .A(N27), .B(edge_count[2]), .Y(n26) );
  CLKXOR2X2M U50 ( .A(N28), .B(edge_count[3]), .Y(n25) );
  NOR4X1M U51 ( .A(n28), .B(n27), .C(n26), .D(n25), .Y(N31) );
endmodule


module data_sampling ( CLK, RST, S_DATA, Prescale, edge_count, Enable, 
        sampled_bit );
  input [5:0] Prescale;
  input [5:0] edge_count;
  input CLK, RST, S_DATA, Enable;
  output sampled_bit;
  wire   N58, n19, n20, n21, \add_21/carry[4] , \add_21/carry[3] ,
         \add_21/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;
  wire   [4:0] half_edges;
  wire   [4:0] half_edges_p1;
  wire   [4:0] half_edges_n1;
  wire   [2:0] Samples;

  DFFRQX2M \Samples_reg[2]  ( .D(n21), .CK(CLK), .RN(RST), .Q(Samples[2]) );
  DFFRQX2M \Samples_reg[1]  ( .D(n20), .CK(CLK), .RN(RST), .Q(Samples[1]) );
  DFFRQX2M \Samples_reg[0]  ( .D(n19), .CK(CLK), .RN(RST), .Q(Samples[0]) );
  DFFRQX2M sampled_bit_reg ( .D(N58), .CK(CLK), .RN(RST), .Q(sampled_bit) );
  INVX2M U3 ( .A(half_edges[2]), .Y(n8) );
  ADDHX1M U4 ( .A(half_edges[2]), .B(\add_21/carry[2] ), .CO(\add_21/carry[3] ), .S(half_edges_p1[2]) );
  ADDHX1M U5 ( .A(half_edges[1]), .B(half_edges[0]), .CO(\add_21/carry[2] ), 
        .S(half_edges_p1[1]) );
  ADDHX1M U6 ( .A(half_edges[3]), .B(\add_21/carry[3] ), .CO(\add_21/carry[4] ), .S(half_edges_p1[3]) );
  INVX2M U7 ( .A(Prescale[3]), .Y(n4) );
  CLKINVX1M U8 ( .A(Prescale[1]), .Y(half_edges[0]) );
  NOR2X1M U9 ( .A(Prescale[2]), .B(Prescale[1]), .Y(n1) );
  AO21XLM U10 ( .A0(Prescale[1]), .A1(Prescale[2]), .B0(n1), .Y(half_edges[1])
         );
  CLKNAND2X2M U11 ( .A(n1), .B(n4), .Y(n2) );
  OAI21X1M U12 ( .A0(n1), .A1(n4), .B0(n2), .Y(half_edges[2]) );
  XNOR2X1M U13 ( .A(Prescale[4]), .B(n2), .Y(half_edges[3]) );
  NOR2X1M U14 ( .A(Prescale[4]), .B(n2), .Y(n3) );
  CLKXOR2X2M U15 ( .A(Prescale[5]), .B(n3), .Y(half_edges[4]) );
  CLKXOR2X2M U16 ( .A(\add_21/carry[4] ), .B(half_edges[4]), .Y(
        half_edges_p1[4]) );
  NOR2X1M U17 ( .A(half_edges[1]), .B(half_edges[0]), .Y(n5) );
  AO21XLM U18 ( .A0(half_edges[0]), .A1(half_edges[1]), .B0(n5), .Y(
        half_edges_n1[1]) );
  CLKNAND2X2M U19 ( .A(n5), .B(n8), .Y(n6) );
  OAI21X1M U20 ( .A0(n5), .A1(n8), .B0(n6), .Y(half_edges_n1[2]) );
  XNOR2X1M U21 ( .A(half_edges[3]), .B(n6), .Y(half_edges_n1[3]) );
  NOR2X1M U22 ( .A(half_edges[3]), .B(n6), .Y(n7) );
  CLKXOR2X2M U23 ( .A(half_edges[4]), .B(n7), .Y(half_edges_n1[4]) );
  MXI2X1M U24 ( .A(n9), .B(n10), .S0(n11), .Y(n21) );
  NOR2X1M U25 ( .A(n12), .B(n13), .Y(n11) );
  NAND4X1M U26 ( .A(n14), .B(n15), .C(n16), .D(n17), .Y(n13) );
  CLKXOR2X2M U27 ( .A(n18), .B(half_edges_p1[1]), .Y(n17) );
  XNOR2X1M U28 ( .A(edge_count[2]), .B(half_edges_p1[2]), .Y(n16) );
  XNOR2X1M U29 ( .A(edge_count[3]), .B(half_edges_p1[3]), .Y(n15) );
  CLKXOR2X2M U30 ( .A(n22), .B(half_edges_p1[4]), .Y(n14) );
  NAND4BX1M U31 ( .AN(edge_count[5]), .B(n23), .C(n24), .D(n25), .Y(n12) );
  XNOR2X1M U32 ( .A(edge_count[0]), .B(Prescale[1]), .Y(n23) );
  CLKNAND2X2M U33 ( .A(Samples[2]), .B(Enable), .Y(n9) );
  MXI2X1M U34 ( .A(n10), .B(n26), .S0(n24), .Y(n20) );
  NAND4X1M U35 ( .A(n27), .B(n28), .C(n29), .D(n30), .Y(n24) );
  NOR4BX1M U36 ( .AN(n25), .B(edge_count[5]), .C(n31), .D(n32), .Y(n30) );
  CLKXOR2X2M U37 ( .A(half_edges[1]), .B(edge_count[1]), .Y(n32) );
  CLKXOR2X2M U38 ( .A(half_edges[0]), .B(edge_count[0]), .Y(n31) );
  XNOR2X1M U39 ( .A(edge_count[3]), .B(half_edges[3]), .Y(n29) );
  CLKXOR2X2M U40 ( .A(n22), .B(half_edges[4]), .Y(n28) );
  CLKINVX1M U41 ( .A(edge_count[4]), .Y(n22) );
  XNOR2X1M U42 ( .A(edge_count[2]), .B(half_edges[2]), .Y(n27) );
  CLKNAND2X2M U43 ( .A(Samples[1]), .B(Enable), .Y(n26) );
  MXI2X1M U44 ( .A(n10), .B(n33), .S0(n25), .Y(n19) );
  NAND4X1M U45 ( .A(n34), .B(n35), .C(n36), .D(n37), .Y(n25) );
  NOR3X1M U46 ( .A(n38), .B(edge_count[5]), .C(n39), .Y(n37) );
  CLKXOR2X2M U47 ( .A(Prescale[1]), .B(edge_count[0]), .Y(n39) );
  CLKXOR2X2M U48 ( .A(half_edges_n1[4]), .B(edge_count[4]), .Y(n38) );
  XNOR2X1M U49 ( .A(edge_count[2]), .B(half_edges_n1[2]), .Y(n36) );
  XNOR2X1M U50 ( .A(edge_count[3]), .B(half_edges_n1[3]), .Y(n35) );
  CLKXOR2X2M U51 ( .A(n18), .B(half_edges_n1[1]), .Y(n34) );
  CLKINVX1M U52 ( .A(edge_count[1]), .Y(n18) );
  CLKNAND2X2M U53 ( .A(Samples[0]), .B(Enable), .Y(n33) );
  CLKNAND2X2M U54 ( .A(S_DATA), .B(Enable), .Y(n10) );
  AOI21BX1M U55 ( .A0(n40), .A1(n41), .B0N(Enable), .Y(N58) );
  OAI21X1M U56 ( .A0(Samples[0]), .A1(Samples[1]), .B0(Samples[2]), .Y(n41) );
  CLKNAND2X2M U57 ( .A(Samples[0]), .B(Samples[1]), .Y(n40) );
endmodule


module deserializer_DATA_WIDTH8 ( CLK, RST, sampled_bit, Enable, edge_count, 
        Prescale, P_DATA );
  input [5:0] edge_count;
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, sampled_bit, Enable;
  wire   N1, N2, N3, N4, N5, N6, N7, n1, n10, n11, n12, n13, n14, n15, n16,
         n17, n2, n3, n4, n5, n6, n7, n8, n9, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31;

  DFFRQX2M \P_DATA_reg[0]  ( .D(n10), .CK(CLK), .RN(RST), .Q(P_DATA[0]) );
  DFFRQX2M \P_DATA_reg[5]  ( .D(n15), .CK(CLK), .RN(RST), .Q(P_DATA[5]) );
  DFFRQX2M \P_DATA_reg[1]  ( .D(n11), .CK(CLK), .RN(RST), .Q(P_DATA[1]) );
  DFFRQX2M \P_DATA_reg[4]  ( .D(n14), .CK(CLK), .RN(RST), .Q(P_DATA[4]) );
  DFFRQX2M \P_DATA_reg[7]  ( .D(n17), .CK(CLK), .RN(RST), .Q(P_DATA[7]) );
  DFFRQX2M \P_DATA_reg[3]  ( .D(n13), .CK(CLK), .RN(RST), .Q(P_DATA[3]) );
  DFFRQX2M \P_DATA_reg[6]  ( .D(n16), .CK(CLK), .RN(RST), .Q(P_DATA[6]) );
  DFFRQX2M \P_DATA_reg[2]  ( .D(n12), .CK(CLK), .RN(RST), .Q(P_DATA[2]) );
  OAI22X1M U3 ( .A0(n31), .A1(n30), .B0(n1), .B1(n29), .Y(n11) );
  OAI22X1M U4 ( .A0(n31), .A1(n29), .B0(n1), .B1(n28), .Y(n12) );
  OAI22X1M U5 ( .A0(n31), .A1(n28), .B0(n1), .B1(n27), .Y(n13) );
  OAI22X1M U6 ( .A0(n31), .A1(n27), .B0(n1), .B1(n26), .Y(n14) );
  OAI22X1M U7 ( .A0(n31), .A1(n26), .B0(n1), .B1(n25), .Y(n15) );
  OAI22X1M U8 ( .A0(n31), .A1(n25), .B0(n1), .B1(n24), .Y(n16) );
  INVX2M U9 ( .A(n1), .Y(n31) );
  NAND2X2M U10 ( .A(N7), .B(Enable), .Y(n1) );
  OAI2BB2X1M U11 ( .B0(n1), .B1(n30), .A0N(P_DATA[0]), .A1N(n1), .Y(n10) );
  OAI2BB2X1M U12 ( .B0(n31), .B1(n24), .A0N(sampled_bit), .A1N(n31), .Y(n17)
         );
  INVX2M U13 ( .A(P_DATA[2]), .Y(n29) );
  INVX2M U14 ( .A(P_DATA[6]), .Y(n25) );
  INVX2M U15 ( .A(P_DATA[7]), .Y(n24) );
  INVX2M U16 ( .A(P_DATA[3]), .Y(n28) );
  INVX2M U17 ( .A(P_DATA[1]), .Y(n30) );
  INVX2M U18 ( .A(P_DATA[4]), .Y(n27) );
  INVX2M U19 ( .A(P_DATA[5]), .Y(n26) );
  OR2X2M U20 ( .A(Prescale[1]), .B(Prescale[0]), .Y(n2) );
  INVX2M U21 ( .A(Prescale[3]), .Y(n6) );
  CLKINVX1M U22 ( .A(Prescale[0]), .Y(N1) );
  OAI2BB1X1M U23 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n2), .Y(N2) );
  NOR2X1M U24 ( .A(n2), .B(Prescale[2]), .Y(n3) );
  AO21XLM U25 ( .A0(n2), .A1(Prescale[2]), .B0(n3), .Y(N3) );
  CLKNAND2X2M U26 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U27 ( .A0(n3), .A1(n6), .B0(n4), .Y(N4) );
  XNOR2X1M U28 ( .A(Prescale[4]), .B(n4), .Y(N5) );
  NOR2X1M U29 ( .A(Prescale[4]), .B(n4), .Y(n5) );
  CLKXOR2X2M U30 ( .A(Prescale[5]), .B(n5), .Y(N6) );
  NOR2BX1M U31 ( .AN(edge_count[0]), .B(N1), .Y(n7) );
  OAI2B2X1M U32 ( .A1N(N2), .A0(n7), .B0(edge_count[1]), .B1(n7), .Y(n19) );
  NOR2BX1M U33 ( .AN(N1), .B(edge_count[0]), .Y(n8) );
  OAI2B2X1M U34 ( .A1N(edge_count[1]), .A0(n8), .B0(N2), .B1(n8), .Y(n18) );
  XNOR2X1M U35 ( .A(N6), .B(edge_count[5]), .Y(n9) );
  NAND3X1M U36 ( .A(n19), .B(n18), .C(n9), .Y(n23) );
  CLKXOR2X2M U37 ( .A(N5), .B(edge_count[4]), .Y(n22) );
  CLKXOR2X2M U38 ( .A(N3), .B(edge_count[2]), .Y(n21) );
  CLKXOR2X2M U39 ( .A(N4), .B(edge_count[3]), .Y(n20) );
  NOR4X1M U40 ( .A(n23), .B(n22), .C(n21), .D(n20), .Y(N7) );
endmodule


module strt_chk ( CLK, RST, sampled_bit, Enable, strt_glitch );
  input CLK, RST, sampled_bit, Enable;
  output strt_glitch;
  wire   n1;

  DFFRQX2M strt_glitch_reg ( .D(n1), .CK(CLK), .RN(RST), .Q(strt_glitch) );
  AO2B2X2M U2 ( .B0(sampled_bit), .B1(Enable), .A0(strt_glitch), .A1N(Enable), 
        .Y(n1) );
endmodule


module par_chk_DATA_WIDTH8 ( CLK, RST, parity_type, sampled_bit, Enable, 
        P_DATA, par_err );
  input [7:0] P_DATA;
  input CLK, RST, parity_type, sampled_bit, Enable;
  output par_err;
  wire   n1, n3, n4, n5, n6, n7, n8, n2;

  DFFRQX2M par_err_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(par_err) );
  XNOR2X2M U2 ( .A(sampled_bit), .B(parity_type), .Y(n5) );
  OAI2BB2X1M U3 ( .B0(n1), .B1(n2), .A0N(par_err), .A1N(n2), .Y(n8) );
  INVX2M U4 ( .A(Enable), .Y(n2) );
  XOR3XLM U5 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
  XOR3XLM U6 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n4) );
  XNOR2X2M U7 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  XOR3XLM U8 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n7), .Y(n3) );
  XNOR2X2M U9 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n7) );
endmodule


module stp_chk ( CLK, RST, sampled_bit, Enable, stp_err );
  input CLK, RST, sampled_bit, Enable;
  output stp_err;
  wire   n2, n1;

  DFFRQX2M stp_err_reg ( .D(n2), .CK(CLK), .RN(RST), .Q(stp_err) );
  OAI2BB2X1M U2 ( .B0(sampled_bit), .B1(n1), .A0N(stp_err), .A1N(n1), .Y(n2)
         );
  INVX2M U3 ( .A(Enable), .Y(n1) );
endmodule


module UART_RX ( CLK, RST, RX_IN, parity_enable, parity_type, Prescale, P_DATA, 
        data_valid, parity_error, framing_error );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, RX_IN, parity_enable, parity_type;
  output data_valid, parity_error, framing_error;
  wire   strt_glitch, strt_chk_en, edge_bit_en, deser_en, par_chk_en,
         stp_chk_en, dat_samp_en, sampled_bit, n1, n2;
  wire   [3:0] bit_count;
  wire   [5:0] edge_count;

  uart_rx_fsm_DATA_WIDTH8 U0_uart_fsm ( .CLK(CLK), .RST(n1), .S_DATA(RX_IN), 
        .Prescale(Prescale), .parity_enable(parity_enable), .bit_count(
        bit_count), .edge_count(edge_count), .par_err(parity_error), .stp_err(
        framing_error), .strt_glitch(strt_glitch), .strt_chk_en(strt_chk_en), 
        .edge_bit_en(edge_bit_en), .deser_en(deser_en), .par_chk_en(par_chk_en), .stp_chk_en(stp_chk_en), .dat_samp_en(dat_samp_en), .data_valid(data_valid)
         );
  edge_bit_counter U0_edge_bit_counter ( .CLK(CLK), .RST(n1), .Enable(
        edge_bit_en), .Prescale(Prescale), .bit_count(bit_count), .edge_count(
        edge_count) );
  data_sampling U0_data_sampling ( .CLK(CLK), .RST(n1), .S_DATA(RX_IN), 
        .Prescale(Prescale), .edge_count(edge_count), .Enable(dat_samp_en), 
        .sampled_bit(sampled_bit) );
  deserializer_DATA_WIDTH8 U0_deserializer ( .CLK(CLK), .RST(n1), 
        .sampled_bit(sampled_bit), .Enable(deser_en), .edge_count(edge_count), 
        .Prescale(Prescale), .P_DATA(P_DATA) );
  strt_chk U0_strt_chk ( .CLK(CLK), .RST(n1), .sampled_bit(sampled_bit), 
        .Enable(strt_chk_en), .strt_glitch(strt_glitch) );
  par_chk_DATA_WIDTH8 U0_par_chk ( .CLK(CLK), .RST(n1), .parity_type(
        parity_type), .sampled_bit(sampled_bit), .Enable(par_chk_en), .P_DATA(
        P_DATA), .par_err(parity_error) );
  stp_chk U0_stp_chk ( .CLK(CLK), .RST(n1), .sampled_bit(sampled_bit), 
        .Enable(stp_chk_en), .stp_err(framing_error) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module UART ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, TX_IN_P, 
        TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, parity_type, 
        parity_error, framing_error );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error;
  wire   n1, n2;

  UART_TX_DATA_WIDTH8 U0_UART_TX ( .CLK(TX_CLK), .RST(n1), .P_DATA(TX_IN_P), 
        .Data_Valid(TX_IN_V), .parity_enable(parity_enable), .parity_type(
        parity_type), .TX_OUT(TX_OUT_S), .busy(TX_OUT_V) );
  UART_RX U0_UART_RX ( .CLK(RX_CLK), .RST(n1), .RX_IN(RX_IN_S), 
        .parity_enable(parity_enable), .parity_type(parity_type), .Prescale(
        Prescale), .P_DATA(RX_OUT_P), .data_valid(RX_OUT_V), .parity_error(
        parity_error), .framing_error(framing_error) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module SYS_CTRL ( CLK, RST, RF_RdData, RF_RdData_VLD, ALU_OUT, ALU_OUT_VLD, 
        UART_RX_DATA, UART_RX_VLD, FIFO_FULL, ALU_EN, ALU_FUN, CLKG_EN, 
        CLKDIV_EN, RF_WrEn, RF_RdEn, RF_Address, RF_WrData, UART_TX_DATA, 
        UART_TX_VLD );
  input [7:0] RF_RdData;
  input [15:0] ALU_OUT;
  input [7:0] UART_RX_DATA;
  output [3:0] ALU_FUN;
  output [3:0] RF_Address;
  output [7:0] RF_WrData;
  output [7:0] UART_TX_DATA;
  input CLK, RST, RF_RdData_VLD, ALU_OUT_VLD, UART_RX_VLD, FIFO_FULL;
  output ALU_EN, CLKG_EN, CLKDIV_EN, RF_WrEn, RF_RdEn, UART_TX_VLD;
  wire   n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n3, n4, n5, n6, n7, n8, n9, n10, n23, n24,
         n25, n26, n27, n28, n92, n93;
  wire   [3:0] current_state;
  wire   [3:0] next_state;
  wire   [15:0] ALU_OUT_REG;

  DFFRQX2M \ALU_OUT_REG_reg[0]  ( .D(n72), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_REG[0]) );
  DFFRQX2M \ALU_OUT_REG_reg[7]  ( .D(n79), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_REG[7]) );
  DFFRQX2M \ALU_OUT_REG_reg[6]  ( .D(n78), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_REG[6]) );
  DFFRQX2M \ALU_OUT_REG_reg[5]  ( .D(n77), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_REG[5]) );
  DFFRQX2M \ALU_OUT_REG_reg[4]  ( .D(n76), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_REG[4]) );
  DFFRQX2M \ALU_OUT_REG_reg[3]  ( .D(n75), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_REG[3]) );
  DFFRQX2M \ALU_OUT_REG_reg[2]  ( .D(n74), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_REG[2]) );
  DFFRQX2M \ALU_OUT_REG_reg[1]  ( .D(n73), .CK(CLK), .RN(RST), .Q(
        ALU_OUT_REG[1]) );
  DFFRX1M \ALU_OUT_REG_reg[15]  ( .D(n87), .CK(CLK), .RN(RST), .QN(n15) );
  DFFRX1M \ALU_OUT_REG_reg[14]  ( .D(n86), .CK(CLK), .RN(RST), .QN(n16) );
  DFFRX1M \ALU_OUT_REG_reg[13]  ( .D(n85), .CK(CLK), .RN(RST), .QN(n17) );
  DFFRX1M \ALU_OUT_REG_reg[12]  ( .D(n84), .CK(CLK), .RN(RST), .QN(n18) );
  DFFRX1M \ALU_OUT_REG_reg[11]  ( .D(n83), .CK(CLK), .RN(RST), .QN(n19) );
  DFFRX1M \ALU_OUT_REG_reg[10]  ( .D(n82), .CK(CLK), .RN(RST), .QN(n20) );
  DFFRX1M \ALU_OUT_REG_reg[9]  ( .D(n81), .CK(CLK), .RN(RST), .QN(n21) );
  DFFRX1M \ALU_OUT_REG_reg[8]  ( .D(n80), .CK(CLK), .RN(RST), .QN(n22) );
  DFFRX1M \RF_ADDR_REG_reg[0]  ( .D(n88), .CK(CLK), .RN(RST), .QN(n14) );
  DFFRX1M \RF_ADDR_REG_reg[3]  ( .D(n91), .CK(CLK), .RN(RST), .QN(n11) );
  DFFRX1M \RF_ADDR_REG_reg[2]  ( .D(n90), .CK(CLK), .RN(RST), .QN(n12) );
  DFFRX1M \RF_ADDR_REG_reg[1]  ( .D(n89), .CK(CLK), .RN(RST), .QN(n13) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[3]  ( .D(next_state[3]), .CK(CLK), .RN(RST), .Q(
        current_state[3]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]) );
  INVX2M U3 ( .A(1'b0), .Y(CLKDIV_EN) );
  NOR2X2M U5 ( .A(n26), .B(n40), .Y(ALU_FUN[3]) );
  NOR2X2M U6 ( .A(n27), .B(n40), .Y(ALU_FUN[2]) );
  OAI22X2M U7 ( .A0(n27), .A1(n6), .B0(n12), .B1(n48), .Y(RF_Address[2]) );
  INVX2M U8 ( .A(RF_RdEn), .Y(n6) );
  NOR2X2M U9 ( .A(n28), .B(n40), .Y(ALU_FUN[1]) );
  NAND2X2M U10 ( .A(n35), .B(n71), .Y(n40) );
  NOR2X2M U11 ( .A(n92), .B(n40), .Y(ALU_FUN[0]) );
  NOR2X2M U12 ( .A(n37), .B(n93), .Y(RF_RdEn) );
  AND3X2M U13 ( .A(n31), .B(n32), .C(n48), .Y(n70) );
  OAI21X2M U14 ( .A0(FIFO_FULL), .A1(n56), .B0(n57), .Y(UART_TX_VLD) );
  NAND2BX2M U15 ( .AN(FIFO_FULL), .B(n69), .Y(n58) );
  NAND3X2M U16 ( .A(n5), .B(n10), .C(n53), .Y(n43) );
  NOR2X2M U17 ( .A(n69), .B(n7), .Y(n56) );
  NOR2X2M U18 ( .A(n70), .B(n28), .Y(RF_WrData[1]) );
  NOR2X2M U19 ( .A(n70), .B(n27), .Y(RF_WrData[2]) );
  NOR2X2M U20 ( .A(n70), .B(n26), .Y(RF_WrData[3]) );
  NOR2X2M U21 ( .A(n70), .B(n25), .Y(RF_WrData[4]) );
  NOR2X2M U22 ( .A(n70), .B(n92), .Y(RF_WrData[0]) );
  NAND3X2M U23 ( .A(n5), .B(n23), .C(n71), .Y(n32) );
  NOR2X2M U24 ( .A(n70), .B(n93), .Y(RF_WrEn) );
  NAND4X2M U25 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(next_state[3]) );
  NAND3X2M U26 ( .A(n92), .B(n25), .C(n33), .Y(n30) );
  INVX2M U27 ( .A(n57), .Y(n3) );
  INVX2M U28 ( .A(n41), .Y(n7) );
  NOR2X2M U29 ( .A(n41), .B(FIFO_FULL), .Y(n60) );
  NOR2X2M U30 ( .A(n40), .B(n93), .Y(ALU_EN) );
  INVX2M U31 ( .A(n45), .Y(n9) );
  NAND4BX1M U32 ( .AN(ALU_EN), .B(n45), .C(n36), .D(n46), .Y(next_state[1]) );
  AOI21BX2M U33 ( .A0(n47), .A1(n93), .B0N(n39), .Y(n46) );
  NAND2X2M U34 ( .A(n48), .B(n37), .Y(n47) );
  NAND3X2M U35 ( .A(n39), .B(n40), .C(n56), .Y(CLKG_EN) );
  INVX2M U36 ( .A(n31), .Y(n8) );
  OAI22X4M U37 ( .A0(n26), .A1(n6), .B0(n11), .B1(n48), .Y(RF_Address[3]) );
  OAI221X1M U38 ( .A0(n14), .A1(n48), .B0(n92), .B1(n6), .C0(n31), .Y(
        RF_Address[0]) );
  NOR2X2M U39 ( .A(n23), .B(current_state[0]), .Y(n35) );
  NOR2X2M U40 ( .A(n24), .B(current_state[1]), .Y(n71) );
  NAND3X2M U41 ( .A(current_state[1]), .B(n24), .C(n35), .Y(n37) );
  INVX2M U42 ( .A(UART_RX_VLD), .Y(n93) );
  INVX2M U43 ( .A(UART_RX_DATA[0]), .Y(n92) );
  INVX2M U44 ( .A(UART_RX_DATA[2]), .Y(n27) );
  INVX2M U45 ( .A(current_state[3]), .Y(n24) );
  INVX2M U46 ( .A(current_state[2]), .Y(n23) );
  OAI22X1M U47 ( .A0(n28), .A1(n6), .B0(n13), .B1(n48), .Y(RF_Address[1]) );
  OAI211X2M U48 ( .A0(n93), .A1(n31), .B0(n29), .C0(n4), .Y(next_state[2]) );
  INVX2M U49 ( .A(n34), .Y(n4) );
  OAI2B11X2M U50 ( .A1N(n35), .A0(RF_RdData_VLD), .B0(n36), .C0(n37), .Y(n34)
         );
  NOR2X2M U51 ( .A(current_state[2]), .B(current_state[3]), .Y(n53) );
  NAND3X2M U52 ( .A(current_state[1]), .B(current_state[0]), .C(n53), .Y(n48)
         );
  NAND4X2M U53 ( .A(current_state[2]), .B(current_state[1]), .C(
        current_state[0]), .D(current_state[3]), .Y(n41) );
  NOR2BX2M U54 ( .AN(UART_RX_DATA[5]), .B(n70), .Y(RF_WrData[5]) );
  NOR2BX2M U55 ( .AN(UART_RX_DATA[6]), .B(n70), .Y(RF_WrData[6]) );
  NOR2BX2M U56 ( .AN(UART_RX_DATA[7]), .B(n70), .Y(RF_WrData[7]) );
  NAND3X2M U57 ( .A(n71), .B(n23), .C(current_state[0]), .Y(n31) );
  AND3X2M U58 ( .A(n71), .B(current_state[0]), .C(current_state[2]), .Y(n69)
         );
  OAI21X2M U59 ( .A0(n22), .A1(n58), .B0(n67), .Y(UART_TX_DATA[0]) );
  AOI22X1M U60 ( .A0(RF_RdData[0]), .A1(n3), .B0(n60), .B1(ALU_OUT_REG[0]), 
        .Y(n67) );
  OAI21X2M U61 ( .A0(n21), .A1(n58), .B0(n66), .Y(UART_TX_DATA[1]) );
  AOI22X1M U62 ( .A0(RF_RdData[1]), .A1(n3), .B0(n60), .B1(ALU_OUT_REG[1]), 
        .Y(n66) );
  OAI21X2M U63 ( .A0(n20), .A1(n58), .B0(n65), .Y(UART_TX_DATA[2]) );
  AOI22X1M U64 ( .A0(RF_RdData[2]), .A1(n3), .B0(n60), .B1(ALU_OUT_REG[2]), 
        .Y(n65) );
  OAI21X2M U65 ( .A0(n19), .A1(n58), .B0(n64), .Y(UART_TX_DATA[3]) );
  AOI22X1M U66 ( .A0(RF_RdData[3]), .A1(n3), .B0(n60), .B1(ALU_OUT_REG[3]), 
        .Y(n64) );
  OAI21X2M U67 ( .A0(n18), .A1(n58), .B0(n63), .Y(UART_TX_DATA[4]) );
  AOI22X1M U68 ( .A0(RF_RdData[4]), .A1(n3), .B0(n60), .B1(ALU_OUT_REG[4]), 
        .Y(n63) );
  OAI21X2M U69 ( .A0(n17), .A1(n58), .B0(n62), .Y(UART_TX_DATA[5]) );
  AOI22X1M U70 ( .A0(RF_RdData[5]), .A1(n3), .B0(n60), .B1(ALU_OUT_REG[5]), 
        .Y(n62) );
  OAI21X2M U71 ( .A0(n16), .A1(n58), .B0(n61), .Y(UART_TX_DATA[6]) );
  AOI22X1M U72 ( .A0(RF_RdData[6]), .A1(n3), .B0(n60), .B1(ALU_OUT_REG[6]), 
        .Y(n61) );
  OAI21X2M U73 ( .A0(n15), .A1(n58), .B0(n59), .Y(UART_TX_DATA[7]) );
  AOI22X1M U74 ( .A0(RF_RdData[7]), .A1(n3), .B0(n60), .B1(ALU_OUT_REG[7]), 
        .Y(n59) );
  AND4X2M U75 ( .A(UART_RX_DATA[6]), .B(UART_RX_DATA[2]), .C(UART_RX_VLD), .D(
        n42), .Y(n33) );
  NOR4X1M U76 ( .A(UART_RX_DATA[5]), .B(UART_RX_DATA[1]), .C(n43), .D(n44), 
        .Y(n42) );
  NAND3X2M U77 ( .A(RF_RdData_VLD), .B(n35), .C(n68), .Y(n57) );
  NOR3X2M U78 ( .A(FIFO_FULL), .B(current_state[3]), .C(current_state[1]), .Y(
        n68) );
  INVX2M U79 ( .A(current_state[0]), .Y(n5) );
  AND4X2M U80 ( .A(n38), .B(n39), .C(n40), .D(n41), .Y(n29) );
  NAND3X2M U81 ( .A(UART_RX_DATA[0]), .B(n33), .C(UART_RX_DATA[4]), .Y(n38) );
  INVX2M U82 ( .A(UART_RX_DATA[1]), .Y(n28) );
  AND4X2M U83 ( .A(UART_RX_DATA[1]), .B(UART_RX_VLD), .C(UART_RX_DATA[5]), .D(
        n55), .Y(n49) );
  NOR4X1M U84 ( .A(UART_RX_DATA[6]), .B(UART_RX_DATA[2]), .C(n43), .D(n44), 
        .Y(n55) );
  INVX2M U85 ( .A(UART_RX_DATA[3]), .Y(n26) );
  NAND3X2M U86 ( .A(UART_RX_DATA[4]), .B(UART_RX_DATA[0]), .C(n49), .Y(n36) );
  NAND4X2M U87 ( .A(UART_RX_VLD), .B(n53), .C(current_state[0]), .D(n10), .Y(
        n45) );
  OAI22X1M U88 ( .A0(n92), .A1(n45), .B0(n9), .B1(n14), .Y(n88) );
  OAI22X1M U89 ( .A0(n28), .A1(n45), .B0(n9), .B1(n13), .Y(n89) );
  OAI22X1M U90 ( .A0(n27), .A1(n45), .B0(n9), .B1(n12), .Y(n90) );
  OAI22X1M U91 ( .A0(n26), .A1(n45), .B0(n9), .B1(n11), .Y(n91) );
  NAND3X2M U92 ( .A(current_state[1]), .B(current_state[3]), .C(n35), .Y(n39)
         );
  OAI211X2M U93 ( .A0(n93), .A1(n32), .B0(n50), .C0(n51), .Y(next_state[0]) );
  AOI211X2M U94 ( .A0(n52), .A1(n53), .B0(n54), .C0(n7), .Y(n51) );
  AOI32X1M U95 ( .A0(n92), .A1(n25), .A2(n49), .B0(n8), .B1(n93), .Y(n50) );
  AOI21X2M U96 ( .A0(UART_RX_VLD), .A1(current_state[1]), .B0(n5), .Y(n52) );
  NAND2X2M U97 ( .A(UART_RX_DATA[7]), .B(UART_RX_DATA[3]), .Y(n44) );
  OAI2BB2X1M U98 ( .B0(n54), .B1(n22), .A0N(ALU_OUT[8]), .A1N(n54), .Y(n80) );
  OAI2BB2X1M U99 ( .B0(n54), .B1(n21), .A0N(ALU_OUT[9]), .A1N(n54), .Y(n81) );
  OAI2BB2X1M U100 ( .B0(n54), .B1(n20), .A0N(ALU_OUT[10]), .A1N(n54), .Y(n82)
         );
  OAI2BB2X1M U101 ( .B0(n54), .B1(n19), .A0N(ALU_OUT[11]), .A1N(n54), .Y(n83)
         );
  OAI2BB2X1M U102 ( .B0(n54), .B1(n18), .A0N(ALU_OUT[12]), .A1N(n54), .Y(n84)
         );
  OAI2BB2X1M U103 ( .B0(n54), .B1(n17), .A0N(ALU_OUT[13]), .A1N(n54), .Y(n85)
         );
  OAI2BB2X1M U104 ( .B0(n54), .B1(n16), .A0N(ALU_OUT[14]), .A1N(n54), .Y(n86)
         );
  OAI2BB2X1M U105 ( .B0(n54), .B1(n15), .A0N(ALU_OUT[15]), .A1N(n54), .Y(n87)
         );
  INVX2M U106 ( .A(current_state[1]), .Y(n10) );
  INVX2M U107 ( .A(UART_RX_DATA[4]), .Y(n25) );
  NOR2BX2M U108 ( .AN(ALU_OUT_VLD), .B(n39), .Y(n54) );
  AO2B2X2M U109 ( .B0(ALU_OUT[1]), .B1(n54), .A0(ALU_OUT_REG[1]), .A1N(n54), 
        .Y(n73) );
  AO2B2X2M U110 ( .B0(ALU_OUT[2]), .B1(n54), .A0(ALU_OUT_REG[2]), .A1N(n54), 
        .Y(n74) );
  AO2B2X2M U111 ( .B0(ALU_OUT[3]), .B1(n54), .A0(ALU_OUT_REG[3]), .A1N(n54), 
        .Y(n75) );
  AO2B2X2M U112 ( .B0(ALU_OUT[4]), .B1(n54), .A0(ALU_OUT_REG[4]), .A1N(n54), 
        .Y(n76) );
  AO2B2X2M U113 ( .B0(ALU_OUT[5]), .B1(n54), .A0(ALU_OUT_REG[5]), .A1N(n54), 
        .Y(n77) );
  AO2B2X2M U114 ( .B0(ALU_OUT[6]), .B1(n54), .A0(ALU_OUT_REG[6]), .A1N(n54), 
        .Y(n78) );
  AO2B2X2M U115 ( .B0(ALU_OUT[7]), .B1(n54), .A0(ALU_OUT_REG[7]), .A1N(n54), 
        .Y(n79) );
  AO2B2X2M U116 ( .B0(ALU_OUT[0]), .B1(n54), .A0(ALU_OUT_REG[0]), .A1N(n54), 
        .Y(n72) );
endmodule


module RegFile ( CLK, RST, WrEn, RdEn, Address, WrData, RdData, RdData_VLD, 
        REG0, REG1, REG2, REG3 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn;
  output RdData_VLD;
  wire   N11, N12, N13, N14, \regArr[15][7] , \regArr[15][6] , \regArr[15][5] ,
         \regArr[15][4] , \regArr[15][3] , \regArr[15][2] , \regArr[15][1] ,
         \regArr[15][0] , \regArr[14][7] , \regArr[14][6] , \regArr[14][5] ,
         \regArr[14][4] , \regArr[14][3] , \regArr[14][2] , \regArr[14][1] ,
         \regArr[14][0] , \regArr[13][7] , \regArr[13][6] , \regArr[13][5] ,
         \regArr[13][4] , \regArr[13][3] , \regArr[13][2] , \regArr[13][1] ,
         \regArr[13][0] , \regArr[12][7] , \regArr[12][6] , \regArr[12][5] ,
         \regArr[12][4] , \regArr[12][3] , \regArr[12][2] , \regArr[12][1] ,
         \regArr[12][0] , \regArr[11][7] , \regArr[11][6] , \regArr[11][5] ,
         \regArr[11][4] , \regArr[11][3] , \regArr[11][2] , \regArr[11][1] ,
         \regArr[11][0] , \regArr[10][7] , \regArr[10][6] , \regArr[10][5] ,
         \regArr[10][4] , \regArr[10][3] , \regArr[10][2] , \regArr[10][1] ,
         \regArr[10][0] , \regArr[9][7] , \regArr[9][6] , \regArr[9][5] ,
         \regArr[9][4] , \regArr[9][3] , \regArr[9][2] , \regArr[9][1] ,
         \regArr[9][0] , \regArr[8][7] , \regArr[8][6] , \regArr[8][5] ,
         \regArr[8][4] , \regArr[8][3] , \regArr[8][2] , \regArr[8][1] ,
         \regArr[8][0] , \regArr[7][7] , \regArr[7][6] , \regArr[7][5] ,
         \regArr[7][4] , \regArr[7][3] , \regArr[7][2] , \regArr[7][1] ,
         \regArr[7][0] , \regArr[6][7] , \regArr[6][6] , \regArr[6][5] ,
         \regArr[6][4] , \regArr[6][3] , \regArr[6][2] , \regArr[6][1] ,
         \regArr[6][0] , \regArr[5][7] , \regArr[5][6] , \regArr[5][5] ,
         \regArr[5][4] , \regArr[5][3] , \regArr[5][2] , \regArr[5][1] ,
         \regArr[5][0] , \regArr[4][7] , \regArr[4][6] , \regArr[4][5] ,
         \regArr[4][4] , \regArr[4][3] , \regArr[4][2] , \regArr[4][1] ,
         \regArr[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n12, n13, n14,
         n15, n16, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n17, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFRHQX8M \regArr_reg[1][7]  ( .D(n64), .CK(CLK), .RN(n204), .Q(REG1[7]) );
  DFFRQX2M \regArr_reg[13][7]  ( .D(n160), .CK(CLK), .RN(n212), .Q(
        \regArr[13][7] ) );
  DFFRQX2M \regArr_reg[13][6]  ( .D(n159), .CK(CLK), .RN(n212), .Q(
        \regArr[13][6] ) );
  DFFRQX2M \regArr_reg[13][5]  ( .D(n158), .CK(CLK), .RN(n211), .Q(
        \regArr[13][5] ) );
  DFFRQX2M \regArr_reg[13][4]  ( .D(n157), .CK(CLK), .RN(n211), .Q(
        \regArr[13][4] ) );
  DFFRQX2M \regArr_reg[13][3]  ( .D(n156), .CK(CLK), .RN(n211), .Q(
        \regArr[13][3] ) );
  DFFRQX2M \regArr_reg[13][2]  ( .D(n155), .CK(CLK), .RN(n211), .Q(
        \regArr[13][2] ) );
  DFFRQX2M \regArr_reg[13][1]  ( .D(n154), .CK(CLK), .RN(n211), .Q(
        \regArr[13][1] ) );
  DFFRQX2M \regArr_reg[13][0]  ( .D(n153), .CK(CLK), .RN(n211), .Q(
        \regArr[13][0] ) );
  DFFRQX2M \regArr_reg[9][7]  ( .D(n128), .CK(CLK), .RN(n209), .Q(
        \regArr[9][7] ) );
  DFFRQX2M \regArr_reg[9][6]  ( .D(n127), .CK(CLK), .RN(n209), .Q(
        \regArr[9][6] ) );
  DFFRQX2M \regArr_reg[9][5]  ( .D(n126), .CK(CLK), .RN(n209), .Q(
        \regArr[9][5] ) );
  DFFRQX2M \regArr_reg[9][4]  ( .D(n125), .CK(CLK), .RN(n209), .Q(
        \regArr[9][4] ) );
  DFFRQX2M \regArr_reg[9][3]  ( .D(n124), .CK(CLK), .RN(n209), .Q(
        \regArr[9][3] ) );
  DFFRQX2M \regArr_reg[9][2]  ( .D(n123), .CK(CLK), .RN(n209), .Q(
        \regArr[9][2] ) );
  DFFRQX2M \regArr_reg[9][1]  ( .D(n122), .CK(CLK), .RN(n209), .Q(
        \regArr[9][1] ) );
  DFFRQX2M \regArr_reg[9][0]  ( .D(n121), .CK(CLK), .RN(n209), .Q(
        \regArr[9][0] ) );
  DFFRQX2M \regArr_reg[5][7]  ( .D(n96), .CK(CLK), .RN(n207), .Q(
        \regArr[5][7] ) );
  DFFRQX2M \regArr_reg[5][6]  ( .D(n95), .CK(CLK), .RN(n207), .Q(
        \regArr[5][6] ) );
  DFFRQX2M \regArr_reg[5][5]  ( .D(n94), .CK(CLK), .RN(n207), .Q(
        \regArr[5][5] ) );
  DFFRQX2M \regArr_reg[5][4]  ( .D(n93), .CK(CLK), .RN(n207), .Q(
        \regArr[5][4] ) );
  DFFRQX2M \regArr_reg[5][3]  ( .D(n92), .CK(CLK), .RN(n207), .Q(
        \regArr[5][3] ) );
  DFFRQX2M \regArr_reg[5][2]  ( .D(n91), .CK(CLK), .RN(n207), .Q(
        \regArr[5][2] ) );
  DFFRQX2M \regArr_reg[5][1]  ( .D(n90), .CK(CLK), .RN(n207), .Q(
        \regArr[5][1] ) );
  DFFRQX2M \regArr_reg[5][0]  ( .D(n89), .CK(CLK), .RN(n207), .Q(
        \regArr[5][0] ) );
  DFFRQX2M \regArr_reg[15][7]  ( .D(n176), .CK(CLK), .RN(n204), .Q(
        \regArr[15][7] ) );
  DFFRQX2M \regArr_reg[15][6]  ( .D(n175), .CK(CLK), .RN(n213), .Q(
        \regArr[15][6] ) );
  DFFRQX2M \regArr_reg[15][5]  ( .D(n174), .CK(CLK), .RN(n213), .Q(
        \regArr[15][5] ) );
  DFFRQX2M \regArr_reg[15][4]  ( .D(n173), .CK(CLK), .RN(n212), .Q(
        \regArr[15][4] ) );
  DFFRQX2M \regArr_reg[15][3]  ( .D(n172), .CK(CLK), .RN(n212), .Q(
        \regArr[15][3] ) );
  DFFRQX2M \regArr_reg[15][2]  ( .D(n171), .CK(CLK), .RN(n212), .Q(
        \regArr[15][2] ) );
  DFFRQX2M \regArr_reg[15][1]  ( .D(n170), .CK(CLK), .RN(n212), .Q(
        \regArr[15][1] ) );
  DFFRQX2M \regArr_reg[15][0]  ( .D(n169), .CK(CLK), .RN(n212), .Q(
        \regArr[15][0] ) );
  DFFRQX2M \regArr_reg[11][7]  ( .D(n144), .CK(CLK), .RN(n211), .Q(
        \regArr[11][7] ) );
  DFFRQX2M \regArr_reg[11][6]  ( .D(n143), .CK(CLK), .RN(n210), .Q(
        \regArr[11][6] ) );
  DFFRQX2M \regArr_reg[11][5]  ( .D(n142), .CK(CLK), .RN(n210), .Q(
        \regArr[11][5] ) );
  DFFRQX2M \regArr_reg[11][4]  ( .D(n141), .CK(CLK), .RN(n210), .Q(
        \regArr[11][4] ) );
  DFFRQX2M \regArr_reg[11][3]  ( .D(n140), .CK(CLK), .RN(n210), .Q(
        \regArr[11][3] ) );
  DFFRQX2M \regArr_reg[11][2]  ( .D(n139), .CK(CLK), .RN(n210), .Q(
        \regArr[11][2] ) );
  DFFRQX2M \regArr_reg[11][1]  ( .D(n138), .CK(CLK), .RN(n210), .Q(
        \regArr[11][1] ) );
  DFFRQX2M \regArr_reg[11][0]  ( .D(n137), .CK(CLK), .RN(n210), .Q(
        \regArr[11][0] ) );
  DFFRQX2M \regArr_reg[7][7]  ( .D(n112), .CK(CLK), .RN(n208), .Q(
        \regArr[7][7] ) );
  DFFRQX2M \regArr_reg[7][6]  ( .D(n111), .CK(CLK), .RN(n208), .Q(
        \regArr[7][6] ) );
  DFFRQX2M \regArr_reg[7][5]  ( .D(n110), .CK(CLK), .RN(n208), .Q(
        \regArr[7][5] ) );
  DFFRQX2M \regArr_reg[7][4]  ( .D(n109), .CK(CLK), .RN(n208), .Q(
        \regArr[7][4] ) );
  DFFRQX2M \regArr_reg[7][3]  ( .D(n108), .CK(CLK), .RN(n208), .Q(
        \regArr[7][3] ) );
  DFFRQX2M \regArr_reg[7][2]  ( .D(n107), .CK(CLK), .RN(n208), .Q(
        \regArr[7][2] ) );
  DFFRQX2M \regArr_reg[7][1]  ( .D(n106), .CK(CLK), .RN(n208), .Q(
        \regArr[7][1] ) );
  DFFRQX2M \regArr_reg[7][0]  ( .D(n105), .CK(CLK), .RN(n208), .Q(
        \regArr[7][0] ) );
  DFFRQX2M \regArr_reg[14][7]  ( .D(n168), .CK(CLK), .RN(n212), .Q(
        \regArr[14][7] ) );
  DFFRQX2M \regArr_reg[14][6]  ( .D(n167), .CK(CLK), .RN(n212), .Q(
        \regArr[14][6] ) );
  DFFRQX2M \regArr_reg[14][5]  ( .D(n166), .CK(CLK), .RN(n212), .Q(
        \regArr[14][5] ) );
  DFFRQX2M \regArr_reg[14][4]  ( .D(n165), .CK(CLK), .RN(n212), .Q(
        \regArr[14][4] ) );
  DFFRQX2M \regArr_reg[14][3]  ( .D(n164), .CK(CLK), .RN(n212), .Q(
        \regArr[14][3] ) );
  DFFRQX2M \regArr_reg[14][2]  ( .D(n163), .CK(CLK), .RN(n212), .Q(
        \regArr[14][2] ) );
  DFFRQX2M \regArr_reg[14][1]  ( .D(n162), .CK(CLK), .RN(n212), .Q(
        \regArr[14][1] ) );
  DFFRQX2M \regArr_reg[14][0]  ( .D(n161), .CK(CLK), .RN(n212), .Q(
        \regArr[14][0] ) );
  DFFRQX2M \regArr_reg[10][7]  ( .D(n136), .CK(CLK), .RN(n210), .Q(
        \regArr[10][7] ) );
  DFFRQX2M \regArr_reg[10][6]  ( .D(n135), .CK(CLK), .RN(n210), .Q(
        \regArr[10][6] ) );
  DFFRQX2M \regArr_reg[10][5]  ( .D(n134), .CK(CLK), .RN(n210), .Q(
        \regArr[10][5] ) );
  DFFRQX2M \regArr_reg[10][4]  ( .D(n133), .CK(CLK), .RN(n210), .Q(
        \regArr[10][4] ) );
  DFFRQX2M \regArr_reg[10][3]  ( .D(n132), .CK(CLK), .RN(n210), .Q(
        \regArr[10][3] ) );
  DFFRQX2M \regArr_reg[10][2]  ( .D(n131), .CK(CLK), .RN(n210), .Q(
        \regArr[10][2] ) );
  DFFRQX2M \regArr_reg[10][1]  ( .D(n130), .CK(CLK), .RN(n210), .Q(
        \regArr[10][1] ) );
  DFFRQX2M \regArr_reg[10][0]  ( .D(n129), .CK(CLK), .RN(n210), .Q(
        \regArr[10][0] ) );
  DFFRQX2M \regArr_reg[6][7]  ( .D(n104), .CK(CLK), .RN(n208), .Q(
        \regArr[6][7] ) );
  DFFRQX2M \regArr_reg[6][6]  ( .D(n103), .CK(CLK), .RN(n208), .Q(
        \regArr[6][6] ) );
  DFFRQX2M \regArr_reg[6][5]  ( .D(n102), .CK(CLK), .RN(n208), .Q(
        \regArr[6][5] ) );
  DFFRQX2M \regArr_reg[6][4]  ( .D(n101), .CK(CLK), .RN(n208), .Q(
        \regArr[6][4] ) );
  DFFRQX2M \regArr_reg[6][3]  ( .D(n100), .CK(CLK), .RN(n208), .Q(
        \regArr[6][3] ) );
  DFFRQX2M \regArr_reg[6][2]  ( .D(n99), .CK(CLK), .RN(n207), .Q(
        \regArr[6][2] ) );
  DFFRQX2M \regArr_reg[6][1]  ( .D(n98), .CK(CLK), .RN(n207), .Q(
        \regArr[6][1] ) );
  DFFRQX2M \regArr_reg[6][0]  ( .D(n97), .CK(CLK), .RN(n207), .Q(
        \regArr[6][0] ) );
  DFFRQX2M \regArr_reg[12][7]  ( .D(n152), .CK(CLK), .RN(n211), .Q(
        \regArr[12][7] ) );
  DFFRQX2M \regArr_reg[12][6]  ( .D(n151), .CK(CLK), .RN(n211), .Q(
        \regArr[12][6] ) );
  DFFRQX2M \regArr_reg[12][5]  ( .D(n150), .CK(CLK), .RN(n211), .Q(
        \regArr[12][5] ) );
  DFFRQX2M \regArr_reg[12][4]  ( .D(n149), .CK(CLK), .RN(n211), .Q(
        \regArr[12][4] ) );
  DFFRQX2M \regArr_reg[12][3]  ( .D(n148), .CK(CLK), .RN(n211), .Q(
        \regArr[12][3] ) );
  DFFRQX2M \regArr_reg[12][2]  ( .D(n147), .CK(CLK), .RN(n211), .Q(
        \regArr[12][2] ) );
  DFFRQX2M \regArr_reg[12][1]  ( .D(n146), .CK(CLK), .RN(n211), .Q(
        \regArr[12][1] ) );
  DFFRQX2M \regArr_reg[12][0]  ( .D(n145), .CK(CLK), .RN(n211), .Q(
        \regArr[12][0] ) );
  DFFRQX2M \regArr_reg[8][7]  ( .D(n120), .CK(CLK), .RN(n209), .Q(
        \regArr[8][7] ) );
  DFFRQX2M \regArr_reg[8][6]  ( .D(n119), .CK(CLK), .RN(n209), .Q(
        \regArr[8][6] ) );
  DFFRQX2M \regArr_reg[8][5]  ( .D(n118), .CK(CLK), .RN(n209), .Q(
        \regArr[8][5] ) );
  DFFRQX2M \regArr_reg[8][4]  ( .D(n117), .CK(CLK), .RN(n209), .Q(
        \regArr[8][4] ) );
  DFFRQX2M \regArr_reg[8][3]  ( .D(n116), .CK(CLK), .RN(n209), .Q(
        \regArr[8][3] ) );
  DFFRQX2M \regArr_reg[8][2]  ( .D(n115), .CK(CLK), .RN(n209), .Q(
        \regArr[8][2] ) );
  DFFRQX2M \regArr_reg[8][1]  ( .D(n114), .CK(CLK), .RN(n209), .Q(
        \regArr[8][1] ) );
  DFFRQX2M \regArr_reg[8][0]  ( .D(n113), .CK(CLK), .RN(n208), .Q(
        \regArr[8][0] ) );
  DFFRQX2M \regArr_reg[4][7]  ( .D(n88), .CK(CLK), .RN(n207), .Q(
        \regArr[4][7] ) );
  DFFRQX2M \regArr_reg[4][6]  ( .D(n87), .CK(CLK), .RN(n207), .Q(
        \regArr[4][6] ) );
  DFFRQX2M \regArr_reg[4][5]  ( .D(n86), .CK(CLK), .RN(n207), .Q(
        \regArr[4][5] ) );
  DFFRQX2M \regArr_reg[4][4]  ( .D(n85), .CK(CLK), .RN(n207), .Q(
        \regArr[4][4] ) );
  DFFRQX2M \regArr_reg[4][3]  ( .D(n84), .CK(CLK), .RN(n206), .Q(
        \regArr[4][3] ) );
  DFFRQX2M \regArr_reg[4][2]  ( .D(n83), .CK(CLK), .RN(n206), .Q(
        \regArr[4][2] ) );
  DFFRQX2M \regArr_reg[4][1]  ( .D(n82), .CK(CLK), .RN(n206), .Q(
        \regArr[4][1] ) );
  DFFRQX2M \regArr_reg[4][0]  ( .D(n81), .CK(CLK), .RN(n206), .Q(
        \regArr[4][0] ) );
  DFFRQX2M \regArr_reg[3][0]  ( .D(n73), .CK(CLK), .RN(n206), .Q(REG3[0]) );
  DFFRQX2M \RdData_reg[7]  ( .D(n47), .CK(CLK), .RN(n204), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n46), .CK(CLK), .RN(n204), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n45), .CK(CLK), .RN(n204), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n44), .CK(CLK), .RN(n206), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n43), .CK(CLK), .RN(n204), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n42), .CK(CLK), .RN(n204), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n41), .CK(CLK), .RN(n204), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n40), .CK(CLK), .RN(n208), .Q(RdData[0]) );
  DFFRQX2M \regArr_reg[3][6]  ( .D(n79), .CK(CLK), .RN(n206), .Q(REG3[6]) );
  DFFRQX2M \regArr_reg[3][4]  ( .D(n77), .CK(CLK), .RN(n206), .Q(REG3[4]) );
  DFFRQX2M \regArr_reg[3][2]  ( .D(n75), .CK(CLK), .RN(n206), .Q(REG3[2]) );
  DFFRQX2M \regArr_reg[3][7]  ( .D(n80), .CK(CLK), .RN(n206), .Q(REG3[7]) );
  DFFRQX2M \regArr_reg[3][3]  ( .D(n76), .CK(CLK), .RN(n206), .Q(REG3[3]) );
  DFFSQX2M \regArr_reg[3][5]  ( .D(n78), .CK(CLK), .SN(n204), .Q(REG3[5]) );
  DFFSQX2M \regArr_reg[2][0]  ( .D(n65), .CK(CLK), .SN(n204), .Q(REG2[0]) );
  DFFRQX2M \regArr_reg[2][1]  ( .D(n66), .CK(CLK), .RN(n205), .Q(REG2[1]) );
  DFFRQX2M RdData_VLD_reg ( .D(n48), .CK(CLK), .RN(n204), .Q(RdData_VLD) );
  DFFRQX2M \regArr_reg[3][1]  ( .D(n74), .CK(CLK), .RN(n206), .Q(REG3[1]) );
  DFFRQX2M \regArr_reg[2][4]  ( .D(n69), .CK(CLK), .RN(n206), .Q(REG2[4]) );
  DFFSQX2M \regArr_reg[2][7]  ( .D(n72), .CK(CLK), .SN(n204), .Q(REG2[7]) );
  DFFRQX2M \regArr_reg[2][3]  ( .D(n68), .CK(CLK), .RN(n205), .Q(REG2[3]) );
  DFFRQX2M \regArr_reg[2][6]  ( .D(n71), .CK(CLK), .RN(n206), .Q(REG2[6]) );
  DFFRQX2M \regArr_reg[2][2]  ( .D(n67), .CK(CLK), .RN(n205), .Q(REG2[2]) );
  DFFRQX2M \regArr_reg[0][2]  ( .D(n51), .CK(CLK), .RN(n205), .Q(REG0[2]) );
  DFFRQX2M \regArr_reg[0][1]  ( .D(n50), .CK(CLK), .RN(n205), .Q(REG0[1]) );
  DFFRQX2M \regArr_reg[0][0]  ( .D(n49), .CK(CLK), .RN(n204), .Q(REG0[0]) );
  DFFRQX2M \regArr_reg[0][3]  ( .D(n52), .CK(CLK), .RN(n205), .Q(REG0[3]) );
  DFFRQX2M \regArr_reg[0][4]  ( .D(n53), .CK(CLK), .RN(n205), .Q(REG0[4]) );
  DFFRQX2M \regArr_reg[2][5]  ( .D(n70), .CK(CLK), .RN(n206), .Q(REG2[5]) );
  DFFRQX1M \regArr_reg[0][5]  ( .D(n54), .CK(CLK), .RN(RST), .Q(REG0[5]) );
  DFFRHQX2M \regArr_reg[1][0]  ( .D(n57), .CK(CLK), .RN(n204), .Q(REG1[0]) );
  DFFRQX2M \regArr_reg[1][2]  ( .D(n59), .CK(CLK), .RN(n205), .Q(REG1[2]) );
  DFFRHQX2M \regArr_reg[1][3]  ( .D(n60), .CK(CLK), .RN(n205), .Q(REG1[3]) );
  DFFRHQX2M \regArr_reg[1][5]  ( .D(n62), .CK(CLK), .RN(n205), .Q(REG1[5]) );
  DFFRHQX2M \regArr_reg[1][4]  ( .D(n61), .CK(CLK), .RN(n205), .Q(REG1[4]) );
  DFFRHQX1M \regArr_reg[1][1]  ( .D(n58), .CK(CLK), .RN(n205), .Q(REG1[1]) );
  DFFRHQX1M \regArr_reg[0][7]  ( .D(n56), .CK(CLK), .RN(n205), .Q(REG0[7]) );
  DFFRQX2M \regArr_reg[0][6]  ( .D(n55), .CK(CLK), .RN(n205), .Q(REG0[6]) );
  DFFRHQX4M \regArr_reg[1][6]  ( .D(n63), .CK(CLK), .RN(n204), .Q(REG1[6]) );
  MX2XLM U3 ( .A(REG1[7]), .B(WrData[7]), .S0(n1), .Y(n64) );
  NOR2X2M U4 ( .A(n221), .B(n220), .Y(n1) );
  NOR2BX2M U5 ( .AN(n38), .B(n202), .Y(n32) );
  NOR2BX2M U6 ( .AN(n27), .B(n202), .Y(n18) );
  NOR2BX2M U7 ( .AN(N13), .B(N12), .Y(n23) );
  NOR2BX2M U8 ( .AN(N13), .B(n203), .Y(n26) );
  NOR2X2M U9 ( .A(n203), .B(N13), .Y(n20) );
  MX2XLM U10 ( .A(REG0[5]), .B(WrData[5]), .S0(n219), .Y(n54) );
  MX2XLM U11 ( .A(REG0[6]), .B(WrData[6]), .S0(n219), .Y(n55) );
  INVX2M U12 ( .A(n199), .Y(n201) );
  INVX2M U13 ( .A(n14), .Y(n219) );
  INVX2M U14 ( .A(n199), .Y(n200) );
  NAND2BX2M U15 ( .AN(n221), .B(n16), .Y(n14) );
  BUFX2M U16 ( .A(n202), .Y(n199) );
  INVX2M U17 ( .A(n203), .Y(n198) );
  INVX2M U18 ( .A(n12), .Y(n230) );
  NOR2BX2M U19 ( .AN(n38), .B(n200), .Y(n30) );
  NOR2BX2M U20 ( .AN(n27), .B(n200), .Y(n16) );
  NAND2X2M U21 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U22 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U23 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U24 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U25 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U26 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U27 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U28 ( .A(n32), .B(n26), .Y(n39) );
  NAND2X2M U29 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U30 ( .A(n20), .B(n18), .Y(n21) );
  NAND2X2M U31 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U32 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U33 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U34 ( .A(n26), .B(n18), .Y(n28) );
  INVX2M U35 ( .A(WrData[0]), .Y(n222) );
  INVX2M U36 ( .A(WrData[1]), .Y(n223) );
  INVX2M U37 ( .A(WrData[2]), .Y(n224) );
  INVX2M U38 ( .A(WrData[3]), .Y(n225) );
  INVX2M U39 ( .A(WrData[4]), .Y(n226) );
  NAND2BX2M U40 ( .AN(WrEn), .B(RdEn), .Y(n12) );
  NOR2BX2M U41 ( .AN(WrEn), .B(RdEn), .Y(n13) );
  INVX2M U42 ( .A(n18), .Y(n220) );
  INVX2M U43 ( .A(n15), .Y(n221) );
  BUFX2M U44 ( .A(n218), .Y(n204) );
  BUFX2M U45 ( .A(n218), .Y(n205) );
  BUFX2M U46 ( .A(n217), .Y(n206) );
  BUFX2M U47 ( .A(n217), .Y(n207) );
  BUFX2M U48 ( .A(n216), .Y(n208) );
  BUFX2M U49 ( .A(n216), .Y(n209) );
  BUFX2M U50 ( .A(n215), .Y(n210) );
  BUFX2M U51 ( .A(n215), .Y(n211) );
  BUFX2M U52 ( .A(n214), .Y(n212) );
  BUFX2M U53 ( .A(n214), .Y(n213) );
  NOR2BX2M U54 ( .AN(n13), .B(N14), .Y(n27) );
  AND2X2M U55 ( .A(N14), .B(n13), .Y(n38) );
  NOR2X2M U56 ( .A(N12), .B(N13), .Y(n15) );
  INVX2M U57 ( .A(WrData[5]), .Y(n227) );
  INVX2M U58 ( .A(WrData[6]), .Y(n228) );
  INVX2M U59 ( .A(WrData[7]), .Y(n229) );
  BUFX2M U60 ( .A(RST), .Y(n217) );
  BUFX2M U61 ( .A(RST), .Y(n216) );
  BUFX2M U62 ( .A(RST), .Y(n215) );
  BUFX2M U63 ( .A(RST), .Y(n214) );
  BUFX2M U64 ( .A(RST), .Y(n218) );
  INVX2M U65 ( .A(N11), .Y(n202) );
  OAI2BB2X1M U66 ( .B0(n222), .B1(n29), .A0N(\regArr[8][0] ), .A1N(n29), .Y(
        n113) );
  OAI2BB2X1M U67 ( .B0(n223), .B1(n29), .A0N(\regArr[8][1] ), .A1N(n29), .Y(
        n114) );
  OAI2BB2X1M U68 ( .B0(n224), .B1(n29), .A0N(\regArr[8][2] ), .A1N(n29), .Y(
        n115) );
  OAI2BB2X1M U69 ( .B0(n225), .B1(n29), .A0N(\regArr[8][3] ), .A1N(n29), .Y(
        n116) );
  OAI2BB2X1M U70 ( .B0(n226), .B1(n29), .A0N(\regArr[8][4] ), .A1N(n29), .Y(
        n117) );
  OAI2BB2X1M U71 ( .B0(n227), .B1(n29), .A0N(\regArr[8][5] ), .A1N(n29), .Y(
        n118) );
  OAI2BB2X1M U72 ( .B0(n228), .B1(n29), .A0N(\regArr[8][6] ), .A1N(n29), .Y(
        n119) );
  OAI2BB2X1M U73 ( .B0(n229), .B1(n29), .A0N(\regArr[8][7] ), .A1N(n29), .Y(
        n120) );
  OAI2BB2X1M U74 ( .B0(n222), .B1(n31), .A0N(\regArr[9][0] ), .A1N(n31), .Y(
        n121) );
  OAI2BB2X1M U75 ( .B0(n223), .B1(n31), .A0N(\regArr[9][1] ), .A1N(n31), .Y(
        n122) );
  OAI2BB2X1M U76 ( .B0(n224), .B1(n31), .A0N(\regArr[9][2] ), .A1N(n31), .Y(
        n123) );
  OAI2BB2X1M U77 ( .B0(n225), .B1(n31), .A0N(\regArr[9][3] ), .A1N(n31), .Y(
        n124) );
  OAI2BB2X1M U78 ( .B0(n226), .B1(n31), .A0N(\regArr[9][4] ), .A1N(n31), .Y(
        n125) );
  OAI2BB2X1M U79 ( .B0(n227), .B1(n31), .A0N(\regArr[9][5] ), .A1N(n31), .Y(
        n126) );
  OAI2BB2X1M U80 ( .B0(n228), .B1(n31), .A0N(\regArr[9][6] ), .A1N(n31), .Y(
        n127) );
  OAI2BB2X1M U81 ( .B0(n229), .B1(n31), .A0N(\regArr[9][7] ), .A1N(n31), .Y(
        n128) );
  OAI2BB2X1M U82 ( .B0(n222), .B1(n33), .A0N(\regArr[10][0] ), .A1N(n33), .Y(
        n129) );
  OAI2BB2X1M U83 ( .B0(n223), .B1(n33), .A0N(\regArr[10][1] ), .A1N(n33), .Y(
        n130) );
  OAI2BB2X1M U84 ( .B0(n224), .B1(n33), .A0N(\regArr[10][2] ), .A1N(n33), .Y(
        n131) );
  OAI2BB2X1M U85 ( .B0(n225), .B1(n33), .A0N(\regArr[10][3] ), .A1N(n33), .Y(
        n132) );
  OAI2BB2X1M U86 ( .B0(n226), .B1(n33), .A0N(\regArr[10][4] ), .A1N(n33), .Y(
        n133) );
  OAI2BB2X1M U87 ( .B0(n227), .B1(n33), .A0N(\regArr[10][5] ), .A1N(n33), .Y(
        n134) );
  OAI2BB2X1M U88 ( .B0(n228), .B1(n33), .A0N(\regArr[10][6] ), .A1N(n33), .Y(
        n135) );
  OAI2BB2X1M U89 ( .B0(n229), .B1(n33), .A0N(\regArr[10][7] ), .A1N(n33), .Y(
        n136) );
  OAI2BB2X1M U90 ( .B0(n222), .B1(n34), .A0N(\regArr[11][0] ), .A1N(n34), .Y(
        n137) );
  OAI2BB2X1M U91 ( .B0(n223), .B1(n34), .A0N(\regArr[11][1] ), .A1N(n34), .Y(
        n138) );
  OAI2BB2X1M U92 ( .B0(n224), .B1(n34), .A0N(\regArr[11][2] ), .A1N(n34), .Y(
        n139) );
  OAI2BB2X1M U93 ( .B0(n225), .B1(n34), .A0N(\regArr[11][3] ), .A1N(n34), .Y(
        n140) );
  OAI2BB2X1M U94 ( .B0(n226), .B1(n34), .A0N(\regArr[11][4] ), .A1N(n34), .Y(
        n141) );
  OAI2BB2X1M U95 ( .B0(n227), .B1(n34), .A0N(\regArr[11][5] ), .A1N(n34), .Y(
        n142) );
  OAI2BB2X1M U96 ( .B0(n228), .B1(n34), .A0N(\regArr[11][6] ), .A1N(n34), .Y(
        n143) );
  OAI2BB2X1M U97 ( .B0(n229), .B1(n34), .A0N(\regArr[11][7] ), .A1N(n34), .Y(
        n144) );
  OAI2BB2X1M U98 ( .B0(n222), .B1(n35), .A0N(\regArr[12][0] ), .A1N(n35), .Y(
        n145) );
  OAI2BB2X1M U99 ( .B0(n223), .B1(n35), .A0N(\regArr[12][1] ), .A1N(n35), .Y(
        n146) );
  OAI2BB2X1M U100 ( .B0(n224), .B1(n35), .A0N(\regArr[12][2] ), .A1N(n35), .Y(
        n147) );
  OAI2BB2X1M U101 ( .B0(n225), .B1(n35), .A0N(\regArr[12][3] ), .A1N(n35), .Y(
        n148) );
  OAI2BB2X1M U102 ( .B0(n226), .B1(n35), .A0N(\regArr[12][4] ), .A1N(n35), .Y(
        n149) );
  OAI2BB2X1M U103 ( .B0(n227), .B1(n35), .A0N(\regArr[12][5] ), .A1N(n35), .Y(
        n150) );
  OAI2BB2X1M U104 ( .B0(n228), .B1(n35), .A0N(\regArr[12][6] ), .A1N(n35), .Y(
        n151) );
  OAI2BB2X1M U105 ( .B0(n229), .B1(n35), .A0N(\regArr[12][7] ), .A1N(n35), .Y(
        n152) );
  OAI2BB2X1M U106 ( .B0(n222), .B1(n36), .A0N(\regArr[13][0] ), .A1N(n36), .Y(
        n153) );
  OAI2BB2X1M U107 ( .B0(n223), .B1(n36), .A0N(\regArr[13][1] ), .A1N(n36), .Y(
        n154) );
  OAI2BB2X1M U108 ( .B0(n224), .B1(n36), .A0N(\regArr[13][2] ), .A1N(n36), .Y(
        n155) );
  OAI2BB2X1M U109 ( .B0(n225), .B1(n36), .A0N(\regArr[13][3] ), .A1N(n36), .Y(
        n156) );
  OAI2BB2X1M U110 ( .B0(n226), .B1(n36), .A0N(\regArr[13][4] ), .A1N(n36), .Y(
        n157) );
  OAI2BB2X1M U111 ( .B0(n227), .B1(n36), .A0N(\regArr[13][5] ), .A1N(n36), .Y(
        n158) );
  OAI2BB2X1M U112 ( .B0(n228), .B1(n36), .A0N(\regArr[13][6] ), .A1N(n36), .Y(
        n159) );
  OAI2BB2X1M U113 ( .B0(n229), .B1(n36), .A0N(\regArr[13][7] ), .A1N(n36), .Y(
        n160) );
  OAI2BB2X1M U114 ( .B0(n222), .B1(n37), .A0N(\regArr[14][0] ), .A1N(n37), .Y(
        n161) );
  OAI2BB2X1M U115 ( .B0(n223), .B1(n37), .A0N(\regArr[14][1] ), .A1N(n37), .Y(
        n162) );
  OAI2BB2X1M U116 ( .B0(n224), .B1(n37), .A0N(\regArr[14][2] ), .A1N(n37), .Y(
        n163) );
  OAI2BB2X1M U117 ( .B0(n225), .B1(n37), .A0N(\regArr[14][3] ), .A1N(n37), .Y(
        n164) );
  OAI2BB2X1M U118 ( .B0(n226), .B1(n37), .A0N(\regArr[14][4] ), .A1N(n37), .Y(
        n165) );
  OAI2BB2X1M U119 ( .B0(n227), .B1(n37), .A0N(\regArr[14][5] ), .A1N(n37), .Y(
        n166) );
  OAI2BB2X1M U120 ( .B0(n228), .B1(n37), .A0N(\regArr[14][6] ), .A1N(n37), .Y(
        n167) );
  OAI2BB2X1M U121 ( .B0(n229), .B1(n37), .A0N(\regArr[14][7] ), .A1N(n37), .Y(
        n168) );
  OAI2BB2X1M U122 ( .B0(n222), .B1(n39), .A0N(\regArr[15][0] ), .A1N(n39), .Y(
        n169) );
  OAI2BB2X1M U123 ( .B0(n223), .B1(n39), .A0N(\regArr[15][1] ), .A1N(n39), .Y(
        n170) );
  OAI2BB2X1M U124 ( .B0(n224), .B1(n39), .A0N(\regArr[15][2] ), .A1N(n39), .Y(
        n171) );
  OAI2BB2X1M U125 ( .B0(n225), .B1(n39), .A0N(\regArr[15][3] ), .A1N(n39), .Y(
        n172) );
  OAI2BB2X1M U126 ( .B0(n226), .B1(n39), .A0N(\regArr[15][4] ), .A1N(n39), .Y(
        n173) );
  OAI2BB2X1M U127 ( .B0(n227), .B1(n39), .A0N(\regArr[15][5] ), .A1N(n39), .Y(
        n174) );
  OAI2BB2X1M U128 ( .B0(n228), .B1(n39), .A0N(\regArr[15][6] ), .A1N(n39), .Y(
        n175) );
  OAI2BB2X1M U129 ( .B0(n229), .B1(n39), .A0N(\regArr[15][7] ), .A1N(n39), .Y(
        n176) );
  AO22X1M U130 ( .A0(N43), .A1(n230), .B0(RdData[0]), .B1(n12), .Y(n40) );
  MX4X1M U131 ( .A(n5), .B(n3), .C(n4), .D(n2), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U132 ( .A(\regArr[8][0] ), .B(\regArr[9][0] ), .C(\regArr[10][0] ), 
        .D(\regArr[11][0] ), .S0(n200), .S1(N12), .Y(n3) );
  MX4X1M U133 ( .A(\regArr[4][0] ), .B(\regArr[5][0] ), .C(\regArr[6][0] ), 
        .D(\regArr[7][0] ), .S0(n200), .S1(N12), .Y(n4) );
  AO22X1M U134 ( .A0(N42), .A1(n230), .B0(RdData[1]), .B1(n12), .Y(n41) );
  MX4X1M U135 ( .A(n9), .B(n7), .C(n8), .D(n6), .S0(N14), .S1(N13), .Y(N42) );
  MX4X1M U136 ( .A(\regArr[8][1] ), .B(\regArr[9][1] ), .C(\regArr[10][1] ), 
        .D(\regArr[11][1] ), .S0(n200), .S1(N12), .Y(n7) );
  MX4X1M U137 ( .A(\regArr[12][1] ), .B(\regArr[13][1] ), .C(\regArr[14][1] ), 
        .D(\regArr[15][1] ), .S0(n200), .S1(N12), .Y(n6) );
  AO22X1M U138 ( .A0(N41), .A1(n230), .B0(RdData[2]), .B1(n12), .Y(n42) );
  MX4X1M U139 ( .A(n177), .B(n11), .C(n17), .D(n10), .S0(N14), .S1(N13), .Y(
        N41) );
  MX4XLM U140 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n201), 
        .S1(N12), .Y(n177) );
  MX4X1M U141 ( .A(\regArr[8][2] ), .B(\regArr[9][2] ), .C(\regArr[10][2] ), 
        .D(\regArr[11][2] ), .S0(n201), .S1(N12), .Y(n11) );
  AO22X1M U142 ( .A0(N40), .A1(n230), .B0(RdData[3]), .B1(n12), .Y(n43) );
  MX4X1M U143 ( .A(n181), .B(n179), .C(n180), .D(n178), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4XLM U144 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n201), 
        .S1(N12), .Y(n181) );
  MX4X1M U145 ( .A(\regArr[8][3] ), .B(\regArr[9][3] ), .C(\regArr[10][3] ), 
        .D(\regArr[11][3] ), .S0(n201), .S1(N12), .Y(n179) );
  AO22X1M U146 ( .A0(N39), .A1(n230), .B0(RdData[4]), .B1(n12), .Y(n44) );
  MX4X1M U147 ( .A(n185), .B(n183), .C(n184), .D(n182), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4XLM U148 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n200), 
        .S1(N12), .Y(n185) );
  MX4X1M U149 ( .A(\regArr[8][4] ), .B(\regArr[9][4] ), .C(\regArr[10][4] ), 
        .D(\regArr[11][4] ), .S0(n201), .S1(N12), .Y(n183) );
  AO22X1M U150 ( .A0(N38), .A1(n230), .B0(RdData[5]), .B1(n12), .Y(n45) );
  MX4X1M U151 ( .A(n189), .B(n187), .C(n188), .D(n186), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4XLM U152 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n200), 
        .S1(n198), .Y(n189) );
  MX4X1M U153 ( .A(\regArr[8][5] ), .B(\regArr[9][5] ), .C(\regArr[10][5] ), 
        .D(\regArr[11][5] ), .S0(N11), .S1(n198), .Y(n187) );
  AO22X1M U154 ( .A0(N37), .A1(n230), .B0(RdData[6]), .B1(n12), .Y(n46) );
  MX4X1M U155 ( .A(n193), .B(n191), .C(n192), .D(n190), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U156 ( .A(\regArr[8][6] ), .B(\regArr[9][6] ), .C(\regArr[10][6] ), 
        .D(\regArr[11][6] ), .S0(N11), .S1(n198), .Y(n191) );
  MX4X1M U157 ( .A(\regArr[4][6] ), .B(\regArr[5][6] ), .C(\regArr[6][6] ), 
        .D(\regArr[7][6] ), .S0(n201), .S1(n198), .Y(n192) );
  AO22X1M U158 ( .A0(N36), .A1(n230), .B0(RdData[7]), .B1(n12), .Y(n47) );
  MX4X1M U159 ( .A(n197), .B(n195), .C(n196), .D(n194), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U160 ( .A(\regArr[8][7] ), .B(\regArr[9][7] ), .C(\regArr[10][7] ), 
        .D(\regArr[11][7] ), .S0(N11), .S1(n198), .Y(n195) );
  MX4X1M U161 ( .A(\regArr[4][7] ), .B(\regArr[5][7] ), .C(\regArr[6][7] ), 
        .D(\regArr[7][7] ), .S0(N11), .S1(n198), .Y(n196) );
  MX4XLM U162 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n201), 
        .S1(N12), .Y(n9) );
  MX4X1M U163 ( .A(\regArr[4][1] ), .B(\regArr[5][1] ), .C(\regArr[6][1] ), 
        .D(\regArr[7][1] ), .S0(n201), .S1(N12), .Y(n8) );
  MX4X1M U164 ( .A(\regArr[4][2] ), .B(\regArr[5][2] ), .C(\regArr[6][2] ), 
        .D(\regArr[7][2] ), .S0(n201), .S1(N12), .Y(n17) );
  MX4X1M U165 ( .A(\regArr[4][3] ), .B(\regArr[5][3] ), .C(\regArr[6][3] ), 
        .D(\regArr[7][3] ), .S0(n201), .S1(N12), .Y(n180) );
  MX4X1M U166 ( .A(\regArr[4][4] ), .B(\regArr[5][4] ), .C(\regArr[6][4] ), 
        .D(\regArr[7][4] ), .S0(n201), .S1(N12), .Y(n184) );
  MX4X1M U167 ( .A(\regArr[4][5] ), .B(\regArr[5][5] ), .C(\regArr[6][5] ), 
        .D(\regArr[7][5] ), .S0(N11), .S1(n198), .Y(n188) );
  MX4X1M U168 ( .A(\regArr[12][0] ), .B(\regArr[13][0] ), .C(\regArr[14][0] ), 
        .D(\regArr[15][0] ), .S0(n200), .S1(n198), .Y(n2) );
  MX4X1M U169 ( .A(\regArr[12][2] ), .B(\regArr[13][2] ), .C(\regArr[14][2] ), 
        .D(\regArr[15][2] ), .S0(n201), .S1(N12), .Y(n10) );
  MX4X1M U170 ( .A(\regArr[12][3] ), .B(\regArr[13][3] ), .C(\regArr[14][3] ), 
        .D(\regArr[15][3] ), .S0(n201), .S1(N12), .Y(n178) );
  MX4X1M U171 ( .A(\regArr[12][4] ), .B(\regArr[13][4] ), .C(\regArr[14][4] ), 
        .D(\regArr[15][4] ), .S0(n201), .S1(N12), .Y(n182) );
  MX4X1M U172 ( .A(\regArr[12][5] ), .B(\regArr[13][5] ), .C(\regArr[14][5] ), 
        .D(\regArr[15][5] ), .S0(n200), .S1(n198), .Y(n186) );
  MX4X1M U173 ( .A(\regArr[12][6] ), .B(\regArr[13][6] ), .C(\regArr[14][6] ), 
        .D(\regArr[15][6] ), .S0(n200), .S1(n198), .Y(n190) );
  MX4X1M U174 ( .A(\regArr[12][7] ), .B(\regArr[13][7] ), .C(\regArr[14][7] ), 
        .D(\regArr[15][7] ), .S0(n200), .S1(n198), .Y(n194) );
  INVX2M U175 ( .A(N12), .Y(n203) );
  OAI2BB2X1M U176 ( .B0(n222), .B1(n22), .A0N(\regArr[4][0] ), .A1N(n22), .Y(
        n81) );
  OAI2BB2X1M U177 ( .B0(n223), .B1(n22), .A0N(\regArr[4][1] ), .A1N(n22), .Y(
        n82) );
  OAI2BB2X1M U178 ( .B0(n224), .B1(n22), .A0N(\regArr[4][2] ), .A1N(n22), .Y(
        n83) );
  OAI2BB2X1M U179 ( .B0(n225), .B1(n22), .A0N(\regArr[4][3] ), .A1N(n22), .Y(
        n84) );
  OAI2BB2X1M U180 ( .B0(n226), .B1(n22), .A0N(\regArr[4][4] ), .A1N(n22), .Y(
        n85) );
  OAI2BB2X1M U181 ( .B0(n227), .B1(n22), .A0N(\regArr[4][5] ), .A1N(n22), .Y(
        n86) );
  OAI2BB2X1M U182 ( .B0(n228), .B1(n22), .A0N(\regArr[4][6] ), .A1N(n22), .Y(
        n87) );
  OAI2BB2X1M U183 ( .B0(n229), .B1(n22), .A0N(\regArr[4][7] ), .A1N(n22), .Y(
        n88) );
  OAI2BB2X1M U184 ( .B0(n222), .B1(n24), .A0N(\regArr[5][0] ), .A1N(n24), .Y(
        n89) );
  OAI2BB2X1M U185 ( .B0(n223), .B1(n24), .A0N(\regArr[5][1] ), .A1N(n24), .Y(
        n90) );
  OAI2BB2X1M U186 ( .B0(n224), .B1(n24), .A0N(\regArr[5][2] ), .A1N(n24), .Y(
        n91) );
  OAI2BB2X1M U187 ( .B0(n225), .B1(n24), .A0N(\regArr[5][3] ), .A1N(n24), .Y(
        n92) );
  OAI2BB2X1M U188 ( .B0(n226), .B1(n24), .A0N(\regArr[5][4] ), .A1N(n24), .Y(
        n93) );
  OAI2BB2X1M U189 ( .B0(n227), .B1(n24), .A0N(\regArr[5][5] ), .A1N(n24), .Y(
        n94) );
  OAI2BB2X1M U190 ( .B0(n228), .B1(n24), .A0N(\regArr[5][6] ), .A1N(n24), .Y(
        n95) );
  OAI2BB2X1M U191 ( .B0(n229), .B1(n24), .A0N(\regArr[5][7] ), .A1N(n24), .Y(
        n96) );
  OAI2BB2X1M U192 ( .B0(n222), .B1(n25), .A0N(\regArr[6][0] ), .A1N(n25), .Y(
        n97) );
  OAI2BB2X1M U193 ( .B0(n223), .B1(n25), .A0N(\regArr[6][1] ), .A1N(n25), .Y(
        n98) );
  OAI2BB2X1M U194 ( .B0(n224), .B1(n25), .A0N(\regArr[6][2] ), .A1N(n25), .Y(
        n99) );
  OAI2BB2X1M U195 ( .B0(n225), .B1(n25), .A0N(\regArr[6][3] ), .A1N(n25), .Y(
        n100) );
  OAI2BB2X1M U196 ( .B0(n226), .B1(n25), .A0N(\regArr[6][4] ), .A1N(n25), .Y(
        n101) );
  OAI2BB2X1M U197 ( .B0(n227), .B1(n25), .A0N(\regArr[6][5] ), .A1N(n25), .Y(
        n102) );
  OAI2BB2X1M U198 ( .B0(n228), .B1(n25), .A0N(\regArr[6][6] ), .A1N(n25), .Y(
        n103) );
  OAI2BB2X1M U199 ( .B0(n229), .B1(n25), .A0N(\regArr[6][7] ), .A1N(n25), .Y(
        n104) );
  OAI2BB2X1M U200 ( .B0(n222), .B1(n28), .A0N(\regArr[7][0] ), .A1N(n28), .Y(
        n105) );
  OAI2BB2X1M U201 ( .B0(n223), .B1(n28), .A0N(\regArr[7][1] ), .A1N(n28), .Y(
        n106) );
  OAI2BB2X1M U202 ( .B0(n224), .B1(n28), .A0N(\regArr[7][2] ), .A1N(n28), .Y(
        n107) );
  OAI2BB2X1M U203 ( .B0(n225), .B1(n28), .A0N(\regArr[7][3] ), .A1N(n28), .Y(
        n108) );
  OAI2BB2X1M U204 ( .B0(n226), .B1(n28), .A0N(\regArr[7][4] ), .A1N(n28), .Y(
        n109) );
  OAI2BB2X1M U205 ( .B0(n227), .B1(n28), .A0N(\regArr[7][5] ), .A1N(n28), .Y(
        n110) );
  OAI2BB2X1M U206 ( .B0(n228), .B1(n28), .A0N(\regArr[7][6] ), .A1N(n28), .Y(
        n111) );
  OAI2BB2X1M U207 ( .B0(n229), .B1(n28), .A0N(\regArr[7][7] ), .A1N(n28), .Y(
        n112) );
  OAI2BB2X1M U208 ( .B0(n223), .B1(n19), .A0N(REG2[1]), .A1N(n19), .Y(n66) );
  OAI2BB2X1M U209 ( .B0(n224), .B1(n19), .A0N(REG2[2]), .A1N(n19), .Y(n67) );
  OAI2BB2X1M U210 ( .B0(n225), .B1(n19), .A0N(REG2[3]), .A1N(n19), .Y(n68) );
  OAI2BB2X1M U211 ( .B0(n226), .B1(n19), .A0N(REG2[4]), .A1N(n19), .Y(n69) );
  OAI2BB2X1M U212 ( .B0(n227), .B1(n19), .A0N(REG2[5]), .A1N(n19), .Y(n70) );
  OAI2BB2X1M U213 ( .B0(n228), .B1(n19), .A0N(REG2[6]), .A1N(n19), .Y(n71) );
  OAI2BB2X1M U214 ( .B0(n222), .B1(n21), .A0N(REG3[0]), .A1N(n21), .Y(n73) );
  OAI2BB2X1M U215 ( .B0(n223), .B1(n21), .A0N(REG3[1]), .A1N(n21), .Y(n74) );
  OAI2BB2X1M U216 ( .B0(n224), .B1(n21), .A0N(REG3[2]), .A1N(n21), .Y(n75) );
  OAI2BB2X1M U217 ( .B0(n225), .B1(n21), .A0N(REG3[3]), .A1N(n21), .Y(n76) );
  OAI2BB2X1M U218 ( .B0(n226), .B1(n21), .A0N(REG3[4]), .A1N(n21), .Y(n77) );
  OAI2BB2X1M U219 ( .B0(n228), .B1(n21), .A0N(REG3[6]), .A1N(n21), .Y(n79) );
  OAI2BB2X1M U220 ( .B0(n229), .B1(n21), .A0N(REG3[7]), .A1N(n21), .Y(n80) );
  OAI2BB2X1M U221 ( .B0(n222), .B1(n19), .A0N(REG2[0]), .A1N(n19), .Y(n65) );
  OAI2BB2X1M U222 ( .B0(n229), .B1(n19), .A0N(REG2[7]), .A1N(n19), .Y(n72) );
  OAI2BB2X1M U223 ( .B0(n227), .B1(n21), .A0N(REG3[5]), .A1N(n21), .Y(n78) );
  OAI2BB2X1M U224 ( .B0(n14), .B1(n222), .A0N(REG0[0]), .A1N(n14), .Y(n49) );
  OAI2BB2X1M U225 ( .B0(n14), .B1(n223), .A0N(REG0[1]), .A1N(n14), .Y(n50) );
  OAI2BB2X1M U226 ( .B0(n14), .B1(n224), .A0N(REG0[2]), .A1N(n14), .Y(n51) );
  OAI2BB2X1M U227 ( .B0(n14), .B1(n225), .A0N(REG0[3]), .A1N(n14), .Y(n52) );
  OAI2BB2X1M U228 ( .B0(n14), .B1(n226), .A0N(REG0[4]), .A1N(n14), .Y(n53) );
  MX2XLM U229 ( .A(REG1[1]), .B(WrData[1]), .S0(n1), .Y(n58) );
  MX2XLM U230 ( .A(REG1[2]), .B(WrData[2]), .S0(n1), .Y(n59) );
  MX2XLM U231 ( .A(REG1[3]), .B(WrData[3]), .S0(n1), .Y(n60) );
  MX2XLM U232 ( .A(REG1[4]), .B(WrData[4]), .S0(n1), .Y(n61) );
  MX2XLM U233 ( .A(REG1[5]), .B(WrData[5]), .S0(n1), .Y(n62) );
  OAI2BB1X2M U234 ( .A0N(RdData_VLD), .A1N(n13), .B0(n12), .Y(n48) );
  MX4XLM U235 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n200), 
        .S1(n198), .Y(n197) );
  MX4XLM U236 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n200), 
        .S1(n198), .Y(n193) );
  MX4XLM U237 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(n200), 
        .S1(N12), .Y(n5) );
  MX2XLM U238 ( .A(REG1[0]), .B(WrData[0]), .S0(n1), .Y(n57) );
  MX2XLM U239 ( .A(REG1[6]), .B(WrData[6]), .S0(n1), .Y(n63) );
  MX2XLM U240 ( .A(REG0[7]), .B(WrData[7]), .S0(n219), .Y(n56) );
endmodule


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVXLM U1 ( .A(B[2]), .Y(n7) );
  INVXLM U2 ( .A(B[3]), .Y(n6) );
  INVXLM U3 ( .A(B[4]), .Y(n5) );
  INVXLM U4 ( .A(B[5]), .Y(n4) );
  INVXLM U5 ( .A(B[1]), .Y(n8) );
  NAND2X2M U6 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U7 ( .A(A[0]), .Y(n1) );
  XNOR2X2M U8 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVXLM U9 ( .A(B[6]), .Y(n3) );
  INVXLM U10 ( .A(B[0]), .Y(n9) );
  INVXLM U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;

  wire   [8:1] carry;

  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_0 ( .A(A[0]), .B(B[0]), .CI(1'b0), .CO(carry[1]), .S(SUM[0]) );
endmodule


module ALU_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  XNOR2X2M U3 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  NAND2X2M U4 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U5 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n8) );
  INVX2M U7 ( .A(A[6]), .Y(n9) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ALU_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n14, n15, n13, n11, n12, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n8), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n4), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n7), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n3), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n6), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n5), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  AND2X2M U2 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVXLM U10 ( .A(A[6]), .Y(n33) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U12 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U13 ( .A(\ab[0][6] ), .Y(n22) );
  INVX2M U14 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U15 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U16 ( .A(\ab[0][3] ), .Y(n19) );
  AND2X2M U17 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U18 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U21 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U22 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U23 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  AND2X2M U24 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n14) );
  CLKXOR2X2M U25 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  AND2X2M U26 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n15) );
  XNOR2X2M U27 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U28 ( .A(\SUMB[7][1] ), .Y(n17) );
  CLKXOR2X2M U29 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  AND2X2M U30 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U31 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U32 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U33 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U34 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U35 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U36 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  INVX2M U37 ( .A(A[1]), .Y(n38) );
  XNOR2X2M U38 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U39 ( .A(A[3]), .Y(n36) );
  INVX2M U40 ( .A(A[2]), .Y(n37) );
  INVX2M U41 ( .A(A[4]), .Y(n35) );
  INVX2M U42 ( .A(A[5]), .Y(n34) );
  INVXLM U43 ( .A(B[3]), .Y(n28) );
  INVXLM U44 ( .A(B[4]), .Y(n27) );
  INVXLM U45 ( .A(B[5]), .Y(n26) );
  INVX2M U46 ( .A(A[0]), .Y(n39) );
  INVXLM U47 ( .A(B[2]), .Y(n29) );
  INVXLM U48 ( .A(B[1]), .Y(n30) );
  INVXLM U49 ( .A(A[7]), .Y(n32) );
  INVXLM U50 ( .A(B[6]), .Y(n25) );
  INVXLM U51 ( .A(B[0]), .Y(n31) );
  INVXLM U52 ( .A(B[7]), .Y(n24) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
endmodule


module ALU_DW_div_uns_1 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][1] , \u_div/CryTmp[0][1] ,
         \u_div/CryTmp[0][2] , \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] ,
         \u_div/CryTmp[0][5] , \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] ,
         \u_div/CryTmp[1][1] , \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] ,
         \u_div/CryTmp[1][4] , \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] ,
         \u_div/CryTmp[1][7] , \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] ,
         \u_div/CryTmp[2][3] , \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] ,
         \u_div/CryTmp[2][6] , \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] ,
         \u_div/CryTmp[3][3] , \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] ,
         \u_div/CryTmp[4][1] , \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] ,
         \u_div/CryTmp[4][4] , \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] ,
         \u_div/CryTmp[5][3] , \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] ,
         \u_div/CryTmp[7][1] , \u_div/PartRem[1][1] , \u_div/PartRem[1][2] ,
         \u_div/PartRem[1][3] , \u_div/PartRem[1][4] , \u_div/PartRem[1][5] ,
         \u_div/PartRem[1][6] , \u_div/PartRem[1][7] , \u_div/PartRem[2][1] ,
         \u_div/PartRem[2][2] , \u_div/PartRem[2][3] , \u_div/PartRem[2][4] ,
         \u_div/PartRem[2][5] , \u_div/PartRem[2][6] , \u_div/PartRem[4][1] ,
         \u_div/PartRem[5][1] , \u_div/PartRem[6][1] , n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n23, n24, n25, n26, n27, n28, n30, n31, n32, n33, n34, n35, n36, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76;
  wire   [7:0] \u_div/BInv ;

  ADDFHX8M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(
        \u_div/BInv [1]), .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), 
        .S(\u_div/SumTmp[4][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(
        \u_div/BInv [6]), .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(
        \u_div/BInv [1]), .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(
        \u_div/BInv [6]), .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), 
        .S(\u_div/SumTmp[1][6] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_4_2  ( .A(n31), .B(\u_div/BInv [2]), .CI(
        \u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_4_3  ( .A(n32), .B(\u_div/BInv [3]), .CI(
        \u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_2  ( .A(n2), .B(\u_div/BInv [2]), .CI(
        \u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(
        \u_div/BInv [5]), .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), 
        .S(\u_div/SumTmp[1][5] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(
        \u_div/BInv [4]), .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(
        \u_div/BInv [5]), .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(
        \u_div/BInv [7]), .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(
        \u_div/BInv [1]), .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), 
        .S(\u_div/SumTmp[1][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(
        \u_div/BInv [4]), .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), 
        .S(\u_div/SumTmp[1][4] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(
        \u_div/BInv [2]), .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), 
        .S(\u_div/SumTmp[1][2] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), 
        .S(\u_div/SumTmp[1][3] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_5_2  ( .A(n24), .B(\u_div/BInv [2]), .CI(
        \u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_3_3  ( .A(n28), .B(\u_div/BInv [3]), .CI(
        \u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_3_4  ( .A(n30), .B(\u_div/BInv [4]), .CI(
        \u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/BInv [1]), .B(n34), .CI(
        \u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_2_1  ( .A(n7), .B(\u_div/BInv [1]), .CI(
        \u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_2_4  ( .A(n27), .B(\u_div/BInv [4]), .CI(
        \u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_2_5  ( .A(n20), .B(\u_div/BInv [5]), .CI(
        \u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_2_2  ( .A(n23), .B(\u_div/BInv [2]), .CI(
        \u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_2_3  ( .A(n26), .B(\u_div/BInv [3]), .CI(
        \u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/CryTmp[5][1] ), .B(
        \u_div/BInv [1]), .CI(\u_div/PartRem[6][1] ), .CO(\u_div/CryTmp[5][2] ), .S(\u_div/SumTmp[5][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/BInv [1]), .B(
        \u_div/PartRem[4][1] ), .CI(\u_div/CryTmp[3][1] ), .CO(
        \u_div/CryTmp[3][2] ), .S(\u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_0  ( .A(a[0]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[0][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_0  ( .A(a[3]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[3][1] ), .S(\u_div/SumTmp[3][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_0  ( .A(a[2]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[2][1] ), .S(\u_div/SumTmp[2][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_0  ( .A(a[1]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[1][1] ), .S(\u_div/SumTmp[1][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_0  ( .A(a[5]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[5][1] ), .S(\u_div/SumTmp[5][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_0  ( .A(a[4]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[4][1] ), .S(\u_div/SumTmp[4][0] ) );
  NAND2X4M U1 ( .A(n1), .B(\u_div/CryTmp[3][2] ), .Y(n4) );
  NAND2X2M U2 ( .A(quotient[6]), .B(\u_div/SumTmp[6][1] ), .Y(n13) );
  INVX6M U3 ( .A(n71), .Y(quotient[6]) );
  NAND3X4M U4 ( .A(n6), .B(n5), .C(n4), .Y(\u_div/CryTmp[3][3] ) );
  NAND2X2M U5 ( .A(\u_div/CryTmp[3][2] ), .B(\u_div/BInv [2]), .Y(n6) );
  INVX12M U6 ( .A(b[7]), .Y(\u_div/BInv [7]) );
  BUFX4M U7 ( .A(n25), .Y(n1) );
  CLKINVX4M U8 ( .A(b[2]), .Y(n14) );
  MXI2X3M U9 ( .A(n16), .B(n17), .S0(quotient[3]), .Y(n23) );
  MX2XLM U10 ( .A(n1), .B(\u_div/SumTmp[3][2] ), .S0(quotient[3]), .Y(n26) );
  CLKINVX16M U11 ( .A(n56), .Y(n72) );
  INVX6M U12 ( .A(a[7]), .Y(n35) );
  NAND2X12M U13 ( .A(n72), .B(\u_div/BInv [3]), .Y(n54) );
  CLKMX2X6M U14 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(n31) );
  INVX8M U15 ( .A(n63), .Y(n74) );
  NAND2BX8M U16 ( .AN(b[6]), .B(\u_div/BInv [7]), .Y(n63) );
  INVX3M U17 ( .A(n46), .Y(\u_div/PartRem[2][1] ) );
  CLKINVX8M U18 ( .A(\u_div/CryTmp[5][3] ), .Y(n38) );
  CLKAND2X3M U19 ( .A(\u_div/CryTmp[5][3] ), .B(n70), .Y(quotient[5]) );
  MXI2X6M U20 ( .A(n9), .B(n8), .S0(n10), .Y(n7) );
  INVX2M U21 ( .A(a[4]), .Y(n19) );
  INVX2M U22 ( .A(\u_div/SumTmp[4][0] ), .Y(n18) );
  INVX2M U23 ( .A(a[3]), .Y(n8) );
  INVX2M U24 ( .A(\u_div/SumTmp[3][0] ), .Y(n9) );
  INVX6M U25 ( .A(b[1]), .Y(\u_div/BInv [1]) );
  CLKINVX2M U26 ( .A(\u_div/CryTmp[3][5] ), .Y(n60) );
  MXI2X1M U27 ( .A(n40), .B(\u_div/SumTmp[2][1] ), .S0(quotient[2]), .Y(n45)
         );
  CLKINVX2M U28 ( .A(\u_div/CryTmp[2][6] ), .Y(n64) );
  NOR2BX2M U29 ( .AN(\u_div/CryTmp[3][5] ), .B(n59), .Y(quotient[3]) );
  INVX4M U30 ( .A(\u_div/CryTmp[4][4] ), .Y(n57) );
  INVX3M U31 ( .A(quotient[6]), .Y(n11) );
  INVX4M U32 ( .A(b[2]), .Y(\u_div/BInv [2]) );
  NAND2X4M U33 ( .A(\u_div/CryTmp[6][2] ), .B(n3), .Y(n71) );
  MXI2X4M U34 ( .A(n49), .B(n33), .S0(quotient[6]), .Y(\u_div/PartRem[6][1] )
         );
  NOR2X8M U35 ( .A(n57), .B(n56), .Y(quotient[4]) );
  NOR2X6M U36 ( .A(n54), .B(n38), .Y(n53) );
  NAND2X2M U37 ( .A(n34), .B(n11), .Y(n12) );
  MXI2X8M U38 ( .A(n36), .B(n35), .S0(n68), .Y(n34) );
  INVX6M U39 ( .A(b[3]), .Y(\u_div/BInv [3]) );
  BUFX4M U40 ( .A(\u_div/PartRem[1][2] ), .Y(n2) );
  AND2X1M U41 ( .A(n70), .B(\u_div/BInv [2]), .Y(n3) );
  INVX4M U42 ( .A(b[0]), .Y(\u_div/BInv [0]) );
  MXI2X1M U43 ( .A(n46), .B(n61), .S0(quotient[1]), .Y(\u_div/PartRem[1][2] )
         );
  INVX2M U44 ( .A(b[4]), .Y(\u_div/BInv [4]) );
  MX2X1M U45 ( .A(n31), .B(\u_div/SumTmp[4][2] ), .S0(quotient[4]), .Y(n28) );
  CLKINVX16M U46 ( .A(n54), .Y(n70) );
  NAND2X2M U47 ( .A(n1), .B(\u_div/BInv [2]), .Y(n5) );
  XOR3XLM U48 ( .A(n1), .B(\u_div/CryTmp[3][2] ), .C(\u_div/BInv [2]), .Y(
        \u_div/SumTmp[3][2] ) );
  MX2XLM U49 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(n25) );
  OR2X6M U50 ( .A(n60), .B(n59), .Y(n10) );
  MXI2X6M U51 ( .A(n19), .B(n18), .S0(quotient[4]), .Y(\u_div/PartRem[4][1] )
         );
  NAND2X6M U52 ( .A(n12), .B(n13), .Y(n24) );
  NAND2X12M U53 ( .A(n69), .B(n70), .Y(n68) );
  MXI2X1M U54 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(n62), .Y(n46) );
  MXI2X6M U55 ( .A(n51), .B(n52), .S0(n53), .Y(\u_div/PartRem[5][1] ) );
  NAND2X2M U56 ( .A(b[0]), .B(n35), .Y(\u_div/CryTmp[7][1] ) );
  INVX4M U57 ( .A(b[1]), .Y(n15) );
  XOR2X1M U58 ( .A(\u_div/BInv [0]), .B(a[7]), .Y(n36) );
  OR2X1M U59 ( .A(\u_div/BInv [0]), .B(a[6]), .Y(\u_div/CryTmp[6][1] ) );
  INVXLM U60 ( .A(\u_div/PartRem[4][1] ), .Y(n16) );
  CLKINVX2M U61 ( .A(\u_div/SumTmp[3][1] ), .Y(n17) );
  XOR2XLM U62 ( .A(\u_div/BInv [0]), .B(a[6]), .Y(n33) );
  INVXLM U63 ( .A(a[6]), .Y(n49) );
  AND3X6M U64 ( .A(\u_div/CryTmp[7][1] ), .B(n14), .C(n15), .Y(n69) );
  NAND2BX1M U65 ( .AN(n64), .B(n74), .Y(n75) );
  MXI2XLM U66 ( .A(n23), .B(\u_div/SumTmp[2][2] ), .S0(quotient[2]), .Y(n44)
         );
  MX2XLM U67 ( .A(n30), .B(\u_div/SumTmp[3][4] ), .S0(quotient[3]), .Y(n20) );
  MX2XLM U68 ( .A(n28), .B(\u_div/SumTmp[3][3] ), .S0(quotient[3]), .Y(n27) );
  INVXLM U69 ( .A(n43), .Y(\u_div/PartRem[2][4] ) );
  INVX2M U70 ( .A(n44), .Y(\u_div/PartRem[2][3] ) );
  INVX3M U71 ( .A(n76), .Y(quotient[1]) );
  INVX2M U72 ( .A(n75), .Y(quotient[2]) );
  MXI2XLM U73 ( .A(n26), .B(\u_div/SumTmp[2][3] ), .S0(quotient[2]), .Y(n43)
         );
  MXI2XLM U74 ( .A(n27), .B(\u_div/SumTmp[2][4] ), .S0(quotient[2]), .Y(n42)
         );
  MXI2XLM U75 ( .A(n20), .B(\u_div/SumTmp[2][5] ), .S0(quotient[2]), .Y(n41)
         );
  INVX2M U76 ( .A(n41), .Y(\u_div/PartRem[2][6] ) );
  MX2XLM U77 ( .A(n32), .B(\u_div/SumTmp[4][3] ), .S0(quotient[4]), .Y(n30) );
  MX2X1M U78 ( .A(n24), .B(\u_div/SumTmp[5][2] ), .S0(quotient[5]), .Y(n32) );
  INVX2M U79 ( .A(a[5]), .Y(n51) );
  INVX2M U80 ( .A(\u_div/SumTmp[5][0] ), .Y(n52) );
  INVX2M U81 ( .A(\u_div/SumTmp[1][1] ), .Y(n61) );
  NOR2XLM U82 ( .A(n63), .B(n64), .Y(n62) );
  MXI2X1M U83 ( .A(n44), .B(n55), .S0(quotient[1]), .Y(\u_div/PartRem[1][4] )
         );
  INVX2M U84 ( .A(\u_div/SumTmp[1][3] ), .Y(n55) );
  MXI2X1M U85 ( .A(n42), .B(n48), .S0(quotient[1]), .Y(\u_div/PartRem[1][6] )
         );
  INVX2M U86 ( .A(\u_div/SumTmp[1][5] ), .Y(n48) );
  INVX2M U87 ( .A(n42), .Y(\u_div/PartRem[2][5] ) );
  MXI2X1M U88 ( .A(n43), .B(n50), .S0(quotient[1]), .Y(\u_div/PartRem[1][5] )
         );
  INVX2M U89 ( .A(\u_div/SumTmp[1][4] ), .Y(n50) );
  MXI2XLM U90 ( .A(n45), .B(n58), .S0(quotient[1]), .Y(\u_div/PartRem[1][3] )
         );
  INVX2M U91 ( .A(\u_div/SumTmp[1][2] ), .Y(n58) );
  MXI2X1M U92 ( .A(n41), .B(n47), .S0(quotient[1]), .Y(\u_div/PartRem[1][7] )
         );
  INVX2M U93 ( .A(\u_div/SumTmp[1][6] ), .Y(n47) );
  NAND2XLM U94 ( .A(n74), .B(\u_div/BInv [5]), .Y(n59) );
  INVX2M U95 ( .A(\u_div/SumTmp[1][0] ), .Y(n66) );
  AND2X1M U96 ( .A(n69), .B(n70), .Y(quotient[7]) );
  INVX2M U97 ( .A(a[1]), .Y(n65) );
  CLKINVX1M U98 ( .A(b[5]), .Y(\u_div/BInv [5]) );
  INVXLM U99 ( .A(b[6]), .Y(\u_div/BInv [6]) );
  INVXLM U100 ( .A(n7), .Y(n39) );
  INVX2M U101 ( .A(n39), .Y(n40) );
  NAND2X12M U102 ( .A(n73), .B(n74), .Y(n56) );
  INVX2M U103 ( .A(n45), .Y(\u_div/PartRem[2][2] ) );
  NAND2BX2M U104 ( .AN(b[7]), .B(\u_div/CryTmp[1][7] ), .Y(n76) );
  MXI2X6M U105 ( .A(n65), .B(n66), .S0(n67), .Y(\u_div/PartRem[1][1] ) );
  NOR2BX8M U106 ( .AN(\u_div/CryTmp[1][7] ), .B(b[7]), .Y(n67) );
  NOR2X8M U107 ( .A(b[5]), .B(b[4]), .Y(n73) );
endmodule


module ALU ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n31, n32,
         n33, n34, n36, n43, n44, n45, n46, n47, n48, n54, n55, n56, n60, n61,
         n62, n66, n67, n68, n72, n73, n74, n78, n79, n80, n83, n84, n85, n86,
         n87, n88, n89, n90, n92, n101, n103, n104, n106, n107, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n35, n37, n38, n39,
         n40, n41, n42, n49, n50, n51, n52, n53, n57, n58, n59, n63, n64, n65,
         n69, n70, n71, n75, n76, n77, n81, n82, n91, n93, n94, n95, n96, n97,
         n98, n99, n100, n102, n105, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168;
  wire   [15:0] ALU_OUT_Comb;

  ALU_DW01_sub_0 sub_46 ( .A({1'b0, n14, n13, n12, n11, n10, n9, n8, A[0]}), 
        .B({1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .DIFF({N108, N107, N106, N105, 
        N104, N103, N102, N101, N100}) );
  ALU_DW01_add_0 add_43 ( .A({1'b0, n14, n13, n12, n11, n10, n9, n8, A[0]}), 
        .B({1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92, N91}) );
  ALU_DW02_mult_0 mult_49 ( .A({n14, n13, n12, n11, n10, n9, n8, A[0]}), .B({
        B[7], n7, B[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, N122, N121, N120, 
        N119, N118, N117, N116, N115, N114, N113, N112, N111, N110, N109}) );
  ALU_DW_div_uns_1 div_52 ( .a({n14, n13, n12, n11, n10, n9, n8, A[0]}), .b({
        B[7], n7, B[5:0]}), .quotient({N132, N131, N130, N129, N128, N127, 
        N126, N125}) );
  DFFRQX1M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  DFFRQX2M OUT_VALID_reg ( .D(EN), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  BUFX8M U3 ( .A(B[6]), .Y(n7) );
  BUFX10M U4 ( .A(A[7]), .Y(n14) );
  BUFX2M U7 ( .A(A[5]), .Y(n12) );
  AND2X2M U8 ( .A(n103), .B(n95), .Y(n3) );
  BUFX2M U9 ( .A(A[6]), .Y(n13) );
  NOR2X4M U10 ( .A(N125), .B(n69), .Y(n113) );
  INVX2M U11 ( .A(n155), .Y(n4) );
  AOI21X1M U12 ( .A0(N101), .A1(n5), .B0(n20), .Y(n21) );
  AOI22XLM U13 ( .A0(N106), .A1(n5), .B0(n13), .B1(n115), .Y(n57) );
  INVXLM U14 ( .A(n13), .Y(n161) );
  AOI21XLM U15 ( .A0(n124), .A1(n121), .B0(B[1]), .Y(n125) );
  INVX2M U16 ( .A(n75), .Y(n117) );
  INVX2M U17 ( .A(n82), .Y(n115) );
  INVX2M U18 ( .A(n102), .Y(n59) );
  OAI2BB1X2M U19 ( .A0N(N124), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U20 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U21 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U22 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U23 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U24 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1X2M U25 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U26 ( .A0N(n168), .A1N(n120), .B0(n101), .Y(n47) );
  OAI2BB1X2M U27 ( .A0N(n119), .A1N(n116), .B0(n101), .Y(n48) );
  OR2X2M U28 ( .A(n18), .B(n24), .Y(n82) );
  OR2X2M U29 ( .A(n107), .B(n16), .Y(n75) );
  INVX2M U30 ( .A(n107), .Y(n168) );
  INVX2M U31 ( .A(n46), .Y(n81) );
  INVX2M U32 ( .A(n24), .Y(n116) );
  INVX2M U33 ( .A(n16), .Y(n119) );
  INVX2M U34 ( .A(n18), .Y(n120) );
  NAND3BX2M U35 ( .AN(n122), .B(n120), .C(n19), .Y(n102) );
  NOR2BX2M U36 ( .AN(n118), .B(n167), .Y(n31) );
  INVX2M U37 ( .A(n15), .Y(n118) );
  NAND3BX2M U38 ( .AN(n122), .B(n119), .C(n19), .Y(n15) );
  NOR2X2M U39 ( .A(n17), .B(n18), .Y(n5) );
  NOR2X2M U40 ( .A(n16), .B(n17), .Y(n6) );
  INVX2M U41 ( .A(n70), .Y(n114) );
  INVX2M U42 ( .A(n106), .Y(n17) );
  NOR2X2M U43 ( .A(n110), .B(n109), .Y(n111) );
  NOR2X2M U44 ( .A(n97), .B(n96), .Y(n112) );
  AOI31X2M U45 ( .A0(N158), .A1(ALU_FUN[3]), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U46 ( .A(n123), .B(ALU_FUN[2]), .C(n122), .Y(n89) );
  NOR2X2M U47 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  AND3X2M U48 ( .A(n106), .B(n123), .C(ALU_FUN[3]), .Y(n46) );
  INVX2M U49 ( .A(ALU_FUN[0]), .Y(n123) );
  NAND2X2M U50 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  NAND2X2M U51 ( .A(EN), .B(n156), .Y(n32) );
  OR2X2M U52 ( .A(ALU_FUN[0]), .B(ALU_FUN[3]), .Y(n16) );
  OR2X2M U53 ( .A(ALU_FUN[3]), .B(n123), .Y(n18) );
  INVX2M U54 ( .A(ALU_FUN[2]), .Y(n19) );
  OR2X2M U55 ( .A(ALU_FUN[1]), .B(n19), .Y(n24) );
  NAND3X2M U56 ( .A(n106), .B(ALU_FUN[0]), .C(ALU_FUN[3]), .Y(n101) );
  AND4X2M U57 ( .A(N159), .B(n116), .C(ALU_FUN[3]), .D(n123), .Y(n90) );
  AO22X1M U58 ( .A0(N97), .A1(n6), .B0(n161), .B1(n117), .Y(n52) );
  NOR3X2M U59 ( .A(n122), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  NAND3BX2M U60 ( .AN(n123), .B(ALU_FUN[3]), .C(n116), .Y(n70) );
  NAND3X2M U61 ( .A(n168), .B(n123), .C(ALU_FUN[3]), .Y(n36) );
  OR2X2M U62 ( .A(n121), .B(n70), .Y(n98) );
  INVX2M U63 ( .A(ALU_FUN[1]), .Y(n122) );
  INVX2M U64 ( .A(n108), .Y(n97) );
  INVX2M U65 ( .A(EN), .Y(n167) );
  AOI31X2M U66 ( .A0(n23), .A1(n22), .A2(n21), .B0(n167), .Y(ALU_OUT_Comb[1])
         );
  AOI22X1M U67 ( .A0(N92), .A1(n6), .B0(N110), .B1(n118), .Y(n23) );
  MX2X2M U68 ( .A(n75), .B(n82), .S0(n8), .Y(n22) );
  AOI31X2M U69 ( .A0(n28), .A1(n27), .A2(n26), .B0(n167), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U70 ( .A0(N102), .A1(n5), .B0(n9), .B1(n115), .Y(n27) );
  AOI211X2M U71 ( .A0(N111), .A1(n118), .B0(n25), .C0(n78), .Y(n26) );
  AOI22XLM U72 ( .A0(n10), .A1(n114), .B0(N127), .B1(n59), .Y(n28) );
  AOI31X2M U73 ( .A0(n37), .A1(n35), .A2(n30), .B0(n167), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U74 ( .A0(N103), .A1(n5), .B0(n10), .B1(n115), .Y(n35) );
  AOI211X2M U75 ( .A0(N112), .A1(n118), .B0(n29), .C0(n72), .Y(n30) );
  AOI31X2M U76 ( .A0(n41), .A1(n40), .A2(n39), .B0(n167), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U77 ( .A0(N104), .A1(n5), .B0(n11), .B1(n115), .Y(n40) );
  AOI211X2M U78 ( .A0(N113), .A1(n118), .B0(n38), .C0(n66), .Y(n39) );
  AOI21X2M U79 ( .A0(n33), .A1(n34), .B0(n167), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U80 ( .A0(N99), .A1(n6), .B0(n156), .Y(n33) );
  AOI2BB2XLM U81 ( .B0(N117), .B1(n118), .A0N(n160), .A1N(n36), .Y(n34) );
  AOI31X2M U82 ( .A0(n65), .A1(n64), .A2(n63), .B0(n167), .Y(ALU_OUT_Comb[7])
         );
  OA22X2M U83 ( .A0(n82), .A1(n160), .B0(n75), .B1(n14), .Y(n64) );
  AOI221XLM U84 ( .A0(N98), .A1(n6), .B0(N116), .B1(n118), .C0(n43), .Y(n63)
         );
  AOI31X2M U85 ( .A0(n58), .A1(n57), .A2(n53), .B0(n167), .Y(ALU_OUT_Comb[6])
         );
  AOI211X2M U86 ( .A0(N115), .A1(n118), .B0(n52), .C0(n54), .Y(n53) );
  AOI221XLM U87 ( .A0(n46), .A1(n161), .B0(n13), .B1(n48), .C0(n115), .Y(n55)
         );
  AOI221XLM U88 ( .A0(n13), .A1(n46), .B0(n47), .B1(n161), .C0(n117), .Y(n56)
         );
  INVX2M U89 ( .A(n92), .Y(n156) );
  AOI211X2M U90 ( .A0(N108), .A1(n5), .B0(n117), .C0(n47), .Y(n92) );
  AOI221XLM U91 ( .A0(n46), .A1(n121), .B0(n8), .B1(n48), .C0(n115), .Y(n86)
         );
  AOI221XLM U92 ( .A0(n8), .A1(n46), .B0(n47), .B1(n121), .C0(n117), .Y(n87)
         );
  NAND4X2M U93 ( .A(n102), .B(n100), .C(n99), .D(n98), .Y(n110) );
  AOI31X2M U94 ( .A0(n51), .A1(n50), .A2(n49), .B0(n167), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U95 ( .A0(N105), .A1(n5), .B0(n12), .B1(n115), .Y(n50) );
  AOI22XLM U96 ( .A0(n13), .A1(n114), .B0(N130), .B1(n59), .Y(n51) );
  AOI211X2M U97 ( .A0(N114), .A1(n118), .B0(n42), .C0(n60), .Y(n49) );
  NAND3X2M U98 ( .A(n99), .B(n105), .C(n100), .Y(n69) );
  NAND3X2M U99 ( .A(n108), .B(n3), .C(n105), .Y(n109) );
  NAND2X2M U100 ( .A(n98), .B(n3), .Y(n96) );
  INVX2M U101 ( .A(n8), .Y(n121) );
  NAND2X2M U102 ( .A(N109), .B(n118), .Y(n108) );
  NAND2X2M U103 ( .A(N91), .B(n6), .Y(n105) );
  AO22X1M U104 ( .A0(N93), .A1(n6), .B0(n165), .B1(n117), .Y(n25) );
  AO22X1M U105 ( .A0(N94), .A1(n6), .B0(n164), .B1(n117), .Y(n29) );
  AO22X1M U106 ( .A0(N95), .A1(n6), .B0(n163), .B1(n117), .Y(n38) );
  AO22X1M U107 ( .A0(N96), .A1(n6), .B0(n162), .B1(n117), .Y(n42) );
  INVX2M U108 ( .A(n10), .Y(n164) );
  INVX2M U109 ( .A(n9), .Y(n165) );
  INVX2M U110 ( .A(n11), .Y(n163) );
  INVX2M U111 ( .A(n12), .Y(n162) );
  BUFX2M U112 ( .A(A[4]), .Y(n11) );
  OAI2BB1XLM U113 ( .A0N(N126), .A1N(n59), .B0(n83), .Y(n20) );
  AOI211X2M U114 ( .A0(n9), .A1(n114), .B0(n84), .C0(n85), .Y(n83) );
  OAI2B2X1M U115 ( .A1N(B[1]), .A0(n86), .B0(n36), .B1(n166), .Y(n85) );
  OAI21XLM U116 ( .A0(B[1]), .A1(n87), .B0(n88), .Y(n84) );
  BUFX2M U117 ( .A(A[3]), .Y(n10) );
  BUFX2M U118 ( .A(A[2]), .Y(n9) );
  BUFX2M U119 ( .A(A[1]), .Y(n8) );
  OAI222XLM U120 ( .A0(n79), .A1(n152), .B0(B[2]), .B1(n80), .C0(n36), .C1(
        n121), .Y(n78) );
  AOI221XLM U121 ( .A0(n9), .A1(n46), .B0(n47), .B1(n165), .C0(n117), .Y(n80)
         );
  AOI221XLM U122 ( .A0(n46), .A1(n165), .B0(n9), .B1(n48), .C0(n115), .Y(n79)
         );
  OAI222XLM U123 ( .A0(n73), .A1(n154), .B0(B[3]), .B1(n74), .C0(n36), .C1(
        n165), .Y(n72) );
  AOI221XLM U124 ( .A0(n10), .A1(n46), .B0(n47), .B1(n164), .C0(n117), .Y(n74)
         );
  AOI221XLM U125 ( .A0(n46), .A1(n164), .B0(n10), .B1(n48), .C0(n115), .Y(n73)
         );
  OAI222XLM U126 ( .A0(n67), .A1(n159), .B0(B[4]), .B1(n68), .C0(n36), .C1(
        n164), .Y(n66) );
  INVXLM U127 ( .A(B[4]), .Y(n159) );
  AOI221XLM U128 ( .A0(n11), .A1(n46), .B0(n47), .B1(n163), .C0(n117), .Y(n68)
         );
  AOI221XLM U129 ( .A0(n46), .A1(n163), .B0(n11), .B1(n48), .C0(n115), .Y(n67)
         );
  OAI222XLM U130 ( .A0(n61), .A1(n158), .B0(B[5]), .B1(n62), .C0(n36), .C1(
        n163), .Y(n60) );
  INVXLM U131 ( .A(B[5]), .Y(n158) );
  AOI221XLM U132 ( .A0(n12), .A1(n46), .B0(n47), .B1(n162), .C0(n117), .Y(n62)
         );
  AOI221XLM U133 ( .A0(n46), .A1(n162), .B0(n12), .B1(n48), .C0(n115), .Y(n61)
         );
  INVX2M U134 ( .A(n124), .Y(n151) );
  AND2X2M U135 ( .A(n76), .B(n75), .Y(n94) );
  INVX2M U136 ( .A(n47), .Y(n71) );
  INVX2M U137 ( .A(n135), .Y(n153) );
  MX2X2M U138 ( .A(n94), .B(n93), .S0(A[0]), .Y(n95) );
  AOI31X2M U139 ( .A0(N157), .A1(ALU_FUN[3]), .A2(n104), .B0(n90), .Y(n103) );
  INVXLM U140 ( .A(B[2]), .Y(n152) );
  INVXLM U141 ( .A(B[3]), .Y(n154) );
  AND2X2M U142 ( .A(n91), .B(n82), .Y(n93) );
  INVX2M U143 ( .A(n48), .Y(n77) );
  NAND2X2M U144 ( .A(N100), .B(n5), .Y(n99) );
  INVX2M U145 ( .A(A[0]), .Y(n166) );
  INVXLM U146 ( .A(n14), .Y(n160) );
  INVXLM U147 ( .A(n7), .Y(n155) );
  MX2XLM U148 ( .A(n75), .B(n82), .S0(B[0]), .Y(n100) );
  MX2XLM U149 ( .A(n71), .B(n81), .S0(B[0]), .Y(n76) );
  MX2XLM U150 ( .A(n81), .B(n77), .S0(B[0]), .Y(n91) );
  INVXLM U151 ( .A(B[0]), .Y(n150) );
  INVXLM U152 ( .A(B[7]), .Y(n157) );
  AOI22XLM U153 ( .A0(n11), .A1(n114), .B0(N128), .B1(n59), .Y(n37) );
  OAI222XLM U154 ( .A0(n55), .A1(n155), .B0(n4), .B1(n56), .C0(n36), .C1(n162), 
        .Y(n54) );
  AOI32XLM U155 ( .A0(n130), .A1(n140), .A2(n143), .B0(n4), .B1(n161), .Y(n131) );
  XNOR2XLM U156 ( .A(n13), .B(n7), .Y(n143) );
  AOI22XLM U157 ( .A0(N132), .A1(n59), .B0(N107), .B1(n5), .Y(n65) );
  AOI22XLM U158 ( .A0(n14), .A1(n114), .B0(N131), .B1(n59), .Y(n58) );
  AOI221XLM U159 ( .A0(n46), .A1(n160), .B0(n14), .B1(n48), .C0(n115), .Y(n44)
         );
  AOI221XLM U160 ( .A0(n46), .A1(n14), .B0(n47), .B1(n160), .C0(n117), .Y(n45)
         );
  NAND2XLM U161 ( .A(B[7]), .B(n160), .Y(n147) );
  AOI22XLM U162 ( .A0(n12), .A1(n114), .B0(N129), .B1(n59), .Y(n41) );
  OAI222XLM U163 ( .A0(n44), .A1(n157), .B0(B[7]), .B1(n45), .C0(n36), .C1(
        n161), .Y(n43) );
  NOR2XLM U164 ( .A(n160), .B(B[7]), .Y(n146) );
  AOI211X2M U165 ( .A0(n113), .A1(n112), .B0(n111), .C0(n167), .Y(
        ALU_OUT_Comb[0]) );
  NAND2BX1M U166 ( .AN(B[4]), .B(n11), .Y(n139) );
  NAND2BX1M U167 ( .AN(n11), .B(B[4]), .Y(n128) );
  CLKNAND2X2M U168 ( .A(n139), .B(n128), .Y(n141) );
  NOR2X1M U169 ( .A(n154), .B(n10), .Y(n136) );
  NOR2X1M U170 ( .A(n152), .B(n9), .Y(n127) );
  NOR2X1M U171 ( .A(n150), .B(A[0]), .Y(n124) );
  CLKNAND2X2M U172 ( .A(n9), .B(n152), .Y(n138) );
  NAND2BX1M U173 ( .AN(n127), .B(n138), .Y(n133) );
  AOI211X1M U174 ( .A0(n8), .A1(n151), .B0(n133), .C0(n125), .Y(n126) );
  CLKNAND2X2M U175 ( .A(n10), .B(n154), .Y(n137) );
  OAI31X1M U176 ( .A0(n136), .A1(n127), .A2(n126), .B0(n137), .Y(n129) );
  NAND2BX1M U177 ( .AN(n12), .B(B[5]), .Y(n144) );
  OAI211X1M U178 ( .A0(n141), .A1(n129), .B0(n128), .C0(n144), .Y(n130) );
  NAND2BX1M U179 ( .AN(B[5]), .B(n12), .Y(n140) );
  OAI21X1M U180 ( .A0(n146), .A1(n131), .B0(n147), .Y(N159) );
  CLKNAND2X2M U181 ( .A(A[0]), .B(n150), .Y(n134) );
  OA21X1M U182 ( .A0(n134), .A1(n121), .B0(B[1]), .Y(n132) );
  AOI211X1M U183 ( .A0(n134), .A1(n121), .B0(n133), .C0(n132), .Y(n135) );
  AOI31X1M U184 ( .A0(n153), .A1(n138), .A2(n137), .B0(n136), .Y(n142) );
  OAI2B11X1M U185 ( .A1N(n142), .A0(n141), .B0(n140), .C0(n139), .Y(n145) );
  AOI32X1M U186 ( .A0(n145), .A1(n144), .A2(n143), .B0(n13), .B1(n155), .Y(
        n148) );
  AOI2B1X1M U187 ( .A1N(n148), .A0(n147), .B0(n146), .Y(n149) );
  CLKINVX1M U188 ( .A(n149), .Y(N158) );
  NOR2X1M U189 ( .A(N159), .B(N158), .Y(N157) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error );
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   SYNC_UART_RST, SYNC_REF_RST, UART_RX_V_OUT, UART_RX_V_SYNC,
         UART_TX_VLD, UART_TX_CLK, UART_TX_Busy_PULSE, FIFO_FULL,
         UART_TX_V_SYNC, UART_TX_Busy, UART_RX_CLK, RF_RdData_VLD, RF_WrEn,
         RF_RdEn, ALU_EN, ALU_OUT_VLD, CLKG_EN, ALU_CLK, n1, n2, n3, n4, n5,
         n6, n7;
  wire   [7:0] UART_RX_OUT;
  wire   [7:0] UART_RX_SYNC;
  wire   [7:0] UART_TX_IN;
  wire   [7:0] UART_TX_SYNC;
  wire   [7:0] DIV_RATIO;
  wire   [7:0] UART_Config;
  wire   [7:0] DIV_RATIO_RX;
  wire   [7:0] RF_RdData;
  wire   [3:0] RF_Address;
  wire   [7:0] RF_WrData;
  wire   [3:0] ALU_FUN;
  wire   [15:0] ALU_OUT;
  wire   [7:0] Operand_A;
  wire   [7:0] Operand_B;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  RST_SYNC_NUM_STAGES2_0 U0_RST_SYNC ( .RST(RST_N), .CLK(UART_CLK), .SYNC_RST(
        SYNC_UART_RST) );
  RST_SYNC_NUM_STAGES2_1 U1_RST_SYNC ( .RST(RST_N), .CLK(REF_CLK), .SYNC_RST(
        SYNC_REF_RST) );
  DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 U0_ref_sync ( .CLK(REF_CLK), .RST(n4), 
        .unsync_bus(UART_RX_OUT), .bus_enable(UART_RX_V_OUT), .sync_bus(
        UART_RX_SYNC), .enable_pulse_d(UART_RX_V_SYNC) );
  Async_fifo_D_SIZE8_F_DEPTH8_P_SIZE4 U0_UART_FIFO ( .i_w_clk(REF_CLK), 
        .i_w_rstn(n4), .i_w_inc(UART_TX_VLD), .i_r_clk(UART_TX_CLK), 
        .i_r_rstn(n6), .i_r_inc(UART_TX_Busy_PULSE), .i_w_data(UART_TX_IN), 
        .o_r_data(UART_TX_SYNC), .o_full(FIFO_FULL), .o_empty(UART_TX_V_SYNC)
         );
  PULSE_GEN U0_PULSE_GEN ( .clk(UART_TX_CLK), .rst(n6), .lvl_sig(UART_TX_Busy), 
        .pulse_sig(UART_TX_Busy_PULSE) );
  ClkDiv_0 U0_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst(n6), .i_clk_en(1'b1), 
        .i_div_ratio(DIV_RATIO), .o_div_clk(UART_TX_CLK) );
  CLKDIV_MUX U0_CLKDIV_MUX ( .IN(UART_Config[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, DIV_RATIO_RX[3:0]})
         );
  ClkDiv_1 U1_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst(n6), .i_clk_en(1'b1), 
        .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, DIV_RATIO_RX[3:0]}), .o_div_clk(
        UART_RX_CLK) );
  UART U0_UART ( .RST(n6), .TX_CLK(UART_TX_CLK), .RX_CLK(UART_RX_CLK), 
        .RX_IN_S(UART_RX_IN), .RX_OUT_P(UART_RX_OUT), .RX_OUT_V(UART_RX_V_OUT), 
        .TX_IN_P(UART_TX_SYNC), .TX_IN_V(n1), .TX_OUT_S(UART_TX_O), .TX_OUT_V(
        UART_TX_Busy), .Prescale(UART_Config[7:2]), .parity_enable(
        UART_Config[0]), .parity_type(UART_Config[1]), .parity_error(
        parity_error), .framing_error(framing_error) );
  SYS_CTRL U0_SYS_CTRL ( .CLK(REF_CLK), .RST(n4), .RF_RdData(RF_RdData), 
        .RF_RdData_VLD(RF_RdData_VLD), .ALU_OUT(ALU_OUT), .ALU_OUT_VLD(
        ALU_OUT_VLD), .UART_RX_DATA(UART_RX_SYNC), .UART_RX_VLD(UART_RX_V_SYNC), .FIFO_FULL(FIFO_FULL), .ALU_EN(ALU_EN), .ALU_FUN(ALU_FUN), .CLKG_EN(CLKG_EN), 
        .RF_WrEn(RF_WrEn), .RF_RdEn(RF_RdEn), .RF_Address(RF_Address), 
        .RF_WrData(RF_WrData), .UART_TX_DATA(UART_TX_IN), .UART_TX_VLD(
        UART_TX_VLD) );
  RegFile U0_RegFile ( .CLK(REF_CLK), .RST(n4), .WrEn(RF_WrEn), .RdEn(RF_RdEn), 
        .Address({RF_Address[3:2], n3, n2}), .WrData(RF_WrData), .RdData(
        RF_RdData), .RdData_VLD(RF_RdData_VLD), .REG0(Operand_A), .REG1(
        Operand_B), .REG2(UART_Config), .REG3(DIV_RATIO) );
  ALU U0_ALU ( .A(Operand_A), .B(Operand_B), .EN(ALU_EN), .ALU_FUN(ALU_FUN), 
        .CLK(ALU_CLK), .RST(n4), .ALU_OUT(ALU_OUT), .OUT_VALID(ALU_OUT_VLD) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(CLKG_EN), .CLK(REF_CLK), .GATED_CLK(ALU_CLK)
         );
  INVX2M U2 ( .A(UART_TX_V_SYNC), .Y(n1) );
  BUFX2M U3 ( .A(RF_Address[0]), .Y(n2) );
  BUFX2M U4 ( .A(RF_Address[1]), .Y(n3) );
  INVX4M U5 ( .A(n5), .Y(n4) );
  INVX2M U6 ( .A(SYNC_REF_RST), .Y(n5) );
  INVX4M U7 ( .A(n7), .Y(n6) );
  INVX2M U8 ( .A(SYNC_UART_RST), .Y(n7) );
endmodule

