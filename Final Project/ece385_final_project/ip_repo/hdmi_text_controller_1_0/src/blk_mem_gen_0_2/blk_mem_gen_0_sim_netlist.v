// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Apr  3 14:18:06 2024
// Host        : LAPTOP-QDR62OIO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               g:/VivadoProject/ip_repo/hdmi_text_controller_1_0/src/blk_mem_gen_0_2/blk_mem_gen_0_sim_netlist.v
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [3:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire [3:0]wea;
  wire [3:0]web;
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
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.7492 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
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
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
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
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 48176)
`pragma protect data_block
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
/Nl6qrlCobAQpjQ=
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
