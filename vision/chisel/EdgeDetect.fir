;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit EdgeDetect : 
  module EdgeDetect : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip x : UInt<11>, flip y : UInt<11>, flip px_in : {r : UInt<8>, g : UInt<8>, b : UInt<8>}, px_out : {r : UInt<8>, g : UInt<8>, b : UInt<8>}, flip line_sync : UInt<1>}
    
    wire _WIRE : {r : UInt<8>, g : UInt<8>, b : UInt<8>}[640]
    _WIRE[0].b is invalid
    _WIRE[0].g is invalid
    _WIRE[0].r is invalid
    _WIRE[1].b is invalid
    _WIRE[1].g is invalid
    _WIRE[1].r is invalid
    _WIRE[2].b is invalid
    _WIRE[2].g is invalid
    _WIRE[2].r is invalid
    _WIRE[3].b is invalid
    _WIRE[3].g is invalid
    _WIRE[3].r is invalid
    _WIRE[4].b is invalid
    _WIRE[4].g is invalid
    _WIRE[4].r is invalid
    _WIRE[5].b is invalid
    _WIRE[5].g is invalid
    _WIRE[5].r is invalid
    _WIRE[6].b is invalid
    _WIRE[6].g is invalid
    _WIRE[6].r is invalid
    _WIRE[7].b is invalid
    _WIRE[7].g is invalid
    _WIRE[7].r is invalid
    _WIRE[8].b is invalid
    _WIRE[8].g is invalid
    _WIRE[8].r is invalid
    _WIRE[9].b is invalid
    _WIRE[9].g is invalid
    _WIRE[9].r is invalid
    _WIRE[10].b is invalid
    _WIRE[10].g is invalid
    _WIRE[10].r is invalid
    _WIRE[11].b is invalid
    _WIRE[11].g is invalid
    _WIRE[11].r is invalid
    _WIRE[12].b is invalid
    _WIRE[12].g is invalid
    _WIRE[12].r is invalid
    _WIRE[13].b is invalid
    _WIRE[13].g is invalid
    _WIRE[13].r is invalid
    _WIRE[14].b is invalid
    _WIRE[14].g is invalid
    _WIRE[14].r is invalid
    _WIRE[15].b is invalid
    _WIRE[15].g is invalid
    _WIRE[15].r is invalid
    _WIRE[16].b is invalid
    _WIRE[16].g is invalid
    _WIRE[16].r is invalid
    _WIRE[17].b is invalid
    _WIRE[17].g is invalid
    _WIRE[17].r is invalid
    _WIRE[18].b is invalid
    _WIRE[18].g is invalid
    _WIRE[18].r is invalid
    _WIRE[19].b is invalid
    _WIRE[19].g is invalid
    _WIRE[19].r is invalid
    _WIRE[20].b is invalid
    _WIRE[20].g is invalid
    _WIRE[20].r is invalid
    _WIRE[21].b is invalid
    _WIRE[21].g is invalid
    _WIRE[21].r is invalid
    _WIRE[22].b is invalid
    _WIRE[22].g is invalid
    _WIRE[22].r is invalid
    _WIRE[23].b is invalid
    _WIRE[23].g is invalid
    _WIRE[23].r is invalid
    _WIRE[24].b is invalid
    _WIRE[24].g is invalid
    _WIRE[24].r is invalid
    _WIRE[25].b is invalid
    _WIRE[25].g is invalid
    _WIRE[25].r is invalid
    _WIRE[26].b is invalid
    _WIRE[26].g is invalid
    _WIRE[26].r is invalid
    _WIRE[27].b is invalid
    _WIRE[27].g is invalid
    _WIRE[27].r is invalid
    _WIRE[28].b is invalid
    _WIRE[28].g is invalid
    _WIRE[28].r is invalid
    _WIRE[29].b is invalid
    _WIRE[29].g is invalid
    _WIRE[29].r is invalid
    _WIRE[30].b is invalid
    _WIRE[30].g is invalid
    _WIRE[30].r is invalid
    _WIRE[31].b is invalid
    _WIRE[31].g is invalid
    _WIRE[31].r is invalid
    _WIRE[32].b is invalid
    _WIRE[32].g is invalid
    _WIRE[32].r is invalid
    _WIRE[33].b is invalid
    _WIRE[33].g is invalid
    _WIRE[33].r is invalid
    _WIRE[34].b is invalid
    _WIRE[34].g is invalid
    _WIRE[34].r is invalid
    _WIRE[35].b is invalid
    _WIRE[35].g is invalid
    _WIRE[35].r is invalid
    _WIRE[36].b is invalid
    _WIRE[36].g is invalid
    _WIRE[36].r is invalid
    _WIRE[37].b is invalid
    _WIRE[37].g is invalid
    _WIRE[37].r is invalid
    _WIRE[38].b is invalid
    _WIRE[38].g is invalid
    _WIRE[38].r is invalid
    _WIRE[39].b is invalid
    _WIRE[39].g is invalid
    _WIRE[39].r is invalid
    _WIRE[40].b is invalid
    _WIRE[40].g is invalid
    _WIRE[40].r is invalid
    _WIRE[41].b is invalid
    _WIRE[41].g is invalid
    _WIRE[41].r is invalid
    _WIRE[42].b is invalid
    _WIRE[42].g is invalid
    _WIRE[42].r is invalid
    _WIRE[43].b is invalid
    _WIRE[43].g is invalid
    _WIRE[43].r is invalid
    _WIRE[44].b is invalid
    _WIRE[44].g is invalid
    _WIRE[44].r is invalid
    _WIRE[45].b is invalid
    _WIRE[45].g is invalid
    _WIRE[45].r is invalid
    _WIRE[46].b is invalid
    _WIRE[46].g is invalid
    _WIRE[46].r is invalid
    _WIRE[47].b is invalid
    _WIRE[47].g is invalid
    _WIRE[47].r is invalid
    _WIRE[48].b is invalid
    _WIRE[48].g is invalid
    _WIRE[48].r is invalid
    _WIRE[49].b is invalid
    _WIRE[49].g is invalid
    _WIRE[49].r is invalid
    _WIRE[50].b is invalid
    _WIRE[50].g is invalid
    _WIRE[50].r is invalid
    _WIRE[51].b is invalid
    _WIRE[51].g is invalid
    _WIRE[51].r is invalid
    _WIRE[52].b is invalid
    _WIRE[52].g is invalid
    _WIRE[52].r is invalid
    _WIRE[53].b is invalid
    _WIRE[53].g is invalid
    _WIRE[53].r is invalid
    _WIRE[54].b is invalid
    _WIRE[54].g is invalid
    _WIRE[54].r is invalid
    _WIRE[55].b is invalid
    _WIRE[55].g is invalid
    _WIRE[55].r is invalid
    _WIRE[56].b is invalid
    _WIRE[56].g is invalid
    _WIRE[56].r is invalid
    _WIRE[57].b is invalid
    _WIRE[57].g is invalid
    _WIRE[57].r is invalid
    _WIRE[58].b is invalid
    _WIRE[58].g is invalid
    _WIRE[58].r is invalid
    _WIRE[59].b is invalid
    _WIRE[59].g is invalid
    _WIRE[59].r is invalid
    _WIRE[60].b is invalid
    _WIRE[60].g is invalid
    _WIRE[60].r is invalid
    _WIRE[61].b is invalid
    _WIRE[61].g is invalid
    _WIRE[61].r is invalid
    _WIRE[62].b is invalid
    _WIRE[62].g is invalid
    _WIRE[62].r is invalid
    _WIRE[63].b is invalid
    _WIRE[63].g is invalid
    _WIRE[63].r is invalid
    _WIRE[64].b is invalid
    _WIRE[64].g is invalid
    _WIRE[64].r is invalid
    _WIRE[65].b is invalid
    _WIRE[65].g is invalid
    _WIRE[65].r is invalid
    _WIRE[66].b is invalid
    _WIRE[66].g is invalid
    _WIRE[66].r is invalid
    _WIRE[67].b is invalid
    _WIRE[67].g is invalid
    _WIRE[67].r is invalid
    _WIRE[68].b is invalid
    _WIRE[68].g is invalid
    _WIRE[68].r is invalid
    _WIRE[69].b is invalid
    _WIRE[69].g is invalid
    _WIRE[69].r is invalid
    _WIRE[70].b is invalid
    _WIRE[70].g is invalid
    _WIRE[70].r is invalid
    _WIRE[71].b is invalid
    _WIRE[71].g is invalid
    _WIRE[71].r is invalid
    _WIRE[72].b is invalid
    _WIRE[72].g is invalid
    _WIRE[72].r is invalid
    _WIRE[73].b is invalid
    _WIRE[73].g is invalid
    _WIRE[73].r is invalid
    _WIRE[74].b is invalid
    _WIRE[74].g is invalid
    _WIRE[74].r is invalid
    _WIRE[75].b is invalid
    _WIRE[75].g is invalid
    _WIRE[75].r is invalid
    _WIRE[76].b is invalid
    _WIRE[76].g is invalid
    _WIRE[76].r is invalid
    _WIRE[77].b is invalid
    _WIRE[77].g is invalid
    _WIRE[77].r is invalid
    _WIRE[78].b is invalid
    _WIRE[78].g is invalid
    _WIRE[78].r is invalid
    _WIRE[79].b is invalid
    _WIRE[79].g is invalid
    _WIRE[79].r is invalid
    _WIRE[80].b is invalid
    _WIRE[80].g is invalid
    _WIRE[80].r is invalid
    _WIRE[81].b is invalid
    _WIRE[81].g is invalid
    _WIRE[81].r is invalid
    _WIRE[82].b is invalid
    _WIRE[82].g is invalid
    _WIRE[82].r is invalid
    _WIRE[83].b is invalid
    _WIRE[83].g is invalid
    _WIRE[83].r is invalid
    _WIRE[84].b is invalid
    _WIRE[84].g is invalid
    _WIRE[84].r is invalid
    _WIRE[85].b is invalid
    _WIRE[85].g is invalid
    _WIRE[85].r is invalid
    _WIRE[86].b is invalid
    _WIRE[86].g is invalid
    _WIRE[86].r is invalid
    _WIRE[87].b is invalid
    _WIRE[87].g is invalid
    _WIRE[87].r is invalid
    _WIRE[88].b is invalid
    _WIRE[88].g is invalid
    _WIRE[88].r is invalid
    _WIRE[89].b is invalid
    _WIRE[89].g is invalid
    _WIRE[89].r is invalid
    _WIRE[90].b is invalid
    _WIRE[90].g is invalid
    _WIRE[90].r is invalid
    _WIRE[91].b is invalid
    _WIRE[91].g is invalid
    _WIRE[91].r is invalid
    _WIRE[92].b is invalid
    _WIRE[92].g is invalid
    _WIRE[92].r is invalid
    _WIRE[93].b is invalid
    _WIRE[93].g is invalid
    _WIRE[93].r is invalid
    _WIRE[94].b is invalid
    _WIRE[94].g is invalid
    _WIRE[94].r is invalid
    _WIRE[95].b is invalid
    _WIRE[95].g is invalid
    _WIRE[95].r is invalid
    _WIRE[96].b is invalid
    _WIRE[96].g is invalid
    _WIRE[96].r is invalid
    _WIRE[97].b is invalid
    _WIRE[97].g is invalid
    _WIRE[97].r is invalid
    _WIRE[98].b is invalid
    _WIRE[98].g is invalid
    _WIRE[98].r is invalid
    _WIRE[99].b is invalid
    _WIRE[99].g is invalid
    _WIRE[99].r is invalid
    _WIRE[100].b is invalid
    _WIRE[100].g is invalid
    _WIRE[100].r is invalid
    _WIRE[101].b is invalid
    _WIRE[101].g is invalid
    _WIRE[101].r is invalid
    _WIRE[102].b is invalid
    _WIRE[102].g is invalid
    _WIRE[102].r is invalid
    _WIRE[103].b is invalid
    _WIRE[103].g is invalid
    _WIRE[103].r is invalid
    _WIRE[104].b is invalid
    _WIRE[104].g is invalid
    _WIRE[104].r is invalid
    _WIRE[105].b is invalid
    _WIRE[105].g is invalid
    _WIRE[105].r is invalid
    _WIRE[106].b is invalid
    _WIRE[106].g is invalid
    _WIRE[106].r is invalid
    _WIRE[107].b is invalid
    _WIRE[107].g is invalid
    _WIRE[107].r is invalid
    _WIRE[108].b is invalid
    _WIRE[108].g is invalid
    _WIRE[108].r is invalid
    _WIRE[109].b is invalid
    _WIRE[109].g is invalid
    _WIRE[109].r is invalid
    _WIRE[110].b is invalid
    _WIRE[110].g is invalid
    _WIRE[110].r is invalid
    _WIRE[111].b is invalid
    _WIRE[111].g is invalid
    _WIRE[111].r is invalid
    _WIRE[112].b is invalid
    _WIRE[112].g is invalid
    _WIRE[112].r is invalid
    _WIRE[113].b is invalid
    _WIRE[113].g is invalid
    _WIRE[113].r is invalid
    _WIRE[114].b is invalid
    _WIRE[114].g is invalid
    _WIRE[114].r is invalid
    _WIRE[115].b is invalid
    _WIRE[115].g is invalid
    _WIRE[115].r is invalid
    _WIRE[116].b is invalid
    _WIRE[116].g is invalid
    _WIRE[116].r is invalid
    _WIRE[117].b is invalid
    _WIRE[117].g is invalid
    _WIRE[117].r is invalid
    _WIRE[118].b is invalid
    _WIRE[118].g is invalid
    _WIRE[118].r is invalid
    _WIRE[119].b is invalid
    _WIRE[119].g is invalid
    _WIRE[119].r is invalid
    _WIRE[120].b is invalid
    _WIRE[120].g is invalid
    _WIRE[120].r is invalid
    _WIRE[121].b is invalid
    _WIRE[121].g is invalid
    _WIRE[121].r is invalid
    _WIRE[122].b is invalid
    _WIRE[122].g is invalid
    _WIRE[122].r is invalid
    _WIRE[123].b is invalid
    _WIRE[123].g is invalid
    _WIRE[123].r is invalid
    _WIRE[124].b is invalid
    _WIRE[124].g is invalid
    _WIRE[124].r is invalid
    _WIRE[125].b is invalid
    _WIRE[125].g is invalid
    _WIRE[125].r is invalid
    _WIRE[126].b is invalid
    _WIRE[126].g is invalid
    _WIRE[126].r is invalid
    _WIRE[127].b is invalid
    _WIRE[127].g is invalid
    _WIRE[127].r is invalid
    _WIRE[128].b is invalid
    _WIRE[128].g is invalid
    _WIRE[128].r is invalid
    _WIRE[129].b is invalid
    _WIRE[129].g is invalid
    _WIRE[129].r is invalid
    _WIRE[130].b is invalid
    _WIRE[130].g is invalid
    _WIRE[130].r is invalid
    _WIRE[131].b is invalid
    _WIRE[131].g is invalid
    _WIRE[131].r is invalid
    _WIRE[132].b is invalid
    _WIRE[132].g is invalid
    _WIRE[132].r is invalid
    _WIRE[133].b is invalid
    _WIRE[133].g is invalid
    _WIRE[133].r is invalid
    _WIRE[134].b is invalid
    _WIRE[134].g is invalid
    _WIRE[134].r is invalid
    _WIRE[135].b is invalid
    _WIRE[135].g is invalid
    _WIRE[135].r is invalid
    _WIRE[136].b is invalid
    _WIRE[136].g is invalid
    _WIRE[136].r is invalid
    _WIRE[137].b is invalid
    _WIRE[137].g is invalid
    _WIRE[137].r is invalid
    _WIRE[138].b is invalid
    _WIRE[138].g is invalid
    _WIRE[138].r is invalid
    _WIRE[139].b is invalid
    _WIRE[139].g is invalid
    _WIRE[139].r is invalid
    _WIRE[140].b is invalid
    _WIRE[140].g is invalid
    _WIRE[140].r is invalid
    _WIRE[141].b is invalid
    _WIRE[141].g is invalid
    _WIRE[141].r is invalid
    _WIRE[142].b is invalid
    _WIRE[142].g is invalid
    _WIRE[142].r is invalid
    _WIRE[143].b is invalid
    _WIRE[143].g is invalid
    _WIRE[143].r is invalid
    _WIRE[144].b is invalid
    _WIRE[144].g is invalid
    _WIRE[144].r is invalid
    _WIRE[145].b is invalid
    _WIRE[145].g is invalid
    _WIRE[145].r is invalid
    _WIRE[146].b is invalid
    _WIRE[146].g is invalid
    _WIRE[146].r is invalid
    _WIRE[147].b is invalid
    _WIRE[147].g is invalid
    _WIRE[147].r is invalid
    _WIRE[148].b is invalid
    _WIRE[148].g is invalid
    _WIRE[148].r is invalid
    _WIRE[149].b is invalid
    _WIRE[149].g is invalid
    _WIRE[149].r is invalid
    _WIRE[150].b is invalid
    _WIRE[150].g is invalid
    _WIRE[150].r is invalid
    _WIRE[151].b is invalid
    _WIRE[151].g is invalid
    _WIRE[151].r is invalid
    _WIRE[152].b is invalid
    _WIRE[152].g is invalid
    _WIRE[152].r is invalid
    _WIRE[153].b is invalid
    _WIRE[153].g is invalid
    _WIRE[153].r is invalid
    _WIRE[154].b is invalid
    _WIRE[154].g is invalid
    _WIRE[154].r is invalid
    _WIRE[155].b is invalid
    _WIRE[155].g is invalid
    _WIRE[155].r is invalid
    _WIRE[156].b is invalid
    _WIRE[156].g is invalid
    _WIRE[156].r is invalid
    _WIRE[157].b is invalid
    _WIRE[157].g is invalid
    _WIRE[157].r is invalid
    _WIRE[158].b is invalid
    _WIRE[158].g is invalid
    _WIRE[158].r is invalid
    _WIRE[159].b is invalid
    _WIRE[159].g is invalid
    _WIRE[159].r is invalid
    _WIRE[160].b is invalid
    _WIRE[160].g is invalid
    _WIRE[160].r is invalid
    _WIRE[161].b is invalid
    _WIRE[161].g is invalid
    _WIRE[161].r is invalid
    _WIRE[162].b is invalid
    _WIRE[162].g is invalid
    _WIRE[162].r is invalid
    _WIRE[163].b is invalid
    _WIRE[163].g is invalid
    _WIRE[163].r is invalid
    _WIRE[164].b is invalid
    _WIRE[164].g is invalid
    _WIRE[164].r is invalid
    _WIRE[165].b is invalid
    _WIRE[165].g is invalid
    _WIRE[165].r is invalid
    _WIRE[166].b is invalid
    _WIRE[166].g is invalid
    _WIRE[166].r is invalid
    _WIRE[167].b is invalid
    _WIRE[167].g is invalid
    _WIRE[167].r is invalid
    _WIRE[168].b is invalid
    _WIRE[168].g is invalid
    _WIRE[168].r is invalid
    _WIRE[169].b is invalid
    _WIRE[169].g is invalid
    _WIRE[169].r is invalid
    _WIRE[170].b is invalid
    _WIRE[170].g is invalid
    _WIRE[170].r is invalid
    _WIRE[171].b is invalid
    _WIRE[171].g is invalid
    _WIRE[171].r is invalid
    _WIRE[172].b is invalid
    _WIRE[172].g is invalid
    _WIRE[172].r is invalid
    _WIRE[173].b is invalid
    _WIRE[173].g is invalid
    _WIRE[173].r is invalid
    _WIRE[174].b is invalid
    _WIRE[174].g is invalid
    _WIRE[174].r is invalid
    _WIRE[175].b is invalid
    _WIRE[175].g is invalid
    _WIRE[175].r is invalid
    _WIRE[176].b is invalid
    _WIRE[176].g is invalid
    _WIRE[176].r is invalid
    _WIRE[177].b is invalid
    _WIRE[177].g is invalid
    _WIRE[177].r is invalid
    _WIRE[178].b is invalid
    _WIRE[178].g is invalid
    _WIRE[178].r is invalid
    _WIRE[179].b is invalid
    _WIRE[179].g is invalid
    _WIRE[179].r is invalid
    _WIRE[180].b is invalid
    _WIRE[180].g is invalid
    _WIRE[180].r is invalid
    _WIRE[181].b is invalid
    _WIRE[181].g is invalid
    _WIRE[181].r is invalid
    _WIRE[182].b is invalid
    _WIRE[182].g is invalid
    _WIRE[182].r is invalid
    _WIRE[183].b is invalid
    _WIRE[183].g is invalid
    _WIRE[183].r is invalid
    _WIRE[184].b is invalid
    _WIRE[184].g is invalid
    _WIRE[184].r is invalid
    _WIRE[185].b is invalid
    _WIRE[185].g is invalid
    _WIRE[185].r is invalid
    _WIRE[186].b is invalid
    _WIRE[186].g is invalid
    _WIRE[186].r is invalid
    _WIRE[187].b is invalid
    _WIRE[187].g is invalid
    _WIRE[187].r is invalid
    _WIRE[188].b is invalid
    _WIRE[188].g is invalid
    _WIRE[188].r is invalid
    _WIRE[189].b is invalid
    _WIRE[189].g is invalid
    _WIRE[189].r is invalid
    _WIRE[190].b is invalid
    _WIRE[190].g is invalid
    _WIRE[190].r is invalid
    _WIRE[191].b is invalid
    _WIRE[191].g is invalid
    _WIRE[191].r is invalid
    _WIRE[192].b is invalid
    _WIRE[192].g is invalid
    _WIRE[192].r is invalid
    _WIRE[193].b is invalid
    _WIRE[193].g is invalid
    _WIRE[193].r is invalid
    _WIRE[194].b is invalid
    _WIRE[194].g is invalid
    _WIRE[194].r is invalid
    _WIRE[195].b is invalid
    _WIRE[195].g is invalid
    _WIRE[195].r is invalid
    _WIRE[196].b is invalid
    _WIRE[196].g is invalid
    _WIRE[196].r is invalid
    _WIRE[197].b is invalid
    _WIRE[197].g is invalid
    _WIRE[197].r is invalid
    _WIRE[198].b is invalid
    _WIRE[198].g is invalid
    _WIRE[198].r is invalid
    _WIRE[199].b is invalid
    _WIRE[199].g is invalid
    _WIRE[199].r is invalid
    _WIRE[200].b is invalid
    _WIRE[200].g is invalid
    _WIRE[200].r is invalid
    _WIRE[201].b is invalid
    _WIRE[201].g is invalid
    _WIRE[201].r is invalid
    _WIRE[202].b is invalid
    _WIRE[202].g is invalid
    _WIRE[202].r is invalid
    _WIRE[203].b is invalid
    _WIRE[203].g is invalid
    _WIRE[203].r is invalid
    _WIRE[204].b is invalid
    _WIRE[204].g is invalid
    _WIRE[204].r is invalid
    _WIRE[205].b is invalid
    _WIRE[205].g is invalid
    _WIRE[205].r is invalid
    _WIRE[206].b is invalid
    _WIRE[206].g is invalid
    _WIRE[206].r is invalid
    _WIRE[207].b is invalid
    _WIRE[207].g is invalid
    _WIRE[207].r is invalid
    _WIRE[208].b is invalid
    _WIRE[208].g is invalid
    _WIRE[208].r is invalid
    _WIRE[209].b is invalid
    _WIRE[209].g is invalid
    _WIRE[209].r is invalid
    _WIRE[210].b is invalid
    _WIRE[210].g is invalid
    _WIRE[210].r is invalid
    _WIRE[211].b is invalid
    _WIRE[211].g is invalid
    _WIRE[211].r is invalid
    _WIRE[212].b is invalid
    _WIRE[212].g is invalid
    _WIRE[212].r is invalid
    _WIRE[213].b is invalid
    _WIRE[213].g is invalid
    _WIRE[213].r is invalid
    _WIRE[214].b is invalid
    _WIRE[214].g is invalid
    _WIRE[214].r is invalid
    _WIRE[215].b is invalid
    _WIRE[215].g is invalid
    _WIRE[215].r is invalid
    _WIRE[216].b is invalid
    _WIRE[216].g is invalid
    _WIRE[216].r is invalid
    _WIRE[217].b is invalid
    _WIRE[217].g is invalid
    _WIRE[217].r is invalid
    _WIRE[218].b is invalid
    _WIRE[218].g is invalid
    _WIRE[218].r is invalid
    _WIRE[219].b is invalid
    _WIRE[219].g is invalid
    _WIRE[219].r is invalid
    _WIRE[220].b is invalid
    _WIRE[220].g is invalid
    _WIRE[220].r is invalid
    _WIRE[221].b is invalid
    _WIRE[221].g is invalid
    _WIRE[221].r is invalid
    _WIRE[222].b is invalid
    _WIRE[222].g is invalid
    _WIRE[222].r is invalid
    _WIRE[223].b is invalid
    _WIRE[223].g is invalid
    _WIRE[223].r is invalid
    _WIRE[224].b is invalid
    _WIRE[224].g is invalid
    _WIRE[224].r is invalid
    _WIRE[225].b is invalid
    _WIRE[225].g is invalid
    _WIRE[225].r is invalid
    _WIRE[226].b is invalid
    _WIRE[226].g is invalid
    _WIRE[226].r is invalid
    _WIRE[227].b is invalid
    _WIRE[227].g is invalid
    _WIRE[227].r is invalid
    _WIRE[228].b is invalid
    _WIRE[228].g is invalid
    _WIRE[228].r is invalid
    _WIRE[229].b is invalid
    _WIRE[229].g is invalid
    _WIRE[229].r is invalid
    _WIRE[230].b is invalid
    _WIRE[230].g is invalid
    _WIRE[230].r is invalid
    _WIRE[231].b is invalid
    _WIRE[231].g is invalid
    _WIRE[231].r is invalid
    _WIRE[232].b is invalid
    _WIRE[232].g is invalid
    _WIRE[232].r is invalid
    _WIRE[233].b is invalid
    _WIRE[233].g is invalid
    _WIRE[233].r is invalid
    _WIRE[234].b is invalid
    _WIRE[234].g is invalid
    _WIRE[234].r is invalid
    _WIRE[235].b is invalid
    _WIRE[235].g is invalid
    _WIRE[235].r is invalid
    _WIRE[236].b is invalid
    _WIRE[236].g is invalid
    _WIRE[236].r is invalid
    _WIRE[237].b is invalid
    _WIRE[237].g is invalid
    _WIRE[237].r is invalid
    _WIRE[238].b is invalid
    _WIRE[238].g is invalid
    _WIRE[238].r is invalid
    _WIRE[239].b is invalid
    _WIRE[239].g is invalid
    _WIRE[239].r is invalid
    _WIRE[240].b is invalid
    _WIRE[240].g is invalid
    _WIRE[240].r is invalid
    _WIRE[241].b is invalid
    _WIRE[241].g is invalid
    _WIRE[241].r is invalid
    _WIRE[242].b is invalid
    _WIRE[242].g is invalid
    _WIRE[242].r is invalid
    _WIRE[243].b is invalid
    _WIRE[243].g is invalid
    _WIRE[243].r is invalid
    _WIRE[244].b is invalid
    _WIRE[244].g is invalid
    _WIRE[244].r is invalid
    _WIRE[245].b is invalid
    _WIRE[245].g is invalid
    _WIRE[245].r is invalid
    _WIRE[246].b is invalid
    _WIRE[246].g is invalid
    _WIRE[246].r is invalid
    _WIRE[247].b is invalid
    _WIRE[247].g is invalid
    _WIRE[247].r is invalid
    _WIRE[248].b is invalid
    _WIRE[248].g is invalid
    _WIRE[248].r is invalid
    _WIRE[249].b is invalid
    _WIRE[249].g is invalid
    _WIRE[249].r is invalid
    _WIRE[250].b is invalid
    _WIRE[250].g is invalid
    _WIRE[250].r is invalid
    _WIRE[251].b is invalid
    _WIRE[251].g is invalid
    _WIRE[251].r is invalid
    _WIRE[252].b is invalid
    _WIRE[252].g is invalid
    _WIRE[252].r is invalid
    _WIRE[253].b is invalid
    _WIRE[253].g is invalid
    _WIRE[253].r is invalid
    _WIRE[254].b is invalid
    _WIRE[254].g is invalid
    _WIRE[254].r is invalid
    _WIRE[255].b is invalid
    _WIRE[255].g is invalid
    _WIRE[255].r is invalid
    _WIRE[256].b is invalid
    _WIRE[256].g is invalid
    _WIRE[256].r is invalid
    _WIRE[257].b is invalid
    _WIRE[257].g is invalid
    _WIRE[257].r is invalid
    _WIRE[258].b is invalid
    _WIRE[258].g is invalid
    _WIRE[258].r is invalid
    _WIRE[259].b is invalid
    _WIRE[259].g is invalid
    _WIRE[259].r is invalid
    _WIRE[260].b is invalid
    _WIRE[260].g is invalid
    _WIRE[260].r is invalid
    _WIRE[261].b is invalid
    _WIRE[261].g is invalid
    _WIRE[261].r is invalid
    _WIRE[262].b is invalid
    _WIRE[262].g is invalid
    _WIRE[262].r is invalid
    _WIRE[263].b is invalid
    _WIRE[263].g is invalid
    _WIRE[263].r is invalid
    _WIRE[264].b is invalid
    _WIRE[264].g is invalid
    _WIRE[264].r is invalid
    _WIRE[265].b is invalid
    _WIRE[265].g is invalid
    _WIRE[265].r is invalid
    _WIRE[266].b is invalid
    _WIRE[266].g is invalid
    _WIRE[266].r is invalid
    _WIRE[267].b is invalid
    _WIRE[267].g is invalid
    _WIRE[267].r is invalid
    _WIRE[268].b is invalid
    _WIRE[268].g is invalid
    _WIRE[268].r is invalid
    _WIRE[269].b is invalid
    _WIRE[269].g is invalid
    _WIRE[269].r is invalid
    _WIRE[270].b is invalid
    _WIRE[270].g is invalid
    _WIRE[270].r is invalid
    _WIRE[271].b is invalid
    _WIRE[271].g is invalid
    _WIRE[271].r is invalid
    _WIRE[272].b is invalid
    _WIRE[272].g is invalid
    _WIRE[272].r is invalid
    _WIRE[273].b is invalid
    _WIRE[273].g is invalid
    _WIRE[273].r is invalid
    _WIRE[274].b is invalid
    _WIRE[274].g is invalid
    _WIRE[274].r is invalid
    _WIRE[275].b is invalid
    _WIRE[275].g is invalid
    _WIRE[275].r is invalid
    _WIRE[276].b is invalid
    _WIRE[276].g is invalid
    _WIRE[276].r is invalid
    _WIRE[277].b is invalid
    _WIRE[277].g is invalid
    _WIRE[277].r is invalid
    _WIRE[278].b is invalid
    _WIRE[278].g is invalid
    _WIRE[278].r is invalid
    _WIRE[279].b is invalid
    _WIRE[279].g is invalid
    _WIRE[279].r is invalid
    _WIRE[280].b is invalid
    _WIRE[280].g is invalid
    _WIRE[280].r is invalid
    _WIRE[281].b is invalid
    _WIRE[281].g is invalid
    _WIRE[281].r is invalid
    _WIRE[282].b is invalid
    _WIRE[282].g is invalid
    _WIRE[282].r is invalid
    _WIRE[283].b is invalid
    _WIRE[283].g is invalid
    _WIRE[283].r is invalid
    _WIRE[284].b is invalid
    _WIRE[284].g is invalid
    _WIRE[284].r is invalid
    _WIRE[285].b is invalid
    _WIRE[285].g is invalid
    _WIRE[285].r is invalid
    _WIRE[286].b is invalid
    _WIRE[286].g is invalid
    _WIRE[286].r is invalid
    _WIRE[287].b is invalid
    _WIRE[287].g is invalid
    _WIRE[287].r is invalid
    _WIRE[288].b is invalid
    _WIRE[288].g is invalid
    _WIRE[288].r is invalid
    _WIRE[289].b is invalid
    _WIRE[289].g is invalid
    _WIRE[289].r is invalid
    _WIRE[290].b is invalid
    _WIRE[290].g is invalid
    _WIRE[290].r is invalid
    _WIRE[291].b is invalid
    _WIRE[291].g is invalid
    _WIRE[291].r is invalid
    _WIRE[292].b is invalid
    _WIRE[292].g is invalid
    _WIRE[292].r is invalid
    _WIRE[293].b is invalid
    _WIRE[293].g is invalid
    _WIRE[293].r is invalid
    _WIRE[294].b is invalid
    _WIRE[294].g is invalid
    _WIRE[294].r is invalid
    _WIRE[295].b is invalid
    _WIRE[295].g is invalid
    _WIRE[295].r is invalid
    _WIRE[296].b is invalid
    _WIRE[296].g is invalid
    _WIRE[296].r is invalid
    _WIRE[297].b is invalid
    _WIRE[297].g is invalid
    _WIRE[297].r is invalid
    _WIRE[298].b is invalid
    _WIRE[298].g is invalid
    _WIRE[298].r is invalid
    _WIRE[299].b is invalid
    _WIRE[299].g is invalid
    _WIRE[299].r is invalid
    _WIRE[300].b is invalid
    _WIRE[300].g is invalid
    _WIRE[300].r is invalid
    _WIRE[301].b is invalid
    _WIRE[301].g is invalid
    _WIRE[301].r is invalid
    _WIRE[302].b is invalid
    _WIRE[302].g is invalid
    _WIRE[302].r is invalid
    _WIRE[303].b is invalid
    _WIRE[303].g is invalid
    _WIRE[303].r is invalid
    _WIRE[304].b is invalid
    _WIRE[304].g is invalid
    _WIRE[304].r is invalid
    _WIRE[305].b is invalid
    _WIRE[305].g is invalid
    _WIRE[305].r is invalid
    _WIRE[306].b is invalid
    _WIRE[306].g is invalid
    _WIRE[306].r is invalid
    _WIRE[307].b is invalid
    _WIRE[307].g is invalid
    _WIRE[307].r is invalid
    _WIRE[308].b is invalid
    _WIRE[308].g is invalid
    _WIRE[308].r is invalid
    _WIRE[309].b is invalid
    _WIRE[309].g is invalid
    _WIRE[309].r is invalid
    _WIRE[310].b is invalid
    _WIRE[310].g is invalid
    _WIRE[310].r is invalid
    _WIRE[311].b is invalid
    _WIRE[311].g is invalid
    _WIRE[311].r is invalid
    _WIRE[312].b is invalid
    _WIRE[312].g is invalid
    _WIRE[312].r is invalid
    _WIRE[313].b is invalid
    _WIRE[313].g is invalid
    _WIRE[313].r is invalid
    _WIRE[314].b is invalid
    _WIRE[314].g is invalid
    _WIRE[314].r is invalid
    _WIRE[315].b is invalid
    _WIRE[315].g is invalid
    _WIRE[315].r is invalid
    _WIRE[316].b is invalid
    _WIRE[316].g is invalid
    _WIRE[316].r is invalid
    _WIRE[317].b is invalid
    _WIRE[317].g is invalid
    _WIRE[317].r is invalid
    _WIRE[318].b is invalid
    _WIRE[318].g is invalid
    _WIRE[318].r is invalid
    _WIRE[319].b is invalid
    _WIRE[319].g is invalid
    _WIRE[319].r is invalid
    _WIRE[320].b is invalid
    _WIRE[320].g is invalid
    _WIRE[320].r is invalid
    _WIRE[321].b is invalid
    _WIRE[321].g is invalid
    _WIRE[321].r is invalid
    _WIRE[322].b is invalid
    _WIRE[322].g is invalid
    _WIRE[322].r is invalid
    _WIRE[323].b is invalid
    _WIRE[323].g is invalid
    _WIRE[323].r is invalid
    _WIRE[324].b is invalid
    _WIRE[324].g is invalid
    _WIRE[324].r is invalid
    _WIRE[325].b is invalid
    _WIRE[325].g is invalid
    _WIRE[325].r is invalid
    _WIRE[326].b is invalid
    _WIRE[326].g is invalid
    _WIRE[326].r is invalid
    _WIRE[327].b is invalid
    _WIRE[327].g is invalid
    _WIRE[327].r is invalid
    _WIRE[328].b is invalid
    _WIRE[328].g is invalid
    _WIRE[328].r is invalid
    _WIRE[329].b is invalid
    _WIRE[329].g is invalid
    _WIRE[329].r is invalid
    _WIRE[330].b is invalid
    _WIRE[330].g is invalid
    _WIRE[330].r is invalid
    _WIRE[331].b is invalid
    _WIRE[331].g is invalid
    _WIRE[331].r is invalid
    _WIRE[332].b is invalid
    _WIRE[332].g is invalid
    _WIRE[332].r is invalid
    _WIRE[333].b is invalid
    _WIRE[333].g is invalid
    _WIRE[333].r is invalid
    _WIRE[334].b is invalid
    _WIRE[334].g is invalid
    _WIRE[334].r is invalid
    _WIRE[335].b is invalid
    _WIRE[335].g is invalid
    _WIRE[335].r is invalid
    _WIRE[336].b is invalid
    _WIRE[336].g is invalid
    _WIRE[336].r is invalid
    _WIRE[337].b is invalid
    _WIRE[337].g is invalid
    _WIRE[337].r is invalid
    _WIRE[338].b is invalid
    _WIRE[338].g is invalid
    _WIRE[338].r is invalid
    _WIRE[339].b is invalid
    _WIRE[339].g is invalid
    _WIRE[339].r is invalid
    _WIRE[340].b is invalid
    _WIRE[340].g is invalid
    _WIRE[340].r is invalid
    _WIRE[341].b is invalid
    _WIRE[341].g is invalid
    _WIRE[341].r is invalid
    _WIRE[342].b is invalid
    _WIRE[342].g is invalid
    _WIRE[342].r is invalid
    _WIRE[343].b is invalid
    _WIRE[343].g is invalid
    _WIRE[343].r is invalid
    _WIRE[344].b is invalid
    _WIRE[344].g is invalid
    _WIRE[344].r is invalid
    _WIRE[345].b is invalid
    _WIRE[345].g is invalid
    _WIRE[345].r is invalid
    _WIRE[346].b is invalid
    _WIRE[346].g is invalid
    _WIRE[346].r is invalid
    _WIRE[347].b is invalid
    _WIRE[347].g is invalid
    _WIRE[347].r is invalid
    _WIRE[348].b is invalid
    _WIRE[348].g is invalid
    _WIRE[348].r is invalid
    _WIRE[349].b is invalid
    _WIRE[349].g is invalid
    _WIRE[349].r is invalid
    _WIRE[350].b is invalid
    _WIRE[350].g is invalid
    _WIRE[350].r is invalid
    _WIRE[351].b is invalid
    _WIRE[351].g is invalid
    _WIRE[351].r is invalid
    _WIRE[352].b is invalid
    _WIRE[352].g is invalid
    _WIRE[352].r is invalid
    _WIRE[353].b is invalid
    _WIRE[353].g is invalid
    _WIRE[353].r is invalid
    _WIRE[354].b is invalid
    _WIRE[354].g is invalid
    _WIRE[354].r is invalid
    _WIRE[355].b is invalid
    _WIRE[355].g is invalid
    _WIRE[355].r is invalid
    _WIRE[356].b is invalid
    _WIRE[356].g is invalid
    _WIRE[356].r is invalid
    _WIRE[357].b is invalid
    _WIRE[357].g is invalid
    _WIRE[357].r is invalid
    _WIRE[358].b is invalid
    _WIRE[358].g is invalid
    _WIRE[358].r is invalid
    _WIRE[359].b is invalid
    _WIRE[359].g is invalid
    _WIRE[359].r is invalid
    _WIRE[360].b is invalid
    _WIRE[360].g is invalid
    _WIRE[360].r is invalid
    _WIRE[361].b is invalid
    _WIRE[361].g is invalid
    _WIRE[361].r is invalid
    _WIRE[362].b is invalid
    _WIRE[362].g is invalid
    _WIRE[362].r is invalid
    _WIRE[363].b is invalid
    _WIRE[363].g is invalid
    _WIRE[363].r is invalid
    _WIRE[364].b is invalid
    _WIRE[364].g is invalid
    _WIRE[364].r is invalid
    _WIRE[365].b is invalid
    _WIRE[365].g is invalid
    _WIRE[365].r is invalid
    _WIRE[366].b is invalid
    _WIRE[366].g is invalid
    _WIRE[366].r is invalid
    _WIRE[367].b is invalid
    _WIRE[367].g is invalid
    _WIRE[367].r is invalid
    _WIRE[368].b is invalid
    _WIRE[368].g is invalid
    _WIRE[368].r is invalid
    _WIRE[369].b is invalid
    _WIRE[369].g is invalid
    _WIRE[369].r is invalid
    _WIRE[370].b is invalid
    _WIRE[370].g is invalid
    _WIRE[370].r is invalid
    _WIRE[371].b is invalid
    _WIRE[371].g is invalid
    _WIRE[371].r is invalid
    _WIRE[372].b is invalid
    _WIRE[372].g is invalid
    _WIRE[372].r is invalid
    _WIRE[373].b is invalid
    _WIRE[373].g is invalid
    _WIRE[373].r is invalid
    _WIRE[374].b is invalid
    _WIRE[374].g is invalid
    _WIRE[374].r is invalid
    _WIRE[375].b is invalid
    _WIRE[375].g is invalid
    _WIRE[375].r is invalid
    _WIRE[376].b is invalid
    _WIRE[376].g is invalid
    _WIRE[376].r is invalid
    _WIRE[377].b is invalid
    _WIRE[377].g is invalid
    _WIRE[377].r is invalid
    _WIRE[378].b is invalid
    _WIRE[378].g is invalid
    _WIRE[378].r is invalid
    _WIRE[379].b is invalid
    _WIRE[379].g is invalid
    _WIRE[379].r is invalid
    _WIRE[380].b is invalid
    _WIRE[380].g is invalid
    _WIRE[380].r is invalid
    _WIRE[381].b is invalid
    _WIRE[381].g is invalid
    _WIRE[381].r is invalid
    _WIRE[382].b is invalid
    _WIRE[382].g is invalid
    _WIRE[382].r is invalid
    _WIRE[383].b is invalid
    _WIRE[383].g is invalid
    _WIRE[383].r is invalid
    _WIRE[384].b is invalid
    _WIRE[384].g is invalid
    _WIRE[384].r is invalid
    _WIRE[385].b is invalid
    _WIRE[385].g is invalid
    _WIRE[385].r is invalid
    _WIRE[386].b is invalid
    _WIRE[386].g is invalid
    _WIRE[386].r is invalid
    _WIRE[387].b is invalid
    _WIRE[387].g is invalid
    _WIRE[387].r is invalid
    _WIRE[388].b is invalid
    _WIRE[388].g is invalid
    _WIRE[388].r is invalid
    _WIRE[389].b is invalid
    _WIRE[389].g is invalid
    _WIRE[389].r is invalid
    _WIRE[390].b is invalid
    _WIRE[390].g is invalid
    _WIRE[390].r is invalid
    _WIRE[391].b is invalid
    _WIRE[391].g is invalid
    _WIRE[391].r is invalid
    _WIRE[392].b is invalid
    _WIRE[392].g is invalid
    _WIRE[392].r is invalid
    _WIRE[393].b is invalid
    _WIRE[393].g is invalid
    _WIRE[393].r is invalid
    _WIRE[394].b is invalid
    _WIRE[394].g is invalid
    _WIRE[394].r is invalid
    _WIRE[395].b is invalid
    _WIRE[395].g is invalid
    _WIRE[395].r is invalid
    _WIRE[396].b is invalid
    _WIRE[396].g is invalid
    _WIRE[396].r is invalid
    _WIRE[397].b is invalid
    _WIRE[397].g is invalid
    _WIRE[397].r is invalid
    _WIRE[398].b is invalid
    _WIRE[398].g is invalid
    _WIRE[398].r is invalid
    _WIRE[399].b is invalid
    _WIRE[399].g is invalid
    _WIRE[399].r is invalid
    _WIRE[400].b is invalid
    _WIRE[400].g is invalid
    _WIRE[400].r is invalid
    _WIRE[401].b is invalid
    _WIRE[401].g is invalid
    _WIRE[401].r is invalid
    _WIRE[402].b is invalid
    _WIRE[402].g is invalid
    _WIRE[402].r is invalid
    _WIRE[403].b is invalid
    _WIRE[403].g is invalid
    _WIRE[403].r is invalid
    _WIRE[404].b is invalid
    _WIRE[404].g is invalid
    _WIRE[404].r is invalid
    _WIRE[405].b is invalid
    _WIRE[405].g is invalid
    _WIRE[405].r is invalid
    _WIRE[406].b is invalid
    _WIRE[406].g is invalid
    _WIRE[406].r is invalid
    _WIRE[407].b is invalid
    _WIRE[407].g is invalid
    _WIRE[407].r is invalid
    _WIRE[408].b is invalid
    _WIRE[408].g is invalid
    _WIRE[408].r is invalid
    _WIRE[409].b is invalid
    _WIRE[409].g is invalid
    _WIRE[409].r is invalid
    _WIRE[410].b is invalid
    _WIRE[410].g is invalid
    _WIRE[410].r is invalid
    _WIRE[411].b is invalid
    _WIRE[411].g is invalid
    _WIRE[411].r is invalid
    _WIRE[412].b is invalid
    _WIRE[412].g is invalid
    _WIRE[412].r is invalid
    _WIRE[413].b is invalid
    _WIRE[413].g is invalid
    _WIRE[413].r is invalid
    _WIRE[414].b is invalid
    _WIRE[414].g is invalid
    _WIRE[414].r is invalid
    _WIRE[415].b is invalid
    _WIRE[415].g is invalid
    _WIRE[415].r is invalid
    _WIRE[416].b is invalid
    _WIRE[416].g is invalid
    _WIRE[416].r is invalid
    _WIRE[417].b is invalid
    _WIRE[417].g is invalid
    _WIRE[417].r is invalid
    _WIRE[418].b is invalid
    _WIRE[418].g is invalid
    _WIRE[418].r is invalid
    _WIRE[419].b is invalid
    _WIRE[419].g is invalid
    _WIRE[419].r is invalid
    _WIRE[420].b is invalid
    _WIRE[420].g is invalid
    _WIRE[420].r is invalid
    _WIRE[421].b is invalid
    _WIRE[421].g is invalid
    _WIRE[421].r is invalid
    _WIRE[422].b is invalid
    _WIRE[422].g is invalid
    _WIRE[422].r is invalid
    _WIRE[423].b is invalid
    _WIRE[423].g is invalid
    _WIRE[423].r is invalid
    _WIRE[424].b is invalid
    _WIRE[424].g is invalid
    _WIRE[424].r is invalid
    _WIRE[425].b is invalid
    _WIRE[425].g is invalid
    _WIRE[425].r is invalid
    _WIRE[426].b is invalid
    _WIRE[426].g is invalid
    _WIRE[426].r is invalid
    _WIRE[427].b is invalid
    _WIRE[427].g is invalid
    _WIRE[427].r is invalid
    _WIRE[428].b is invalid
    _WIRE[428].g is invalid
    _WIRE[428].r is invalid
    _WIRE[429].b is invalid
    _WIRE[429].g is invalid
    _WIRE[429].r is invalid
    _WIRE[430].b is invalid
    _WIRE[430].g is invalid
    _WIRE[430].r is invalid
    _WIRE[431].b is invalid
    _WIRE[431].g is invalid
    _WIRE[431].r is invalid
    _WIRE[432].b is invalid
    _WIRE[432].g is invalid
    _WIRE[432].r is invalid
    _WIRE[433].b is invalid
    _WIRE[433].g is invalid
    _WIRE[433].r is invalid
    _WIRE[434].b is invalid
    _WIRE[434].g is invalid
    _WIRE[434].r is invalid
    _WIRE[435].b is invalid
    _WIRE[435].g is invalid
    _WIRE[435].r is invalid
    _WIRE[436].b is invalid
    _WIRE[436].g is invalid
    _WIRE[436].r is invalid
    _WIRE[437].b is invalid
    _WIRE[437].g is invalid
    _WIRE[437].r is invalid
    _WIRE[438].b is invalid
    _WIRE[438].g is invalid
    _WIRE[438].r is invalid
    _WIRE[439].b is invalid
    _WIRE[439].g is invalid
    _WIRE[439].r is invalid
    _WIRE[440].b is invalid
    _WIRE[440].g is invalid
    _WIRE[440].r is invalid
    _WIRE[441].b is invalid
    _WIRE[441].g is invalid
    _WIRE[441].r is invalid
    _WIRE[442].b is invalid
    _WIRE[442].g is invalid
    _WIRE[442].r is invalid
    _WIRE[443].b is invalid
    _WIRE[443].g is invalid
    _WIRE[443].r is invalid
    _WIRE[444].b is invalid
    _WIRE[444].g is invalid
    _WIRE[444].r is invalid
    _WIRE[445].b is invalid
    _WIRE[445].g is invalid
    _WIRE[445].r is invalid
    _WIRE[446].b is invalid
    _WIRE[446].g is invalid
    _WIRE[446].r is invalid
    _WIRE[447].b is invalid
    _WIRE[447].g is invalid
    _WIRE[447].r is invalid
    _WIRE[448].b is invalid
    _WIRE[448].g is invalid
    _WIRE[448].r is invalid
    _WIRE[449].b is invalid
    _WIRE[449].g is invalid
    _WIRE[449].r is invalid
    _WIRE[450].b is invalid
    _WIRE[450].g is invalid
    _WIRE[450].r is invalid
    _WIRE[451].b is invalid
    _WIRE[451].g is invalid
    _WIRE[451].r is invalid
    _WIRE[452].b is invalid
    _WIRE[452].g is invalid
    _WIRE[452].r is invalid
    _WIRE[453].b is invalid
    _WIRE[453].g is invalid
    _WIRE[453].r is invalid
    _WIRE[454].b is invalid
    _WIRE[454].g is invalid
    _WIRE[454].r is invalid
    _WIRE[455].b is invalid
    _WIRE[455].g is invalid
    _WIRE[455].r is invalid
    _WIRE[456].b is invalid
    _WIRE[456].g is invalid
    _WIRE[456].r is invalid
    _WIRE[457].b is invalid
    _WIRE[457].g is invalid
    _WIRE[457].r is invalid
    _WIRE[458].b is invalid
    _WIRE[458].g is invalid
    _WIRE[458].r is invalid
    _WIRE[459].b is invalid
    _WIRE[459].g is invalid
    _WIRE[459].r is invalid
    _WIRE[460].b is invalid
    _WIRE[460].g is invalid
    _WIRE[460].r is invalid
    _WIRE[461].b is invalid
    _WIRE[461].g is invalid
    _WIRE[461].r is invalid
    _WIRE[462].b is invalid
    _WIRE[462].g is invalid
    _WIRE[462].r is invalid
    _WIRE[463].b is invalid
    _WIRE[463].g is invalid
    _WIRE[463].r is invalid
    _WIRE[464].b is invalid
    _WIRE[464].g is invalid
    _WIRE[464].r is invalid
    _WIRE[465].b is invalid
    _WIRE[465].g is invalid
    _WIRE[465].r is invalid
    _WIRE[466].b is invalid
    _WIRE[466].g is invalid
    _WIRE[466].r is invalid
    _WIRE[467].b is invalid
    _WIRE[467].g is invalid
    _WIRE[467].r is invalid
    _WIRE[468].b is invalid
    _WIRE[468].g is invalid
    _WIRE[468].r is invalid
    _WIRE[469].b is invalid
    _WIRE[469].g is invalid
    _WIRE[469].r is invalid
    _WIRE[470].b is invalid
    _WIRE[470].g is invalid
    _WIRE[470].r is invalid
    _WIRE[471].b is invalid
    _WIRE[471].g is invalid
    _WIRE[471].r is invalid
    _WIRE[472].b is invalid
    _WIRE[472].g is invalid
    _WIRE[472].r is invalid
    _WIRE[473].b is invalid
    _WIRE[473].g is invalid
    _WIRE[473].r is invalid
    _WIRE[474].b is invalid
    _WIRE[474].g is invalid
    _WIRE[474].r is invalid
    _WIRE[475].b is invalid
    _WIRE[475].g is invalid
    _WIRE[475].r is invalid
    _WIRE[476].b is invalid
    _WIRE[476].g is invalid
    _WIRE[476].r is invalid
    _WIRE[477].b is invalid
    _WIRE[477].g is invalid
    _WIRE[477].r is invalid
    _WIRE[478].b is invalid
    _WIRE[478].g is invalid
    _WIRE[478].r is invalid
    _WIRE[479].b is invalid
    _WIRE[479].g is invalid
    _WIRE[479].r is invalid
    _WIRE[480].b is invalid
    _WIRE[480].g is invalid
    _WIRE[480].r is invalid
    _WIRE[481].b is invalid
    _WIRE[481].g is invalid
    _WIRE[481].r is invalid
    _WIRE[482].b is invalid
    _WIRE[482].g is invalid
    _WIRE[482].r is invalid
    _WIRE[483].b is invalid
    _WIRE[483].g is invalid
    _WIRE[483].r is invalid
    _WIRE[484].b is invalid
    _WIRE[484].g is invalid
    _WIRE[484].r is invalid
    _WIRE[485].b is invalid
    _WIRE[485].g is invalid
    _WIRE[485].r is invalid
    _WIRE[486].b is invalid
    _WIRE[486].g is invalid
    _WIRE[486].r is invalid
    _WIRE[487].b is invalid
    _WIRE[487].g is invalid
    _WIRE[487].r is invalid
    _WIRE[488].b is invalid
    _WIRE[488].g is invalid
    _WIRE[488].r is invalid
    _WIRE[489].b is invalid
    _WIRE[489].g is invalid
    _WIRE[489].r is invalid
    _WIRE[490].b is invalid
    _WIRE[490].g is invalid
    _WIRE[490].r is invalid
    _WIRE[491].b is invalid
    _WIRE[491].g is invalid
    _WIRE[491].r is invalid
    _WIRE[492].b is invalid
    _WIRE[492].g is invalid
    _WIRE[492].r is invalid
    _WIRE[493].b is invalid
    _WIRE[493].g is invalid
    _WIRE[493].r is invalid
    _WIRE[494].b is invalid
    _WIRE[494].g is invalid
    _WIRE[494].r is invalid
    _WIRE[495].b is invalid
    _WIRE[495].g is invalid
    _WIRE[495].r is invalid
    _WIRE[496].b is invalid
    _WIRE[496].g is invalid
    _WIRE[496].r is invalid
    _WIRE[497].b is invalid
    _WIRE[497].g is invalid
    _WIRE[497].r is invalid
    _WIRE[498].b is invalid
    _WIRE[498].g is invalid
    _WIRE[498].r is invalid
    _WIRE[499].b is invalid
    _WIRE[499].g is invalid
    _WIRE[499].r is invalid
    _WIRE[500].b is invalid
    _WIRE[500].g is invalid
    _WIRE[500].r is invalid
    _WIRE[501].b is invalid
    _WIRE[501].g is invalid
    _WIRE[501].r is invalid
    _WIRE[502].b is invalid
    _WIRE[502].g is invalid
    _WIRE[502].r is invalid
    _WIRE[503].b is invalid
    _WIRE[503].g is invalid
    _WIRE[503].r is invalid
    _WIRE[504].b is invalid
    _WIRE[504].g is invalid
    _WIRE[504].r is invalid
    _WIRE[505].b is invalid
    _WIRE[505].g is invalid
    _WIRE[505].r is invalid
    _WIRE[506].b is invalid
    _WIRE[506].g is invalid
    _WIRE[506].r is invalid
    _WIRE[507].b is invalid
    _WIRE[507].g is invalid
    _WIRE[507].r is invalid
    _WIRE[508].b is invalid
    _WIRE[508].g is invalid
    _WIRE[508].r is invalid
    _WIRE[509].b is invalid
    _WIRE[509].g is invalid
    _WIRE[509].r is invalid
    _WIRE[510].b is invalid
    _WIRE[510].g is invalid
    _WIRE[510].r is invalid
    _WIRE[511].b is invalid
    _WIRE[511].g is invalid
    _WIRE[511].r is invalid
    _WIRE[512].b is invalid
    _WIRE[512].g is invalid
    _WIRE[512].r is invalid
    _WIRE[513].b is invalid
    _WIRE[513].g is invalid
    _WIRE[513].r is invalid
    _WIRE[514].b is invalid
    _WIRE[514].g is invalid
    _WIRE[514].r is invalid
    _WIRE[515].b is invalid
    _WIRE[515].g is invalid
    _WIRE[515].r is invalid
    _WIRE[516].b is invalid
    _WIRE[516].g is invalid
    _WIRE[516].r is invalid
    _WIRE[517].b is invalid
    _WIRE[517].g is invalid
    _WIRE[517].r is invalid
    _WIRE[518].b is invalid
    _WIRE[518].g is invalid
    _WIRE[518].r is invalid
    _WIRE[519].b is invalid
    _WIRE[519].g is invalid
    _WIRE[519].r is invalid
    _WIRE[520].b is invalid
    _WIRE[520].g is invalid
    _WIRE[520].r is invalid
    _WIRE[521].b is invalid
    _WIRE[521].g is invalid
    _WIRE[521].r is invalid
    _WIRE[522].b is invalid
    _WIRE[522].g is invalid
    _WIRE[522].r is invalid
    _WIRE[523].b is invalid
    _WIRE[523].g is invalid
    _WIRE[523].r is invalid
    _WIRE[524].b is invalid
    _WIRE[524].g is invalid
    _WIRE[524].r is invalid
    _WIRE[525].b is invalid
    _WIRE[525].g is invalid
    _WIRE[525].r is invalid
    _WIRE[526].b is invalid
    _WIRE[526].g is invalid
    _WIRE[526].r is invalid
    _WIRE[527].b is invalid
    _WIRE[527].g is invalid
    _WIRE[527].r is invalid
    _WIRE[528].b is invalid
    _WIRE[528].g is invalid
    _WIRE[528].r is invalid
    _WIRE[529].b is invalid
    _WIRE[529].g is invalid
    _WIRE[529].r is invalid
    _WIRE[530].b is invalid
    _WIRE[530].g is invalid
    _WIRE[530].r is invalid
    _WIRE[531].b is invalid
    _WIRE[531].g is invalid
    _WIRE[531].r is invalid
    _WIRE[532].b is invalid
    _WIRE[532].g is invalid
    _WIRE[532].r is invalid
    _WIRE[533].b is invalid
    _WIRE[533].g is invalid
    _WIRE[533].r is invalid
    _WIRE[534].b is invalid
    _WIRE[534].g is invalid
    _WIRE[534].r is invalid
    _WIRE[535].b is invalid
    _WIRE[535].g is invalid
    _WIRE[535].r is invalid
    _WIRE[536].b is invalid
    _WIRE[536].g is invalid
    _WIRE[536].r is invalid
    _WIRE[537].b is invalid
    _WIRE[537].g is invalid
    _WIRE[537].r is invalid
    _WIRE[538].b is invalid
    _WIRE[538].g is invalid
    _WIRE[538].r is invalid
    _WIRE[539].b is invalid
    _WIRE[539].g is invalid
    _WIRE[539].r is invalid
    _WIRE[540].b is invalid
    _WIRE[540].g is invalid
    _WIRE[540].r is invalid
    _WIRE[541].b is invalid
    _WIRE[541].g is invalid
    _WIRE[541].r is invalid
    _WIRE[542].b is invalid
    _WIRE[542].g is invalid
    _WIRE[542].r is invalid
    _WIRE[543].b is invalid
    _WIRE[543].g is invalid
    _WIRE[543].r is invalid
    _WIRE[544].b is invalid
    _WIRE[544].g is invalid
    _WIRE[544].r is invalid
    _WIRE[545].b is invalid
    _WIRE[545].g is invalid
    _WIRE[545].r is invalid
    _WIRE[546].b is invalid
    _WIRE[546].g is invalid
    _WIRE[546].r is invalid
    _WIRE[547].b is invalid
    _WIRE[547].g is invalid
    _WIRE[547].r is invalid
    _WIRE[548].b is invalid
    _WIRE[548].g is invalid
    _WIRE[548].r is invalid
    _WIRE[549].b is invalid
    _WIRE[549].g is invalid
    _WIRE[549].r is invalid
    _WIRE[550].b is invalid
    _WIRE[550].g is invalid
    _WIRE[550].r is invalid
    _WIRE[551].b is invalid
    _WIRE[551].g is invalid
    _WIRE[551].r is invalid
    _WIRE[552].b is invalid
    _WIRE[552].g is invalid
    _WIRE[552].r is invalid
    _WIRE[553].b is invalid
    _WIRE[553].g is invalid
    _WIRE[553].r is invalid
    _WIRE[554].b is invalid
    _WIRE[554].g is invalid
    _WIRE[554].r is invalid
    _WIRE[555].b is invalid
    _WIRE[555].g is invalid
    _WIRE[555].r is invalid
    _WIRE[556].b is invalid
    _WIRE[556].g is invalid
    _WIRE[556].r is invalid
    _WIRE[557].b is invalid
    _WIRE[557].g is invalid
    _WIRE[557].r is invalid
    _WIRE[558].b is invalid
    _WIRE[558].g is invalid
    _WIRE[558].r is invalid
    _WIRE[559].b is invalid
    _WIRE[559].g is invalid
    _WIRE[559].r is invalid
    _WIRE[560].b is invalid
    _WIRE[560].g is invalid
    _WIRE[560].r is invalid
    _WIRE[561].b is invalid
    _WIRE[561].g is invalid
    _WIRE[561].r is invalid
    _WIRE[562].b is invalid
    _WIRE[562].g is invalid
    _WIRE[562].r is invalid
    _WIRE[563].b is invalid
    _WIRE[563].g is invalid
    _WIRE[563].r is invalid
    _WIRE[564].b is invalid
    _WIRE[564].g is invalid
    _WIRE[564].r is invalid
    _WIRE[565].b is invalid
    _WIRE[565].g is invalid
    _WIRE[565].r is invalid
    _WIRE[566].b is invalid
    _WIRE[566].g is invalid
    _WIRE[566].r is invalid
    _WIRE[567].b is invalid
    _WIRE[567].g is invalid
    _WIRE[567].r is invalid
    _WIRE[568].b is invalid
    _WIRE[568].g is invalid
    _WIRE[568].r is invalid
    _WIRE[569].b is invalid
    _WIRE[569].g is invalid
    _WIRE[569].r is invalid
    _WIRE[570].b is invalid
    _WIRE[570].g is invalid
    _WIRE[570].r is invalid
    _WIRE[571].b is invalid
    _WIRE[571].g is invalid
    _WIRE[571].r is invalid
    _WIRE[572].b is invalid
    _WIRE[572].g is invalid
    _WIRE[572].r is invalid
    _WIRE[573].b is invalid
    _WIRE[573].g is invalid
    _WIRE[573].r is invalid
    _WIRE[574].b is invalid
    _WIRE[574].g is invalid
    _WIRE[574].r is invalid
    _WIRE[575].b is invalid
    _WIRE[575].g is invalid
    _WIRE[575].r is invalid
    _WIRE[576].b is invalid
    _WIRE[576].g is invalid
    _WIRE[576].r is invalid
    _WIRE[577].b is invalid
    _WIRE[577].g is invalid
    _WIRE[577].r is invalid
    _WIRE[578].b is invalid
    _WIRE[578].g is invalid
    _WIRE[578].r is invalid
    _WIRE[579].b is invalid
    _WIRE[579].g is invalid
    _WIRE[579].r is invalid
    _WIRE[580].b is invalid
    _WIRE[580].g is invalid
    _WIRE[580].r is invalid
    _WIRE[581].b is invalid
    _WIRE[581].g is invalid
    _WIRE[581].r is invalid
    _WIRE[582].b is invalid
    _WIRE[582].g is invalid
    _WIRE[582].r is invalid
    _WIRE[583].b is invalid
    _WIRE[583].g is invalid
    _WIRE[583].r is invalid
    _WIRE[584].b is invalid
    _WIRE[584].g is invalid
    _WIRE[584].r is invalid
    _WIRE[585].b is invalid
    _WIRE[585].g is invalid
    _WIRE[585].r is invalid
    _WIRE[586].b is invalid
    _WIRE[586].g is invalid
    _WIRE[586].r is invalid
    _WIRE[587].b is invalid
    _WIRE[587].g is invalid
    _WIRE[587].r is invalid
    _WIRE[588].b is invalid
    _WIRE[588].g is invalid
    _WIRE[588].r is invalid
    _WIRE[589].b is invalid
    _WIRE[589].g is invalid
    _WIRE[589].r is invalid
    _WIRE[590].b is invalid
    _WIRE[590].g is invalid
    _WIRE[590].r is invalid
    _WIRE[591].b is invalid
    _WIRE[591].g is invalid
    _WIRE[591].r is invalid
    _WIRE[592].b is invalid
    _WIRE[592].g is invalid
    _WIRE[592].r is invalid
    _WIRE[593].b is invalid
    _WIRE[593].g is invalid
    _WIRE[593].r is invalid
    _WIRE[594].b is invalid
    _WIRE[594].g is invalid
    _WIRE[594].r is invalid
    _WIRE[595].b is invalid
    _WIRE[595].g is invalid
    _WIRE[595].r is invalid
    _WIRE[596].b is invalid
    _WIRE[596].g is invalid
    _WIRE[596].r is invalid
    _WIRE[597].b is invalid
    _WIRE[597].g is invalid
    _WIRE[597].r is invalid
    _WIRE[598].b is invalid
    _WIRE[598].g is invalid
    _WIRE[598].r is invalid
    _WIRE[599].b is invalid
    _WIRE[599].g is invalid
    _WIRE[599].r is invalid
    _WIRE[600].b is invalid
    _WIRE[600].g is invalid
    _WIRE[600].r is invalid
    _WIRE[601].b is invalid
    _WIRE[601].g is invalid
    _WIRE[601].r is invalid
    _WIRE[602].b is invalid
    _WIRE[602].g is invalid
    _WIRE[602].r is invalid
    _WIRE[603].b is invalid
    _WIRE[603].g is invalid
    _WIRE[603].r is invalid
    _WIRE[604].b is invalid
    _WIRE[604].g is invalid
    _WIRE[604].r is invalid
    _WIRE[605].b is invalid
    _WIRE[605].g is invalid
    _WIRE[605].r is invalid
    _WIRE[606].b is invalid
    _WIRE[606].g is invalid
    _WIRE[606].r is invalid
    _WIRE[607].b is invalid
    _WIRE[607].g is invalid
    _WIRE[607].r is invalid
    _WIRE[608].b is invalid
    _WIRE[608].g is invalid
    _WIRE[608].r is invalid
    _WIRE[609].b is invalid
    _WIRE[609].g is invalid
    _WIRE[609].r is invalid
    _WIRE[610].b is invalid
    _WIRE[610].g is invalid
    _WIRE[610].r is invalid
    _WIRE[611].b is invalid
    _WIRE[611].g is invalid
    _WIRE[611].r is invalid
    _WIRE[612].b is invalid
    _WIRE[612].g is invalid
    _WIRE[612].r is invalid
    _WIRE[613].b is invalid
    _WIRE[613].g is invalid
    _WIRE[613].r is invalid
    _WIRE[614].b is invalid
    _WIRE[614].g is invalid
    _WIRE[614].r is invalid
    _WIRE[615].b is invalid
    _WIRE[615].g is invalid
    _WIRE[615].r is invalid
    _WIRE[616].b is invalid
    _WIRE[616].g is invalid
    _WIRE[616].r is invalid
    _WIRE[617].b is invalid
    _WIRE[617].g is invalid
    _WIRE[617].r is invalid
    _WIRE[618].b is invalid
    _WIRE[618].g is invalid
    _WIRE[618].r is invalid
    _WIRE[619].b is invalid
    _WIRE[619].g is invalid
    _WIRE[619].r is invalid
    _WIRE[620].b is invalid
    _WIRE[620].g is invalid
    _WIRE[620].r is invalid
    _WIRE[621].b is invalid
    _WIRE[621].g is invalid
    _WIRE[621].r is invalid
    _WIRE[622].b is invalid
    _WIRE[622].g is invalid
    _WIRE[622].r is invalid
    _WIRE[623].b is invalid
    _WIRE[623].g is invalid
    _WIRE[623].r is invalid
    _WIRE[624].b is invalid
    _WIRE[624].g is invalid
    _WIRE[624].r is invalid
    _WIRE[625].b is invalid
    _WIRE[625].g is invalid
    _WIRE[625].r is invalid
    _WIRE[626].b is invalid
    _WIRE[626].g is invalid
    _WIRE[626].r is invalid
    _WIRE[627].b is invalid
    _WIRE[627].g is invalid
    _WIRE[627].r is invalid
    _WIRE[628].b is invalid
    _WIRE[628].g is invalid
    _WIRE[628].r is invalid
    _WIRE[629].b is invalid
    _WIRE[629].g is invalid
    _WIRE[629].r is invalid
    _WIRE[630].b is invalid
    _WIRE[630].g is invalid
    _WIRE[630].r is invalid
    _WIRE[631].b is invalid
    _WIRE[631].g is invalid
    _WIRE[631].r is invalid
    _WIRE[632].b is invalid
    _WIRE[632].g is invalid
    _WIRE[632].r is invalid
    _WIRE[633].b is invalid
    _WIRE[633].g is invalid
    _WIRE[633].r is invalid
    _WIRE[634].b is invalid
    _WIRE[634].g is invalid
    _WIRE[634].r is invalid
    _WIRE[635].b is invalid
    _WIRE[635].g is invalid
    _WIRE[635].r is invalid
    _WIRE[636].b is invalid
    _WIRE[636].g is invalid
    _WIRE[636].r is invalid
    _WIRE[637].b is invalid
    _WIRE[637].g is invalid
    _WIRE[637].r is invalid
    _WIRE[638].b is invalid
    _WIRE[638].g is invalid
    _WIRE[638].r is invalid
    _WIRE[639].b is invalid
    _WIRE[639].g is invalid
    _WIRE[639].r is invalid
    reg px_buffer : {r : UInt<8>, g : UInt<8>, b : UInt<8>}[640], clock @[EdgeDetect.scala 31:26]
    px_buffer[0].b <= _WIRE[0].b @[EdgeDetect.scala 31:26]
    px_buffer[0].g <= _WIRE[0].g @[EdgeDetect.scala 31:26]
    px_buffer[0].r <= _WIRE[0].r @[EdgeDetect.scala 31:26]
    px_buffer[1].b <= _WIRE[1].b @[EdgeDetect.scala 31:26]
    px_buffer[1].g <= _WIRE[1].g @[EdgeDetect.scala 31:26]
    px_buffer[1].r <= _WIRE[1].r @[EdgeDetect.scala 31:26]
    px_buffer[2].b <= _WIRE[2].b @[EdgeDetect.scala 31:26]
    px_buffer[2].g <= _WIRE[2].g @[EdgeDetect.scala 31:26]
    px_buffer[2].r <= _WIRE[2].r @[EdgeDetect.scala 31:26]
    px_buffer[3].b <= _WIRE[3].b @[EdgeDetect.scala 31:26]
    px_buffer[3].g <= _WIRE[3].g @[EdgeDetect.scala 31:26]
    px_buffer[3].r <= _WIRE[3].r @[EdgeDetect.scala 31:26]
    px_buffer[4].b <= _WIRE[4].b @[EdgeDetect.scala 31:26]
    px_buffer[4].g <= _WIRE[4].g @[EdgeDetect.scala 31:26]
    px_buffer[4].r <= _WIRE[4].r @[EdgeDetect.scala 31:26]
    px_buffer[5].b <= _WIRE[5].b @[EdgeDetect.scala 31:26]
    px_buffer[5].g <= _WIRE[5].g @[EdgeDetect.scala 31:26]
    px_buffer[5].r <= _WIRE[5].r @[EdgeDetect.scala 31:26]
    px_buffer[6].b <= _WIRE[6].b @[EdgeDetect.scala 31:26]
    px_buffer[6].g <= _WIRE[6].g @[EdgeDetect.scala 31:26]
    px_buffer[6].r <= _WIRE[6].r @[EdgeDetect.scala 31:26]
    px_buffer[7].b <= _WIRE[7].b @[EdgeDetect.scala 31:26]
    px_buffer[7].g <= _WIRE[7].g @[EdgeDetect.scala 31:26]
    px_buffer[7].r <= _WIRE[7].r @[EdgeDetect.scala 31:26]
    px_buffer[8].b <= _WIRE[8].b @[EdgeDetect.scala 31:26]
    px_buffer[8].g <= _WIRE[8].g @[EdgeDetect.scala 31:26]
    px_buffer[8].r <= _WIRE[8].r @[EdgeDetect.scala 31:26]
    px_buffer[9].b <= _WIRE[9].b @[EdgeDetect.scala 31:26]
    px_buffer[9].g <= _WIRE[9].g @[EdgeDetect.scala 31:26]
    px_buffer[9].r <= _WIRE[9].r @[EdgeDetect.scala 31:26]
    px_buffer[10].b <= _WIRE[10].b @[EdgeDetect.scala 31:26]
    px_buffer[10].g <= _WIRE[10].g @[EdgeDetect.scala 31:26]
    px_buffer[10].r <= _WIRE[10].r @[EdgeDetect.scala 31:26]
    px_buffer[11].b <= _WIRE[11].b @[EdgeDetect.scala 31:26]
    px_buffer[11].g <= _WIRE[11].g @[EdgeDetect.scala 31:26]
    px_buffer[11].r <= _WIRE[11].r @[EdgeDetect.scala 31:26]
    px_buffer[12].b <= _WIRE[12].b @[EdgeDetect.scala 31:26]
    px_buffer[12].g <= _WIRE[12].g @[EdgeDetect.scala 31:26]
    px_buffer[12].r <= _WIRE[12].r @[EdgeDetect.scala 31:26]
    px_buffer[13].b <= _WIRE[13].b @[EdgeDetect.scala 31:26]
    px_buffer[13].g <= _WIRE[13].g @[EdgeDetect.scala 31:26]
    px_buffer[13].r <= _WIRE[13].r @[EdgeDetect.scala 31:26]
    px_buffer[14].b <= _WIRE[14].b @[EdgeDetect.scala 31:26]
    px_buffer[14].g <= _WIRE[14].g @[EdgeDetect.scala 31:26]
    px_buffer[14].r <= _WIRE[14].r @[EdgeDetect.scala 31:26]
    px_buffer[15].b <= _WIRE[15].b @[EdgeDetect.scala 31:26]
    px_buffer[15].g <= _WIRE[15].g @[EdgeDetect.scala 31:26]
    px_buffer[15].r <= _WIRE[15].r @[EdgeDetect.scala 31:26]
    px_buffer[16].b <= _WIRE[16].b @[EdgeDetect.scala 31:26]
    px_buffer[16].g <= _WIRE[16].g @[EdgeDetect.scala 31:26]
    px_buffer[16].r <= _WIRE[16].r @[EdgeDetect.scala 31:26]
    px_buffer[17].b <= _WIRE[17].b @[EdgeDetect.scala 31:26]
    px_buffer[17].g <= _WIRE[17].g @[EdgeDetect.scala 31:26]
    px_buffer[17].r <= _WIRE[17].r @[EdgeDetect.scala 31:26]
    px_buffer[18].b <= _WIRE[18].b @[EdgeDetect.scala 31:26]
    px_buffer[18].g <= _WIRE[18].g @[EdgeDetect.scala 31:26]
    px_buffer[18].r <= _WIRE[18].r @[EdgeDetect.scala 31:26]
    px_buffer[19].b <= _WIRE[19].b @[EdgeDetect.scala 31:26]
    px_buffer[19].g <= _WIRE[19].g @[EdgeDetect.scala 31:26]
    px_buffer[19].r <= _WIRE[19].r @[EdgeDetect.scala 31:26]
    px_buffer[20].b <= _WIRE[20].b @[EdgeDetect.scala 31:26]
    px_buffer[20].g <= _WIRE[20].g @[EdgeDetect.scala 31:26]
    px_buffer[20].r <= _WIRE[20].r @[EdgeDetect.scala 31:26]
    px_buffer[21].b <= _WIRE[21].b @[EdgeDetect.scala 31:26]
    px_buffer[21].g <= _WIRE[21].g @[EdgeDetect.scala 31:26]
    px_buffer[21].r <= _WIRE[21].r @[EdgeDetect.scala 31:26]
    px_buffer[22].b <= _WIRE[22].b @[EdgeDetect.scala 31:26]
    px_buffer[22].g <= _WIRE[22].g @[EdgeDetect.scala 31:26]
    px_buffer[22].r <= _WIRE[22].r @[EdgeDetect.scala 31:26]
    px_buffer[23].b <= _WIRE[23].b @[EdgeDetect.scala 31:26]
    px_buffer[23].g <= _WIRE[23].g @[EdgeDetect.scala 31:26]
    px_buffer[23].r <= _WIRE[23].r @[EdgeDetect.scala 31:26]
    px_buffer[24].b <= _WIRE[24].b @[EdgeDetect.scala 31:26]
    px_buffer[24].g <= _WIRE[24].g @[EdgeDetect.scala 31:26]
    px_buffer[24].r <= _WIRE[24].r @[EdgeDetect.scala 31:26]
    px_buffer[25].b <= _WIRE[25].b @[EdgeDetect.scala 31:26]
    px_buffer[25].g <= _WIRE[25].g @[EdgeDetect.scala 31:26]
    px_buffer[25].r <= _WIRE[25].r @[EdgeDetect.scala 31:26]
    px_buffer[26].b <= _WIRE[26].b @[EdgeDetect.scala 31:26]
    px_buffer[26].g <= _WIRE[26].g @[EdgeDetect.scala 31:26]
    px_buffer[26].r <= _WIRE[26].r @[EdgeDetect.scala 31:26]
    px_buffer[27].b <= _WIRE[27].b @[EdgeDetect.scala 31:26]
    px_buffer[27].g <= _WIRE[27].g @[EdgeDetect.scala 31:26]
    px_buffer[27].r <= _WIRE[27].r @[EdgeDetect.scala 31:26]
    px_buffer[28].b <= _WIRE[28].b @[EdgeDetect.scala 31:26]
    px_buffer[28].g <= _WIRE[28].g @[EdgeDetect.scala 31:26]
    px_buffer[28].r <= _WIRE[28].r @[EdgeDetect.scala 31:26]
    px_buffer[29].b <= _WIRE[29].b @[EdgeDetect.scala 31:26]
    px_buffer[29].g <= _WIRE[29].g @[EdgeDetect.scala 31:26]
    px_buffer[29].r <= _WIRE[29].r @[EdgeDetect.scala 31:26]
    px_buffer[30].b <= _WIRE[30].b @[EdgeDetect.scala 31:26]
    px_buffer[30].g <= _WIRE[30].g @[EdgeDetect.scala 31:26]
    px_buffer[30].r <= _WIRE[30].r @[EdgeDetect.scala 31:26]
    px_buffer[31].b <= _WIRE[31].b @[EdgeDetect.scala 31:26]
    px_buffer[31].g <= _WIRE[31].g @[EdgeDetect.scala 31:26]
    px_buffer[31].r <= _WIRE[31].r @[EdgeDetect.scala 31:26]
    px_buffer[32].b <= _WIRE[32].b @[EdgeDetect.scala 31:26]
    px_buffer[32].g <= _WIRE[32].g @[EdgeDetect.scala 31:26]
    px_buffer[32].r <= _WIRE[32].r @[EdgeDetect.scala 31:26]
    px_buffer[33].b <= _WIRE[33].b @[EdgeDetect.scala 31:26]
    px_buffer[33].g <= _WIRE[33].g @[EdgeDetect.scala 31:26]
    px_buffer[33].r <= _WIRE[33].r @[EdgeDetect.scala 31:26]
    px_buffer[34].b <= _WIRE[34].b @[EdgeDetect.scala 31:26]
    px_buffer[34].g <= _WIRE[34].g @[EdgeDetect.scala 31:26]
    px_buffer[34].r <= _WIRE[34].r @[EdgeDetect.scala 31:26]
    px_buffer[35].b <= _WIRE[35].b @[EdgeDetect.scala 31:26]
    px_buffer[35].g <= _WIRE[35].g @[EdgeDetect.scala 31:26]
    px_buffer[35].r <= _WIRE[35].r @[EdgeDetect.scala 31:26]
    px_buffer[36].b <= _WIRE[36].b @[EdgeDetect.scala 31:26]
    px_buffer[36].g <= _WIRE[36].g @[EdgeDetect.scala 31:26]
    px_buffer[36].r <= _WIRE[36].r @[EdgeDetect.scala 31:26]
    px_buffer[37].b <= _WIRE[37].b @[EdgeDetect.scala 31:26]
    px_buffer[37].g <= _WIRE[37].g @[EdgeDetect.scala 31:26]
    px_buffer[37].r <= _WIRE[37].r @[EdgeDetect.scala 31:26]
    px_buffer[38].b <= _WIRE[38].b @[EdgeDetect.scala 31:26]
    px_buffer[38].g <= _WIRE[38].g @[EdgeDetect.scala 31:26]
    px_buffer[38].r <= _WIRE[38].r @[EdgeDetect.scala 31:26]
    px_buffer[39].b <= _WIRE[39].b @[EdgeDetect.scala 31:26]
    px_buffer[39].g <= _WIRE[39].g @[EdgeDetect.scala 31:26]
    px_buffer[39].r <= _WIRE[39].r @[EdgeDetect.scala 31:26]
    px_buffer[40].b <= _WIRE[40].b @[EdgeDetect.scala 31:26]
    px_buffer[40].g <= _WIRE[40].g @[EdgeDetect.scala 31:26]
    px_buffer[40].r <= _WIRE[40].r @[EdgeDetect.scala 31:26]
    px_buffer[41].b <= _WIRE[41].b @[EdgeDetect.scala 31:26]
    px_buffer[41].g <= _WIRE[41].g @[EdgeDetect.scala 31:26]
    px_buffer[41].r <= _WIRE[41].r @[EdgeDetect.scala 31:26]
    px_buffer[42].b <= _WIRE[42].b @[EdgeDetect.scala 31:26]
    px_buffer[42].g <= _WIRE[42].g @[EdgeDetect.scala 31:26]
    px_buffer[42].r <= _WIRE[42].r @[EdgeDetect.scala 31:26]
    px_buffer[43].b <= _WIRE[43].b @[EdgeDetect.scala 31:26]
    px_buffer[43].g <= _WIRE[43].g @[EdgeDetect.scala 31:26]
    px_buffer[43].r <= _WIRE[43].r @[EdgeDetect.scala 31:26]
    px_buffer[44].b <= _WIRE[44].b @[EdgeDetect.scala 31:26]
    px_buffer[44].g <= _WIRE[44].g @[EdgeDetect.scala 31:26]
    px_buffer[44].r <= _WIRE[44].r @[EdgeDetect.scala 31:26]
    px_buffer[45].b <= _WIRE[45].b @[EdgeDetect.scala 31:26]
    px_buffer[45].g <= _WIRE[45].g @[EdgeDetect.scala 31:26]
    px_buffer[45].r <= _WIRE[45].r @[EdgeDetect.scala 31:26]
    px_buffer[46].b <= _WIRE[46].b @[EdgeDetect.scala 31:26]
    px_buffer[46].g <= _WIRE[46].g @[EdgeDetect.scala 31:26]
    px_buffer[46].r <= _WIRE[46].r @[EdgeDetect.scala 31:26]
    px_buffer[47].b <= _WIRE[47].b @[EdgeDetect.scala 31:26]
    px_buffer[47].g <= _WIRE[47].g @[EdgeDetect.scala 31:26]
    px_buffer[47].r <= _WIRE[47].r @[EdgeDetect.scala 31:26]
    px_buffer[48].b <= _WIRE[48].b @[EdgeDetect.scala 31:26]
    px_buffer[48].g <= _WIRE[48].g @[EdgeDetect.scala 31:26]
    px_buffer[48].r <= _WIRE[48].r @[EdgeDetect.scala 31:26]
    px_buffer[49].b <= _WIRE[49].b @[EdgeDetect.scala 31:26]
    px_buffer[49].g <= _WIRE[49].g @[EdgeDetect.scala 31:26]
    px_buffer[49].r <= _WIRE[49].r @[EdgeDetect.scala 31:26]
    px_buffer[50].b <= _WIRE[50].b @[EdgeDetect.scala 31:26]
    px_buffer[50].g <= _WIRE[50].g @[EdgeDetect.scala 31:26]
    px_buffer[50].r <= _WIRE[50].r @[EdgeDetect.scala 31:26]
    px_buffer[51].b <= _WIRE[51].b @[EdgeDetect.scala 31:26]
    px_buffer[51].g <= _WIRE[51].g @[EdgeDetect.scala 31:26]
    px_buffer[51].r <= _WIRE[51].r @[EdgeDetect.scala 31:26]
    px_buffer[52].b <= _WIRE[52].b @[EdgeDetect.scala 31:26]
    px_buffer[52].g <= _WIRE[52].g @[EdgeDetect.scala 31:26]
    px_buffer[52].r <= _WIRE[52].r @[EdgeDetect.scala 31:26]
    px_buffer[53].b <= _WIRE[53].b @[EdgeDetect.scala 31:26]
    px_buffer[53].g <= _WIRE[53].g @[EdgeDetect.scala 31:26]
    px_buffer[53].r <= _WIRE[53].r @[EdgeDetect.scala 31:26]
    px_buffer[54].b <= _WIRE[54].b @[EdgeDetect.scala 31:26]
    px_buffer[54].g <= _WIRE[54].g @[EdgeDetect.scala 31:26]
    px_buffer[54].r <= _WIRE[54].r @[EdgeDetect.scala 31:26]
    px_buffer[55].b <= _WIRE[55].b @[EdgeDetect.scala 31:26]
    px_buffer[55].g <= _WIRE[55].g @[EdgeDetect.scala 31:26]
    px_buffer[55].r <= _WIRE[55].r @[EdgeDetect.scala 31:26]
    px_buffer[56].b <= _WIRE[56].b @[EdgeDetect.scala 31:26]
    px_buffer[56].g <= _WIRE[56].g @[EdgeDetect.scala 31:26]
    px_buffer[56].r <= _WIRE[56].r @[EdgeDetect.scala 31:26]
    px_buffer[57].b <= _WIRE[57].b @[EdgeDetect.scala 31:26]
    px_buffer[57].g <= _WIRE[57].g @[EdgeDetect.scala 31:26]
    px_buffer[57].r <= _WIRE[57].r @[EdgeDetect.scala 31:26]
    px_buffer[58].b <= _WIRE[58].b @[EdgeDetect.scala 31:26]
    px_buffer[58].g <= _WIRE[58].g @[EdgeDetect.scala 31:26]
    px_buffer[58].r <= _WIRE[58].r @[EdgeDetect.scala 31:26]
    px_buffer[59].b <= _WIRE[59].b @[EdgeDetect.scala 31:26]
    px_buffer[59].g <= _WIRE[59].g @[EdgeDetect.scala 31:26]
    px_buffer[59].r <= _WIRE[59].r @[EdgeDetect.scala 31:26]
    px_buffer[60].b <= _WIRE[60].b @[EdgeDetect.scala 31:26]
    px_buffer[60].g <= _WIRE[60].g @[EdgeDetect.scala 31:26]
    px_buffer[60].r <= _WIRE[60].r @[EdgeDetect.scala 31:26]
    px_buffer[61].b <= _WIRE[61].b @[EdgeDetect.scala 31:26]
    px_buffer[61].g <= _WIRE[61].g @[EdgeDetect.scala 31:26]
    px_buffer[61].r <= _WIRE[61].r @[EdgeDetect.scala 31:26]
    px_buffer[62].b <= _WIRE[62].b @[EdgeDetect.scala 31:26]
    px_buffer[62].g <= _WIRE[62].g @[EdgeDetect.scala 31:26]
    px_buffer[62].r <= _WIRE[62].r @[EdgeDetect.scala 31:26]
    px_buffer[63].b <= _WIRE[63].b @[EdgeDetect.scala 31:26]
    px_buffer[63].g <= _WIRE[63].g @[EdgeDetect.scala 31:26]
    px_buffer[63].r <= _WIRE[63].r @[EdgeDetect.scala 31:26]
    px_buffer[64].b <= _WIRE[64].b @[EdgeDetect.scala 31:26]
    px_buffer[64].g <= _WIRE[64].g @[EdgeDetect.scala 31:26]
    px_buffer[64].r <= _WIRE[64].r @[EdgeDetect.scala 31:26]
    px_buffer[65].b <= _WIRE[65].b @[EdgeDetect.scala 31:26]
    px_buffer[65].g <= _WIRE[65].g @[EdgeDetect.scala 31:26]
    px_buffer[65].r <= _WIRE[65].r @[EdgeDetect.scala 31:26]
    px_buffer[66].b <= _WIRE[66].b @[EdgeDetect.scala 31:26]
    px_buffer[66].g <= _WIRE[66].g @[EdgeDetect.scala 31:26]
    px_buffer[66].r <= _WIRE[66].r @[EdgeDetect.scala 31:26]
    px_buffer[67].b <= _WIRE[67].b @[EdgeDetect.scala 31:26]
    px_buffer[67].g <= _WIRE[67].g @[EdgeDetect.scala 31:26]
    px_buffer[67].r <= _WIRE[67].r @[EdgeDetect.scala 31:26]
    px_buffer[68].b <= _WIRE[68].b @[EdgeDetect.scala 31:26]
    px_buffer[68].g <= _WIRE[68].g @[EdgeDetect.scala 31:26]
    px_buffer[68].r <= _WIRE[68].r @[EdgeDetect.scala 31:26]
    px_buffer[69].b <= _WIRE[69].b @[EdgeDetect.scala 31:26]
    px_buffer[69].g <= _WIRE[69].g @[EdgeDetect.scala 31:26]
    px_buffer[69].r <= _WIRE[69].r @[EdgeDetect.scala 31:26]
    px_buffer[70].b <= _WIRE[70].b @[EdgeDetect.scala 31:26]
    px_buffer[70].g <= _WIRE[70].g @[EdgeDetect.scala 31:26]
    px_buffer[70].r <= _WIRE[70].r @[EdgeDetect.scala 31:26]
    px_buffer[71].b <= _WIRE[71].b @[EdgeDetect.scala 31:26]
    px_buffer[71].g <= _WIRE[71].g @[EdgeDetect.scala 31:26]
    px_buffer[71].r <= _WIRE[71].r @[EdgeDetect.scala 31:26]
    px_buffer[72].b <= _WIRE[72].b @[EdgeDetect.scala 31:26]
    px_buffer[72].g <= _WIRE[72].g @[EdgeDetect.scala 31:26]
    px_buffer[72].r <= _WIRE[72].r @[EdgeDetect.scala 31:26]
    px_buffer[73].b <= _WIRE[73].b @[EdgeDetect.scala 31:26]
    px_buffer[73].g <= _WIRE[73].g @[EdgeDetect.scala 31:26]
    px_buffer[73].r <= _WIRE[73].r @[EdgeDetect.scala 31:26]
    px_buffer[74].b <= _WIRE[74].b @[EdgeDetect.scala 31:26]
    px_buffer[74].g <= _WIRE[74].g @[EdgeDetect.scala 31:26]
    px_buffer[74].r <= _WIRE[74].r @[EdgeDetect.scala 31:26]
    px_buffer[75].b <= _WIRE[75].b @[EdgeDetect.scala 31:26]
    px_buffer[75].g <= _WIRE[75].g @[EdgeDetect.scala 31:26]
    px_buffer[75].r <= _WIRE[75].r @[EdgeDetect.scala 31:26]
    px_buffer[76].b <= _WIRE[76].b @[EdgeDetect.scala 31:26]
    px_buffer[76].g <= _WIRE[76].g @[EdgeDetect.scala 31:26]
    px_buffer[76].r <= _WIRE[76].r @[EdgeDetect.scala 31:26]
    px_buffer[77].b <= _WIRE[77].b @[EdgeDetect.scala 31:26]
    px_buffer[77].g <= _WIRE[77].g @[EdgeDetect.scala 31:26]
    px_buffer[77].r <= _WIRE[77].r @[EdgeDetect.scala 31:26]
    px_buffer[78].b <= _WIRE[78].b @[EdgeDetect.scala 31:26]
    px_buffer[78].g <= _WIRE[78].g @[EdgeDetect.scala 31:26]
    px_buffer[78].r <= _WIRE[78].r @[EdgeDetect.scala 31:26]
    px_buffer[79].b <= _WIRE[79].b @[EdgeDetect.scala 31:26]
    px_buffer[79].g <= _WIRE[79].g @[EdgeDetect.scala 31:26]
    px_buffer[79].r <= _WIRE[79].r @[EdgeDetect.scala 31:26]
    px_buffer[80].b <= _WIRE[80].b @[EdgeDetect.scala 31:26]
    px_buffer[80].g <= _WIRE[80].g @[EdgeDetect.scala 31:26]
    px_buffer[80].r <= _WIRE[80].r @[EdgeDetect.scala 31:26]
    px_buffer[81].b <= _WIRE[81].b @[EdgeDetect.scala 31:26]
    px_buffer[81].g <= _WIRE[81].g @[EdgeDetect.scala 31:26]
    px_buffer[81].r <= _WIRE[81].r @[EdgeDetect.scala 31:26]
    px_buffer[82].b <= _WIRE[82].b @[EdgeDetect.scala 31:26]
    px_buffer[82].g <= _WIRE[82].g @[EdgeDetect.scala 31:26]
    px_buffer[82].r <= _WIRE[82].r @[EdgeDetect.scala 31:26]
    px_buffer[83].b <= _WIRE[83].b @[EdgeDetect.scala 31:26]
    px_buffer[83].g <= _WIRE[83].g @[EdgeDetect.scala 31:26]
    px_buffer[83].r <= _WIRE[83].r @[EdgeDetect.scala 31:26]
    px_buffer[84].b <= _WIRE[84].b @[EdgeDetect.scala 31:26]
    px_buffer[84].g <= _WIRE[84].g @[EdgeDetect.scala 31:26]
    px_buffer[84].r <= _WIRE[84].r @[EdgeDetect.scala 31:26]
    px_buffer[85].b <= _WIRE[85].b @[EdgeDetect.scala 31:26]
    px_buffer[85].g <= _WIRE[85].g @[EdgeDetect.scala 31:26]
    px_buffer[85].r <= _WIRE[85].r @[EdgeDetect.scala 31:26]
    px_buffer[86].b <= _WIRE[86].b @[EdgeDetect.scala 31:26]
    px_buffer[86].g <= _WIRE[86].g @[EdgeDetect.scala 31:26]
    px_buffer[86].r <= _WIRE[86].r @[EdgeDetect.scala 31:26]
    px_buffer[87].b <= _WIRE[87].b @[EdgeDetect.scala 31:26]
    px_buffer[87].g <= _WIRE[87].g @[EdgeDetect.scala 31:26]
    px_buffer[87].r <= _WIRE[87].r @[EdgeDetect.scala 31:26]
    px_buffer[88].b <= _WIRE[88].b @[EdgeDetect.scala 31:26]
    px_buffer[88].g <= _WIRE[88].g @[EdgeDetect.scala 31:26]
    px_buffer[88].r <= _WIRE[88].r @[EdgeDetect.scala 31:26]
    px_buffer[89].b <= _WIRE[89].b @[EdgeDetect.scala 31:26]
    px_buffer[89].g <= _WIRE[89].g @[EdgeDetect.scala 31:26]
    px_buffer[89].r <= _WIRE[89].r @[EdgeDetect.scala 31:26]
    px_buffer[90].b <= _WIRE[90].b @[EdgeDetect.scala 31:26]
    px_buffer[90].g <= _WIRE[90].g @[EdgeDetect.scala 31:26]
    px_buffer[90].r <= _WIRE[90].r @[EdgeDetect.scala 31:26]
    px_buffer[91].b <= _WIRE[91].b @[EdgeDetect.scala 31:26]
    px_buffer[91].g <= _WIRE[91].g @[EdgeDetect.scala 31:26]
    px_buffer[91].r <= _WIRE[91].r @[EdgeDetect.scala 31:26]
    px_buffer[92].b <= _WIRE[92].b @[EdgeDetect.scala 31:26]
    px_buffer[92].g <= _WIRE[92].g @[EdgeDetect.scala 31:26]
    px_buffer[92].r <= _WIRE[92].r @[EdgeDetect.scala 31:26]
    px_buffer[93].b <= _WIRE[93].b @[EdgeDetect.scala 31:26]
    px_buffer[93].g <= _WIRE[93].g @[EdgeDetect.scala 31:26]
    px_buffer[93].r <= _WIRE[93].r @[EdgeDetect.scala 31:26]
    px_buffer[94].b <= _WIRE[94].b @[EdgeDetect.scala 31:26]
    px_buffer[94].g <= _WIRE[94].g @[EdgeDetect.scala 31:26]
    px_buffer[94].r <= _WIRE[94].r @[EdgeDetect.scala 31:26]
    px_buffer[95].b <= _WIRE[95].b @[EdgeDetect.scala 31:26]
    px_buffer[95].g <= _WIRE[95].g @[EdgeDetect.scala 31:26]
    px_buffer[95].r <= _WIRE[95].r @[EdgeDetect.scala 31:26]
    px_buffer[96].b <= _WIRE[96].b @[EdgeDetect.scala 31:26]
    px_buffer[96].g <= _WIRE[96].g @[EdgeDetect.scala 31:26]
    px_buffer[96].r <= _WIRE[96].r @[EdgeDetect.scala 31:26]
    px_buffer[97].b <= _WIRE[97].b @[EdgeDetect.scala 31:26]
    px_buffer[97].g <= _WIRE[97].g @[EdgeDetect.scala 31:26]
    px_buffer[97].r <= _WIRE[97].r @[EdgeDetect.scala 31:26]
    px_buffer[98].b <= _WIRE[98].b @[EdgeDetect.scala 31:26]
    px_buffer[98].g <= _WIRE[98].g @[EdgeDetect.scala 31:26]
    px_buffer[98].r <= _WIRE[98].r @[EdgeDetect.scala 31:26]
    px_buffer[99].b <= _WIRE[99].b @[EdgeDetect.scala 31:26]
    px_buffer[99].g <= _WIRE[99].g @[EdgeDetect.scala 31:26]
    px_buffer[99].r <= _WIRE[99].r @[EdgeDetect.scala 31:26]
    px_buffer[100].b <= _WIRE[100].b @[EdgeDetect.scala 31:26]
    px_buffer[100].g <= _WIRE[100].g @[EdgeDetect.scala 31:26]
    px_buffer[100].r <= _WIRE[100].r @[EdgeDetect.scala 31:26]
    px_buffer[101].b <= _WIRE[101].b @[EdgeDetect.scala 31:26]
    px_buffer[101].g <= _WIRE[101].g @[EdgeDetect.scala 31:26]
    px_buffer[101].r <= _WIRE[101].r @[EdgeDetect.scala 31:26]
    px_buffer[102].b <= _WIRE[102].b @[EdgeDetect.scala 31:26]
    px_buffer[102].g <= _WIRE[102].g @[EdgeDetect.scala 31:26]
    px_buffer[102].r <= _WIRE[102].r @[EdgeDetect.scala 31:26]
    px_buffer[103].b <= _WIRE[103].b @[EdgeDetect.scala 31:26]
    px_buffer[103].g <= _WIRE[103].g @[EdgeDetect.scala 31:26]
    px_buffer[103].r <= _WIRE[103].r @[EdgeDetect.scala 31:26]
    px_buffer[104].b <= _WIRE[104].b @[EdgeDetect.scala 31:26]
    px_buffer[104].g <= _WIRE[104].g @[EdgeDetect.scala 31:26]
    px_buffer[104].r <= _WIRE[104].r @[EdgeDetect.scala 31:26]
    px_buffer[105].b <= _WIRE[105].b @[EdgeDetect.scala 31:26]
    px_buffer[105].g <= _WIRE[105].g @[EdgeDetect.scala 31:26]
    px_buffer[105].r <= _WIRE[105].r @[EdgeDetect.scala 31:26]
    px_buffer[106].b <= _WIRE[106].b @[EdgeDetect.scala 31:26]
    px_buffer[106].g <= _WIRE[106].g @[EdgeDetect.scala 31:26]
    px_buffer[106].r <= _WIRE[106].r @[EdgeDetect.scala 31:26]
    px_buffer[107].b <= _WIRE[107].b @[EdgeDetect.scala 31:26]
    px_buffer[107].g <= _WIRE[107].g @[EdgeDetect.scala 31:26]
    px_buffer[107].r <= _WIRE[107].r @[EdgeDetect.scala 31:26]
    px_buffer[108].b <= _WIRE[108].b @[EdgeDetect.scala 31:26]
    px_buffer[108].g <= _WIRE[108].g @[EdgeDetect.scala 31:26]
    px_buffer[108].r <= _WIRE[108].r @[EdgeDetect.scala 31:26]
    px_buffer[109].b <= _WIRE[109].b @[EdgeDetect.scala 31:26]
    px_buffer[109].g <= _WIRE[109].g @[EdgeDetect.scala 31:26]
    px_buffer[109].r <= _WIRE[109].r @[EdgeDetect.scala 31:26]
    px_buffer[110].b <= _WIRE[110].b @[EdgeDetect.scala 31:26]
    px_buffer[110].g <= _WIRE[110].g @[EdgeDetect.scala 31:26]
    px_buffer[110].r <= _WIRE[110].r @[EdgeDetect.scala 31:26]
    px_buffer[111].b <= _WIRE[111].b @[EdgeDetect.scala 31:26]
    px_buffer[111].g <= _WIRE[111].g @[EdgeDetect.scala 31:26]
    px_buffer[111].r <= _WIRE[111].r @[EdgeDetect.scala 31:26]
    px_buffer[112].b <= _WIRE[112].b @[EdgeDetect.scala 31:26]
    px_buffer[112].g <= _WIRE[112].g @[EdgeDetect.scala 31:26]
    px_buffer[112].r <= _WIRE[112].r @[EdgeDetect.scala 31:26]
    px_buffer[113].b <= _WIRE[113].b @[EdgeDetect.scala 31:26]
    px_buffer[113].g <= _WIRE[113].g @[EdgeDetect.scala 31:26]
    px_buffer[113].r <= _WIRE[113].r @[EdgeDetect.scala 31:26]
    px_buffer[114].b <= _WIRE[114].b @[EdgeDetect.scala 31:26]
    px_buffer[114].g <= _WIRE[114].g @[EdgeDetect.scala 31:26]
    px_buffer[114].r <= _WIRE[114].r @[EdgeDetect.scala 31:26]
    px_buffer[115].b <= _WIRE[115].b @[EdgeDetect.scala 31:26]
    px_buffer[115].g <= _WIRE[115].g @[EdgeDetect.scala 31:26]
    px_buffer[115].r <= _WIRE[115].r @[EdgeDetect.scala 31:26]
    px_buffer[116].b <= _WIRE[116].b @[EdgeDetect.scala 31:26]
    px_buffer[116].g <= _WIRE[116].g @[EdgeDetect.scala 31:26]
    px_buffer[116].r <= _WIRE[116].r @[EdgeDetect.scala 31:26]
    px_buffer[117].b <= _WIRE[117].b @[EdgeDetect.scala 31:26]
    px_buffer[117].g <= _WIRE[117].g @[EdgeDetect.scala 31:26]
    px_buffer[117].r <= _WIRE[117].r @[EdgeDetect.scala 31:26]
    px_buffer[118].b <= _WIRE[118].b @[EdgeDetect.scala 31:26]
    px_buffer[118].g <= _WIRE[118].g @[EdgeDetect.scala 31:26]
    px_buffer[118].r <= _WIRE[118].r @[EdgeDetect.scala 31:26]
    px_buffer[119].b <= _WIRE[119].b @[EdgeDetect.scala 31:26]
    px_buffer[119].g <= _WIRE[119].g @[EdgeDetect.scala 31:26]
    px_buffer[119].r <= _WIRE[119].r @[EdgeDetect.scala 31:26]
    px_buffer[120].b <= _WIRE[120].b @[EdgeDetect.scala 31:26]
    px_buffer[120].g <= _WIRE[120].g @[EdgeDetect.scala 31:26]
    px_buffer[120].r <= _WIRE[120].r @[EdgeDetect.scala 31:26]
    px_buffer[121].b <= _WIRE[121].b @[EdgeDetect.scala 31:26]
    px_buffer[121].g <= _WIRE[121].g @[EdgeDetect.scala 31:26]
    px_buffer[121].r <= _WIRE[121].r @[EdgeDetect.scala 31:26]
    px_buffer[122].b <= _WIRE[122].b @[EdgeDetect.scala 31:26]
    px_buffer[122].g <= _WIRE[122].g @[EdgeDetect.scala 31:26]
    px_buffer[122].r <= _WIRE[122].r @[EdgeDetect.scala 31:26]
    px_buffer[123].b <= _WIRE[123].b @[EdgeDetect.scala 31:26]
    px_buffer[123].g <= _WIRE[123].g @[EdgeDetect.scala 31:26]
    px_buffer[123].r <= _WIRE[123].r @[EdgeDetect.scala 31:26]
    px_buffer[124].b <= _WIRE[124].b @[EdgeDetect.scala 31:26]
    px_buffer[124].g <= _WIRE[124].g @[EdgeDetect.scala 31:26]
    px_buffer[124].r <= _WIRE[124].r @[EdgeDetect.scala 31:26]
    px_buffer[125].b <= _WIRE[125].b @[EdgeDetect.scala 31:26]
    px_buffer[125].g <= _WIRE[125].g @[EdgeDetect.scala 31:26]
    px_buffer[125].r <= _WIRE[125].r @[EdgeDetect.scala 31:26]
    px_buffer[126].b <= _WIRE[126].b @[EdgeDetect.scala 31:26]
    px_buffer[126].g <= _WIRE[126].g @[EdgeDetect.scala 31:26]
    px_buffer[126].r <= _WIRE[126].r @[EdgeDetect.scala 31:26]
    px_buffer[127].b <= _WIRE[127].b @[EdgeDetect.scala 31:26]
    px_buffer[127].g <= _WIRE[127].g @[EdgeDetect.scala 31:26]
    px_buffer[127].r <= _WIRE[127].r @[EdgeDetect.scala 31:26]
    px_buffer[128].b <= _WIRE[128].b @[EdgeDetect.scala 31:26]
    px_buffer[128].g <= _WIRE[128].g @[EdgeDetect.scala 31:26]
    px_buffer[128].r <= _WIRE[128].r @[EdgeDetect.scala 31:26]
    px_buffer[129].b <= _WIRE[129].b @[EdgeDetect.scala 31:26]
    px_buffer[129].g <= _WIRE[129].g @[EdgeDetect.scala 31:26]
    px_buffer[129].r <= _WIRE[129].r @[EdgeDetect.scala 31:26]
    px_buffer[130].b <= _WIRE[130].b @[EdgeDetect.scala 31:26]
    px_buffer[130].g <= _WIRE[130].g @[EdgeDetect.scala 31:26]
    px_buffer[130].r <= _WIRE[130].r @[EdgeDetect.scala 31:26]
    px_buffer[131].b <= _WIRE[131].b @[EdgeDetect.scala 31:26]
    px_buffer[131].g <= _WIRE[131].g @[EdgeDetect.scala 31:26]
    px_buffer[131].r <= _WIRE[131].r @[EdgeDetect.scala 31:26]
    px_buffer[132].b <= _WIRE[132].b @[EdgeDetect.scala 31:26]
    px_buffer[132].g <= _WIRE[132].g @[EdgeDetect.scala 31:26]
    px_buffer[132].r <= _WIRE[132].r @[EdgeDetect.scala 31:26]
    px_buffer[133].b <= _WIRE[133].b @[EdgeDetect.scala 31:26]
    px_buffer[133].g <= _WIRE[133].g @[EdgeDetect.scala 31:26]
    px_buffer[133].r <= _WIRE[133].r @[EdgeDetect.scala 31:26]
    px_buffer[134].b <= _WIRE[134].b @[EdgeDetect.scala 31:26]
    px_buffer[134].g <= _WIRE[134].g @[EdgeDetect.scala 31:26]
    px_buffer[134].r <= _WIRE[134].r @[EdgeDetect.scala 31:26]
    px_buffer[135].b <= _WIRE[135].b @[EdgeDetect.scala 31:26]
    px_buffer[135].g <= _WIRE[135].g @[EdgeDetect.scala 31:26]
    px_buffer[135].r <= _WIRE[135].r @[EdgeDetect.scala 31:26]
    px_buffer[136].b <= _WIRE[136].b @[EdgeDetect.scala 31:26]
    px_buffer[136].g <= _WIRE[136].g @[EdgeDetect.scala 31:26]
    px_buffer[136].r <= _WIRE[136].r @[EdgeDetect.scala 31:26]
    px_buffer[137].b <= _WIRE[137].b @[EdgeDetect.scala 31:26]
    px_buffer[137].g <= _WIRE[137].g @[EdgeDetect.scala 31:26]
    px_buffer[137].r <= _WIRE[137].r @[EdgeDetect.scala 31:26]
    px_buffer[138].b <= _WIRE[138].b @[EdgeDetect.scala 31:26]
    px_buffer[138].g <= _WIRE[138].g @[EdgeDetect.scala 31:26]
    px_buffer[138].r <= _WIRE[138].r @[EdgeDetect.scala 31:26]
    px_buffer[139].b <= _WIRE[139].b @[EdgeDetect.scala 31:26]
    px_buffer[139].g <= _WIRE[139].g @[EdgeDetect.scala 31:26]
    px_buffer[139].r <= _WIRE[139].r @[EdgeDetect.scala 31:26]
    px_buffer[140].b <= _WIRE[140].b @[EdgeDetect.scala 31:26]
    px_buffer[140].g <= _WIRE[140].g @[EdgeDetect.scala 31:26]
    px_buffer[140].r <= _WIRE[140].r @[EdgeDetect.scala 31:26]
    px_buffer[141].b <= _WIRE[141].b @[EdgeDetect.scala 31:26]
    px_buffer[141].g <= _WIRE[141].g @[EdgeDetect.scala 31:26]
    px_buffer[141].r <= _WIRE[141].r @[EdgeDetect.scala 31:26]
    px_buffer[142].b <= _WIRE[142].b @[EdgeDetect.scala 31:26]
    px_buffer[142].g <= _WIRE[142].g @[EdgeDetect.scala 31:26]
    px_buffer[142].r <= _WIRE[142].r @[EdgeDetect.scala 31:26]
    px_buffer[143].b <= _WIRE[143].b @[EdgeDetect.scala 31:26]
    px_buffer[143].g <= _WIRE[143].g @[EdgeDetect.scala 31:26]
    px_buffer[143].r <= _WIRE[143].r @[EdgeDetect.scala 31:26]
    px_buffer[144].b <= _WIRE[144].b @[EdgeDetect.scala 31:26]
    px_buffer[144].g <= _WIRE[144].g @[EdgeDetect.scala 31:26]
    px_buffer[144].r <= _WIRE[144].r @[EdgeDetect.scala 31:26]
    px_buffer[145].b <= _WIRE[145].b @[EdgeDetect.scala 31:26]
    px_buffer[145].g <= _WIRE[145].g @[EdgeDetect.scala 31:26]
    px_buffer[145].r <= _WIRE[145].r @[EdgeDetect.scala 31:26]
    px_buffer[146].b <= _WIRE[146].b @[EdgeDetect.scala 31:26]
    px_buffer[146].g <= _WIRE[146].g @[EdgeDetect.scala 31:26]
    px_buffer[146].r <= _WIRE[146].r @[EdgeDetect.scala 31:26]
    px_buffer[147].b <= _WIRE[147].b @[EdgeDetect.scala 31:26]
    px_buffer[147].g <= _WIRE[147].g @[EdgeDetect.scala 31:26]
    px_buffer[147].r <= _WIRE[147].r @[EdgeDetect.scala 31:26]
    px_buffer[148].b <= _WIRE[148].b @[EdgeDetect.scala 31:26]
    px_buffer[148].g <= _WIRE[148].g @[EdgeDetect.scala 31:26]
    px_buffer[148].r <= _WIRE[148].r @[EdgeDetect.scala 31:26]
    px_buffer[149].b <= _WIRE[149].b @[EdgeDetect.scala 31:26]
    px_buffer[149].g <= _WIRE[149].g @[EdgeDetect.scala 31:26]
    px_buffer[149].r <= _WIRE[149].r @[EdgeDetect.scala 31:26]
    px_buffer[150].b <= _WIRE[150].b @[EdgeDetect.scala 31:26]
    px_buffer[150].g <= _WIRE[150].g @[EdgeDetect.scala 31:26]
    px_buffer[150].r <= _WIRE[150].r @[EdgeDetect.scala 31:26]
    px_buffer[151].b <= _WIRE[151].b @[EdgeDetect.scala 31:26]
    px_buffer[151].g <= _WIRE[151].g @[EdgeDetect.scala 31:26]
    px_buffer[151].r <= _WIRE[151].r @[EdgeDetect.scala 31:26]
    px_buffer[152].b <= _WIRE[152].b @[EdgeDetect.scala 31:26]
    px_buffer[152].g <= _WIRE[152].g @[EdgeDetect.scala 31:26]
    px_buffer[152].r <= _WIRE[152].r @[EdgeDetect.scala 31:26]
    px_buffer[153].b <= _WIRE[153].b @[EdgeDetect.scala 31:26]
    px_buffer[153].g <= _WIRE[153].g @[EdgeDetect.scala 31:26]
    px_buffer[153].r <= _WIRE[153].r @[EdgeDetect.scala 31:26]
    px_buffer[154].b <= _WIRE[154].b @[EdgeDetect.scala 31:26]
    px_buffer[154].g <= _WIRE[154].g @[EdgeDetect.scala 31:26]
    px_buffer[154].r <= _WIRE[154].r @[EdgeDetect.scala 31:26]
    px_buffer[155].b <= _WIRE[155].b @[EdgeDetect.scala 31:26]
    px_buffer[155].g <= _WIRE[155].g @[EdgeDetect.scala 31:26]
    px_buffer[155].r <= _WIRE[155].r @[EdgeDetect.scala 31:26]
    px_buffer[156].b <= _WIRE[156].b @[EdgeDetect.scala 31:26]
    px_buffer[156].g <= _WIRE[156].g @[EdgeDetect.scala 31:26]
    px_buffer[156].r <= _WIRE[156].r @[EdgeDetect.scala 31:26]
    px_buffer[157].b <= _WIRE[157].b @[EdgeDetect.scala 31:26]
    px_buffer[157].g <= _WIRE[157].g @[EdgeDetect.scala 31:26]
    px_buffer[157].r <= _WIRE[157].r @[EdgeDetect.scala 31:26]
    px_buffer[158].b <= _WIRE[158].b @[EdgeDetect.scala 31:26]
    px_buffer[158].g <= _WIRE[158].g @[EdgeDetect.scala 31:26]
    px_buffer[158].r <= _WIRE[158].r @[EdgeDetect.scala 31:26]
    px_buffer[159].b <= _WIRE[159].b @[EdgeDetect.scala 31:26]
    px_buffer[159].g <= _WIRE[159].g @[EdgeDetect.scala 31:26]
    px_buffer[159].r <= _WIRE[159].r @[EdgeDetect.scala 31:26]
    px_buffer[160].b <= _WIRE[160].b @[EdgeDetect.scala 31:26]
    px_buffer[160].g <= _WIRE[160].g @[EdgeDetect.scala 31:26]
    px_buffer[160].r <= _WIRE[160].r @[EdgeDetect.scala 31:26]
    px_buffer[161].b <= _WIRE[161].b @[EdgeDetect.scala 31:26]
    px_buffer[161].g <= _WIRE[161].g @[EdgeDetect.scala 31:26]
    px_buffer[161].r <= _WIRE[161].r @[EdgeDetect.scala 31:26]
    px_buffer[162].b <= _WIRE[162].b @[EdgeDetect.scala 31:26]
    px_buffer[162].g <= _WIRE[162].g @[EdgeDetect.scala 31:26]
    px_buffer[162].r <= _WIRE[162].r @[EdgeDetect.scala 31:26]
    px_buffer[163].b <= _WIRE[163].b @[EdgeDetect.scala 31:26]
    px_buffer[163].g <= _WIRE[163].g @[EdgeDetect.scala 31:26]
    px_buffer[163].r <= _WIRE[163].r @[EdgeDetect.scala 31:26]
    px_buffer[164].b <= _WIRE[164].b @[EdgeDetect.scala 31:26]
    px_buffer[164].g <= _WIRE[164].g @[EdgeDetect.scala 31:26]
    px_buffer[164].r <= _WIRE[164].r @[EdgeDetect.scala 31:26]
    px_buffer[165].b <= _WIRE[165].b @[EdgeDetect.scala 31:26]
    px_buffer[165].g <= _WIRE[165].g @[EdgeDetect.scala 31:26]
    px_buffer[165].r <= _WIRE[165].r @[EdgeDetect.scala 31:26]
    px_buffer[166].b <= _WIRE[166].b @[EdgeDetect.scala 31:26]
    px_buffer[166].g <= _WIRE[166].g @[EdgeDetect.scala 31:26]
    px_buffer[166].r <= _WIRE[166].r @[EdgeDetect.scala 31:26]
    px_buffer[167].b <= _WIRE[167].b @[EdgeDetect.scala 31:26]
    px_buffer[167].g <= _WIRE[167].g @[EdgeDetect.scala 31:26]
    px_buffer[167].r <= _WIRE[167].r @[EdgeDetect.scala 31:26]
    px_buffer[168].b <= _WIRE[168].b @[EdgeDetect.scala 31:26]
    px_buffer[168].g <= _WIRE[168].g @[EdgeDetect.scala 31:26]
    px_buffer[168].r <= _WIRE[168].r @[EdgeDetect.scala 31:26]
    px_buffer[169].b <= _WIRE[169].b @[EdgeDetect.scala 31:26]
    px_buffer[169].g <= _WIRE[169].g @[EdgeDetect.scala 31:26]
    px_buffer[169].r <= _WIRE[169].r @[EdgeDetect.scala 31:26]
    px_buffer[170].b <= _WIRE[170].b @[EdgeDetect.scala 31:26]
    px_buffer[170].g <= _WIRE[170].g @[EdgeDetect.scala 31:26]
    px_buffer[170].r <= _WIRE[170].r @[EdgeDetect.scala 31:26]
    px_buffer[171].b <= _WIRE[171].b @[EdgeDetect.scala 31:26]
    px_buffer[171].g <= _WIRE[171].g @[EdgeDetect.scala 31:26]
    px_buffer[171].r <= _WIRE[171].r @[EdgeDetect.scala 31:26]
    px_buffer[172].b <= _WIRE[172].b @[EdgeDetect.scala 31:26]
    px_buffer[172].g <= _WIRE[172].g @[EdgeDetect.scala 31:26]
    px_buffer[172].r <= _WIRE[172].r @[EdgeDetect.scala 31:26]
    px_buffer[173].b <= _WIRE[173].b @[EdgeDetect.scala 31:26]
    px_buffer[173].g <= _WIRE[173].g @[EdgeDetect.scala 31:26]
    px_buffer[173].r <= _WIRE[173].r @[EdgeDetect.scala 31:26]
    px_buffer[174].b <= _WIRE[174].b @[EdgeDetect.scala 31:26]
    px_buffer[174].g <= _WIRE[174].g @[EdgeDetect.scala 31:26]
    px_buffer[174].r <= _WIRE[174].r @[EdgeDetect.scala 31:26]
    px_buffer[175].b <= _WIRE[175].b @[EdgeDetect.scala 31:26]
    px_buffer[175].g <= _WIRE[175].g @[EdgeDetect.scala 31:26]
    px_buffer[175].r <= _WIRE[175].r @[EdgeDetect.scala 31:26]
    px_buffer[176].b <= _WIRE[176].b @[EdgeDetect.scala 31:26]
    px_buffer[176].g <= _WIRE[176].g @[EdgeDetect.scala 31:26]
    px_buffer[176].r <= _WIRE[176].r @[EdgeDetect.scala 31:26]
    px_buffer[177].b <= _WIRE[177].b @[EdgeDetect.scala 31:26]
    px_buffer[177].g <= _WIRE[177].g @[EdgeDetect.scala 31:26]
    px_buffer[177].r <= _WIRE[177].r @[EdgeDetect.scala 31:26]
    px_buffer[178].b <= _WIRE[178].b @[EdgeDetect.scala 31:26]
    px_buffer[178].g <= _WIRE[178].g @[EdgeDetect.scala 31:26]
    px_buffer[178].r <= _WIRE[178].r @[EdgeDetect.scala 31:26]
    px_buffer[179].b <= _WIRE[179].b @[EdgeDetect.scala 31:26]
    px_buffer[179].g <= _WIRE[179].g @[EdgeDetect.scala 31:26]
    px_buffer[179].r <= _WIRE[179].r @[EdgeDetect.scala 31:26]
    px_buffer[180].b <= _WIRE[180].b @[EdgeDetect.scala 31:26]
    px_buffer[180].g <= _WIRE[180].g @[EdgeDetect.scala 31:26]
    px_buffer[180].r <= _WIRE[180].r @[EdgeDetect.scala 31:26]
    px_buffer[181].b <= _WIRE[181].b @[EdgeDetect.scala 31:26]
    px_buffer[181].g <= _WIRE[181].g @[EdgeDetect.scala 31:26]
    px_buffer[181].r <= _WIRE[181].r @[EdgeDetect.scala 31:26]
    px_buffer[182].b <= _WIRE[182].b @[EdgeDetect.scala 31:26]
    px_buffer[182].g <= _WIRE[182].g @[EdgeDetect.scala 31:26]
    px_buffer[182].r <= _WIRE[182].r @[EdgeDetect.scala 31:26]
    px_buffer[183].b <= _WIRE[183].b @[EdgeDetect.scala 31:26]
    px_buffer[183].g <= _WIRE[183].g @[EdgeDetect.scala 31:26]
    px_buffer[183].r <= _WIRE[183].r @[EdgeDetect.scala 31:26]
    px_buffer[184].b <= _WIRE[184].b @[EdgeDetect.scala 31:26]
    px_buffer[184].g <= _WIRE[184].g @[EdgeDetect.scala 31:26]
    px_buffer[184].r <= _WIRE[184].r @[EdgeDetect.scala 31:26]
    px_buffer[185].b <= _WIRE[185].b @[EdgeDetect.scala 31:26]
    px_buffer[185].g <= _WIRE[185].g @[EdgeDetect.scala 31:26]
    px_buffer[185].r <= _WIRE[185].r @[EdgeDetect.scala 31:26]
    px_buffer[186].b <= _WIRE[186].b @[EdgeDetect.scala 31:26]
    px_buffer[186].g <= _WIRE[186].g @[EdgeDetect.scala 31:26]
    px_buffer[186].r <= _WIRE[186].r @[EdgeDetect.scala 31:26]
    px_buffer[187].b <= _WIRE[187].b @[EdgeDetect.scala 31:26]
    px_buffer[187].g <= _WIRE[187].g @[EdgeDetect.scala 31:26]
    px_buffer[187].r <= _WIRE[187].r @[EdgeDetect.scala 31:26]
    px_buffer[188].b <= _WIRE[188].b @[EdgeDetect.scala 31:26]
    px_buffer[188].g <= _WIRE[188].g @[EdgeDetect.scala 31:26]
    px_buffer[188].r <= _WIRE[188].r @[EdgeDetect.scala 31:26]
    px_buffer[189].b <= _WIRE[189].b @[EdgeDetect.scala 31:26]
    px_buffer[189].g <= _WIRE[189].g @[EdgeDetect.scala 31:26]
    px_buffer[189].r <= _WIRE[189].r @[EdgeDetect.scala 31:26]
    px_buffer[190].b <= _WIRE[190].b @[EdgeDetect.scala 31:26]
    px_buffer[190].g <= _WIRE[190].g @[EdgeDetect.scala 31:26]
    px_buffer[190].r <= _WIRE[190].r @[EdgeDetect.scala 31:26]
    px_buffer[191].b <= _WIRE[191].b @[EdgeDetect.scala 31:26]
    px_buffer[191].g <= _WIRE[191].g @[EdgeDetect.scala 31:26]
    px_buffer[191].r <= _WIRE[191].r @[EdgeDetect.scala 31:26]
    px_buffer[192].b <= _WIRE[192].b @[EdgeDetect.scala 31:26]
    px_buffer[192].g <= _WIRE[192].g @[EdgeDetect.scala 31:26]
    px_buffer[192].r <= _WIRE[192].r @[EdgeDetect.scala 31:26]
    px_buffer[193].b <= _WIRE[193].b @[EdgeDetect.scala 31:26]
    px_buffer[193].g <= _WIRE[193].g @[EdgeDetect.scala 31:26]
    px_buffer[193].r <= _WIRE[193].r @[EdgeDetect.scala 31:26]
    px_buffer[194].b <= _WIRE[194].b @[EdgeDetect.scala 31:26]
    px_buffer[194].g <= _WIRE[194].g @[EdgeDetect.scala 31:26]
    px_buffer[194].r <= _WIRE[194].r @[EdgeDetect.scala 31:26]
    px_buffer[195].b <= _WIRE[195].b @[EdgeDetect.scala 31:26]
    px_buffer[195].g <= _WIRE[195].g @[EdgeDetect.scala 31:26]
    px_buffer[195].r <= _WIRE[195].r @[EdgeDetect.scala 31:26]
    px_buffer[196].b <= _WIRE[196].b @[EdgeDetect.scala 31:26]
    px_buffer[196].g <= _WIRE[196].g @[EdgeDetect.scala 31:26]
    px_buffer[196].r <= _WIRE[196].r @[EdgeDetect.scala 31:26]
    px_buffer[197].b <= _WIRE[197].b @[EdgeDetect.scala 31:26]
    px_buffer[197].g <= _WIRE[197].g @[EdgeDetect.scala 31:26]
    px_buffer[197].r <= _WIRE[197].r @[EdgeDetect.scala 31:26]
    px_buffer[198].b <= _WIRE[198].b @[EdgeDetect.scala 31:26]
    px_buffer[198].g <= _WIRE[198].g @[EdgeDetect.scala 31:26]
    px_buffer[198].r <= _WIRE[198].r @[EdgeDetect.scala 31:26]
    px_buffer[199].b <= _WIRE[199].b @[EdgeDetect.scala 31:26]
    px_buffer[199].g <= _WIRE[199].g @[EdgeDetect.scala 31:26]
    px_buffer[199].r <= _WIRE[199].r @[EdgeDetect.scala 31:26]
    px_buffer[200].b <= _WIRE[200].b @[EdgeDetect.scala 31:26]
    px_buffer[200].g <= _WIRE[200].g @[EdgeDetect.scala 31:26]
    px_buffer[200].r <= _WIRE[200].r @[EdgeDetect.scala 31:26]
    px_buffer[201].b <= _WIRE[201].b @[EdgeDetect.scala 31:26]
    px_buffer[201].g <= _WIRE[201].g @[EdgeDetect.scala 31:26]
    px_buffer[201].r <= _WIRE[201].r @[EdgeDetect.scala 31:26]
    px_buffer[202].b <= _WIRE[202].b @[EdgeDetect.scala 31:26]
    px_buffer[202].g <= _WIRE[202].g @[EdgeDetect.scala 31:26]
    px_buffer[202].r <= _WIRE[202].r @[EdgeDetect.scala 31:26]
    px_buffer[203].b <= _WIRE[203].b @[EdgeDetect.scala 31:26]
    px_buffer[203].g <= _WIRE[203].g @[EdgeDetect.scala 31:26]
    px_buffer[203].r <= _WIRE[203].r @[EdgeDetect.scala 31:26]
    px_buffer[204].b <= _WIRE[204].b @[EdgeDetect.scala 31:26]
    px_buffer[204].g <= _WIRE[204].g @[EdgeDetect.scala 31:26]
    px_buffer[204].r <= _WIRE[204].r @[EdgeDetect.scala 31:26]
    px_buffer[205].b <= _WIRE[205].b @[EdgeDetect.scala 31:26]
    px_buffer[205].g <= _WIRE[205].g @[EdgeDetect.scala 31:26]
    px_buffer[205].r <= _WIRE[205].r @[EdgeDetect.scala 31:26]
    px_buffer[206].b <= _WIRE[206].b @[EdgeDetect.scala 31:26]
    px_buffer[206].g <= _WIRE[206].g @[EdgeDetect.scala 31:26]
    px_buffer[206].r <= _WIRE[206].r @[EdgeDetect.scala 31:26]
    px_buffer[207].b <= _WIRE[207].b @[EdgeDetect.scala 31:26]
    px_buffer[207].g <= _WIRE[207].g @[EdgeDetect.scala 31:26]
    px_buffer[207].r <= _WIRE[207].r @[EdgeDetect.scala 31:26]
    px_buffer[208].b <= _WIRE[208].b @[EdgeDetect.scala 31:26]
    px_buffer[208].g <= _WIRE[208].g @[EdgeDetect.scala 31:26]
    px_buffer[208].r <= _WIRE[208].r @[EdgeDetect.scala 31:26]
    px_buffer[209].b <= _WIRE[209].b @[EdgeDetect.scala 31:26]
    px_buffer[209].g <= _WIRE[209].g @[EdgeDetect.scala 31:26]
    px_buffer[209].r <= _WIRE[209].r @[EdgeDetect.scala 31:26]
    px_buffer[210].b <= _WIRE[210].b @[EdgeDetect.scala 31:26]
    px_buffer[210].g <= _WIRE[210].g @[EdgeDetect.scala 31:26]
    px_buffer[210].r <= _WIRE[210].r @[EdgeDetect.scala 31:26]
    px_buffer[211].b <= _WIRE[211].b @[EdgeDetect.scala 31:26]
    px_buffer[211].g <= _WIRE[211].g @[EdgeDetect.scala 31:26]
    px_buffer[211].r <= _WIRE[211].r @[EdgeDetect.scala 31:26]
    px_buffer[212].b <= _WIRE[212].b @[EdgeDetect.scala 31:26]
    px_buffer[212].g <= _WIRE[212].g @[EdgeDetect.scala 31:26]
    px_buffer[212].r <= _WIRE[212].r @[EdgeDetect.scala 31:26]
    px_buffer[213].b <= _WIRE[213].b @[EdgeDetect.scala 31:26]
    px_buffer[213].g <= _WIRE[213].g @[EdgeDetect.scala 31:26]
    px_buffer[213].r <= _WIRE[213].r @[EdgeDetect.scala 31:26]
    px_buffer[214].b <= _WIRE[214].b @[EdgeDetect.scala 31:26]
    px_buffer[214].g <= _WIRE[214].g @[EdgeDetect.scala 31:26]
    px_buffer[214].r <= _WIRE[214].r @[EdgeDetect.scala 31:26]
    px_buffer[215].b <= _WIRE[215].b @[EdgeDetect.scala 31:26]
    px_buffer[215].g <= _WIRE[215].g @[EdgeDetect.scala 31:26]
    px_buffer[215].r <= _WIRE[215].r @[EdgeDetect.scala 31:26]
    px_buffer[216].b <= _WIRE[216].b @[EdgeDetect.scala 31:26]
    px_buffer[216].g <= _WIRE[216].g @[EdgeDetect.scala 31:26]
    px_buffer[216].r <= _WIRE[216].r @[EdgeDetect.scala 31:26]
    px_buffer[217].b <= _WIRE[217].b @[EdgeDetect.scala 31:26]
    px_buffer[217].g <= _WIRE[217].g @[EdgeDetect.scala 31:26]
    px_buffer[217].r <= _WIRE[217].r @[EdgeDetect.scala 31:26]
    px_buffer[218].b <= _WIRE[218].b @[EdgeDetect.scala 31:26]
    px_buffer[218].g <= _WIRE[218].g @[EdgeDetect.scala 31:26]
    px_buffer[218].r <= _WIRE[218].r @[EdgeDetect.scala 31:26]
    px_buffer[219].b <= _WIRE[219].b @[EdgeDetect.scala 31:26]
    px_buffer[219].g <= _WIRE[219].g @[EdgeDetect.scala 31:26]
    px_buffer[219].r <= _WIRE[219].r @[EdgeDetect.scala 31:26]
    px_buffer[220].b <= _WIRE[220].b @[EdgeDetect.scala 31:26]
    px_buffer[220].g <= _WIRE[220].g @[EdgeDetect.scala 31:26]
    px_buffer[220].r <= _WIRE[220].r @[EdgeDetect.scala 31:26]
    px_buffer[221].b <= _WIRE[221].b @[EdgeDetect.scala 31:26]
    px_buffer[221].g <= _WIRE[221].g @[EdgeDetect.scala 31:26]
    px_buffer[221].r <= _WIRE[221].r @[EdgeDetect.scala 31:26]
    px_buffer[222].b <= _WIRE[222].b @[EdgeDetect.scala 31:26]
    px_buffer[222].g <= _WIRE[222].g @[EdgeDetect.scala 31:26]
    px_buffer[222].r <= _WIRE[222].r @[EdgeDetect.scala 31:26]
    px_buffer[223].b <= _WIRE[223].b @[EdgeDetect.scala 31:26]
    px_buffer[223].g <= _WIRE[223].g @[EdgeDetect.scala 31:26]
    px_buffer[223].r <= _WIRE[223].r @[EdgeDetect.scala 31:26]
    px_buffer[224].b <= _WIRE[224].b @[EdgeDetect.scala 31:26]
    px_buffer[224].g <= _WIRE[224].g @[EdgeDetect.scala 31:26]
    px_buffer[224].r <= _WIRE[224].r @[EdgeDetect.scala 31:26]
    px_buffer[225].b <= _WIRE[225].b @[EdgeDetect.scala 31:26]
    px_buffer[225].g <= _WIRE[225].g @[EdgeDetect.scala 31:26]
    px_buffer[225].r <= _WIRE[225].r @[EdgeDetect.scala 31:26]
    px_buffer[226].b <= _WIRE[226].b @[EdgeDetect.scala 31:26]
    px_buffer[226].g <= _WIRE[226].g @[EdgeDetect.scala 31:26]
    px_buffer[226].r <= _WIRE[226].r @[EdgeDetect.scala 31:26]
    px_buffer[227].b <= _WIRE[227].b @[EdgeDetect.scala 31:26]
    px_buffer[227].g <= _WIRE[227].g @[EdgeDetect.scala 31:26]
    px_buffer[227].r <= _WIRE[227].r @[EdgeDetect.scala 31:26]
    px_buffer[228].b <= _WIRE[228].b @[EdgeDetect.scala 31:26]
    px_buffer[228].g <= _WIRE[228].g @[EdgeDetect.scala 31:26]
    px_buffer[228].r <= _WIRE[228].r @[EdgeDetect.scala 31:26]
    px_buffer[229].b <= _WIRE[229].b @[EdgeDetect.scala 31:26]
    px_buffer[229].g <= _WIRE[229].g @[EdgeDetect.scala 31:26]
    px_buffer[229].r <= _WIRE[229].r @[EdgeDetect.scala 31:26]
    px_buffer[230].b <= _WIRE[230].b @[EdgeDetect.scala 31:26]
    px_buffer[230].g <= _WIRE[230].g @[EdgeDetect.scala 31:26]
    px_buffer[230].r <= _WIRE[230].r @[EdgeDetect.scala 31:26]
    px_buffer[231].b <= _WIRE[231].b @[EdgeDetect.scala 31:26]
    px_buffer[231].g <= _WIRE[231].g @[EdgeDetect.scala 31:26]
    px_buffer[231].r <= _WIRE[231].r @[EdgeDetect.scala 31:26]
    px_buffer[232].b <= _WIRE[232].b @[EdgeDetect.scala 31:26]
    px_buffer[232].g <= _WIRE[232].g @[EdgeDetect.scala 31:26]
    px_buffer[232].r <= _WIRE[232].r @[EdgeDetect.scala 31:26]
    px_buffer[233].b <= _WIRE[233].b @[EdgeDetect.scala 31:26]
    px_buffer[233].g <= _WIRE[233].g @[EdgeDetect.scala 31:26]
    px_buffer[233].r <= _WIRE[233].r @[EdgeDetect.scala 31:26]
    px_buffer[234].b <= _WIRE[234].b @[EdgeDetect.scala 31:26]
    px_buffer[234].g <= _WIRE[234].g @[EdgeDetect.scala 31:26]
    px_buffer[234].r <= _WIRE[234].r @[EdgeDetect.scala 31:26]
    px_buffer[235].b <= _WIRE[235].b @[EdgeDetect.scala 31:26]
    px_buffer[235].g <= _WIRE[235].g @[EdgeDetect.scala 31:26]
    px_buffer[235].r <= _WIRE[235].r @[EdgeDetect.scala 31:26]
    px_buffer[236].b <= _WIRE[236].b @[EdgeDetect.scala 31:26]
    px_buffer[236].g <= _WIRE[236].g @[EdgeDetect.scala 31:26]
    px_buffer[236].r <= _WIRE[236].r @[EdgeDetect.scala 31:26]
    px_buffer[237].b <= _WIRE[237].b @[EdgeDetect.scala 31:26]
    px_buffer[237].g <= _WIRE[237].g @[EdgeDetect.scala 31:26]
    px_buffer[237].r <= _WIRE[237].r @[EdgeDetect.scala 31:26]
    px_buffer[238].b <= _WIRE[238].b @[EdgeDetect.scala 31:26]
    px_buffer[238].g <= _WIRE[238].g @[EdgeDetect.scala 31:26]
    px_buffer[238].r <= _WIRE[238].r @[EdgeDetect.scala 31:26]
    px_buffer[239].b <= _WIRE[239].b @[EdgeDetect.scala 31:26]
    px_buffer[239].g <= _WIRE[239].g @[EdgeDetect.scala 31:26]
    px_buffer[239].r <= _WIRE[239].r @[EdgeDetect.scala 31:26]
    px_buffer[240].b <= _WIRE[240].b @[EdgeDetect.scala 31:26]
    px_buffer[240].g <= _WIRE[240].g @[EdgeDetect.scala 31:26]
    px_buffer[240].r <= _WIRE[240].r @[EdgeDetect.scala 31:26]
    px_buffer[241].b <= _WIRE[241].b @[EdgeDetect.scala 31:26]
    px_buffer[241].g <= _WIRE[241].g @[EdgeDetect.scala 31:26]
    px_buffer[241].r <= _WIRE[241].r @[EdgeDetect.scala 31:26]
    px_buffer[242].b <= _WIRE[242].b @[EdgeDetect.scala 31:26]
    px_buffer[242].g <= _WIRE[242].g @[EdgeDetect.scala 31:26]
    px_buffer[242].r <= _WIRE[242].r @[EdgeDetect.scala 31:26]
    px_buffer[243].b <= _WIRE[243].b @[EdgeDetect.scala 31:26]
    px_buffer[243].g <= _WIRE[243].g @[EdgeDetect.scala 31:26]
    px_buffer[243].r <= _WIRE[243].r @[EdgeDetect.scala 31:26]
    px_buffer[244].b <= _WIRE[244].b @[EdgeDetect.scala 31:26]
    px_buffer[244].g <= _WIRE[244].g @[EdgeDetect.scala 31:26]
    px_buffer[244].r <= _WIRE[244].r @[EdgeDetect.scala 31:26]
    px_buffer[245].b <= _WIRE[245].b @[EdgeDetect.scala 31:26]
    px_buffer[245].g <= _WIRE[245].g @[EdgeDetect.scala 31:26]
    px_buffer[245].r <= _WIRE[245].r @[EdgeDetect.scala 31:26]
    px_buffer[246].b <= _WIRE[246].b @[EdgeDetect.scala 31:26]
    px_buffer[246].g <= _WIRE[246].g @[EdgeDetect.scala 31:26]
    px_buffer[246].r <= _WIRE[246].r @[EdgeDetect.scala 31:26]
    px_buffer[247].b <= _WIRE[247].b @[EdgeDetect.scala 31:26]
    px_buffer[247].g <= _WIRE[247].g @[EdgeDetect.scala 31:26]
    px_buffer[247].r <= _WIRE[247].r @[EdgeDetect.scala 31:26]
    px_buffer[248].b <= _WIRE[248].b @[EdgeDetect.scala 31:26]
    px_buffer[248].g <= _WIRE[248].g @[EdgeDetect.scala 31:26]
    px_buffer[248].r <= _WIRE[248].r @[EdgeDetect.scala 31:26]
    px_buffer[249].b <= _WIRE[249].b @[EdgeDetect.scala 31:26]
    px_buffer[249].g <= _WIRE[249].g @[EdgeDetect.scala 31:26]
    px_buffer[249].r <= _WIRE[249].r @[EdgeDetect.scala 31:26]
    px_buffer[250].b <= _WIRE[250].b @[EdgeDetect.scala 31:26]
    px_buffer[250].g <= _WIRE[250].g @[EdgeDetect.scala 31:26]
    px_buffer[250].r <= _WIRE[250].r @[EdgeDetect.scala 31:26]
    px_buffer[251].b <= _WIRE[251].b @[EdgeDetect.scala 31:26]
    px_buffer[251].g <= _WIRE[251].g @[EdgeDetect.scala 31:26]
    px_buffer[251].r <= _WIRE[251].r @[EdgeDetect.scala 31:26]
    px_buffer[252].b <= _WIRE[252].b @[EdgeDetect.scala 31:26]
    px_buffer[252].g <= _WIRE[252].g @[EdgeDetect.scala 31:26]
    px_buffer[252].r <= _WIRE[252].r @[EdgeDetect.scala 31:26]
    px_buffer[253].b <= _WIRE[253].b @[EdgeDetect.scala 31:26]
    px_buffer[253].g <= _WIRE[253].g @[EdgeDetect.scala 31:26]
    px_buffer[253].r <= _WIRE[253].r @[EdgeDetect.scala 31:26]
    px_buffer[254].b <= _WIRE[254].b @[EdgeDetect.scala 31:26]
    px_buffer[254].g <= _WIRE[254].g @[EdgeDetect.scala 31:26]
    px_buffer[254].r <= _WIRE[254].r @[EdgeDetect.scala 31:26]
    px_buffer[255].b <= _WIRE[255].b @[EdgeDetect.scala 31:26]
    px_buffer[255].g <= _WIRE[255].g @[EdgeDetect.scala 31:26]
    px_buffer[255].r <= _WIRE[255].r @[EdgeDetect.scala 31:26]
    px_buffer[256].b <= _WIRE[256].b @[EdgeDetect.scala 31:26]
    px_buffer[256].g <= _WIRE[256].g @[EdgeDetect.scala 31:26]
    px_buffer[256].r <= _WIRE[256].r @[EdgeDetect.scala 31:26]
    px_buffer[257].b <= _WIRE[257].b @[EdgeDetect.scala 31:26]
    px_buffer[257].g <= _WIRE[257].g @[EdgeDetect.scala 31:26]
    px_buffer[257].r <= _WIRE[257].r @[EdgeDetect.scala 31:26]
    px_buffer[258].b <= _WIRE[258].b @[EdgeDetect.scala 31:26]
    px_buffer[258].g <= _WIRE[258].g @[EdgeDetect.scala 31:26]
    px_buffer[258].r <= _WIRE[258].r @[EdgeDetect.scala 31:26]
    px_buffer[259].b <= _WIRE[259].b @[EdgeDetect.scala 31:26]
    px_buffer[259].g <= _WIRE[259].g @[EdgeDetect.scala 31:26]
    px_buffer[259].r <= _WIRE[259].r @[EdgeDetect.scala 31:26]
    px_buffer[260].b <= _WIRE[260].b @[EdgeDetect.scala 31:26]
    px_buffer[260].g <= _WIRE[260].g @[EdgeDetect.scala 31:26]
    px_buffer[260].r <= _WIRE[260].r @[EdgeDetect.scala 31:26]
    px_buffer[261].b <= _WIRE[261].b @[EdgeDetect.scala 31:26]
    px_buffer[261].g <= _WIRE[261].g @[EdgeDetect.scala 31:26]
    px_buffer[261].r <= _WIRE[261].r @[EdgeDetect.scala 31:26]
    px_buffer[262].b <= _WIRE[262].b @[EdgeDetect.scala 31:26]
    px_buffer[262].g <= _WIRE[262].g @[EdgeDetect.scala 31:26]
    px_buffer[262].r <= _WIRE[262].r @[EdgeDetect.scala 31:26]
    px_buffer[263].b <= _WIRE[263].b @[EdgeDetect.scala 31:26]
    px_buffer[263].g <= _WIRE[263].g @[EdgeDetect.scala 31:26]
    px_buffer[263].r <= _WIRE[263].r @[EdgeDetect.scala 31:26]
    px_buffer[264].b <= _WIRE[264].b @[EdgeDetect.scala 31:26]
    px_buffer[264].g <= _WIRE[264].g @[EdgeDetect.scala 31:26]
    px_buffer[264].r <= _WIRE[264].r @[EdgeDetect.scala 31:26]
    px_buffer[265].b <= _WIRE[265].b @[EdgeDetect.scala 31:26]
    px_buffer[265].g <= _WIRE[265].g @[EdgeDetect.scala 31:26]
    px_buffer[265].r <= _WIRE[265].r @[EdgeDetect.scala 31:26]
    px_buffer[266].b <= _WIRE[266].b @[EdgeDetect.scala 31:26]
    px_buffer[266].g <= _WIRE[266].g @[EdgeDetect.scala 31:26]
    px_buffer[266].r <= _WIRE[266].r @[EdgeDetect.scala 31:26]
    px_buffer[267].b <= _WIRE[267].b @[EdgeDetect.scala 31:26]
    px_buffer[267].g <= _WIRE[267].g @[EdgeDetect.scala 31:26]
    px_buffer[267].r <= _WIRE[267].r @[EdgeDetect.scala 31:26]
    px_buffer[268].b <= _WIRE[268].b @[EdgeDetect.scala 31:26]
    px_buffer[268].g <= _WIRE[268].g @[EdgeDetect.scala 31:26]
    px_buffer[268].r <= _WIRE[268].r @[EdgeDetect.scala 31:26]
    px_buffer[269].b <= _WIRE[269].b @[EdgeDetect.scala 31:26]
    px_buffer[269].g <= _WIRE[269].g @[EdgeDetect.scala 31:26]
    px_buffer[269].r <= _WIRE[269].r @[EdgeDetect.scala 31:26]
    px_buffer[270].b <= _WIRE[270].b @[EdgeDetect.scala 31:26]
    px_buffer[270].g <= _WIRE[270].g @[EdgeDetect.scala 31:26]
    px_buffer[270].r <= _WIRE[270].r @[EdgeDetect.scala 31:26]
    px_buffer[271].b <= _WIRE[271].b @[EdgeDetect.scala 31:26]
    px_buffer[271].g <= _WIRE[271].g @[EdgeDetect.scala 31:26]
    px_buffer[271].r <= _WIRE[271].r @[EdgeDetect.scala 31:26]
    px_buffer[272].b <= _WIRE[272].b @[EdgeDetect.scala 31:26]
    px_buffer[272].g <= _WIRE[272].g @[EdgeDetect.scala 31:26]
    px_buffer[272].r <= _WIRE[272].r @[EdgeDetect.scala 31:26]
    px_buffer[273].b <= _WIRE[273].b @[EdgeDetect.scala 31:26]
    px_buffer[273].g <= _WIRE[273].g @[EdgeDetect.scala 31:26]
    px_buffer[273].r <= _WIRE[273].r @[EdgeDetect.scala 31:26]
    px_buffer[274].b <= _WIRE[274].b @[EdgeDetect.scala 31:26]
    px_buffer[274].g <= _WIRE[274].g @[EdgeDetect.scala 31:26]
    px_buffer[274].r <= _WIRE[274].r @[EdgeDetect.scala 31:26]
    px_buffer[275].b <= _WIRE[275].b @[EdgeDetect.scala 31:26]
    px_buffer[275].g <= _WIRE[275].g @[EdgeDetect.scala 31:26]
    px_buffer[275].r <= _WIRE[275].r @[EdgeDetect.scala 31:26]
    px_buffer[276].b <= _WIRE[276].b @[EdgeDetect.scala 31:26]
    px_buffer[276].g <= _WIRE[276].g @[EdgeDetect.scala 31:26]
    px_buffer[276].r <= _WIRE[276].r @[EdgeDetect.scala 31:26]
    px_buffer[277].b <= _WIRE[277].b @[EdgeDetect.scala 31:26]
    px_buffer[277].g <= _WIRE[277].g @[EdgeDetect.scala 31:26]
    px_buffer[277].r <= _WIRE[277].r @[EdgeDetect.scala 31:26]
    px_buffer[278].b <= _WIRE[278].b @[EdgeDetect.scala 31:26]
    px_buffer[278].g <= _WIRE[278].g @[EdgeDetect.scala 31:26]
    px_buffer[278].r <= _WIRE[278].r @[EdgeDetect.scala 31:26]
    px_buffer[279].b <= _WIRE[279].b @[EdgeDetect.scala 31:26]
    px_buffer[279].g <= _WIRE[279].g @[EdgeDetect.scala 31:26]
    px_buffer[279].r <= _WIRE[279].r @[EdgeDetect.scala 31:26]
    px_buffer[280].b <= _WIRE[280].b @[EdgeDetect.scala 31:26]
    px_buffer[280].g <= _WIRE[280].g @[EdgeDetect.scala 31:26]
    px_buffer[280].r <= _WIRE[280].r @[EdgeDetect.scala 31:26]
    px_buffer[281].b <= _WIRE[281].b @[EdgeDetect.scala 31:26]
    px_buffer[281].g <= _WIRE[281].g @[EdgeDetect.scala 31:26]
    px_buffer[281].r <= _WIRE[281].r @[EdgeDetect.scala 31:26]
    px_buffer[282].b <= _WIRE[282].b @[EdgeDetect.scala 31:26]
    px_buffer[282].g <= _WIRE[282].g @[EdgeDetect.scala 31:26]
    px_buffer[282].r <= _WIRE[282].r @[EdgeDetect.scala 31:26]
    px_buffer[283].b <= _WIRE[283].b @[EdgeDetect.scala 31:26]
    px_buffer[283].g <= _WIRE[283].g @[EdgeDetect.scala 31:26]
    px_buffer[283].r <= _WIRE[283].r @[EdgeDetect.scala 31:26]
    px_buffer[284].b <= _WIRE[284].b @[EdgeDetect.scala 31:26]
    px_buffer[284].g <= _WIRE[284].g @[EdgeDetect.scala 31:26]
    px_buffer[284].r <= _WIRE[284].r @[EdgeDetect.scala 31:26]
    px_buffer[285].b <= _WIRE[285].b @[EdgeDetect.scala 31:26]
    px_buffer[285].g <= _WIRE[285].g @[EdgeDetect.scala 31:26]
    px_buffer[285].r <= _WIRE[285].r @[EdgeDetect.scala 31:26]
    px_buffer[286].b <= _WIRE[286].b @[EdgeDetect.scala 31:26]
    px_buffer[286].g <= _WIRE[286].g @[EdgeDetect.scala 31:26]
    px_buffer[286].r <= _WIRE[286].r @[EdgeDetect.scala 31:26]
    px_buffer[287].b <= _WIRE[287].b @[EdgeDetect.scala 31:26]
    px_buffer[287].g <= _WIRE[287].g @[EdgeDetect.scala 31:26]
    px_buffer[287].r <= _WIRE[287].r @[EdgeDetect.scala 31:26]
    px_buffer[288].b <= _WIRE[288].b @[EdgeDetect.scala 31:26]
    px_buffer[288].g <= _WIRE[288].g @[EdgeDetect.scala 31:26]
    px_buffer[288].r <= _WIRE[288].r @[EdgeDetect.scala 31:26]
    px_buffer[289].b <= _WIRE[289].b @[EdgeDetect.scala 31:26]
    px_buffer[289].g <= _WIRE[289].g @[EdgeDetect.scala 31:26]
    px_buffer[289].r <= _WIRE[289].r @[EdgeDetect.scala 31:26]
    px_buffer[290].b <= _WIRE[290].b @[EdgeDetect.scala 31:26]
    px_buffer[290].g <= _WIRE[290].g @[EdgeDetect.scala 31:26]
    px_buffer[290].r <= _WIRE[290].r @[EdgeDetect.scala 31:26]
    px_buffer[291].b <= _WIRE[291].b @[EdgeDetect.scala 31:26]
    px_buffer[291].g <= _WIRE[291].g @[EdgeDetect.scala 31:26]
    px_buffer[291].r <= _WIRE[291].r @[EdgeDetect.scala 31:26]
    px_buffer[292].b <= _WIRE[292].b @[EdgeDetect.scala 31:26]
    px_buffer[292].g <= _WIRE[292].g @[EdgeDetect.scala 31:26]
    px_buffer[292].r <= _WIRE[292].r @[EdgeDetect.scala 31:26]
    px_buffer[293].b <= _WIRE[293].b @[EdgeDetect.scala 31:26]
    px_buffer[293].g <= _WIRE[293].g @[EdgeDetect.scala 31:26]
    px_buffer[293].r <= _WIRE[293].r @[EdgeDetect.scala 31:26]
    px_buffer[294].b <= _WIRE[294].b @[EdgeDetect.scala 31:26]
    px_buffer[294].g <= _WIRE[294].g @[EdgeDetect.scala 31:26]
    px_buffer[294].r <= _WIRE[294].r @[EdgeDetect.scala 31:26]
    px_buffer[295].b <= _WIRE[295].b @[EdgeDetect.scala 31:26]
    px_buffer[295].g <= _WIRE[295].g @[EdgeDetect.scala 31:26]
    px_buffer[295].r <= _WIRE[295].r @[EdgeDetect.scala 31:26]
    px_buffer[296].b <= _WIRE[296].b @[EdgeDetect.scala 31:26]
    px_buffer[296].g <= _WIRE[296].g @[EdgeDetect.scala 31:26]
    px_buffer[296].r <= _WIRE[296].r @[EdgeDetect.scala 31:26]
    px_buffer[297].b <= _WIRE[297].b @[EdgeDetect.scala 31:26]
    px_buffer[297].g <= _WIRE[297].g @[EdgeDetect.scala 31:26]
    px_buffer[297].r <= _WIRE[297].r @[EdgeDetect.scala 31:26]
    px_buffer[298].b <= _WIRE[298].b @[EdgeDetect.scala 31:26]
    px_buffer[298].g <= _WIRE[298].g @[EdgeDetect.scala 31:26]
    px_buffer[298].r <= _WIRE[298].r @[EdgeDetect.scala 31:26]
    px_buffer[299].b <= _WIRE[299].b @[EdgeDetect.scala 31:26]
    px_buffer[299].g <= _WIRE[299].g @[EdgeDetect.scala 31:26]
    px_buffer[299].r <= _WIRE[299].r @[EdgeDetect.scala 31:26]
    px_buffer[300].b <= _WIRE[300].b @[EdgeDetect.scala 31:26]
    px_buffer[300].g <= _WIRE[300].g @[EdgeDetect.scala 31:26]
    px_buffer[300].r <= _WIRE[300].r @[EdgeDetect.scala 31:26]
    px_buffer[301].b <= _WIRE[301].b @[EdgeDetect.scala 31:26]
    px_buffer[301].g <= _WIRE[301].g @[EdgeDetect.scala 31:26]
    px_buffer[301].r <= _WIRE[301].r @[EdgeDetect.scala 31:26]
    px_buffer[302].b <= _WIRE[302].b @[EdgeDetect.scala 31:26]
    px_buffer[302].g <= _WIRE[302].g @[EdgeDetect.scala 31:26]
    px_buffer[302].r <= _WIRE[302].r @[EdgeDetect.scala 31:26]
    px_buffer[303].b <= _WIRE[303].b @[EdgeDetect.scala 31:26]
    px_buffer[303].g <= _WIRE[303].g @[EdgeDetect.scala 31:26]
    px_buffer[303].r <= _WIRE[303].r @[EdgeDetect.scala 31:26]
    px_buffer[304].b <= _WIRE[304].b @[EdgeDetect.scala 31:26]
    px_buffer[304].g <= _WIRE[304].g @[EdgeDetect.scala 31:26]
    px_buffer[304].r <= _WIRE[304].r @[EdgeDetect.scala 31:26]
    px_buffer[305].b <= _WIRE[305].b @[EdgeDetect.scala 31:26]
    px_buffer[305].g <= _WIRE[305].g @[EdgeDetect.scala 31:26]
    px_buffer[305].r <= _WIRE[305].r @[EdgeDetect.scala 31:26]
    px_buffer[306].b <= _WIRE[306].b @[EdgeDetect.scala 31:26]
    px_buffer[306].g <= _WIRE[306].g @[EdgeDetect.scala 31:26]
    px_buffer[306].r <= _WIRE[306].r @[EdgeDetect.scala 31:26]
    px_buffer[307].b <= _WIRE[307].b @[EdgeDetect.scala 31:26]
    px_buffer[307].g <= _WIRE[307].g @[EdgeDetect.scala 31:26]
    px_buffer[307].r <= _WIRE[307].r @[EdgeDetect.scala 31:26]
    px_buffer[308].b <= _WIRE[308].b @[EdgeDetect.scala 31:26]
    px_buffer[308].g <= _WIRE[308].g @[EdgeDetect.scala 31:26]
    px_buffer[308].r <= _WIRE[308].r @[EdgeDetect.scala 31:26]
    px_buffer[309].b <= _WIRE[309].b @[EdgeDetect.scala 31:26]
    px_buffer[309].g <= _WIRE[309].g @[EdgeDetect.scala 31:26]
    px_buffer[309].r <= _WIRE[309].r @[EdgeDetect.scala 31:26]
    px_buffer[310].b <= _WIRE[310].b @[EdgeDetect.scala 31:26]
    px_buffer[310].g <= _WIRE[310].g @[EdgeDetect.scala 31:26]
    px_buffer[310].r <= _WIRE[310].r @[EdgeDetect.scala 31:26]
    px_buffer[311].b <= _WIRE[311].b @[EdgeDetect.scala 31:26]
    px_buffer[311].g <= _WIRE[311].g @[EdgeDetect.scala 31:26]
    px_buffer[311].r <= _WIRE[311].r @[EdgeDetect.scala 31:26]
    px_buffer[312].b <= _WIRE[312].b @[EdgeDetect.scala 31:26]
    px_buffer[312].g <= _WIRE[312].g @[EdgeDetect.scala 31:26]
    px_buffer[312].r <= _WIRE[312].r @[EdgeDetect.scala 31:26]
    px_buffer[313].b <= _WIRE[313].b @[EdgeDetect.scala 31:26]
    px_buffer[313].g <= _WIRE[313].g @[EdgeDetect.scala 31:26]
    px_buffer[313].r <= _WIRE[313].r @[EdgeDetect.scala 31:26]
    px_buffer[314].b <= _WIRE[314].b @[EdgeDetect.scala 31:26]
    px_buffer[314].g <= _WIRE[314].g @[EdgeDetect.scala 31:26]
    px_buffer[314].r <= _WIRE[314].r @[EdgeDetect.scala 31:26]
    px_buffer[315].b <= _WIRE[315].b @[EdgeDetect.scala 31:26]
    px_buffer[315].g <= _WIRE[315].g @[EdgeDetect.scala 31:26]
    px_buffer[315].r <= _WIRE[315].r @[EdgeDetect.scala 31:26]
    px_buffer[316].b <= _WIRE[316].b @[EdgeDetect.scala 31:26]
    px_buffer[316].g <= _WIRE[316].g @[EdgeDetect.scala 31:26]
    px_buffer[316].r <= _WIRE[316].r @[EdgeDetect.scala 31:26]
    px_buffer[317].b <= _WIRE[317].b @[EdgeDetect.scala 31:26]
    px_buffer[317].g <= _WIRE[317].g @[EdgeDetect.scala 31:26]
    px_buffer[317].r <= _WIRE[317].r @[EdgeDetect.scala 31:26]
    px_buffer[318].b <= _WIRE[318].b @[EdgeDetect.scala 31:26]
    px_buffer[318].g <= _WIRE[318].g @[EdgeDetect.scala 31:26]
    px_buffer[318].r <= _WIRE[318].r @[EdgeDetect.scala 31:26]
    px_buffer[319].b <= _WIRE[319].b @[EdgeDetect.scala 31:26]
    px_buffer[319].g <= _WIRE[319].g @[EdgeDetect.scala 31:26]
    px_buffer[319].r <= _WIRE[319].r @[EdgeDetect.scala 31:26]
    px_buffer[320].b <= _WIRE[320].b @[EdgeDetect.scala 31:26]
    px_buffer[320].g <= _WIRE[320].g @[EdgeDetect.scala 31:26]
    px_buffer[320].r <= _WIRE[320].r @[EdgeDetect.scala 31:26]
    px_buffer[321].b <= _WIRE[321].b @[EdgeDetect.scala 31:26]
    px_buffer[321].g <= _WIRE[321].g @[EdgeDetect.scala 31:26]
    px_buffer[321].r <= _WIRE[321].r @[EdgeDetect.scala 31:26]
    px_buffer[322].b <= _WIRE[322].b @[EdgeDetect.scala 31:26]
    px_buffer[322].g <= _WIRE[322].g @[EdgeDetect.scala 31:26]
    px_buffer[322].r <= _WIRE[322].r @[EdgeDetect.scala 31:26]
    px_buffer[323].b <= _WIRE[323].b @[EdgeDetect.scala 31:26]
    px_buffer[323].g <= _WIRE[323].g @[EdgeDetect.scala 31:26]
    px_buffer[323].r <= _WIRE[323].r @[EdgeDetect.scala 31:26]
    px_buffer[324].b <= _WIRE[324].b @[EdgeDetect.scala 31:26]
    px_buffer[324].g <= _WIRE[324].g @[EdgeDetect.scala 31:26]
    px_buffer[324].r <= _WIRE[324].r @[EdgeDetect.scala 31:26]
    px_buffer[325].b <= _WIRE[325].b @[EdgeDetect.scala 31:26]
    px_buffer[325].g <= _WIRE[325].g @[EdgeDetect.scala 31:26]
    px_buffer[325].r <= _WIRE[325].r @[EdgeDetect.scala 31:26]
    px_buffer[326].b <= _WIRE[326].b @[EdgeDetect.scala 31:26]
    px_buffer[326].g <= _WIRE[326].g @[EdgeDetect.scala 31:26]
    px_buffer[326].r <= _WIRE[326].r @[EdgeDetect.scala 31:26]
    px_buffer[327].b <= _WIRE[327].b @[EdgeDetect.scala 31:26]
    px_buffer[327].g <= _WIRE[327].g @[EdgeDetect.scala 31:26]
    px_buffer[327].r <= _WIRE[327].r @[EdgeDetect.scala 31:26]
    px_buffer[328].b <= _WIRE[328].b @[EdgeDetect.scala 31:26]
    px_buffer[328].g <= _WIRE[328].g @[EdgeDetect.scala 31:26]
    px_buffer[328].r <= _WIRE[328].r @[EdgeDetect.scala 31:26]
    px_buffer[329].b <= _WIRE[329].b @[EdgeDetect.scala 31:26]
    px_buffer[329].g <= _WIRE[329].g @[EdgeDetect.scala 31:26]
    px_buffer[329].r <= _WIRE[329].r @[EdgeDetect.scala 31:26]
    px_buffer[330].b <= _WIRE[330].b @[EdgeDetect.scala 31:26]
    px_buffer[330].g <= _WIRE[330].g @[EdgeDetect.scala 31:26]
    px_buffer[330].r <= _WIRE[330].r @[EdgeDetect.scala 31:26]
    px_buffer[331].b <= _WIRE[331].b @[EdgeDetect.scala 31:26]
    px_buffer[331].g <= _WIRE[331].g @[EdgeDetect.scala 31:26]
    px_buffer[331].r <= _WIRE[331].r @[EdgeDetect.scala 31:26]
    px_buffer[332].b <= _WIRE[332].b @[EdgeDetect.scala 31:26]
    px_buffer[332].g <= _WIRE[332].g @[EdgeDetect.scala 31:26]
    px_buffer[332].r <= _WIRE[332].r @[EdgeDetect.scala 31:26]
    px_buffer[333].b <= _WIRE[333].b @[EdgeDetect.scala 31:26]
    px_buffer[333].g <= _WIRE[333].g @[EdgeDetect.scala 31:26]
    px_buffer[333].r <= _WIRE[333].r @[EdgeDetect.scala 31:26]
    px_buffer[334].b <= _WIRE[334].b @[EdgeDetect.scala 31:26]
    px_buffer[334].g <= _WIRE[334].g @[EdgeDetect.scala 31:26]
    px_buffer[334].r <= _WIRE[334].r @[EdgeDetect.scala 31:26]
    px_buffer[335].b <= _WIRE[335].b @[EdgeDetect.scala 31:26]
    px_buffer[335].g <= _WIRE[335].g @[EdgeDetect.scala 31:26]
    px_buffer[335].r <= _WIRE[335].r @[EdgeDetect.scala 31:26]
    px_buffer[336].b <= _WIRE[336].b @[EdgeDetect.scala 31:26]
    px_buffer[336].g <= _WIRE[336].g @[EdgeDetect.scala 31:26]
    px_buffer[336].r <= _WIRE[336].r @[EdgeDetect.scala 31:26]
    px_buffer[337].b <= _WIRE[337].b @[EdgeDetect.scala 31:26]
    px_buffer[337].g <= _WIRE[337].g @[EdgeDetect.scala 31:26]
    px_buffer[337].r <= _WIRE[337].r @[EdgeDetect.scala 31:26]
    px_buffer[338].b <= _WIRE[338].b @[EdgeDetect.scala 31:26]
    px_buffer[338].g <= _WIRE[338].g @[EdgeDetect.scala 31:26]
    px_buffer[338].r <= _WIRE[338].r @[EdgeDetect.scala 31:26]
    px_buffer[339].b <= _WIRE[339].b @[EdgeDetect.scala 31:26]
    px_buffer[339].g <= _WIRE[339].g @[EdgeDetect.scala 31:26]
    px_buffer[339].r <= _WIRE[339].r @[EdgeDetect.scala 31:26]
    px_buffer[340].b <= _WIRE[340].b @[EdgeDetect.scala 31:26]
    px_buffer[340].g <= _WIRE[340].g @[EdgeDetect.scala 31:26]
    px_buffer[340].r <= _WIRE[340].r @[EdgeDetect.scala 31:26]
    px_buffer[341].b <= _WIRE[341].b @[EdgeDetect.scala 31:26]
    px_buffer[341].g <= _WIRE[341].g @[EdgeDetect.scala 31:26]
    px_buffer[341].r <= _WIRE[341].r @[EdgeDetect.scala 31:26]
    px_buffer[342].b <= _WIRE[342].b @[EdgeDetect.scala 31:26]
    px_buffer[342].g <= _WIRE[342].g @[EdgeDetect.scala 31:26]
    px_buffer[342].r <= _WIRE[342].r @[EdgeDetect.scala 31:26]
    px_buffer[343].b <= _WIRE[343].b @[EdgeDetect.scala 31:26]
    px_buffer[343].g <= _WIRE[343].g @[EdgeDetect.scala 31:26]
    px_buffer[343].r <= _WIRE[343].r @[EdgeDetect.scala 31:26]
    px_buffer[344].b <= _WIRE[344].b @[EdgeDetect.scala 31:26]
    px_buffer[344].g <= _WIRE[344].g @[EdgeDetect.scala 31:26]
    px_buffer[344].r <= _WIRE[344].r @[EdgeDetect.scala 31:26]
    px_buffer[345].b <= _WIRE[345].b @[EdgeDetect.scala 31:26]
    px_buffer[345].g <= _WIRE[345].g @[EdgeDetect.scala 31:26]
    px_buffer[345].r <= _WIRE[345].r @[EdgeDetect.scala 31:26]
    px_buffer[346].b <= _WIRE[346].b @[EdgeDetect.scala 31:26]
    px_buffer[346].g <= _WIRE[346].g @[EdgeDetect.scala 31:26]
    px_buffer[346].r <= _WIRE[346].r @[EdgeDetect.scala 31:26]
    px_buffer[347].b <= _WIRE[347].b @[EdgeDetect.scala 31:26]
    px_buffer[347].g <= _WIRE[347].g @[EdgeDetect.scala 31:26]
    px_buffer[347].r <= _WIRE[347].r @[EdgeDetect.scala 31:26]
    px_buffer[348].b <= _WIRE[348].b @[EdgeDetect.scala 31:26]
    px_buffer[348].g <= _WIRE[348].g @[EdgeDetect.scala 31:26]
    px_buffer[348].r <= _WIRE[348].r @[EdgeDetect.scala 31:26]
    px_buffer[349].b <= _WIRE[349].b @[EdgeDetect.scala 31:26]
    px_buffer[349].g <= _WIRE[349].g @[EdgeDetect.scala 31:26]
    px_buffer[349].r <= _WIRE[349].r @[EdgeDetect.scala 31:26]
    px_buffer[350].b <= _WIRE[350].b @[EdgeDetect.scala 31:26]
    px_buffer[350].g <= _WIRE[350].g @[EdgeDetect.scala 31:26]
    px_buffer[350].r <= _WIRE[350].r @[EdgeDetect.scala 31:26]
    px_buffer[351].b <= _WIRE[351].b @[EdgeDetect.scala 31:26]
    px_buffer[351].g <= _WIRE[351].g @[EdgeDetect.scala 31:26]
    px_buffer[351].r <= _WIRE[351].r @[EdgeDetect.scala 31:26]
    px_buffer[352].b <= _WIRE[352].b @[EdgeDetect.scala 31:26]
    px_buffer[352].g <= _WIRE[352].g @[EdgeDetect.scala 31:26]
    px_buffer[352].r <= _WIRE[352].r @[EdgeDetect.scala 31:26]
    px_buffer[353].b <= _WIRE[353].b @[EdgeDetect.scala 31:26]
    px_buffer[353].g <= _WIRE[353].g @[EdgeDetect.scala 31:26]
    px_buffer[353].r <= _WIRE[353].r @[EdgeDetect.scala 31:26]
    px_buffer[354].b <= _WIRE[354].b @[EdgeDetect.scala 31:26]
    px_buffer[354].g <= _WIRE[354].g @[EdgeDetect.scala 31:26]
    px_buffer[354].r <= _WIRE[354].r @[EdgeDetect.scala 31:26]
    px_buffer[355].b <= _WIRE[355].b @[EdgeDetect.scala 31:26]
    px_buffer[355].g <= _WIRE[355].g @[EdgeDetect.scala 31:26]
    px_buffer[355].r <= _WIRE[355].r @[EdgeDetect.scala 31:26]
    px_buffer[356].b <= _WIRE[356].b @[EdgeDetect.scala 31:26]
    px_buffer[356].g <= _WIRE[356].g @[EdgeDetect.scala 31:26]
    px_buffer[356].r <= _WIRE[356].r @[EdgeDetect.scala 31:26]
    px_buffer[357].b <= _WIRE[357].b @[EdgeDetect.scala 31:26]
    px_buffer[357].g <= _WIRE[357].g @[EdgeDetect.scala 31:26]
    px_buffer[357].r <= _WIRE[357].r @[EdgeDetect.scala 31:26]
    px_buffer[358].b <= _WIRE[358].b @[EdgeDetect.scala 31:26]
    px_buffer[358].g <= _WIRE[358].g @[EdgeDetect.scala 31:26]
    px_buffer[358].r <= _WIRE[358].r @[EdgeDetect.scala 31:26]
    px_buffer[359].b <= _WIRE[359].b @[EdgeDetect.scala 31:26]
    px_buffer[359].g <= _WIRE[359].g @[EdgeDetect.scala 31:26]
    px_buffer[359].r <= _WIRE[359].r @[EdgeDetect.scala 31:26]
    px_buffer[360].b <= _WIRE[360].b @[EdgeDetect.scala 31:26]
    px_buffer[360].g <= _WIRE[360].g @[EdgeDetect.scala 31:26]
    px_buffer[360].r <= _WIRE[360].r @[EdgeDetect.scala 31:26]
    px_buffer[361].b <= _WIRE[361].b @[EdgeDetect.scala 31:26]
    px_buffer[361].g <= _WIRE[361].g @[EdgeDetect.scala 31:26]
    px_buffer[361].r <= _WIRE[361].r @[EdgeDetect.scala 31:26]
    px_buffer[362].b <= _WIRE[362].b @[EdgeDetect.scala 31:26]
    px_buffer[362].g <= _WIRE[362].g @[EdgeDetect.scala 31:26]
    px_buffer[362].r <= _WIRE[362].r @[EdgeDetect.scala 31:26]
    px_buffer[363].b <= _WIRE[363].b @[EdgeDetect.scala 31:26]
    px_buffer[363].g <= _WIRE[363].g @[EdgeDetect.scala 31:26]
    px_buffer[363].r <= _WIRE[363].r @[EdgeDetect.scala 31:26]
    px_buffer[364].b <= _WIRE[364].b @[EdgeDetect.scala 31:26]
    px_buffer[364].g <= _WIRE[364].g @[EdgeDetect.scala 31:26]
    px_buffer[364].r <= _WIRE[364].r @[EdgeDetect.scala 31:26]
    px_buffer[365].b <= _WIRE[365].b @[EdgeDetect.scala 31:26]
    px_buffer[365].g <= _WIRE[365].g @[EdgeDetect.scala 31:26]
    px_buffer[365].r <= _WIRE[365].r @[EdgeDetect.scala 31:26]
    px_buffer[366].b <= _WIRE[366].b @[EdgeDetect.scala 31:26]
    px_buffer[366].g <= _WIRE[366].g @[EdgeDetect.scala 31:26]
    px_buffer[366].r <= _WIRE[366].r @[EdgeDetect.scala 31:26]
    px_buffer[367].b <= _WIRE[367].b @[EdgeDetect.scala 31:26]
    px_buffer[367].g <= _WIRE[367].g @[EdgeDetect.scala 31:26]
    px_buffer[367].r <= _WIRE[367].r @[EdgeDetect.scala 31:26]
    px_buffer[368].b <= _WIRE[368].b @[EdgeDetect.scala 31:26]
    px_buffer[368].g <= _WIRE[368].g @[EdgeDetect.scala 31:26]
    px_buffer[368].r <= _WIRE[368].r @[EdgeDetect.scala 31:26]
    px_buffer[369].b <= _WIRE[369].b @[EdgeDetect.scala 31:26]
    px_buffer[369].g <= _WIRE[369].g @[EdgeDetect.scala 31:26]
    px_buffer[369].r <= _WIRE[369].r @[EdgeDetect.scala 31:26]
    px_buffer[370].b <= _WIRE[370].b @[EdgeDetect.scala 31:26]
    px_buffer[370].g <= _WIRE[370].g @[EdgeDetect.scala 31:26]
    px_buffer[370].r <= _WIRE[370].r @[EdgeDetect.scala 31:26]
    px_buffer[371].b <= _WIRE[371].b @[EdgeDetect.scala 31:26]
    px_buffer[371].g <= _WIRE[371].g @[EdgeDetect.scala 31:26]
    px_buffer[371].r <= _WIRE[371].r @[EdgeDetect.scala 31:26]
    px_buffer[372].b <= _WIRE[372].b @[EdgeDetect.scala 31:26]
    px_buffer[372].g <= _WIRE[372].g @[EdgeDetect.scala 31:26]
    px_buffer[372].r <= _WIRE[372].r @[EdgeDetect.scala 31:26]
    px_buffer[373].b <= _WIRE[373].b @[EdgeDetect.scala 31:26]
    px_buffer[373].g <= _WIRE[373].g @[EdgeDetect.scala 31:26]
    px_buffer[373].r <= _WIRE[373].r @[EdgeDetect.scala 31:26]
    px_buffer[374].b <= _WIRE[374].b @[EdgeDetect.scala 31:26]
    px_buffer[374].g <= _WIRE[374].g @[EdgeDetect.scala 31:26]
    px_buffer[374].r <= _WIRE[374].r @[EdgeDetect.scala 31:26]
    px_buffer[375].b <= _WIRE[375].b @[EdgeDetect.scala 31:26]
    px_buffer[375].g <= _WIRE[375].g @[EdgeDetect.scala 31:26]
    px_buffer[375].r <= _WIRE[375].r @[EdgeDetect.scala 31:26]
    px_buffer[376].b <= _WIRE[376].b @[EdgeDetect.scala 31:26]
    px_buffer[376].g <= _WIRE[376].g @[EdgeDetect.scala 31:26]
    px_buffer[376].r <= _WIRE[376].r @[EdgeDetect.scala 31:26]
    px_buffer[377].b <= _WIRE[377].b @[EdgeDetect.scala 31:26]
    px_buffer[377].g <= _WIRE[377].g @[EdgeDetect.scala 31:26]
    px_buffer[377].r <= _WIRE[377].r @[EdgeDetect.scala 31:26]
    px_buffer[378].b <= _WIRE[378].b @[EdgeDetect.scala 31:26]
    px_buffer[378].g <= _WIRE[378].g @[EdgeDetect.scala 31:26]
    px_buffer[378].r <= _WIRE[378].r @[EdgeDetect.scala 31:26]
    px_buffer[379].b <= _WIRE[379].b @[EdgeDetect.scala 31:26]
    px_buffer[379].g <= _WIRE[379].g @[EdgeDetect.scala 31:26]
    px_buffer[379].r <= _WIRE[379].r @[EdgeDetect.scala 31:26]
    px_buffer[380].b <= _WIRE[380].b @[EdgeDetect.scala 31:26]
    px_buffer[380].g <= _WIRE[380].g @[EdgeDetect.scala 31:26]
    px_buffer[380].r <= _WIRE[380].r @[EdgeDetect.scala 31:26]
    px_buffer[381].b <= _WIRE[381].b @[EdgeDetect.scala 31:26]
    px_buffer[381].g <= _WIRE[381].g @[EdgeDetect.scala 31:26]
    px_buffer[381].r <= _WIRE[381].r @[EdgeDetect.scala 31:26]
    px_buffer[382].b <= _WIRE[382].b @[EdgeDetect.scala 31:26]
    px_buffer[382].g <= _WIRE[382].g @[EdgeDetect.scala 31:26]
    px_buffer[382].r <= _WIRE[382].r @[EdgeDetect.scala 31:26]
    px_buffer[383].b <= _WIRE[383].b @[EdgeDetect.scala 31:26]
    px_buffer[383].g <= _WIRE[383].g @[EdgeDetect.scala 31:26]
    px_buffer[383].r <= _WIRE[383].r @[EdgeDetect.scala 31:26]
    px_buffer[384].b <= _WIRE[384].b @[EdgeDetect.scala 31:26]
    px_buffer[384].g <= _WIRE[384].g @[EdgeDetect.scala 31:26]
    px_buffer[384].r <= _WIRE[384].r @[EdgeDetect.scala 31:26]
    px_buffer[385].b <= _WIRE[385].b @[EdgeDetect.scala 31:26]
    px_buffer[385].g <= _WIRE[385].g @[EdgeDetect.scala 31:26]
    px_buffer[385].r <= _WIRE[385].r @[EdgeDetect.scala 31:26]
    px_buffer[386].b <= _WIRE[386].b @[EdgeDetect.scala 31:26]
    px_buffer[386].g <= _WIRE[386].g @[EdgeDetect.scala 31:26]
    px_buffer[386].r <= _WIRE[386].r @[EdgeDetect.scala 31:26]
    px_buffer[387].b <= _WIRE[387].b @[EdgeDetect.scala 31:26]
    px_buffer[387].g <= _WIRE[387].g @[EdgeDetect.scala 31:26]
    px_buffer[387].r <= _WIRE[387].r @[EdgeDetect.scala 31:26]
    px_buffer[388].b <= _WIRE[388].b @[EdgeDetect.scala 31:26]
    px_buffer[388].g <= _WIRE[388].g @[EdgeDetect.scala 31:26]
    px_buffer[388].r <= _WIRE[388].r @[EdgeDetect.scala 31:26]
    px_buffer[389].b <= _WIRE[389].b @[EdgeDetect.scala 31:26]
    px_buffer[389].g <= _WIRE[389].g @[EdgeDetect.scala 31:26]
    px_buffer[389].r <= _WIRE[389].r @[EdgeDetect.scala 31:26]
    px_buffer[390].b <= _WIRE[390].b @[EdgeDetect.scala 31:26]
    px_buffer[390].g <= _WIRE[390].g @[EdgeDetect.scala 31:26]
    px_buffer[390].r <= _WIRE[390].r @[EdgeDetect.scala 31:26]
    px_buffer[391].b <= _WIRE[391].b @[EdgeDetect.scala 31:26]
    px_buffer[391].g <= _WIRE[391].g @[EdgeDetect.scala 31:26]
    px_buffer[391].r <= _WIRE[391].r @[EdgeDetect.scala 31:26]
    px_buffer[392].b <= _WIRE[392].b @[EdgeDetect.scala 31:26]
    px_buffer[392].g <= _WIRE[392].g @[EdgeDetect.scala 31:26]
    px_buffer[392].r <= _WIRE[392].r @[EdgeDetect.scala 31:26]
    px_buffer[393].b <= _WIRE[393].b @[EdgeDetect.scala 31:26]
    px_buffer[393].g <= _WIRE[393].g @[EdgeDetect.scala 31:26]
    px_buffer[393].r <= _WIRE[393].r @[EdgeDetect.scala 31:26]
    px_buffer[394].b <= _WIRE[394].b @[EdgeDetect.scala 31:26]
    px_buffer[394].g <= _WIRE[394].g @[EdgeDetect.scala 31:26]
    px_buffer[394].r <= _WIRE[394].r @[EdgeDetect.scala 31:26]
    px_buffer[395].b <= _WIRE[395].b @[EdgeDetect.scala 31:26]
    px_buffer[395].g <= _WIRE[395].g @[EdgeDetect.scala 31:26]
    px_buffer[395].r <= _WIRE[395].r @[EdgeDetect.scala 31:26]
    px_buffer[396].b <= _WIRE[396].b @[EdgeDetect.scala 31:26]
    px_buffer[396].g <= _WIRE[396].g @[EdgeDetect.scala 31:26]
    px_buffer[396].r <= _WIRE[396].r @[EdgeDetect.scala 31:26]
    px_buffer[397].b <= _WIRE[397].b @[EdgeDetect.scala 31:26]
    px_buffer[397].g <= _WIRE[397].g @[EdgeDetect.scala 31:26]
    px_buffer[397].r <= _WIRE[397].r @[EdgeDetect.scala 31:26]
    px_buffer[398].b <= _WIRE[398].b @[EdgeDetect.scala 31:26]
    px_buffer[398].g <= _WIRE[398].g @[EdgeDetect.scala 31:26]
    px_buffer[398].r <= _WIRE[398].r @[EdgeDetect.scala 31:26]
    px_buffer[399].b <= _WIRE[399].b @[EdgeDetect.scala 31:26]
    px_buffer[399].g <= _WIRE[399].g @[EdgeDetect.scala 31:26]
    px_buffer[399].r <= _WIRE[399].r @[EdgeDetect.scala 31:26]
    px_buffer[400].b <= _WIRE[400].b @[EdgeDetect.scala 31:26]
    px_buffer[400].g <= _WIRE[400].g @[EdgeDetect.scala 31:26]
    px_buffer[400].r <= _WIRE[400].r @[EdgeDetect.scala 31:26]
    px_buffer[401].b <= _WIRE[401].b @[EdgeDetect.scala 31:26]
    px_buffer[401].g <= _WIRE[401].g @[EdgeDetect.scala 31:26]
    px_buffer[401].r <= _WIRE[401].r @[EdgeDetect.scala 31:26]
    px_buffer[402].b <= _WIRE[402].b @[EdgeDetect.scala 31:26]
    px_buffer[402].g <= _WIRE[402].g @[EdgeDetect.scala 31:26]
    px_buffer[402].r <= _WIRE[402].r @[EdgeDetect.scala 31:26]
    px_buffer[403].b <= _WIRE[403].b @[EdgeDetect.scala 31:26]
    px_buffer[403].g <= _WIRE[403].g @[EdgeDetect.scala 31:26]
    px_buffer[403].r <= _WIRE[403].r @[EdgeDetect.scala 31:26]
    px_buffer[404].b <= _WIRE[404].b @[EdgeDetect.scala 31:26]
    px_buffer[404].g <= _WIRE[404].g @[EdgeDetect.scala 31:26]
    px_buffer[404].r <= _WIRE[404].r @[EdgeDetect.scala 31:26]
    px_buffer[405].b <= _WIRE[405].b @[EdgeDetect.scala 31:26]
    px_buffer[405].g <= _WIRE[405].g @[EdgeDetect.scala 31:26]
    px_buffer[405].r <= _WIRE[405].r @[EdgeDetect.scala 31:26]
    px_buffer[406].b <= _WIRE[406].b @[EdgeDetect.scala 31:26]
    px_buffer[406].g <= _WIRE[406].g @[EdgeDetect.scala 31:26]
    px_buffer[406].r <= _WIRE[406].r @[EdgeDetect.scala 31:26]
    px_buffer[407].b <= _WIRE[407].b @[EdgeDetect.scala 31:26]
    px_buffer[407].g <= _WIRE[407].g @[EdgeDetect.scala 31:26]
    px_buffer[407].r <= _WIRE[407].r @[EdgeDetect.scala 31:26]
    px_buffer[408].b <= _WIRE[408].b @[EdgeDetect.scala 31:26]
    px_buffer[408].g <= _WIRE[408].g @[EdgeDetect.scala 31:26]
    px_buffer[408].r <= _WIRE[408].r @[EdgeDetect.scala 31:26]
    px_buffer[409].b <= _WIRE[409].b @[EdgeDetect.scala 31:26]
    px_buffer[409].g <= _WIRE[409].g @[EdgeDetect.scala 31:26]
    px_buffer[409].r <= _WIRE[409].r @[EdgeDetect.scala 31:26]
    px_buffer[410].b <= _WIRE[410].b @[EdgeDetect.scala 31:26]
    px_buffer[410].g <= _WIRE[410].g @[EdgeDetect.scala 31:26]
    px_buffer[410].r <= _WIRE[410].r @[EdgeDetect.scala 31:26]
    px_buffer[411].b <= _WIRE[411].b @[EdgeDetect.scala 31:26]
    px_buffer[411].g <= _WIRE[411].g @[EdgeDetect.scala 31:26]
    px_buffer[411].r <= _WIRE[411].r @[EdgeDetect.scala 31:26]
    px_buffer[412].b <= _WIRE[412].b @[EdgeDetect.scala 31:26]
    px_buffer[412].g <= _WIRE[412].g @[EdgeDetect.scala 31:26]
    px_buffer[412].r <= _WIRE[412].r @[EdgeDetect.scala 31:26]
    px_buffer[413].b <= _WIRE[413].b @[EdgeDetect.scala 31:26]
    px_buffer[413].g <= _WIRE[413].g @[EdgeDetect.scala 31:26]
    px_buffer[413].r <= _WIRE[413].r @[EdgeDetect.scala 31:26]
    px_buffer[414].b <= _WIRE[414].b @[EdgeDetect.scala 31:26]
    px_buffer[414].g <= _WIRE[414].g @[EdgeDetect.scala 31:26]
    px_buffer[414].r <= _WIRE[414].r @[EdgeDetect.scala 31:26]
    px_buffer[415].b <= _WIRE[415].b @[EdgeDetect.scala 31:26]
    px_buffer[415].g <= _WIRE[415].g @[EdgeDetect.scala 31:26]
    px_buffer[415].r <= _WIRE[415].r @[EdgeDetect.scala 31:26]
    px_buffer[416].b <= _WIRE[416].b @[EdgeDetect.scala 31:26]
    px_buffer[416].g <= _WIRE[416].g @[EdgeDetect.scala 31:26]
    px_buffer[416].r <= _WIRE[416].r @[EdgeDetect.scala 31:26]
    px_buffer[417].b <= _WIRE[417].b @[EdgeDetect.scala 31:26]
    px_buffer[417].g <= _WIRE[417].g @[EdgeDetect.scala 31:26]
    px_buffer[417].r <= _WIRE[417].r @[EdgeDetect.scala 31:26]
    px_buffer[418].b <= _WIRE[418].b @[EdgeDetect.scala 31:26]
    px_buffer[418].g <= _WIRE[418].g @[EdgeDetect.scala 31:26]
    px_buffer[418].r <= _WIRE[418].r @[EdgeDetect.scala 31:26]
    px_buffer[419].b <= _WIRE[419].b @[EdgeDetect.scala 31:26]
    px_buffer[419].g <= _WIRE[419].g @[EdgeDetect.scala 31:26]
    px_buffer[419].r <= _WIRE[419].r @[EdgeDetect.scala 31:26]
    px_buffer[420].b <= _WIRE[420].b @[EdgeDetect.scala 31:26]
    px_buffer[420].g <= _WIRE[420].g @[EdgeDetect.scala 31:26]
    px_buffer[420].r <= _WIRE[420].r @[EdgeDetect.scala 31:26]
    px_buffer[421].b <= _WIRE[421].b @[EdgeDetect.scala 31:26]
    px_buffer[421].g <= _WIRE[421].g @[EdgeDetect.scala 31:26]
    px_buffer[421].r <= _WIRE[421].r @[EdgeDetect.scala 31:26]
    px_buffer[422].b <= _WIRE[422].b @[EdgeDetect.scala 31:26]
    px_buffer[422].g <= _WIRE[422].g @[EdgeDetect.scala 31:26]
    px_buffer[422].r <= _WIRE[422].r @[EdgeDetect.scala 31:26]
    px_buffer[423].b <= _WIRE[423].b @[EdgeDetect.scala 31:26]
    px_buffer[423].g <= _WIRE[423].g @[EdgeDetect.scala 31:26]
    px_buffer[423].r <= _WIRE[423].r @[EdgeDetect.scala 31:26]
    px_buffer[424].b <= _WIRE[424].b @[EdgeDetect.scala 31:26]
    px_buffer[424].g <= _WIRE[424].g @[EdgeDetect.scala 31:26]
    px_buffer[424].r <= _WIRE[424].r @[EdgeDetect.scala 31:26]
    px_buffer[425].b <= _WIRE[425].b @[EdgeDetect.scala 31:26]
    px_buffer[425].g <= _WIRE[425].g @[EdgeDetect.scala 31:26]
    px_buffer[425].r <= _WIRE[425].r @[EdgeDetect.scala 31:26]
    px_buffer[426].b <= _WIRE[426].b @[EdgeDetect.scala 31:26]
    px_buffer[426].g <= _WIRE[426].g @[EdgeDetect.scala 31:26]
    px_buffer[426].r <= _WIRE[426].r @[EdgeDetect.scala 31:26]
    px_buffer[427].b <= _WIRE[427].b @[EdgeDetect.scala 31:26]
    px_buffer[427].g <= _WIRE[427].g @[EdgeDetect.scala 31:26]
    px_buffer[427].r <= _WIRE[427].r @[EdgeDetect.scala 31:26]
    px_buffer[428].b <= _WIRE[428].b @[EdgeDetect.scala 31:26]
    px_buffer[428].g <= _WIRE[428].g @[EdgeDetect.scala 31:26]
    px_buffer[428].r <= _WIRE[428].r @[EdgeDetect.scala 31:26]
    px_buffer[429].b <= _WIRE[429].b @[EdgeDetect.scala 31:26]
    px_buffer[429].g <= _WIRE[429].g @[EdgeDetect.scala 31:26]
    px_buffer[429].r <= _WIRE[429].r @[EdgeDetect.scala 31:26]
    px_buffer[430].b <= _WIRE[430].b @[EdgeDetect.scala 31:26]
    px_buffer[430].g <= _WIRE[430].g @[EdgeDetect.scala 31:26]
    px_buffer[430].r <= _WIRE[430].r @[EdgeDetect.scala 31:26]
    px_buffer[431].b <= _WIRE[431].b @[EdgeDetect.scala 31:26]
    px_buffer[431].g <= _WIRE[431].g @[EdgeDetect.scala 31:26]
    px_buffer[431].r <= _WIRE[431].r @[EdgeDetect.scala 31:26]
    px_buffer[432].b <= _WIRE[432].b @[EdgeDetect.scala 31:26]
    px_buffer[432].g <= _WIRE[432].g @[EdgeDetect.scala 31:26]
    px_buffer[432].r <= _WIRE[432].r @[EdgeDetect.scala 31:26]
    px_buffer[433].b <= _WIRE[433].b @[EdgeDetect.scala 31:26]
    px_buffer[433].g <= _WIRE[433].g @[EdgeDetect.scala 31:26]
    px_buffer[433].r <= _WIRE[433].r @[EdgeDetect.scala 31:26]
    px_buffer[434].b <= _WIRE[434].b @[EdgeDetect.scala 31:26]
    px_buffer[434].g <= _WIRE[434].g @[EdgeDetect.scala 31:26]
    px_buffer[434].r <= _WIRE[434].r @[EdgeDetect.scala 31:26]
    px_buffer[435].b <= _WIRE[435].b @[EdgeDetect.scala 31:26]
    px_buffer[435].g <= _WIRE[435].g @[EdgeDetect.scala 31:26]
    px_buffer[435].r <= _WIRE[435].r @[EdgeDetect.scala 31:26]
    px_buffer[436].b <= _WIRE[436].b @[EdgeDetect.scala 31:26]
    px_buffer[436].g <= _WIRE[436].g @[EdgeDetect.scala 31:26]
    px_buffer[436].r <= _WIRE[436].r @[EdgeDetect.scala 31:26]
    px_buffer[437].b <= _WIRE[437].b @[EdgeDetect.scala 31:26]
    px_buffer[437].g <= _WIRE[437].g @[EdgeDetect.scala 31:26]
    px_buffer[437].r <= _WIRE[437].r @[EdgeDetect.scala 31:26]
    px_buffer[438].b <= _WIRE[438].b @[EdgeDetect.scala 31:26]
    px_buffer[438].g <= _WIRE[438].g @[EdgeDetect.scala 31:26]
    px_buffer[438].r <= _WIRE[438].r @[EdgeDetect.scala 31:26]
    px_buffer[439].b <= _WIRE[439].b @[EdgeDetect.scala 31:26]
    px_buffer[439].g <= _WIRE[439].g @[EdgeDetect.scala 31:26]
    px_buffer[439].r <= _WIRE[439].r @[EdgeDetect.scala 31:26]
    px_buffer[440].b <= _WIRE[440].b @[EdgeDetect.scala 31:26]
    px_buffer[440].g <= _WIRE[440].g @[EdgeDetect.scala 31:26]
    px_buffer[440].r <= _WIRE[440].r @[EdgeDetect.scala 31:26]
    px_buffer[441].b <= _WIRE[441].b @[EdgeDetect.scala 31:26]
    px_buffer[441].g <= _WIRE[441].g @[EdgeDetect.scala 31:26]
    px_buffer[441].r <= _WIRE[441].r @[EdgeDetect.scala 31:26]
    px_buffer[442].b <= _WIRE[442].b @[EdgeDetect.scala 31:26]
    px_buffer[442].g <= _WIRE[442].g @[EdgeDetect.scala 31:26]
    px_buffer[442].r <= _WIRE[442].r @[EdgeDetect.scala 31:26]
    px_buffer[443].b <= _WIRE[443].b @[EdgeDetect.scala 31:26]
    px_buffer[443].g <= _WIRE[443].g @[EdgeDetect.scala 31:26]
    px_buffer[443].r <= _WIRE[443].r @[EdgeDetect.scala 31:26]
    px_buffer[444].b <= _WIRE[444].b @[EdgeDetect.scala 31:26]
    px_buffer[444].g <= _WIRE[444].g @[EdgeDetect.scala 31:26]
    px_buffer[444].r <= _WIRE[444].r @[EdgeDetect.scala 31:26]
    px_buffer[445].b <= _WIRE[445].b @[EdgeDetect.scala 31:26]
    px_buffer[445].g <= _WIRE[445].g @[EdgeDetect.scala 31:26]
    px_buffer[445].r <= _WIRE[445].r @[EdgeDetect.scala 31:26]
    px_buffer[446].b <= _WIRE[446].b @[EdgeDetect.scala 31:26]
    px_buffer[446].g <= _WIRE[446].g @[EdgeDetect.scala 31:26]
    px_buffer[446].r <= _WIRE[446].r @[EdgeDetect.scala 31:26]
    px_buffer[447].b <= _WIRE[447].b @[EdgeDetect.scala 31:26]
    px_buffer[447].g <= _WIRE[447].g @[EdgeDetect.scala 31:26]
    px_buffer[447].r <= _WIRE[447].r @[EdgeDetect.scala 31:26]
    px_buffer[448].b <= _WIRE[448].b @[EdgeDetect.scala 31:26]
    px_buffer[448].g <= _WIRE[448].g @[EdgeDetect.scala 31:26]
    px_buffer[448].r <= _WIRE[448].r @[EdgeDetect.scala 31:26]
    px_buffer[449].b <= _WIRE[449].b @[EdgeDetect.scala 31:26]
    px_buffer[449].g <= _WIRE[449].g @[EdgeDetect.scala 31:26]
    px_buffer[449].r <= _WIRE[449].r @[EdgeDetect.scala 31:26]
    px_buffer[450].b <= _WIRE[450].b @[EdgeDetect.scala 31:26]
    px_buffer[450].g <= _WIRE[450].g @[EdgeDetect.scala 31:26]
    px_buffer[450].r <= _WIRE[450].r @[EdgeDetect.scala 31:26]
    px_buffer[451].b <= _WIRE[451].b @[EdgeDetect.scala 31:26]
    px_buffer[451].g <= _WIRE[451].g @[EdgeDetect.scala 31:26]
    px_buffer[451].r <= _WIRE[451].r @[EdgeDetect.scala 31:26]
    px_buffer[452].b <= _WIRE[452].b @[EdgeDetect.scala 31:26]
    px_buffer[452].g <= _WIRE[452].g @[EdgeDetect.scala 31:26]
    px_buffer[452].r <= _WIRE[452].r @[EdgeDetect.scala 31:26]
    px_buffer[453].b <= _WIRE[453].b @[EdgeDetect.scala 31:26]
    px_buffer[453].g <= _WIRE[453].g @[EdgeDetect.scala 31:26]
    px_buffer[453].r <= _WIRE[453].r @[EdgeDetect.scala 31:26]
    px_buffer[454].b <= _WIRE[454].b @[EdgeDetect.scala 31:26]
    px_buffer[454].g <= _WIRE[454].g @[EdgeDetect.scala 31:26]
    px_buffer[454].r <= _WIRE[454].r @[EdgeDetect.scala 31:26]
    px_buffer[455].b <= _WIRE[455].b @[EdgeDetect.scala 31:26]
    px_buffer[455].g <= _WIRE[455].g @[EdgeDetect.scala 31:26]
    px_buffer[455].r <= _WIRE[455].r @[EdgeDetect.scala 31:26]
    px_buffer[456].b <= _WIRE[456].b @[EdgeDetect.scala 31:26]
    px_buffer[456].g <= _WIRE[456].g @[EdgeDetect.scala 31:26]
    px_buffer[456].r <= _WIRE[456].r @[EdgeDetect.scala 31:26]
    px_buffer[457].b <= _WIRE[457].b @[EdgeDetect.scala 31:26]
    px_buffer[457].g <= _WIRE[457].g @[EdgeDetect.scala 31:26]
    px_buffer[457].r <= _WIRE[457].r @[EdgeDetect.scala 31:26]
    px_buffer[458].b <= _WIRE[458].b @[EdgeDetect.scala 31:26]
    px_buffer[458].g <= _WIRE[458].g @[EdgeDetect.scala 31:26]
    px_buffer[458].r <= _WIRE[458].r @[EdgeDetect.scala 31:26]
    px_buffer[459].b <= _WIRE[459].b @[EdgeDetect.scala 31:26]
    px_buffer[459].g <= _WIRE[459].g @[EdgeDetect.scala 31:26]
    px_buffer[459].r <= _WIRE[459].r @[EdgeDetect.scala 31:26]
    px_buffer[460].b <= _WIRE[460].b @[EdgeDetect.scala 31:26]
    px_buffer[460].g <= _WIRE[460].g @[EdgeDetect.scala 31:26]
    px_buffer[460].r <= _WIRE[460].r @[EdgeDetect.scala 31:26]
    px_buffer[461].b <= _WIRE[461].b @[EdgeDetect.scala 31:26]
    px_buffer[461].g <= _WIRE[461].g @[EdgeDetect.scala 31:26]
    px_buffer[461].r <= _WIRE[461].r @[EdgeDetect.scala 31:26]
    px_buffer[462].b <= _WIRE[462].b @[EdgeDetect.scala 31:26]
    px_buffer[462].g <= _WIRE[462].g @[EdgeDetect.scala 31:26]
    px_buffer[462].r <= _WIRE[462].r @[EdgeDetect.scala 31:26]
    px_buffer[463].b <= _WIRE[463].b @[EdgeDetect.scala 31:26]
    px_buffer[463].g <= _WIRE[463].g @[EdgeDetect.scala 31:26]
    px_buffer[463].r <= _WIRE[463].r @[EdgeDetect.scala 31:26]
    px_buffer[464].b <= _WIRE[464].b @[EdgeDetect.scala 31:26]
    px_buffer[464].g <= _WIRE[464].g @[EdgeDetect.scala 31:26]
    px_buffer[464].r <= _WIRE[464].r @[EdgeDetect.scala 31:26]
    px_buffer[465].b <= _WIRE[465].b @[EdgeDetect.scala 31:26]
    px_buffer[465].g <= _WIRE[465].g @[EdgeDetect.scala 31:26]
    px_buffer[465].r <= _WIRE[465].r @[EdgeDetect.scala 31:26]
    px_buffer[466].b <= _WIRE[466].b @[EdgeDetect.scala 31:26]
    px_buffer[466].g <= _WIRE[466].g @[EdgeDetect.scala 31:26]
    px_buffer[466].r <= _WIRE[466].r @[EdgeDetect.scala 31:26]
    px_buffer[467].b <= _WIRE[467].b @[EdgeDetect.scala 31:26]
    px_buffer[467].g <= _WIRE[467].g @[EdgeDetect.scala 31:26]
    px_buffer[467].r <= _WIRE[467].r @[EdgeDetect.scala 31:26]
    px_buffer[468].b <= _WIRE[468].b @[EdgeDetect.scala 31:26]
    px_buffer[468].g <= _WIRE[468].g @[EdgeDetect.scala 31:26]
    px_buffer[468].r <= _WIRE[468].r @[EdgeDetect.scala 31:26]
    px_buffer[469].b <= _WIRE[469].b @[EdgeDetect.scala 31:26]
    px_buffer[469].g <= _WIRE[469].g @[EdgeDetect.scala 31:26]
    px_buffer[469].r <= _WIRE[469].r @[EdgeDetect.scala 31:26]
    px_buffer[470].b <= _WIRE[470].b @[EdgeDetect.scala 31:26]
    px_buffer[470].g <= _WIRE[470].g @[EdgeDetect.scala 31:26]
    px_buffer[470].r <= _WIRE[470].r @[EdgeDetect.scala 31:26]
    px_buffer[471].b <= _WIRE[471].b @[EdgeDetect.scala 31:26]
    px_buffer[471].g <= _WIRE[471].g @[EdgeDetect.scala 31:26]
    px_buffer[471].r <= _WIRE[471].r @[EdgeDetect.scala 31:26]
    px_buffer[472].b <= _WIRE[472].b @[EdgeDetect.scala 31:26]
    px_buffer[472].g <= _WIRE[472].g @[EdgeDetect.scala 31:26]
    px_buffer[472].r <= _WIRE[472].r @[EdgeDetect.scala 31:26]
    px_buffer[473].b <= _WIRE[473].b @[EdgeDetect.scala 31:26]
    px_buffer[473].g <= _WIRE[473].g @[EdgeDetect.scala 31:26]
    px_buffer[473].r <= _WIRE[473].r @[EdgeDetect.scala 31:26]
    px_buffer[474].b <= _WIRE[474].b @[EdgeDetect.scala 31:26]
    px_buffer[474].g <= _WIRE[474].g @[EdgeDetect.scala 31:26]
    px_buffer[474].r <= _WIRE[474].r @[EdgeDetect.scala 31:26]
    px_buffer[475].b <= _WIRE[475].b @[EdgeDetect.scala 31:26]
    px_buffer[475].g <= _WIRE[475].g @[EdgeDetect.scala 31:26]
    px_buffer[475].r <= _WIRE[475].r @[EdgeDetect.scala 31:26]
    px_buffer[476].b <= _WIRE[476].b @[EdgeDetect.scala 31:26]
    px_buffer[476].g <= _WIRE[476].g @[EdgeDetect.scala 31:26]
    px_buffer[476].r <= _WIRE[476].r @[EdgeDetect.scala 31:26]
    px_buffer[477].b <= _WIRE[477].b @[EdgeDetect.scala 31:26]
    px_buffer[477].g <= _WIRE[477].g @[EdgeDetect.scala 31:26]
    px_buffer[477].r <= _WIRE[477].r @[EdgeDetect.scala 31:26]
    px_buffer[478].b <= _WIRE[478].b @[EdgeDetect.scala 31:26]
    px_buffer[478].g <= _WIRE[478].g @[EdgeDetect.scala 31:26]
    px_buffer[478].r <= _WIRE[478].r @[EdgeDetect.scala 31:26]
    px_buffer[479].b <= _WIRE[479].b @[EdgeDetect.scala 31:26]
    px_buffer[479].g <= _WIRE[479].g @[EdgeDetect.scala 31:26]
    px_buffer[479].r <= _WIRE[479].r @[EdgeDetect.scala 31:26]
    px_buffer[480].b <= _WIRE[480].b @[EdgeDetect.scala 31:26]
    px_buffer[480].g <= _WIRE[480].g @[EdgeDetect.scala 31:26]
    px_buffer[480].r <= _WIRE[480].r @[EdgeDetect.scala 31:26]
    px_buffer[481].b <= _WIRE[481].b @[EdgeDetect.scala 31:26]
    px_buffer[481].g <= _WIRE[481].g @[EdgeDetect.scala 31:26]
    px_buffer[481].r <= _WIRE[481].r @[EdgeDetect.scala 31:26]
    px_buffer[482].b <= _WIRE[482].b @[EdgeDetect.scala 31:26]
    px_buffer[482].g <= _WIRE[482].g @[EdgeDetect.scala 31:26]
    px_buffer[482].r <= _WIRE[482].r @[EdgeDetect.scala 31:26]
    px_buffer[483].b <= _WIRE[483].b @[EdgeDetect.scala 31:26]
    px_buffer[483].g <= _WIRE[483].g @[EdgeDetect.scala 31:26]
    px_buffer[483].r <= _WIRE[483].r @[EdgeDetect.scala 31:26]
    px_buffer[484].b <= _WIRE[484].b @[EdgeDetect.scala 31:26]
    px_buffer[484].g <= _WIRE[484].g @[EdgeDetect.scala 31:26]
    px_buffer[484].r <= _WIRE[484].r @[EdgeDetect.scala 31:26]
    px_buffer[485].b <= _WIRE[485].b @[EdgeDetect.scala 31:26]
    px_buffer[485].g <= _WIRE[485].g @[EdgeDetect.scala 31:26]
    px_buffer[485].r <= _WIRE[485].r @[EdgeDetect.scala 31:26]
    px_buffer[486].b <= _WIRE[486].b @[EdgeDetect.scala 31:26]
    px_buffer[486].g <= _WIRE[486].g @[EdgeDetect.scala 31:26]
    px_buffer[486].r <= _WIRE[486].r @[EdgeDetect.scala 31:26]
    px_buffer[487].b <= _WIRE[487].b @[EdgeDetect.scala 31:26]
    px_buffer[487].g <= _WIRE[487].g @[EdgeDetect.scala 31:26]
    px_buffer[487].r <= _WIRE[487].r @[EdgeDetect.scala 31:26]
    px_buffer[488].b <= _WIRE[488].b @[EdgeDetect.scala 31:26]
    px_buffer[488].g <= _WIRE[488].g @[EdgeDetect.scala 31:26]
    px_buffer[488].r <= _WIRE[488].r @[EdgeDetect.scala 31:26]
    px_buffer[489].b <= _WIRE[489].b @[EdgeDetect.scala 31:26]
    px_buffer[489].g <= _WIRE[489].g @[EdgeDetect.scala 31:26]
    px_buffer[489].r <= _WIRE[489].r @[EdgeDetect.scala 31:26]
    px_buffer[490].b <= _WIRE[490].b @[EdgeDetect.scala 31:26]
    px_buffer[490].g <= _WIRE[490].g @[EdgeDetect.scala 31:26]
    px_buffer[490].r <= _WIRE[490].r @[EdgeDetect.scala 31:26]
    px_buffer[491].b <= _WIRE[491].b @[EdgeDetect.scala 31:26]
    px_buffer[491].g <= _WIRE[491].g @[EdgeDetect.scala 31:26]
    px_buffer[491].r <= _WIRE[491].r @[EdgeDetect.scala 31:26]
    px_buffer[492].b <= _WIRE[492].b @[EdgeDetect.scala 31:26]
    px_buffer[492].g <= _WIRE[492].g @[EdgeDetect.scala 31:26]
    px_buffer[492].r <= _WIRE[492].r @[EdgeDetect.scala 31:26]
    px_buffer[493].b <= _WIRE[493].b @[EdgeDetect.scala 31:26]
    px_buffer[493].g <= _WIRE[493].g @[EdgeDetect.scala 31:26]
    px_buffer[493].r <= _WIRE[493].r @[EdgeDetect.scala 31:26]
    px_buffer[494].b <= _WIRE[494].b @[EdgeDetect.scala 31:26]
    px_buffer[494].g <= _WIRE[494].g @[EdgeDetect.scala 31:26]
    px_buffer[494].r <= _WIRE[494].r @[EdgeDetect.scala 31:26]
    px_buffer[495].b <= _WIRE[495].b @[EdgeDetect.scala 31:26]
    px_buffer[495].g <= _WIRE[495].g @[EdgeDetect.scala 31:26]
    px_buffer[495].r <= _WIRE[495].r @[EdgeDetect.scala 31:26]
    px_buffer[496].b <= _WIRE[496].b @[EdgeDetect.scala 31:26]
    px_buffer[496].g <= _WIRE[496].g @[EdgeDetect.scala 31:26]
    px_buffer[496].r <= _WIRE[496].r @[EdgeDetect.scala 31:26]
    px_buffer[497].b <= _WIRE[497].b @[EdgeDetect.scala 31:26]
    px_buffer[497].g <= _WIRE[497].g @[EdgeDetect.scala 31:26]
    px_buffer[497].r <= _WIRE[497].r @[EdgeDetect.scala 31:26]
    px_buffer[498].b <= _WIRE[498].b @[EdgeDetect.scala 31:26]
    px_buffer[498].g <= _WIRE[498].g @[EdgeDetect.scala 31:26]
    px_buffer[498].r <= _WIRE[498].r @[EdgeDetect.scala 31:26]
    px_buffer[499].b <= _WIRE[499].b @[EdgeDetect.scala 31:26]
    px_buffer[499].g <= _WIRE[499].g @[EdgeDetect.scala 31:26]
    px_buffer[499].r <= _WIRE[499].r @[EdgeDetect.scala 31:26]
    px_buffer[500].b <= _WIRE[500].b @[EdgeDetect.scala 31:26]
    px_buffer[500].g <= _WIRE[500].g @[EdgeDetect.scala 31:26]
    px_buffer[500].r <= _WIRE[500].r @[EdgeDetect.scala 31:26]
    px_buffer[501].b <= _WIRE[501].b @[EdgeDetect.scala 31:26]
    px_buffer[501].g <= _WIRE[501].g @[EdgeDetect.scala 31:26]
    px_buffer[501].r <= _WIRE[501].r @[EdgeDetect.scala 31:26]
    px_buffer[502].b <= _WIRE[502].b @[EdgeDetect.scala 31:26]
    px_buffer[502].g <= _WIRE[502].g @[EdgeDetect.scala 31:26]
    px_buffer[502].r <= _WIRE[502].r @[EdgeDetect.scala 31:26]
    px_buffer[503].b <= _WIRE[503].b @[EdgeDetect.scala 31:26]
    px_buffer[503].g <= _WIRE[503].g @[EdgeDetect.scala 31:26]
    px_buffer[503].r <= _WIRE[503].r @[EdgeDetect.scala 31:26]
    px_buffer[504].b <= _WIRE[504].b @[EdgeDetect.scala 31:26]
    px_buffer[504].g <= _WIRE[504].g @[EdgeDetect.scala 31:26]
    px_buffer[504].r <= _WIRE[504].r @[EdgeDetect.scala 31:26]
    px_buffer[505].b <= _WIRE[505].b @[EdgeDetect.scala 31:26]
    px_buffer[505].g <= _WIRE[505].g @[EdgeDetect.scala 31:26]
    px_buffer[505].r <= _WIRE[505].r @[EdgeDetect.scala 31:26]
    px_buffer[506].b <= _WIRE[506].b @[EdgeDetect.scala 31:26]
    px_buffer[506].g <= _WIRE[506].g @[EdgeDetect.scala 31:26]
    px_buffer[506].r <= _WIRE[506].r @[EdgeDetect.scala 31:26]
    px_buffer[507].b <= _WIRE[507].b @[EdgeDetect.scala 31:26]
    px_buffer[507].g <= _WIRE[507].g @[EdgeDetect.scala 31:26]
    px_buffer[507].r <= _WIRE[507].r @[EdgeDetect.scala 31:26]
    px_buffer[508].b <= _WIRE[508].b @[EdgeDetect.scala 31:26]
    px_buffer[508].g <= _WIRE[508].g @[EdgeDetect.scala 31:26]
    px_buffer[508].r <= _WIRE[508].r @[EdgeDetect.scala 31:26]
    px_buffer[509].b <= _WIRE[509].b @[EdgeDetect.scala 31:26]
    px_buffer[509].g <= _WIRE[509].g @[EdgeDetect.scala 31:26]
    px_buffer[509].r <= _WIRE[509].r @[EdgeDetect.scala 31:26]
    px_buffer[510].b <= _WIRE[510].b @[EdgeDetect.scala 31:26]
    px_buffer[510].g <= _WIRE[510].g @[EdgeDetect.scala 31:26]
    px_buffer[510].r <= _WIRE[510].r @[EdgeDetect.scala 31:26]
    px_buffer[511].b <= _WIRE[511].b @[EdgeDetect.scala 31:26]
    px_buffer[511].g <= _WIRE[511].g @[EdgeDetect.scala 31:26]
    px_buffer[511].r <= _WIRE[511].r @[EdgeDetect.scala 31:26]
    px_buffer[512].b <= _WIRE[512].b @[EdgeDetect.scala 31:26]
    px_buffer[512].g <= _WIRE[512].g @[EdgeDetect.scala 31:26]
    px_buffer[512].r <= _WIRE[512].r @[EdgeDetect.scala 31:26]
    px_buffer[513].b <= _WIRE[513].b @[EdgeDetect.scala 31:26]
    px_buffer[513].g <= _WIRE[513].g @[EdgeDetect.scala 31:26]
    px_buffer[513].r <= _WIRE[513].r @[EdgeDetect.scala 31:26]
    px_buffer[514].b <= _WIRE[514].b @[EdgeDetect.scala 31:26]
    px_buffer[514].g <= _WIRE[514].g @[EdgeDetect.scala 31:26]
    px_buffer[514].r <= _WIRE[514].r @[EdgeDetect.scala 31:26]
    px_buffer[515].b <= _WIRE[515].b @[EdgeDetect.scala 31:26]
    px_buffer[515].g <= _WIRE[515].g @[EdgeDetect.scala 31:26]
    px_buffer[515].r <= _WIRE[515].r @[EdgeDetect.scala 31:26]
    px_buffer[516].b <= _WIRE[516].b @[EdgeDetect.scala 31:26]
    px_buffer[516].g <= _WIRE[516].g @[EdgeDetect.scala 31:26]
    px_buffer[516].r <= _WIRE[516].r @[EdgeDetect.scala 31:26]
    px_buffer[517].b <= _WIRE[517].b @[EdgeDetect.scala 31:26]
    px_buffer[517].g <= _WIRE[517].g @[EdgeDetect.scala 31:26]
    px_buffer[517].r <= _WIRE[517].r @[EdgeDetect.scala 31:26]
    px_buffer[518].b <= _WIRE[518].b @[EdgeDetect.scala 31:26]
    px_buffer[518].g <= _WIRE[518].g @[EdgeDetect.scala 31:26]
    px_buffer[518].r <= _WIRE[518].r @[EdgeDetect.scala 31:26]
    px_buffer[519].b <= _WIRE[519].b @[EdgeDetect.scala 31:26]
    px_buffer[519].g <= _WIRE[519].g @[EdgeDetect.scala 31:26]
    px_buffer[519].r <= _WIRE[519].r @[EdgeDetect.scala 31:26]
    px_buffer[520].b <= _WIRE[520].b @[EdgeDetect.scala 31:26]
    px_buffer[520].g <= _WIRE[520].g @[EdgeDetect.scala 31:26]
    px_buffer[520].r <= _WIRE[520].r @[EdgeDetect.scala 31:26]
    px_buffer[521].b <= _WIRE[521].b @[EdgeDetect.scala 31:26]
    px_buffer[521].g <= _WIRE[521].g @[EdgeDetect.scala 31:26]
    px_buffer[521].r <= _WIRE[521].r @[EdgeDetect.scala 31:26]
    px_buffer[522].b <= _WIRE[522].b @[EdgeDetect.scala 31:26]
    px_buffer[522].g <= _WIRE[522].g @[EdgeDetect.scala 31:26]
    px_buffer[522].r <= _WIRE[522].r @[EdgeDetect.scala 31:26]
    px_buffer[523].b <= _WIRE[523].b @[EdgeDetect.scala 31:26]
    px_buffer[523].g <= _WIRE[523].g @[EdgeDetect.scala 31:26]
    px_buffer[523].r <= _WIRE[523].r @[EdgeDetect.scala 31:26]
    px_buffer[524].b <= _WIRE[524].b @[EdgeDetect.scala 31:26]
    px_buffer[524].g <= _WIRE[524].g @[EdgeDetect.scala 31:26]
    px_buffer[524].r <= _WIRE[524].r @[EdgeDetect.scala 31:26]
    px_buffer[525].b <= _WIRE[525].b @[EdgeDetect.scala 31:26]
    px_buffer[525].g <= _WIRE[525].g @[EdgeDetect.scala 31:26]
    px_buffer[525].r <= _WIRE[525].r @[EdgeDetect.scala 31:26]
    px_buffer[526].b <= _WIRE[526].b @[EdgeDetect.scala 31:26]
    px_buffer[526].g <= _WIRE[526].g @[EdgeDetect.scala 31:26]
    px_buffer[526].r <= _WIRE[526].r @[EdgeDetect.scala 31:26]
    px_buffer[527].b <= _WIRE[527].b @[EdgeDetect.scala 31:26]
    px_buffer[527].g <= _WIRE[527].g @[EdgeDetect.scala 31:26]
    px_buffer[527].r <= _WIRE[527].r @[EdgeDetect.scala 31:26]
    px_buffer[528].b <= _WIRE[528].b @[EdgeDetect.scala 31:26]
    px_buffer[528].g <= _WIRE[528].g @[EdgeDetect.scala 31:26]
    px_buffer[528].r <= _WIRE[528].r @[EdgeDetect.scala 31:26]
    px_buffer[529].b <= _WIRE[529].b @[EdgeDetect.scala 31:26]
    px_buffer[529].g <= _WIRE[529].g @[EdgeDetect.scala 31:26]
    px_buffer[529].r <= _WIRE[529].r @[EdgeDetect.scala 31:26]
    px_buffer[530].b <= _WIRE[530].b @[EdgeDetect.scala 31:26]
    px_buffer[530].g <= _WIRE[530].g @[EdgeDetect.scala 31:26]
    px_buffer[530].r <= _WIRE[530].r @[EdgeDetect.scala 31:26]
    px_buffer[531].b <= _WIRE[531].b @[EdgeDetect.scala 31:26]
    px_buffer[531].g <= _WIRE[531].g @[EdgeDetect.scala 31:26]
    px_buffer[531].r <= _WIRE[531].r @[EdgeDetect.scala 31:26]
    px_buffer[532].b <= _WIRE[532].b @[EdgeDetect.scala 31:26]
    px_buffer[532].g <= _WIRE[532].g @[EdgeDetect.scala 31:26]
    px_buffer[532].r <= _WIRE[532].r @[EdgeDetect.scala 31:26]
    px_buffer[533].b <= _WIRE[533].b @[EdgeDetect.scala 31:26]
    px_buffer[533].g <= _WIRE[533].g @[EdgeDetect.scala 31:26]
    px_buffer[533].r <= _WIRE[533].r @[EdgeDetect.scala 31:26]
    px_buffer[534].b <= _WIRE[534].b @[EdgeDetect.scala 31:26]
    px_buffer[534].g <= _WIRE[534].g @[EdgeDetect.scala 31:26]
    px_buffer[534].r <= _WIRE[534].r @[EdgeDetect.scala 31:26]
    px_buffer[535].b <= _WIRE[535].b @[EdgeDetect.scala 31:26]
    px_buffer[535].g <= _WIRE[535].g @[EdgeDetect.scala 31:26]
    px_buffer[535].r <= _WIRE[535].r @[EdgeDetect.scala 31:26]
    px_buffer[536].b <= _WIRE[536].b @[EdgeDetect.scala 31:26]
    px_buffer[536].g <= _WIRE[536].g @[EdgeDetect.scala 31:26]
    px_buffer[536].r <= _WIRE[536].r @[EdgeDetect.scala 31:26]
    px_buffer[537].b <= _WIRE[537].b @[EdgeDetect.scala 31:26]
    px_buffer[537].g <= _WIRE[537].g @[EdgeDetect.scala 31:26]
    px_buffer[537].r <= _WIRE[537].r @[EdgeDetect.scala 31:26]
    px_buffer[538].b <= _WIRE[538].b @[EdgeDetect.scala 31:26]
    px_buffer[538].g <= _WIRE[538].g @[EdgeDetect.scala 31:26]
    px_buffer[538].r <= _WIRE[538].r @[EdgeDetect.scala 31:26]
    px_buffer[539].b <= _WIRE[539].b @[EdgeDetect.scala 31:26]
    px_buffer[539].g <= _WIRE[539].g @[EdgeDetect.scala 31:26]
    px_buffer[539].r <= _WIRE[539].r @[EdgeDetect.scala 31:26]
    px_buffer[540].b <= _WIRE[540].b @[EdgeDetect.scala 31:26]
    px_buffer[540].g <= _WIRE[540].g @[EdgeDetect.scala 31:26]
    px_buffer[540].r <= _WIRE[540].r @[EdgeDetect.scala 31:26]
    px_buffer[541].b <= _WIRE[541].b @[EdgeDetect.scala 31:26]
    px_buffer[541].g <= _WIRE[541].g @[EdgeDetect.scala 31:26]
    px_buffer[541].r <= _WIRE[541].r @[EdgeDetect.scala 31:26]
    px_buffer[542].b <= _WIRE[542].b @[EdgeDetect.scala 31:26]
    px_buffer[542].g <= _WIRE[542].g @[EdgeDetect.scala 31:26]
    px_buffer[542].r <= _WIRE[542].r @[EdgeDetect.scala 31:26]
    px_buffer[543].b <= _WIRE[543].b @[EdgeDetect.scala 31:26]
    px_buffer[543].g <= _WIRE[543].g @[EdgeDetect.scala 31:26]
    px_buffer[543].r <= _WIRE[543].r @[EdgeDetect.scala 31:26]
    px_buffer[544].b <= _WIRE[544].b @[EdgeDetect.scala 31:26]
    px_buffer[544].g <= _WIRE[544].g @[EdgeDetect.scala 31:26]
    px_buffer[544].r <= _WIRE[544].r @[EdgeDetect.scala 31:26]
    px_buffer[545].b <= _WIRE[545].b @[EdgeDetect.scala 31:26]
    px_buffer[545].g <= _WIRE[545].g @[EdgeDetect.scala 31:26]
    px_buffer[545].r <= _WIRE[545].r @[EdgeDetect.scala 31:26]
    px_buffer[546].b <= _WIRE[546].b @[EdgeDetect.scala 31:26]
    px_buffer[546].g <= _WIRE[546].g @[EdgeDetect.scala 31:26]
    px_buffer[546].r <= _WIRE[546].r @[EdgeDetect.scala 31:26]
    px_buffer[547].b <= _WIRE[547].b @[EdgeDetect.scala 31:26]
    px_buffer[547].g <= _WIRE[547].g @[EdgeDetect.scala 31:26]
    px_buffer[547].r <= _WIRE[547].r @[EdgeDetect.scala 31:26]
    px_buffer[548].b <= _WIRE[548].b @[EdgeDetect.scala 31:26]
    px_buffer[548].g <= _WIRE[548].g @[EdgeDetect.scala 31:26]
    px_buffer[548].r <= _WIRE[548].r @[EdgeDetect.scala 31:26]
    px_buffer[549].b <= _WIRE[549].b @[EdgeDetect.scala 31:26]
    px_buffer[549].g <= _WIRE[549].g @[EdgeDetect.scala 31:26]
    px_buffer[549].r <= _WIRE[549].r @[EdgeDetect.scala 31:26]
    px_buffer[550].b <= _WIRE[550].b @[EdgeDetect.scala 31:26]
    px_buffer[550].g <= _WIRE[550].g @[EdgeDetect.scala 31:26]
    px_buffer[550].r <= _WIRE[550].r @[EdgeDetect.scala 31:26]
    px_buffer[551].b <= _WIRE[551].b @[EdgeDetect.scala 31:26]
    px_buffer[551].g <= _WIRE[551].g @[EdgeDetect.scala 31:26]
    px_buffer[551].r <= _WIRE[551].r @[EdgeDetect.scala 31:26]
    px_buffer[552].b <= _WIRE[552].b @[EdgeDetect.scala 31:26]
    px_buffer[552].g <= _WIRE[552].g @[EdgeDetect.scala 31:26]
    px_buffer[552].r <= _WIRE[552].r @[EdgeDetect.scala 31:26]
    px_buffer[553].b <= _WIRE[553].b @[EdgeDetect.scala 31:26]
    px_buffer[553].g <= _WIRE[553].g @[EdgeDetect.scala 31:26]
    px_buffer[553].r <= _WIRE[553].r @[EdgeDetect.scala 31:26]
    px_buffer[554].b <= _WIRE[554].b @[EdgeDetect.scala 31:26]
    px_buffer[554].g <= _WIRE[554].g @[EdgeDetect.scala 31:26]
    px_buffer[554].r <= _WIRE[554].r @[EdgeDetect.scala 31:26]
    px_buffer[555].b <= _WIRE[555].b @[EdgeDetect.scala 31:26]
    px_buffer[555].g <= _WIRE[555].g @[EdgeDetect.scala 31:26]
    px_buffer[555].r <= _WIRE[555].r @[EdgeDetect.scala 31:26]
    px_buffer[556].b <= _WIRE[556].b @[EdgeDetect.scala 31:26]
    px_buffer[556].g <= _WIRE[556].g @[EdgeDetect.scala 31:26]
    px_buffer[556].r <= _WIRE[556].r @[EdgeDetect.scala 31:26]
    px_buffer[557].b <= _WIRE[557].b @[EdgeDetect.scala 31:26]
    px_buffer[557].g <= _WIRE[557].g @[EdgeDetect.scala 31:26]
    px_buffer[557].r <= _WIRE[557].r @[EdgeDetect.scala 31:26]
    px_buffer[558].b <= _WIRE[558].b @[EdgeDetect.scala 31:26]
    px_buffer[558].g <= _WIRE[558].g @[EdgeDetect.scala 31:26]
    px_buffer[558].r <= _WIRE[558].r @[EdgeDetect.scala 31:26]
    px_buffer[559].b <= _WIRE[559].b @[EdgeDetect.scala 31:26]
    px_buffer[559].g <= _WIRE[559].g @[EdgeDetect.scala 31:26]
    px_buffer[559].r <= _WIRE[559].r @[EdgeDetect.scala 31:26]
    px_buffer[560].b <= _WIRE[560].b @[EdgeDetect.scala 31:26]
    px_buffer[560].g <= _WIRE[560].g @[EdgeDetect.scala 31:26]
    px_buffer[560].r <= _WIRE[560].r @[EdgeDetect.scala 31:26]
    px_buffer[561].b <= _WIRE[561].b @[EdgeDetect.scala 31:26]
    px_buffer[561].g <= _WIRE[561].g @[EdgeDetect.scala 31:26]
    px_buffer[561].r <= _WIRE[561].r @[EdgeDetect.scala 31:26]
    px_buffer[562].b <= _WIRE[562].b @[EdgeDetect.scala 31:26]
    px_buffer[562].g <= _WIRE[562].g @[EdgeDetect.scala 31:26]
    px_buffer[562].r <= _WIRE[562].r @[EdgeDetect.scala 31:26]
    px_buffer[563].b <= _WIRE[563].b @[EdgeDetect.scala 31:26]
    px_buffer[563].g <= _WIRE[563].g @[EdgeDetect.scala 31:26]
    px_buffer[563].r <= _WIRE[563].r @[EdgeDetect.scala 31:26]
    px_buffer[564].b <= _WIRE[564].b @[EdgeDetect.scala 31:26]
    px_buffer[564].g <= _WIRE[564].g @[EdgeDetect.scala 31:26]
    px_buffer[564].r <= _WIRE[564].r @[EdgeDetect.scala 31:26]
    px_buffer[565].b <= _WIRE[565].b @[EdgeDetect.scala 31:26]
    px_buffer[565].g <= _WIRE[565].g @[EdgeDetect.scala 31:26]
    px_buffer[565].r <= _WIRE[565].r @[EdgeDetect.scala 31:26]
    px_buffer[566].b <= _WIRE[566].b @[EdgeDetect.scala 31:26]
    px_buffer[566].g <= _WIRE[566].g @[EdgeDetect.scala 31:26]
    px_buffer[566].r <= _WIRE[566].r @[EdgeDetect.scala 31:26]
    px_buffer[567].b <= _WIRE[567].b @[EdgeDetect.scala 31:26]
    px_buffer[567].g <= _WIRE[567].g @[EdgeDetect.scala 31:26]
    px_buffer[567].r <= _WIRE[567].r @[EdgeDetect.scala 31:26]
    px_buffer[568].b <= _WIRE[568].b @[EdgeDetect.scala 31:26]
    px_buffer[568].g <= _WIRE[568].g @[EdgeDetect.scala 31:26]
    px_buffer[568].r <= _WIRE[568].r @[EdgeDetect.scala 31:26]
    px_buffer[569].b <= _WIRE[569].b @[EdgeDetect.scala 31:26]
    px_buffer[569].g <= _WIRE[569].g @[EdgeDetect.scala 31:26]
    px_buffer[569].r <= _WIRE[569].r @[EdgeDetect.scala 31:26]
    px_buffer[570].b <= _WIRE[570].b @[EdgeDetect.scala 31:26]
    px_buffer[570].g <= _WIRE[570].g @[EdgeDetect.scala 31:26]
    px_buffer[570].r <= _WIRE[570].r @[EdgeDetect.scala 31:26]
    px_buffer[571].b <= _WIRE[571].b @[EdgeDetect.scala 31:26]
    px_buffer[571].g <= _WIRE[571].g @[EdgeDetect.scala 31:26]
    px_buffer[571].r <= _WIRE[571].r @[EdgeDetect.scala 31:26]
    px_buffer[572].b <= _WIRE[572].b @[EdgeDetect.scala 31:26]
    px_buffer[572].g <= _WIRE[572].g @[EdgeDetect.scala 31:26]
    px_buffer[572].r <= _WIRE[572].r @[EdgeDetect.scala 31:26]
    px_buffer[573].b <= _WIRE[573].b @[EdgeDetect.scala 31:26]
    px_buffer[573].g <= _WIRE[573].g @[EdgeDetect.scala 31:26]
    px_buffer[573].r <= _WIRE[573].r @[EdgeDetect.scala 31:26]
    px_buffer[574].b <= _WIRE[574].b @[EdgeDetect.scala 31:26]
    px_buffer[574].g <= _WIRE[574].g @[EdgeDetect.scala 31:26]
    px_buffer[574].r <= _WIRE[574].r @[EdgeDetect.scala 31:26]
    px_buffer[575].b <= _WIRE[575].b @[EdgeDetect.scala 31:26]
    px_buffer[575].g <= _WIRE[575].g @[EdgeDetect.scala 31:26]
    px_buffer[575].r <= _WIRE[575].r @[EdgeDetect.scala 31:26]
    px_buffer[576].b <= _WIRE[576].b @[EdgeDetect.scala 31:26]
    px_buffer[576].g <= _WIRE[576].g @[EdgeDetect.scala 31:26]
    px_buffer[576].r <= _WIRE[576].r @[EdgeDetect.scala 31:26]
    px_buffer[577].b <= _WIRE[577].b @[EdgeDetect.scala 31:26]
    px_buffer[577].g <= _WIRE[577].g @[EdgeDetect.scala 31:26]
    px_buffer[577].r <= _WIRE[577].r @[EdgeDetect.scala 31:26]
    px_buffer[578].b <= _WIRE[578].b @[EdgeDetect.scala 31:26]
    px_buffer[578].g <= _WIRE[578].g @[EdgeDetect.scala 31:26]
    px_buffer[578].r <= _WIRE[578].r @[EdgeDetect.scala 31:26]
    px_buffer[579].b <= _WIRE[579].b @[EdgeDetect.scala 31:26]
    px_buffer[579].g <= _WIRE[579].g @[EdgeDetect.scala 31:26]
    px_buffer[579].r <= _WIRE[579].r @[EdgeDetect.scala 31:26]
    px_buffer[580].b <= _WIRE[580].b @[EdgeDetect.scala 31:26]
    px_buffer[580].g <= _WIRE[580].g @[EdgeDetect.scala 31:26]
    px_buffer[580].r <= _WIRE[580].r @[EdgeDetect.scala 31:26]
    px_buffer[581].b <= _WIRE[581].b @[EdgeDetect.scala 31:26]
    px_buffer[581].g <= _WIRE[581].g @[EdgeDetect.scala 31:26]
    px_buffer[581].r <= _WIRE[581].r @[EdgeDetect.scala 31:26]
    px_buffer[582].b <= _WIRE[582].b @[EdgeDetect.scala 31:26]
    px_buffer[582].g <= _WIRE[582].g @[EdgeDetect.scala 31:26]
    px_buffer[582].r <= _WIRE[582].r @[EdgeDetect.scala 31:26]
    px_buffer[583].b <= _WIRE[583].b @[EdgeDetect.scala 31:26]
    px_buffer[583].g <= _WIRE[583].g @[EdgeDetect.scala 31:26]
    px_buffer[583].r <= _WIRE[583].r @[EdgeDetect.scala 31:26]
    px_buffer[584].b <= _WIRE[584].b @[EdgeDetect.scala 31:26]
    px_buffer[584].g <= _WIRE[584].g @[EdgeDetect.scala 31:26]
    px_buffer[584].r <= _WIRE[584].r @[EdgeDetect.scala 31:26]
    px_buffer[585].b <= _WIRE[585].b @[EdgeDetect.scala 31:26]
    px_buffer[585].g <= _WIRE[585].g @[EdgeDetect.scala 31:26]
    px_buffer[585].r <= _WIRE[585].r @[EdgeDetect.scala 31:26]
    px_buffer[586].b <= _WIRE[586].b @[EdgeDetect.scala 31:26]
    px_buffer[586].g <= _WIRE[586].g @[EdgeDetect.scala 31:26]
    px_buffer[586].r <= _WIRE[586].r @[EdgeDetect.scala 31:26]
    px_buffer[587].b <= _WIRE[587].b @[EdgeDetect.scala 31:26]
    px_buffer[587].g <= _WIRE[587].g @[EdgeDetect.scala 31:26]
    px_buffer[587].r <= _WIRE[587].r @[EdgeDetect.scala 31:26]
    px_buffer[588].b <= _WIRE[588].b @[EdgeDetect.scala 31:26]
    px_buffer[588].g <= _WIRE[588].g @[EdgeDetect.scala 31:26]
    px_buffer[588].r <= _WIRE[588].r @[EdgeDetect.scala 31:26]
    px_buffer[589].b <= _WIRE[589].b @[EdgeDetect.scala 31:26]
    px_buffer[589].g <= _WIRE[589].g @[EdgeDetect.scala 31:26]
    px_buffer[589].r <= _WIRE[589].r @[EdgeDetect.scala 31:26]
    px_buffer[590].b <= _WIRE[590].b @[EdgeDetect.scala 31:26]
    px_buffer[590].g <= _WIRE[590].g @[EdgeDetect.scala 31:26]
    px_buffer[590].r <= _WIRE[590].r @[EdgeDetect.scala 31:26]
    px_buffer[591].b <= _WIRE[591].b @[EdgeDetect.scala 31:26]
    px_buffer[591].g <= _WIRE[591].g @[EdgeDetect.scala 31:26]
    px_buffer[591].r <= _WIRE[591].r @[EdgeDetect.scala 31:26]
    px_buffer[592].b <= _WIRE[592].b @[EdgeDetect.scala 31:26]
    px_buffer[592].g <= _WIRE[592].g @[EdgeDetect.scala 31:26]
    px_buffer[592].r <= _WIRE[592].r @[EdgeDetect.scala 31:26]
    px_buffer[593].b <= _WIRE[593].b @[EdgeDetect.scala 31:26]
    px_buffer[593].g <= _WIRE[593].g @[EdgeDetect.scala 31:26]
    px_buffer[593].r <= _WIRE[593].r @[EdgeDetect.scala 31:26]
    px_buffer[594].b <= _WIRE[594].b @[EdgeDetect.scala 31:26]
    px_buffer[594].g <= _WIRE[594].g @[EdgeDetect.scala 31:26]
    px_buffer[594].r <= _WIRE[594].r @[EdgeDetect.scala 31:26]
    px_buffer[595].b <= _WIRE[595].b @[EdgeDetect.scala 31:26]
    px_buffer[595].g <= _WIRE[595].g @[EdgeDetect.scala 31:26]
    px_buffer[595].r <= _WIRE[595].r @[EdgeDetect.scala 31:26]
    px_buffer[596].b <= _WIRE[596].b @[EdgeDetect.scala 31:26]
    px_buffer[596].g <= _WIRE[596].g @[EdgeDetect.scala 31:26]
    px_buffer[596].r <= _WIRE[596].r @[EdgeDetect.scala 31:26]
    px_buffer[597].b <= _WIRE[597].b @[EdgeDetect.scala 31:26]
    px_buffer[597].g <= _WIRE[597].g @[EdgeDetect.scala 31:26]
    px_buffer[597].r <= _WIRE[597].r @[EdgeDetect.scala 31:26]
    px_buffer[598].b <= _WIRE[598].b @[EdgeDetect.scala 31:26]
    px_buffer[598].g <= _WIRE[598].g @[EdgeDetect.scala 31:26]
    px_buffer[598].r <= _WIRE[598].r @[EdgeDetect.scala 31:26]
    px_buffer[599].b <= _WIRE[599].b @[EdgeDetect.scala 31:26]
    px_buffer[599].g <= _WIRE[599].g @[EdgeDetect.scala 31:26]
    px_buffer[599].r <= _WIRE[599].r @[EdgeDetect.scala 31:26]
    px_buffer[600].b <= _WIRE[600].b @[EdgeDetect.scala 31:26]
    px_buffer[600].g <= _WIRE[600].g @[EdgeDetect.scala 31:26]
    px_buffer[600].r <= _WIRE[600].r @[EdgeDetect.scala 31:26]
    px_buffer[601].b <= _WIRE[601].b @[EdgeDetect.scala 31:26]
    px_buffer[601].g <= _WIRE[601].g @[EdgeDetect.scala 31:26]
    px_buffer[601].r <= _WIRE[601].r @[EdgeDetect.scala 31:26]
    px_buffer[602].b <= _WIRE[602].b @[EdgeDetect.scala 31:26]
    px_buffer[602].g <= _WIRE[602].g @[EdgeDetect.scala 31:26]
    px_buffer[602].r <= _WIRE[602].r @[EdgeDetect.scala 31:26]
    px_buffer[603].b <= _WIRE[603].b @[EdgeDetect.scala 31:26]
    px_buffer[603].g <= _WIRE[603].g @[EdgeDetect.scala 31:26]
    px_buffer[603].r <= _WIRE[603].r @[EdgeDetect.scala 31:26]
    px_buffer[604].b <= _WIRE[604].b @[EdgeDetect.scala 31:26]
    px_buffer[604].g <= _WIRE[604].g @[EdgeDetect.scala 31:26]
    px_buffer[604].r <= _WIRE[604].r @[EdgeDetect.scala 31:26]
    px_buffer[605].b <= _WIRE[605].b @[EdgeDetect.scala 31:26]
    px_buffer[605].g <= _WIRE[605].g @[EdgeDetect.scala 31:26]
    px_buffer[605].r <= _WIRE[605].r @[EdgeDetect.scala 31:26]
    px_buffer[606].b <= _WIRE[606].b @[EdgeDetect.scala 31:26]
    px_buffer[606].g <= _WIRE[606].g @[EdgeDetect.scala 31:26]
    px_buffer[606].r <= _WIRE[606].r @[EdgeDetect.scala 31:26]
    px_buffer[607].b <= _WIRE[607].b @[EdgeDetect.scala 31:26]
    px_buffer[607].g <= _WIRE[607].g @[EdgeDetect.scala 31:26]
    px_buffer[607].r <= _WIRE[607].r @[EdgeDetect.scala 31:26]
    px_buffer[608].b <= _WIRE[608].b @[EdgeDetect.scala 31:26]
    px_buffer[608].g <= _WIRE[608].g @[EdgeDetect.scala 31:26]
    px_buffer[608].r <= _WIRE[608].r @[EdgeDetect.scala 31:26]
    px_buffer[609].b <= _WIRE[609].b @[EdgeDetect.scala 31:26]
    px_buffer[609].g <= _WIRE[609].g @[EdgeDetect.scala 31:26]
    px_buffer[609].r <= _WIRE[609].r @[EdgeDetect.scala 31:26]
    px_buffer[610].b <= _WIRE[610].b @[EdgeDetect.scala 31:26]
    px_buffer[610].g <= _WIRE[610].g @[EdgeDetect.scala 31:26]
    px_buffer[610].r <= _WIRE[610].r @[EdgeDetect.scala 31:26]
    px_buffer[611].b <= _WIRE[611].b @[EdgeDetect.scala 31:26]
    px_buffer[611].g <= _WIRE[611].g @[EdgeDetect.scala 31:26]
    px_buffer[611].r <= _WIRE[611].r @[EdgeDetect.scala 31:26]
    px_buffer[612].b <= _WIRE[612].b @[EdgeDetect.scala 31:26]
    px_buffer[612].g <= _WIRE[612].g @[EdgeDetect.scala 31:26]
    px_buffer[612].r <= _WIRE[612].r @[EdgeDetect.scala 31:26]
    px_buffer[613].b <= _WIRE[613].b @[EdgeDetect.scala 31:26]
    px_buffer[613].g <= _WIRE[613].g @[EdgeDetect.scala 31:26]
    px_buffer[613].r <= _WIRE[613].r @[EdgeDetect.scala 31:26]
    px_buffer[614].b <= _WIRE[614].b @[EdgeDetect.scala 31:26]
    px_buffer[614].g <= _WIRE[614].g @[EdgeDetect.scala 31:26]
    px_buffer[614].r <= _WIRE[614].r @[EdgeDetect.scala 31:26]
    px_buffer[615].b <= _WIRE[615].b @[EdgeDetect.scala 31:26]
    px_buffer[615].g <= _WIRE[615].g @[EdgeDetect.scala 31:26]
    px_buffer[615].r <= _WIRE[615].r @[EdgeDetect.scala 31:26]
    px_buffer[616].b <= _WIRE[616].b @[EdgeDetect.scala 31:26]
    px_buffer[616].g <= _WIRE[616].g @[EdgeDetect.scala 31:26]
    px_buffer[616].r <= _WIRE[616].r @[EdgeDetect.scala 31:26]
    px_buffer[617].b <= _WIRE[617].b @[EdgeDetect.scala 31:26]
    px_buffer[617].g <= _WIRE[617].g @[EdgeDetect.scala 31:26]
    px_buffer[617].r <= _WIRE[617].r @[EdgeDetect.scala 31:26]
    px_buffer[618].b <= _WIRE[618].b @[EdgeDetect.scala 31:26]
    px_buffer[618].g <= _WIRE[618].g @[EdgeDetect.scala 31:26]
    px_buffer[618].r <= _WIRE[618].r @[EdgeDetect.scala 31:26]
    px_buffer[619].b <= _WIRE[619].b @[EdgeDetect.scala 31:26]
    px_buffer[619].g <= _WIRE[619].g @[EdgeDetect.scala 31:26]
    px_buffer[619].r <= _WIRE[619].r @[EdgeDetect.scala 31:26]
    px_buffer[620].b <= _WIRE[620].b @[EdgeDetect.scala 31:26]
    px_buffer[620].g <= _WIRE[620].g @[EdgeDetect.scala 31:26]
    px_buffer[620].r <= _WIRE[620].r @[EdgeDetect.scala 31:26]
    px_buffer[621].b <= _WIRE[621].b @[EdgeDetect.scala 31:26]
    px_buffer[621].g <= _WIRE[621].g @[EdgeDetect.scala 31:26]
    px_buffer[621].r <= _WIRE[621].r @[EdgeDetect.scala 31:26]
    px_buffer[622].b <= _WIRE[622].b @[EdgeDetect.scala 31:26]
    px_buffer[622].g <= _WIRE[622].g @[EdgeDetect.scala 31:26]
    px_buffer[622].r <= _WIRE[622].r @[EdgeDetect.scala 31:26]
    px_buffer[623].b <= _WIRE[623].b @[EdgeDetect.scala 31:26]
    px_buffer[623].g <= _WIRE[623].g @[EdgeDetect.scala 31:26]
    px_buffer[623].r <= _WIRE[623].r @[EdgeDetect.scala 31:26]
    px_buffer[624].b <= _WIRE[624].b @[EdgeDetect.scala 31:26]
    px_buffer[624].g <= _WIRE[624].g @[EdgeDetect.scala 31:26]
    px_buffer[624].r <= _WIRE[624].r @[EdgeDetect.scala 31:26]
    px_buffer[625].b <= _WIRE[625].b @[EdgeDetect.scala 31:26]
    px_buffer[625].g <= _WIRE[625].g @[EdgeDetect.scala 31:26]
    px_buffer[625].r <= _WIRE[625].r @[EdgeDetect.scala 31:26]
    px_buffer[626].b <= _WIRE[626].b @[EdgeDetect.scala 31:26]
    px_buffer[626].g <= _WIRE[626].g @[EdgeDetect.scala 31:26]
    px_buffer[626].r <= _WIRE[626].r @[EdgeDetect.scala 31:26]
    px_buffer[627].b <= _WIRE[627].b @[EdgeDetect.scala 31:26]
    px_buffer[627].g <= _WIRE[627].g @[EdgeDetect.scala 31:26]
    px_buffer[627].r <= _WIRE[627].r @[EdgeDetect.scala 31:26]
    px_buffer[628].b <= _WIRE[628].b @[EdgeDetect.scala 31:26]
    px_buffer[628].g <= _WIRE[628].g @[EdgeDetect.scala 31:26]
    px_buffer[628].r <= _WIRE[628].r @[EdgeDetect.scala 31:26]
    px_buffer[629].b <= _WIRE[629].b @[EdgeDetect.scala 31:26]
    px_buffer[629].g <= _WIRE[629].g @[EdgeDetect.scala 31:26]
    px_buffer[629].r <= _WIRE[629].r @[EdgeDetect.scala 31:26]
    px_buffer[630].b <= _WIRE[630].b @[EdgeDetect.scala 31:26]
    px_buffer[630].g <= _WIRE[630].g @[EdgeDetect.scala 31:26]
    px_buffer[630].r <= _WIRE[630].r @[EdgeDetect.scala 31:26]
    px_buffer[631].b <= _WIRE[631].b @[EdgeDetect.scala 31:26]
    px_buffer[631].g <= _WIRE[631].g @[EdgeDetect.scala 31:26]
    px_buffer[631].r <= _WIRE[631].r @[EdgeDetect.scala 31:26]
    px_buffer[632].b <= _WIRE[632].b @[EdgeDetect.scala 31:26]
    px_buffer[632].g <= _WIRE[632].g @[EdgeDetect.scala 31:26]
    px_buffer[632].r <= _WIRE[632].r @[EdgeDetect.scala 31:26]
    px_buffer[633].b <= _WIRE[633].b @[EdgeDetect.scala 31:26]
    px_buffer[633].g <= _WIRE[633].g @[EdgeDetect.scala 31:26]
    px_buffer[633].r <= _WIRE[633].r @[EdgeDetect.scala 31:26]
    px_buffer[634].b <= _WIRE[634].b @[EdgeDetect.scala 31:26]
    px_buffer[634].g <= _WIRE[634].g @[EdgeDetect.scala 31:26]
    px_buffer[634].r <= _WIRE[634].r @[EdgeDetect.scala 31:26]
    px_buffer[635].b <= _WIRE[635].b @[EdgeDetect.scala 31:26]
    px_buffer[635].g <= _WIRE[635].g @[EdgeDetect.scala 31:26]
    px_buffer[635].r <= _WIRE[635].r @[EdgeDetect.scala 31:26]
    px_buffer[636].b <= _WIRE[636].b @[EdgeDetect.scala 31:26]
    px_buffer[636].g <= _WIRE[636].g @[EdgeDetect.scala 31:26]
    px_buffer[636].r <= _WIRE[636].r @[EdgeDetect.scala 31:26]
    px_buffer[637].b <= _WIRE[637].b @[EdgeDetect.scala 31:26]
    px_buffer[637].g <= _WIRE[637].g @[EdgeDetect.scala 31:26]
    px_buffer[637].r <= _WIRE[637].r @[EdgeDetect.scala 31:26]
    px_buffer[638].b <= _WIRE[638].b @[EdgeDetect.scala 31:26]
    px_buffer[638].g <= _WIRE[638].g @[EdgeDetect.scala 31:26]
    px_buffer[638].r <= _WIRE[638].r @[EdgeDetect.scala 31:26]
    px_buffer[639].b <= _WIRE[639].b @[EdgeDetect.scala 31:26]
    px_buffer[639].g <= _WIRE[639].g @[EdgeDetect.scala 31:26]
    px_buffer[639].r <= _WIRE[639].r @[EdgeDetect.scala 31:26]
    wire _WIRE_1 : {r : UInt<8>, g : UInt<8>, b : UInt<8>}
    _WIRE_1.b is invalid
    _WIRE_1.g is invalid
    _WIRE_1.r is invalid
    reg last_px : {r : UInt<8>, g : UInt<8>, b : UInt<8>}, clock @[EdgeDetect.scala 32:24]
    last_px.b <= _WIRE_1.b @[EdgeDetect.scala 32:24]
    last_px.g <= _WIRE_1.g @[EdgeDetect.scala 32:24]
    last_px.r <= _WIRE_1.r @[EdgeDetect.scala 32:24]
    reg REG : SInt<9>, clock @[EdgeDetect.scala 12:25]
    reg REG_1 : SInt<9>, clock @[EdgeDetect.scala 12:25]
    reg REG_2 : SInt<9>, clock @[EdgeDetect.scala 12:25]
    reg REG_3 : SInt<9>, clock @[EdgeDetect.scala 12:25]
    reg REG_4 : SInt<9>, clock @[EdgeDetect.scala 12:25]
    reg REG_5 : SInt<9>, clock @[EdgeDetect.scala 12:25]
    wire abs_dh : {r : UInt<8>, g : UInt<8>, b : UInt<8>} @[EdgeDetect.scala 35:35]
    wire abs_dv : {r : UInt<8>, g : UInt<8>, b : UInt<8>} @[EdgeDetect.scala 35:35]
    wire abs_d : {r : UInt<8>, g : UInt<8>, b : UInt<8>} @[EdgeDetect.scala 35:35]
    node _T = lt(REG, asSInt(UInt<1>("h00"))) @[EdgeDetect.scala 37:21]
    node _T_1 = sub(asSInt(UInt<1>("h00")), REG) @[EdgeDetect.scala 37:21]
    node _T_2 = tail(_T_1, 1) @[EdgeDetect.scala 37:21]
    node _T_3 = asSInt(_T_2) @[EdgeDetect.scala 37:21]
    node _T_4 = mux(_T, _T_3, REG) @[EdgeDetect.scala 37:21]
    node _T_5 = asUInt(_T_4) @[EdgeDetect.scala 37:25]
    node _T_6 = tail(_T_5, 1) @[EdgeDetect.scala 37:36]
    abs_dh.r <= _T_6 @[EdgeDetect.scala 37:12]
    node _T_7 = lt(REG_3, asSInt(UInt<1>("h00"))) @[EdgeDetect.scala 38:21]
    node _T_8 = sub(asSInt(UInt<1>("h00")), REG_3) @[EdgeDetect.scala 38:21]
    node _T_9 = tail(_T_8, 1) @[EdgeDetect.scala 38:21]
    node _T_10 = asSInt(_T_9) @[EdgeDetect.scala 38:21]
    node _T_11 = mux(_T_7, _T_10, REG_3) @[EdgeDetect.scala 38:21]
    node _T_12 = asUInt(_T_11) @[EdgeDetect.scala 38:25]
    node _T_13 = tail(_T_12, 1) @[EdgeDetect.scala 38:36]
    abs_dv.r <= _T_13 @[EdgeDetect.scala 38:12]
    node _T_14 = add(abs_dh.r, abs_dv.r) @[EdgeDetect.scala 39:24]
    node _T_15 = shr(_T_14, 1) @[EdgeDetect.scala 39:36]
    abs_d.r <= _T_15 @[EdgeDetect.scala 39:11]
    node _T_16 = gt(abs_d.r, UInt<8>("h0ff")) @[EdgeDetect.scala 40:27]
    node _T_17 = mux(_T_16, UInt<1>("h00"), abs_d.r) @[EdgeDetect.scala 40:18]
    io.px_out.r <= _T_17 @[EdgeDetect.scala 40:12]
    node _T_18 = lt(REG_1, asSInt(UInt<1>("h00"))) @[EdgeDetect.scala 42:21]
    node _T_19 = sub(asSInt(UInt<1>("h00")), REG_1) @[EdgeDetect.scala 42:21]
    node _T_20 = tail(_T_19, 1) @[EdgeDetect.scala 42:21]
    node _T_21 = asSInt(_T_20) @[EdgeDetect.scala 42:21]
    node _T_22 = mux(_T_18, _T_21, REG_1) @[EdgeDetect.scala 42:21]
    node _T_23 = asUInt(_T_22) @[EdgeDetect.scala 42:25]
    node _T_24 = tail(_T_23, 1) @[EdgeDetect.scala 42:36]
    abs_dh.g <= _T_24 @[EdgeDetect.scala 42:12]
    node _T_25 = lt(REG_4, asSInt(UInt<1>("h00"))) @[EdgeDetect.scala 43:21]
    node _T_26 = sub(asSInt(UInt<1>("h00")), REG_4) @[EdgeDetect.scala 43:21]
    node _T_27 = tail(_T_26, 1) @[EdgeDetect.scala 43:21]
    node _T_28 = asSInt(_T_27) @[EdgeDetect.scala 43:21]
    node _T_29 = mux(_T_25, _T_28, REG_4) @[EdgeDetect.scala 43:21]
    node _T_30 = asUInt(_T_29) @[EdgeDetect.scala 43:25]
    node _T_31 = tail(_T_30, 1) @[EdgeDetect.scala 43:36]
    abs_dv.g <= _T_31 @[EdgeDetect.scala 43:12]
    node _T_32 = add(abs_dh.g, abs_dv.g) @[EdgeDetect.scala 44:24]
    node _T_33 = shr(_T_32, 1) @[EdgeDetect.scala 44:36]
    abs_d.g <= _T_33 @[EdgeDetect.scala 44:11]
    node _T_34 = gt(abs_d.g, UInt<8>("h0ff")) @[EdgeDetect.scala 45:27]
    node _T_35 = mux(_T_34, UInt<1>("h00"), abs_d.g) @[EdgeDetect.scala 45:18]
    io.px_out.g <= _T_35 @[EdgeDetect.scala 45:12]
    node _T_36 = lt(REG_2, asSInt(UInt<1>("h00"))) @[EdgeDetect.scala 47:21]
    node _T_37 = sub(asSInt(UInt<1>("h00")), REG_2) @[EdgeDetect.scala 47:21]
    node _T_38 = tail(_T_37, 1) @[EdgeDetect.scala 47:21]
    node _T_39 = asSInt(_T_38) @[EdgeDetect.scala 47:21]
    node _T_40 = mux(_T_36, _T_39, REG_2) @[EdgeDetect.scala 47:21]
    node _T_41 = asUInt(_T_40) @[EdgeDetect.scala 47:25]
    node _T_42 = tail(_T_41, 1) @[EdgeDetect.scala 47:36]
    abs_dh.b <= _T_42 @[EdgeDetect.scala 47:12]
    node _T_43 = lt(REG_5, asSInt(UInt<1>("h00"))) @[EdgeDetect.scala 48:21]
    node _T_44 = sub(asSInt(UInt<1>("h00")), REG_5) @[EdgeDetect.scala 48:21]
    node _T_45 = tail(_T_44, 1) @[EdgeDetect.scala 48:21]
    node _T_46 = asSInt(_T_45) @[EdgeDetect.scala 48:21]
    node _T_47 = mux(_T_43, _T_46, REG_5) @[EdgeDetect.scala 48:21]
    node _T_48 = asUInt(_T_47) @[EdgeDetect.scala 48:25]
    node _T_49 = tail(_T_48, 1) @[EdgeDetect.scala 48:36]
    abs_dv.b <= _T_49 @[EdgeDetect.scala 48:12]
    node _T_50 = add(abs_dh.b, abs_dv.b) @[EdgeDetect.scala 49:24]
    node _T_51 = shr(_T_50, 1) @[EdgeDetect.scala 49:36]
    abs_d.b <= _T_51 @[EdgeDetect.scala 49:11]
    io.px_out.b <= abs_d.g @[EdgeDetect.scala 50:12]
    node _T_52 = geq(io.x, UInt<1>("h01")) @[EdgeDetect.scala 53:12]
    when _T_52 : @[EdgeDetect.scala 53:20]
      node _T_53 = sub(io.x, UInt<1>("h01")) @[EdgeDetect.scala 54:41]
      node _T_54 = tail(_T_53, 1) @[EdgeDetect.scala 54:41]
      node _T_55 = bits(_T_54, 9, 0)
      node _T_56 = cat(UInt<1>("h00"), px_buffer[_T_55].r) @[Cat.scala 30:58]
      node _T_57 = asSInt(_T_56) @[EdgeDetect.scala 54:51]
      node _T_58 = cat(UInt<1>("h00"), io.px_in.r) @[Cat.scala 30:58]
      node _T_59 = asSInt(_T_58) @[EdgeDetect.scala 54:81]
      node _T_60 = sub(_T_57, _T_59) @[EdgeDetect.scala 54:58]
      node _T_61 = tail(_T_60, 1) @[EdgeDetect.scala 54:58]
      node _T_62 = asSInt(_T_61) @[EdgeDetect.scala 54:58]
      REG <= _T_62 @[EdgeDetect.scala 54:13]
      node _T_63 = bits(io.x, 9, 0)
      node _T_64 = cat(UInt<1>("h00"), px_buffer[_T_63].r) @[Cat.scala 30:58]
      node _T_65 = asSInt(_T_64) @[EdgeDetect.scala 55:47]
      node _T_66 = cat(UInt<1>("h00"), last_px.r) @[Cat.scala 30:58]
      node _T_67 = asSInt(_T_66) @[EdgeDetect.scala 55:79]
      node _T_68 = sub(_T_65, _T_67) @[EdgeDetect.scala 55:54]
      node _T_69 = tail(_T_68, 1) @[EdgeDetect.scala 55:54]
      node _T_70 = asSInt(_T_69) @[EdgeDetect.scala 55:54]
      REG_3 <= _T_70 @[EdgeDetect.scala 55:13]
      node _T_71 = sub(io.x, UInt<1>("h01")) @[EdgeDetect.scala 56:41]
      node _T_72 = tail(_T_71, 1) @[EdgeDetect.scala 56:41]
      node _T_73 = bits(_T_72, 9, 0)
      node _T_74 = cat(UInt<1>("h00"), px_buffer[_T_73].g) @[Cat.scala 30:58]
      node _T_75 = asSInt(_T_74) @[EdgeDetect.scala 56:51]
      node _T_76 = cat(UInt<1>("h00"), io.px_in.g) @[Cat.scala 30:58]
      node _T_77 = asSInt(_T_76) @[EdgeDetect.scala 56:81]
      node _T_78 = sub(_T_75, _T_77) @[EdgeDetect.scala 56:58]
      node _T_79 = tail(_T_78, 1) @[EdgeDetect.scala 56:58]
      node _T_80 = asSInt(_T_79) @[EdgeDetect.scala 56:58]
      REG_1 <= _T_80 @[EdgeDetect.scala 56:13]
      node _T_81 = bits(io.x, 9, 0)
      node _T_82 = cat(UInt<1>("h00"), px_buffer[_T_81].g) @[Cat.scala 30:58]
      node _T_83 = asSInt(_T_82) @[EdgeDetect.scala 57:47]
      node _T_84 = cat(UInt<1>("h00"), last_px.g) @[Cat.scala 30:58]
      node _T_85 = asSInt(_T_84) @[EdgeDetect.scala 57:79]
      node _T_86 = sub(_T_83, _T_85) @[EdgeDetect.scala 57:54]
      node _T_87 = tail(_T_86, 1) @[EdgeDetect.scala 57:54]
      node _T_88 = asSInt(_T_87) @[EdgeDetect.scala 57:54]
      REG_4 <= _T_88 @[EdgeDetect.scala 57:13]
      node _T_89 = sub(io.x, UInt<1>("h01")) @[EdgeDetect.scala 58:41]
      node _T_90 = tail(_T_89, 1) @[EdgeDetect.scala 58:41]
      node _T_91 = bits(_T_90, 9, 0)
      node _T_92 = cat(UInt<1>("h00"), px_buffer[_T_91].b) @[Cat.scala 30:58]
      node _T_93 = asSInt(_T_92) @[EdgeDetect.scala 58:51]
      node _T_94 = cat(UInt<1>("h00"), io.px_in.b) @[Cat.scala 30:58]
      node _T_95 = asSInt(_T_94) @[EdgeDetect.scala 58:81]
      node _T_96 = sub(_T_93, _T_95) @[EdgeDetect.scala 58:58]
      node _T_97 = tail(_T_96, 1) @[EdgeDetect.scala 58:58]
      node _T_98 = asSInt(_T_97) @[EdgeDetect.scala 58:58]
      REG_2 <= _T_98 @[EdgeDetect.scala 58:13]
      node _T_99 = bits(io.x, 9, 0)
      node _T_100 = cat(UInt<1>("h00"), px_buffer[_T_99].b) @[Cat.scala 30:58]
      node _T_101 = asSInt(_T_100) @[EdgeDetect.scala 59:47]
      node _T_102 = cat(UInt<1>("h00"), last_px.b) @[Cat.scala 30:58]
      node _T_103 = asSInt(_T_102) @[EdgeDetect.scala 59:79]
      node _T_104 = sub(_T_101, _T_103) @[EdgeDetect.scala 59:54]
      node _T_105 = tail(_T_104, 1) @[EdgeDetect.scala 59:54]
      node _T_106 = asSInt(_T_105) @[EdgeDetect.scala 59:54]
      REG_5 <= _T_106 @[EdgeDetect.scala 59:13]
      skip @[EdgeDetect.scala 53:20]
    node _T_107 = bits(io.x, 9, 0)
    px_buffer[_T_107].b <= last_px.b @[EdgeDetect.scala 61:18]
    px_buffer[_T_107].g <= last_px.g @[EdgeDetect.scala 61:18]
    px_buffer[_T_107].r <= last_px.r @[EdgeDetect.scala 61:18]
    last_px.b <= io.px_in.b @[EdgeDetect.scala 62:13]
    last_px.g <= io.px_in.g @[EdgeDetect.scala 62:13]
    last_px.r <= io.px_in.r @[EdgeDetect.scala 62:13]
    
