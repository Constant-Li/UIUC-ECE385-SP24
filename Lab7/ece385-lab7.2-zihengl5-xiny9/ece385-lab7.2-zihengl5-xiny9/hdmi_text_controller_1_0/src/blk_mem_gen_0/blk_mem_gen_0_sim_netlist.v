// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Apr  2 22:41:15 2024
// Host        : LAPTOP-QDR62OIO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               g:/VivadoProject/ip_repo/hdmi_text_controller_1_0/src/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;
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
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.698 mW" *) 
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
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1200" *) 
  (* C_WRITE_DEPTH_B = "1200" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 47984)
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
