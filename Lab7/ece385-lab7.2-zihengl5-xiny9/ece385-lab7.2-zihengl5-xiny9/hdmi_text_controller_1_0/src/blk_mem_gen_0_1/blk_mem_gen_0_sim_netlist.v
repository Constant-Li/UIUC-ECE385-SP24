// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Apr  3 11:29:10 2024
// Host        : LAPTOP-QDR62OIO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               g:/VivadoProject/ip_repo/hdmi_text_controller_1_0/src/blk_mem_gen_0_1/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [1:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [17:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [17:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [1:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [17:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [17:0]doutb;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [17:0]dina;
  wire [17:0]dinb;
  wire [17:0]douta;
  wire [17:0]doutb;
  wire ena;
  wire enb;
  wire [1:0]wea;
  wire [1:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [17:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.4322 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1200" *) 
  (* C_READ_DEPTH_B = "1200" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "18" *) 
  (* C_READ_WIDTH_B = "18" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "2" *) 
  (* C_WEB_WIDTH = "2" *) 
  (* C_WRITE_DEPTH_A = "1200" *) 
  (* C_WRITE_DEPTH_B = "1200" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "18" *) 
  (* C_WRITE_WIDTH_B = "18" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[17:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28544)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
